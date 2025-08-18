#!/bin/bash

# === Configuration ===
OUTPUT="Практический_TypeScript.pdf"
TITLE="Практический TypeScript"
SUBTITLE="Практическое руководство по TypeScript с примерами и объяснениями на русском языке"
AUTHOR="Герасимов Александр"
DATE=$(date +"%Y-%m-%d")

# === Step 1: Define files in correct order ===
FILES=(
    "00. Введение.md"
    "01. Про то как TypeScript связан с JavaScript.md"
    "02. Как Выбирать нужные опции в TypeScript.md"
    "03. Генерация кода не зависит от типов.md"
    "04. Что такое структурная типизация?.md"
    "05. Как ограничить тип any.md"
    "06. Как использовать редактор для получения информации о системе типов.md"
    "07. Типы как множества значений.md"
    "08. Как выражать принадлежность сущностей к пространству типов или пространству значений.md"
    "09. Как отдавать предпочтение аннотациям типов, а не утверждениям.md"
    "10. Как и для чего избегать объектных типов-оберток (String, Number, Boolean, Symbol, BigInt).md"
    "11. Проверка лишних свойств.md"
    "12. как задать тип всему функциональному выражению.md"
    "13. Различия между type и interace.md"
    "14. Readonly.md"
    "15. как использовать операции типов.md"
    "16. Используйте более точные альтернативы для сигнатур индексов.md"
    "17. Избегайте использования числовых сигнатур индексов.md"
    "18. Не засорять код лишними аннотациями типов.md"
    "19. Используйте разные переменные для разных типов.md"
    "20. Что такое расширение типов в TypeScript.md"
    "21. Почему лучше создавать объекты целиком.md"
    "22. Сужение типов.md"
    "23. Как быть последовательным с использованием псевдонимов.md"
    "24. Как использовать контекст при выводе типов.md"
    "25. Эволюционирующие типы.md"
    "26. Функциональные конструкции и библиотеки для улучшения работы с типами.md"
    "27. Async-функции вместо обратных вызовов.md"
    "28. Классы и каррирование для создания новых точек вывода типов.md"
    "29. Моделирование допустимых состояний (valid states).md"
    "30. Будь консервативным в отправке, либеральным в приёме.md"
    "31. Не повторять информацию типа в документации.md"
    "32. Избегать включения null или undefined в псевдонимы типов.md"
    "33. Вынесение null на периферию типов.md"
    "34. Предпочитай объединения интерфейсов (union of interfaces).md"
    "35. Использование более узких (строгих) типов вместо \`string\`.md"
    "36. Использовать отдельный тип для специальных значений.md"
    "37. Ограничить использование опциональных свойств.md"
    "38. Избегайте повторяющихся параметров одного типа.md"
    "39. Унификация типов, вместо моделирования.md"
    "40. Лучше неточно, чем недостоверно.md"
    "41. Имена типов на языке предметной области задачи.md"
    "42. Типы на основе API и спецификаций, а не данных.md"
    "43. Использовать максимально узкий диапазон для типов any.md"
    "44. Более точне варианты any.md"
    "45. Скрывать небезопасные утверждения типов в хорошо типизированных функциях.md"
    "46. unknown вместо any для значений с неизвестным типом.md"
    "47. Типобезопасные решения вместо динамической модификации.md"
    "48. Избегайте ловушек надежности.md"
    "49. Отслеживайте зону охвата типов для предотвращения регрессии в типобезопасности.md"
    "50. Обобщённые (generics) конструкции.md"
    "51. Избегайте лишних параметров типа.md"
    "52. Лучше условные типы, чем перегруженные сигнатуры.md"
    "53. Распределение объединений.md"
    "54. Шаблонные литеральные типы для моделирования DSL и отношений между строками.md"
    "55. Как писать тесты для типов.md"
    "56. Обращайте внимание на отображение типов.md"
    "57. Отдавайте предпочтение обобщенным типам с хвостовой рекурсией.md"
    "58. Кодогенерация как альтернатива сложным типам.md"
    "59. Типы never для выполнения проверки полноты.md"
    "60. Итерация по объектам.md"
    "61. Типы записей для поддержания синхронизации значений.md"
    "62. Остаточные параметры и типы кортежа для моделирования функций с переменным числом аргументов.md"
    "63. Используйте опциональные свойства never для моделирования исключающего ИЛИ.md"
    "64. Маркировки для номинальной типизации.md"
    "65. Размещать TypeScript и @types в devDependencies.md"
    "66. Проверять совместимость трех версий, задействованных в объявлениях типов.md"
    "67. Экспортировать все типы, которые появляются в открытом (публичном) API.md"
    "68. TSDoc для комментариев к API.md"
    "69. Определять тип this в обратных вызовах, если он является частью API.md"
    "70. Зеркалирование типов для разрыва зависимостей.md"
    "71. Аугментацию модулей для улучшения типов.md"
    "72. Отдавать предпочтение функциональности ECMAScript перед TypeScript.md"
    "73. Source Map для отладки TypeScript.md"
    "74. Реконструкция типов на стадии выполнения.md"
    "75. Иерархия DOM (Document Object Model).md"
    "76. Точная модель среды выполнения.md"
    "77. Проверка типов и юнит-тестирование.md"
    "78. Быстродействие компилятора.md"
    "79. Использовать современный JavaScript.md"
    "80. @ts-check и JSDoc в TypeScript.md"
    "81. allowJs для совмещения TypeScript и JavaScript.md"
    "82. Конвертируйте модуль за модулем вверх по графу зависимостей.md"
    "83. Не считайте миграцию завершенной, пока не включите noImplicitAny.md"
    "_Базовые типы.md"
    "_Дженерики.md"
    "_Специальные типы.md"
)

