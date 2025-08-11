#!/bin/bash

# === HTML to PDF Converter with Table of Contents ===
# This script converts HTML files to PDF with proper table of contents
# Uses Puppeteer (headless Chrome) for high-quality PDF generation

# === Configuration ===
INPUT_HTML="Практический_TypeScript.html"
OUTPUT_PDF="Практический_TypeScript_from_HTML.pdf"
TEMP_DIR="temp_pdf_conversion"

# === Check dependencies ===
check_dependencies() {
    echo "Проверка зависимостей..."
    
    # Check if Node.js is installed
    if ! command -v node &> /dev/null; then
        echo "✗ Node.js не найден. Установите Node.js для продолжения."
        echo "  Скачайте с: https://nodejs.org/"
        exit 1
    fi
    
    # Check if npm is installed
    if ! command -v npm &> /dev/null; then
        echo "✗ npm не найден. Установите npm для продолжения."
        exit 1
    fi
    
    echo "✓ Node.js и npm найдены"
}

# === Setup temporary environment ===
setup_temp_env() {
    echo "Настройка временного окружения..."
    
    # Create temporary directory
    mkdir -p "$TEMP_DIR"
    cd "$TEMP_DIR"
    
    # Initialize npm project if package.json doesn't exist
    if [[ ! -f "package.json" ]]; then
        npm init -y > /dev/null 2>&1
    fi
    
    # Install puppeteer if not already installed
    if [[ ! -d "node_modules/puppeteer" ]]; then
        echo "Установка Puppeteer..."
        npm install puppeteer > /dev/null 2>&1
        if [[ $? -ne 0 ]]; then
            echo "✗ Ошибка установки Puppeteer"
            exit 1
        fi
        echo "✓ Puppeteer установлен"
    else
        echo "✓ Puppeteer уже установлен"
    fi
    
    cd ..
}

# === Create PDF conversion script ===
create_conversion_script() {
    echo "Создание скрипта конвертации..."
    
    cat <<'EOF' > "$TEMP_DIR/convert.js"
const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

async function convertHtmlToPdf(inputHtml, outputPdf) {
    try {
        // Check if input file exists
        if (!fs.existsSync(inputHtml)) {
            throw new Error(`Input file not found: ${inputHtml}`);
        }

        console.log('Запуск браузера...');
        const browser = await puppeteer.launch({
            headless: true,
            args: ['--no-sandbox', '--disable-setuid-sandbox']
        });

        const page = await browser.newPage();
        
        // Set viewport for consistent rendering
        await page.setViewport({
            width: 1200,
            height: 800,
            deviceScaleFactor: 1
        });

        console.log('Загрузка HTML файла...');
        const htmlPath = path.resolve(inputHtml);
        await page.goto(`file://${htmlPath}`, {
            waitUntil: 'networkidle0',
            timeout: 30000
        });

        console.log('Генерация PDF...');
        await page.pdf({
            path: outputPdf,
            format: 'A4',
            printBackground: true,
            margin: {
                top: '20mm',
                right: '15mm',
                bottom: '20mm',
                left: '15mm'
            },
            displayHeaderFooter: true,
            headerTemplate: `
                <div style="font-size: 10px; margin: 0 auto; color: #666;">
                    <span class="title"></span>
                </div>
            `,
            footerTemplate: `
                <div style="font-size: 10px; margin: 0 auto; color: #666;">
                    Страница <span class="pageNumber"></span> из <span class="totalPages"></span>
                </div>
            `,
            preferCSSPageSize: false
        });

        await browser.close();
        console.log(`✓ PDF успешно создан: ${outputPdf}`);
        
    } catch (error) {
        console.error('✗ Ошибка конвертации:', error.message);
        process.exit(1);
    }
}

// Get command line arguments
const args = process.argv.slice(2);
if (args.length < 2) {
    console.error('Использование: node convert.js <input.html> <output.pdf>');
    process.exit(1);
}

const inputHtml = args[0];
const outputPdf = args[1];

convertHtmlToPdf(inputHtml, outputPdf);
EOF

    echo "✓ Скрипт конвертации создан"
}

