#!/bin/bash

# === Configuration ===
OUTPUT="Практический_TypeScript.html"
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

# Create a combined markdown file with metadata and preface
cat <<EOF > combined.md
---
title: "$TITLE"
subtitle: "$SUBTITLE"
author: "$AUTHOR"
date: "$DATE"
lang: ru
toc: true
toc-depth: 2
---

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

---

EOF

# Append all existing files
for file in "${EXISTING_FILES[@]}"; do
    echo "" >> combined.md
    cat "$file" >> combined.md
    echo "" >> combined.md
done

# === Step 4: Generate HTML with pandoc ===
echo "Генерация HTML с помощью pandoc..."
echo "Создание HTML из ${#EXISTING_FILES[@]} файлов..."

pandoc combined.md -o "$OUTPUT" \
  --standalone \
  --toc \
  --toc-depth=2 \
  --highlight-style=tango \
  --css=styles.css \
  --metadata title="$TITLE" \
  --metadata author="$AUTHOR" \
  --metadata date="$DATE" \
  --metadata lang=ru

# === Step 5: Create CSS file for styling ===
echo "Создание CSS файла для стилизации..."

cat <<EOF > styles.css
/* General styling */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.6;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    background-color: #ffffff;
    color: #333;
}

/* Header styling */
header {
    text-align: center;
    margin-bottom: 2em;
    padding-bottom: 1em;
    border-bottom: 2px solid #e0e0e0;
}

h1.title {
    color: #2c3e50;
    font-size: 2.5em;
    margin-bottom: 0.5em;
}

p.subtitle {
    color: #7f8c8d;
    font-size: 1.2em;
    font-style: italic;
}

p.author, p.date {
    color: #95a5a6;
    margin: 0.5em 0;
}

/* Table of Contents */
#TOC {
    background-color: #f8f9fa;
    border: 1px solid #e9ecef;
    border-radius: 8px;
    padding: 20px;
    margin: 2em 0;
}

#TOC > ul {
    margin: 0;
    padding-left: 0;
}

#TOC ul {
    list-style-type: none;
}

#TOC li {
    margin: 0.5em 0;
}

#TOC a {
    color: #007bff;
    text-decoration: none;
    padding: 2px 4px;
    border-radius: 3px;
    transition: background-color 0.2s;
}

#TOC a:hover {
    background-color: #e3f2fd;
    text-decoration: underline;
}

/* Headings */
h1, h2, h3, h4, h5, h6 {
    color: #2c3e50;
    margin-top: 2em;
    margin-bottom: 1em;
}

h1 {
    font-size: 2.2em;
    border-bottom: 3px solid #3498db;
    padding-bottom: 0.5em;
}

h2 {
    font-size: 1.8em;
    border-bottom: 2px solid #95a5a6;
    padding-bottom: 0.3em;
}

h3 {
    font-size: 1.4em;
    color: #34495e;
}

/* Code styling */
code {
    background-color: #f8f9fa;
    padding: 2px 6px;
    border-radius: 3px;
    font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
    font-size: 0.9em;
    color: #e74c3c;
}

pre {
    background-color: #f8f9fa;
    border: 1px solid #e9ecef;
    border-radius: 6px;
    padding: 15px;
    overflow-x: auto;
    margin: 1.5em 0;
}

pre code {
    background-color: transparent;
    padding: 0;
    color: inherit;
}

/* Blockquotes */
blockquote {
    border-left: 4px solid #3498db;
    margin: 1.5em 0;
    padding: 0.5em 0 0.5em 1em;
    background-color: #f8f9fa;
    font-style: italic;
}

/* Lists */
ul, ol {
    margin: 1em 0;
    padding-left: 2em;
}

li {
    margin: 0.5em 0;
}

/* Tables */
table {
    border-collapse: collapse;
    width: 100%;
    margin: 1.5em 0;
}

th, td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
}

/* Links */
a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

/* Responsive design */
@media (max-width: 768px) {
    body {
        padding: 10px;
    }
    
    h1.title {
        font-size: 2em;
    }
    
    pre {
        padding: 10px;
        font-size: 0.9em;
    }
}

/* Print styles */
@media print {
    body {
        font-size: 12pt;
        line-height: 1.4;
    }
    
    #TOC {
        page-break-after: always;
    }
    
    h1, h2, h3 {
        page-break-after: avoid;
    }
    
    pre {
        page-break-inside: avoid;
    }
}
EOF

# === Step 6: Clean up ===
echo "Очистка временных файлов..."
rm -f combined.md

if [[ -f "$OUTPUT" ]]; then
    echo ""
    echo "✓ HTML успешно создан: $OUTPUT"
    echo "✓ CSS файл создан: styles.css"
    echo "Включено файлов: ${#EXISTING_FILES[@]}"
    if [[ ${#MISSING_FILES[@]} -gt 0 ]]; then
        echo "Пропущено файлов: ${#MISSING_FILES[@]}"
    fi
    echo "Временные файлы очищены"
    echo ""
    echo "Откройте $OUTPUT в браузере для просмотра"
else
    echo ""
    echo "✗ Ошибка при создании HTML"
    echo "Проверьте логи компиляции pandoc"
    exit 1
fi