# === Step 2: Check if files exist and build file list ===
EXISTING_FILES=()
MISSING_FILES=()

echo "Проверка файлов..."
for file in "${FILES[@]}"; do
    if [[ -f "$file" ]]; then
        EXISTING_FILES+=("$file")
        echo "✓ $file"
    else
        MISSING_FILES+=("$file")
        echo "✗ $file (не найден)"
    fi
done

if [[ ${#MISSING_FILES[@]} -gt 0 ]]; then
    echo ""
    echo "Предупреждение: ${#MISSING_FILES[@]} файлов не найдено:"
    printf '   - %s\n' "${MISSING_FILES[@]}"
    echo ""
    echo "Продолжаем с найденными файлами..."
fi

# === Step 3: Create combined markdown file ===
echo ""
echo "Создание объединенного markdown файла..."

# Create a combined markdown file without metadata
cat <<EOF > combined.md
# Предисловие

Данная коллекция статей основана на книге **«Эффективный TypeScript»** автора **Дэна Вандеркама**.

## Материалы охватывают основные темы TypeScript:

- **Основы языка** - связь с JavaScript, настройка компилятора, структурная типизация
- **Система типов** - типы как множества, операции с типами, расширение типов
- **Лучшие практики** - избежание \`any\`, правильное использование аннотаций, создание объектов
- **Продвинутые концепции** - \`readonly\`, различия между \`type\` и \`interface\`, индексные сигнатуры

Каждая статья содержит практические примеры кода с пояснениями и рекомендациями по использованию.

## Для кого эта книга

- Разработчики, изучающие TypeScript
- JavaScript-разработчики, переходящие на TypeScript
- Те, кто хочет улучшить понимание системы типов TypeScript
- Разработчики, ищущие практические советы и лучшие практики

## Как использовать

Каждая статья самодостаточна и может читаться отдельно. Рекомендуется начать с основ (статьи 01-04) и постепенно переходить к более сложным темам.

EOF

# Function to create anchor from text
create_anchor() {
    local text="$1"
    echo "$text" | tr '[:upper:]' '[:lower:]' | \
    sed 's/[^a-zA-Zа-яё0-9 ]//g' | \
    sed 's/[[:space:]]\+/-/g' | \
    sed 's/--*/-/g' | \
    sed 's/^-\|-$//g'
}

# Function to extract the first header from a markdown file
get_first_header() {
    local file="$1"
    # Find the first line that starts with # and extract the text (with or without space after #)
    grep -m 1 '^#' "$file" | sed 's/^#[[:space:]]*//' || echo ""
}

# Function to process markdown file and add clickable anchors to headers
process_file_with_anchors() {
    local input_file="$1"
    
    while IFS= read -r line; do
        if [[ "$line" =~ ^#{1,6}([[:space:]]+|[^[:space:]]) ]]; then
            # Extract heading level and text
            heading_level=$(echo "$line" | grep -o '^#*' | wc -c)
            heading_level=$((heading_level - 1))
            heading_text=$(echo "$line" | sed 's/^#*[[:space:]]*//')
            
            # Create clean anchor
            anchor=$(create_anchor "$heading_text")
            
            # Output heading with HTML anchor for clickable navigation
            echo "<h$heading_level id=\"$anchor\">$heading_text</h$heading_level>"
        else
            echo "$line"
        fi
    done < "$input_file"
}

# Append all existing files with section dividers and anchors
current_section=""
for file in "${EXISTING_FILES[@]}"; do
    # Extract file number
    if [[ "$file" =~ ^([0-9]+)\. ]]; then
        file_num=${BASH_REMATCH[1]}
        file_num=$((10#$file_num))  # Convert to decimal to handle leading zeros
        
        # Determine section based on file number
        new_section=""
        section_anchor=""
        if [[ $file_num -ge 1 && $file_num -le 10 ]]; then
            new_section="🏗️ Основы TypeScript (01-10)"
            section_anchor="основы-typescript"
        elif [[ $file_num -ge 11 && $file_num -le 30 ]]; then
            new_section="🔧 Система типов (11-30)"
            section_anchor="система-типов"
        elif [[ $file_num -ge 31 && $file_num -le 49 ]]; then
            new_section="📝 Лучшие практики (31-49)"
            section_anchor="лучшие-практики"
        elif [[ $file_num -ge 50 && $file_num -le 64 ]]; then
            new_section="🚀 Продвинутые типы (50-64)"
            section_anchor="продвинутые-типы"
        elif [[ $file_num -ge 65 && $file_num -le 71 ]]; then
            new_section="📦 Публикация и API (65-71)"
            section_anchor="публикация-и-api"
        elif [[ $file_num -ge 72 && $file_num -le 83 ]]; then
            new_section="⚡ Производительность и миграция (72-83)"
            section_anchor="производительность-и-миграция"
        fi
        
        # Add section divider if section changed
        if [[ "$new_section" != "$current_section" && -n "$new_section" ]]; then
            echo "" >> combined.md
            echo '<div class="section-divider">' >> combined.md
            echo "<h1 id=\"$section_anchor\">$new_section</h1>" >> combined.md
            echo '</div>' >> combined.md
            echo "" >> combined.md
            current_section="$new_section"
        fi
    elif [[ "$file" =~ ^_.*\.md$ ]]; then
        # Handle reference materials
        if [[ "$current_section" != "📚 Справочные материалы" ]]; then
            echo "" >> combined.md
            echo '<div class="section-divider">' >> combined.md
            echo '<h1 id="справочные-материалы">📚 Справочные материалы</h1>' >> combined.md
            echo '</div>' >> combined.md
            echo "" >> combined.md
            current_section="📚 Справочные материалы"
        fi
        
        # Add invisible anchors for specific reference materials
        if [[ "$file" == "_Базовые типы.md" ]]; then
            echo '<div class="invisible-anchor" id="базовые-типы"></div>' >> combined.md
        elif [[ "$file" == "_Дженерики.md" ]]; then
            echo '<div class="invisible-anchor" id="дженерики"></div>' >> combined.md
        elif [[ "$file" == "_Специальные типы.md" ]]; then
            echo '<div class="invisible-anchor" id="специальные-типы"></div>' >> combined.md
        fi
    fi
    
    echo "" >> combined.md
    # Process file content and add proper anchors to headers
    process_file_with_anchors "$file" >> combined.md
    echo "" >> combined.md
done

# === Step 4: Generate PDF with md-to-pdf ===
echo "Генерация PDF с помощью md-to-pdf..."
echo "Создание PDF из ${#EXISTING_FILES[@]} файлов..."

# Add table of contents to the beginning of the markdown file
echo "Добавление оглавления..."
TOC_FILE="combined_with_toc.md"

# Create enhanced file with navigation (no metadata)
cat <<EOF > "$TOC_FILE"
<div class="cover-page">
<img src="assets/cover.png" alt="Практический TypeScript - Обложка" class="cover-image" />
</div>

# Оглавление

<div class="nav-section">
<h2>📖 Быстрая навигация по разделам</h2>
<div class="nav-links">
<a href="#основы-typescript" class="nav-link">🏗️ Основы TypeScript (01-10)</a>
<a href="#система-типов" class="nav-link">🔧 Система типов (11-30)</a>
<a href="#лучшие-практики" class="nav-link">📝 Лучшие практики (31-49)</a>
<a href="#продвинутые-типы" class="nav-link">🚀 Продвинутые типы (50-64)</a>
<a href="#публикация-и-api" class="nav-link">📦 Публикация и API (65-71)</a>
<a href="#производительность-и-миграция" class="nav-link">⚡ Производительность и миграция (72-83)</a>
<a href="#справочные-материалы" class="nav-link">📚 Справочные материалы</a>
</div>
</div>

EOF

# Generate detailed TOC with sections
generate_section_toc() {
    local start=$1
    local end=$2
    local section_name=$3
    local icon=$4
    
    echo "" >> "$TOC_FILE"
    echo "### $icon $section_name" >> "$TOC_FILE"
    echo "" >> "$TOC_FILE"
    
    for ((i=start; i<=end; i++)); do
        # Find file that starts with this number
        for file in "${EXISTING_FILES[@]}"; do
            if [[ "$file" =~ ^0*$i\. ]]; then
                # Extract title and create anchor using the same function as headers
                title=$(echo "$file" | sed 's/^[0-9]*\. //' | sed 's/\.md$//')
                # Use the same anchor creation function for consistency
                anchor=$(create_anchor "$title")
                echo "- [$i. $title](#$anchor)" >> "$TOC_FILE"
                break
            fi
        done
    done
}

# Generate clickable sections with enhanced styling
generate_clickable_section_toc() {
    local start=$1
    local end=$2
    local section_name=$3
    local icon=$4
    
    echo "" >> "$TOC_FILE"
    echo "### $icon $section_name" >> "$TOC_FILE"
    echo "" >> "$TOC_FILE"
    
    for ((i=start; i<=end; i++)); do
        # Find file that starts with this number
        for file in "${EXISTING_FILES[@]}"; do
            if [[ "$file" =~ ^0*$i\. ]]; then
                # Get the actual first header from the file instead of using filename
                actual_header=$(get_first_header "$file")
                if [[ -n "$actual_header" ]]; then
                    title="$actual_header"
                else
                    # Fallback to filename if no header found
                    title=$(echo "$file" | sed 's/^[0-9]*\. //' | sed 's/\.md$//')
                fi
                
                # Use the same anchor creation function for consistency
                anchor=$(create_anchor "$title")
                
                # Format with clickable styling
                echo "<div class=\"clickable-toc-entry\">" >> "$TOC_FILE"
                echo "  <span class=\"toc-chapter-number\">$i</span>" >> "$TOC_FILE"
                echo "  <a href=\"#$anchor\" class=\"toc-link\">$title</a>" >> "$TOC_FILE"
                echo "</div>" >> "$TOC_FILE"
                echo "" >> "$TOC_FILE"
                break
            fi
        done
    done
}

# Generate clickable sections
generate_clickable_section_toc 1 10 "Основы TypeScript" "🏗️"
generate_clickable_section_toc 11 30 "Система типов" "🔧"
generate_clickable_section_toc 31 49 "Лучшие практики" "📝"
generate_clickable_section_toc 50 64 "Продвинутые типы" "🚀"
generate_clickable_section_toc 65 71 "Публикация и API" "📦"
generate_clickable_section_toc 72 83 "Производительность и миграция" "⚡"

# Add clickable reference materials
cat <<EOF >> "$TOC_FILE"

### 📚 Справочные материалы

<div class="clickable-toc-entry">
  <span class="toc-chapter-number">📖</span>
  <a href="#базовые-типы" class="toc-link">Базовые типы</a>
</div>

<div class="clickable-toc-entry">
  <span class="toc-chapter-number">🔧</span>
  <a href="#дженерики" class="toc-link">Дженерики</a>
</div>

<div class="clickable-toc-entry">
  <span class="toc-chapter-number">⚡</span>
  <a href="#специальные-типы" class="toc-link">Специальные типы</a>
</div>

<div class="quick-ref">
<h3>💡 Как использовать навигацию</h3>
<p>В PDF-версии вы можете:</p>
<ul>
<li>Использовать закладки в боковой панели PDF-ридера</li>
<li>Кликать по ссылкам в оглавлении для быстрого перехода</li>
<li>Использовать поиск (Ctrl+F) для нахождения конкретных тем</li>
<li>Переходить между разделами с помощью навигационных блоков</li>
</ul>
</div>

---

EOF

# Append original content
cat combined.md >> "$TOC_FILE"

# Generate PDF using md-to-pdf
npx md-to-pdf "$TOC_FILE" --config-file ./pdf-config.js

# Rename the generated PDF to our desired output name
if [[ -f "${TOC_FILE%.md}.pdf" ]]; then
    mv "${TOC_FILE%.md}.pdf" "$OUTPUT"
fi
  

# === Step 5: Clean up ===
echo "Очистка временных файлов..."
rm -f combined.md "$TOC_FILE"

if [[ -f "$OUTPUT" ]]; then
    echo ""
    echo "✓ PDF успешно создан: $OUTPUT"
    echo "Включено файлов: ${#EXISTING_FILES[@]}"
    if [[ ${#MISSING_FILES[@]} -gt 0 ]]; then
        echo "Пропущено файлов: ${#MISSING_FILES[@]}"
    fi
    echo "Временные файлы очищены"
else
    echo ""
    echo "✗ Ошибка при создании PDF"
    echo "Проверьте логи компиляции markdown-pdf"
    exit 1
fi