# === Enhanced HTML preprocessing ===
preprocess_html() {
    local input_file="$1"
    local output_file="$2"
    
    echo "Предобработка HTML для улучшения PDF..."
    
    # Create enhanced HTML with better PDF styling
    cat <<EOF > "$output_file"
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Практический TypeScript</title>
    <style>
        /* PDF-optimized styles */
        @page {
            size: A4;
            margin: 20mm 15mm;
        }
        
        body {
            font-family: 'Times New Roman', serif;
            font-size: 11pt;
            line-height: 1.4;
            color: #000;
            background: white;
        }
        
        /* Table of Contents styling for PDF */
        #TOC {
            page-break-after: always;
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 20px;
            background: #f9f9f9;
        }
        
        #TOC h1 {
            font-size: 18pt;
            margin-bottom: 15px;
            text-align: center;
        }
        
        #TOC ul {
            list-style: none;
            padding-left: 0;
        }
        
        #TOC li {
            margin: 5px 0;
            padding-left: 20px;
        }
        
        #TOC li li {
            padding-left: 40px;
            font-size: 10pt;
        }
        
        #TOC a {
            color: #000;
            text-decoration: none;
        }
        
        #TOC a:after {
            content: leader('.') target-counter(attr(href), page);
        }
        
        /* Headings */
        h1 {
            font-size: 16pt;
            font-weight: bold;
            margin-top: 25px;
            margin-bottom: 15px;
            page-break-after: avoid;
            border-bottom: 2px solid #333;
            padding-bottom: 5px;
        }
        
        h2 {
            font-size: 14pt;
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 10px;
            page-break-after: avoid;
            border-bottom: 1px solid #666;
            padding-bottom: 3px;
        }
        
        h3 {
            font-size: 12pt;
            font-weight: bold;
            margin-top: 15px;
            margin-bottom: 8px;
            page-break-after: avoid;
        }
        
        /* Code blocks */
        pre {
            background: #f5f5f5;
            border: 1px solid #ddd;
            padding: 10px;
            font-family: 'Courier New', monospace;
            font-size: 9pt;
            line-height: 1.2;
            page-break-inside: avoid;
            margin: 10px 0;
        }
        
        code {
            font-family: 'Courier New', monospace;
            font-size: 9pt;
            background: #f0f0f0;
            padding: 1px 3px;
        }
        
        /* Paragraphs */
        p {
            margin: 8px 0;
            text-align: justify;
        }
        
        /* Lists */
        ul, ol {
            margin: 8px 0;
            padding-left: 25px;
        }
        
        li {
            margin: 3px 0;
        }
        
        /* Tables */
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 10px 0;
            page-break-inside: avoid;
        }
        
        th, td {
            border: 1px solid #ddd;
            padding: 6px;
            text-align: left;
            font-size: 10pt;
        }
        
        th {
            background: #f0f0f0;
            font-weight: bold;
        }
        
        /* Blockquotes */
        blockquote {
            border-left: 3px solid #ccc;
            margin: 10px 0;
            padding: 5px 0 5px 15px;
            background: #f9f9f9;
            font-style: italic;
        }
        
        /* Page breaks */
        .page-break {
            page-break-before: always;
        }
        
        /* Header styling */
        .title-page {
            text-align: center;
            page-break-after: always;
            margin-top: 100px;
        }
        
        .title-page h1 {
            font-size: 24pt;
            margin-bottom: 20px;
            border: none;
        }
        
        .title-page .subtitle {
            font-size: 14pt;
            color: #666;
            margin-bottom: 30px;
        }
        
        .title-page .author {
            font-size: 12pt;
            margin-bottom: 10px;
        }
        
        .title-page .date {
            font-size: 11pt;
            color: #888;
        }
    </style>
</head>
<body>
EOF

    # Extract content from original HTML (skip head section)
    if [[ -f "$input_file" ]]; then
        # Extract body content and append to our enhanced HTML
        sed -n '/<body>/,/<\/body>/p' "$input_file" | sed '1d;$d' >> "$output_file"
    else
        echo "✗ Исходный HTML файл не найден: $input_file"
        exit 1
    fi
    
    # Close HTML
    cat <<EOF >> "$output_file"
</body>
</html>
EOF

    echo "✓ HTML предобработан для PDF"
}

# === Main conversion function ===
convert_to_pdf() {
    echo "Конвертация HTML в PDF..."
    
    # Check if input HTML exists
    if [[ ! -f "$INPUT_HTML" ]]; then
        echo "✗ HTML файл не найден: $INPUT_HTML"
        echo "Сначала запустите build-html.sh для создания HTML файла"
        exit 1
    fi
    
    # Preprocess HTML for better PDF output
    local enhanced_html="$TEMP_DIR/enhanced.html"
    preprocess_html "$INPUT_HTML" "$enhanced_html"
    
    # Run conversion
    cd "$TEMP_DIR"
    node convert.js "../$enhanced_html" "../$OUTPUT_PDF"
    cd ..
    
    if [[ -f "$OUTPUT_PDF" ]]; then
        echo "✓ PDF успешно создан: $OUTPUT_PDF"
        
        # Get file size
        local file_size=$(du -h "$OUTPUT_PDF" | cut -f1)
        echo "Размер файла: $file_size"
        
        # Get page count (if pdfinfo is available)
        if command -v pdfinfo &> /dev/null; then
            local pages=$(pdfinfo "$OUTPUT_PDF" 2>/dev/null | grep "Pages:" | awk '{print $2}')
            if [[ -n "$pages" ]]; then
                echo "Количество страниц: $pages"
            fi
        fi
    else
        echo "✗ Ошибка создания PDF"
        exit 1
    fi
}

# === Cleanup function ===
cleanup() {
    echo "Очистка временных файлов..."
    if [[ -d "$TEMP_DIR" ]]; then
        rm -rf "$TEMP_DIR"
        echo "✓ Временные файлы удалены"
    fi
}

# === Alternative method using wkhtmltopdf ===
convert_with_wkhtmltopdf() {
    echo "Попытка конвертации с помощью wkhtmltopdf..."
    
    if ! command -v wkhtmltopdf &> /dev/null; then
        echo "✗ wkhtmltopdf не найден"
        echo "Установите wkhtmltopdf: sudo apt-get install wkhtmltopdf"
        return 1
    fi
    
    wkhtmltopdf \
        --page-size A4 \
        --margin-top 20mm \
        --margin-right 15mm \
        --margin-bottom 20mm \
        --margin-left 15mm \
        --encoding UTF-8 \
        --enable-local-file-access \
        --print-media-type \
        --toc \
        --toc-header-text "Содержание" \
        --toc-text-size-shrink 0.8 \
        "$INPUT_HTML" "$OUTPUT_PDF"
    
    if [[ $? -eq 0 ]]; then
        echo "✓ PDF создан с помощью wkhtmltopdf: $OUTPUT_PDF"
        return 0
    else
        echo "✗ Ошибка wkhtmltopdf"
        return 1
    fi
}

# === Main execution ===
main() {
    echo "=== HTML to PDF Converter ==="
    echo "Входной файл: $INPUT_HTML"
    echo "Выходной файл: $OUTPUT_PDF"
    echo ""
    
    # Try wkhtmltopdf first (simpler, if available)
    if convert_with_wkhtmltopdf; then
        echo ""
        echo "✓ Конвертация завершена успешно"
        exit 0
    fi
    
    echo ""
    echo "Переход к методу с Puppeteer..."
    echo ""
    
    # Fallback to Puppeteer method
    check_dependencies
    setup_temp_env
    create_conversion_script
    convert_to_pdf
    cleanup
    
    echo ""
    echo "✓ Конвертация завершена успешно"
    echo "Откройте $OUTPUT_PDF для просмотра результата"
}

# === Handle script interruption ===
trap cleanup EXIT

# === Run main function ===
main "$@"