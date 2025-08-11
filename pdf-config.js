module.exports = {
  stylesheet: ['./styles.css'],
  css: `
    @page {
      margin: 20mm;
      @bottom-center {
        content: "Страница " counter(page) " из " counter(pages);
        font-size: 10px;
        color: #666;
      }
    }
    
    /* Table of Contents styling */
    .toc {
      page-break-after: always;
      margin-bottom: 2em;
    }
    
    .toc h1 {
      text-align: center;
      margin-bottom: 1em;
      border-bottom: 2px solid #333;
      padding-bottom: 0.5em;
    }
    
    .toc-entry {
      display: flex;
      justify-content: space-between;
      margin: 0.5em 0;
      padding: 0.25em 0;
      border-bottom: 1px dotted #ccc;
    }
    
    .toc-entry a {
      text-decoration: none;
      color: #333;
      flex-grow: 1;
    }
    
    .toc-entry a:hover {
      color: #0066cc;
    }
    
    .toc-page-number {
      margin-left: 1em;
      font-weight: bold;
      color: #666;
    }
    
    /* Enhanced navigation styles */
    .nav-section {
      background: #f8f9fa;
      border-left: 4px solid #0066cc;
      padding: 1em;
      margin: 1em 0;
      page-break-inside: avoid;
    }
    
    .nav-section h2 {
      margin-top: 0;
      color: #0066cc;
    }
    
    .nav-links {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 0.5em;
      margin-top: 1em;
    }
    
    .nav-link {
      display: block;
      padding: 0.5em;
      background: white;
      border: 1px solid #ddd;
      border-radius: 4px;
      text-decoration: none;
      color: #333;
      transition: all 0.2s;
    }
    
    .nav-link:hover {
      background: #e9ecef;
      border-color: #0066cc;
    }
    
    /* Chapter numbering */
    body {
      counter-reset: chapter;
    }
    
    h1 {
      counter-increment: chapter;
      page-break-before: always;
      position: relative;
    }
    
    h1::before {
      content: "Глава " counter(chapter) ": ";
      font-weight: bold;
      color: #0066cc;
    }
    
    /* Navigation bookmarks for PDF outline */
    .bookmark {
      position: absolute;
      left: -9999px;
    }
    
    /* Section dividers */
    .section-divider {
      page-break-before: always;
      text-align: center;
      padding: 2em 0;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      margin: 2em 0;
    }
    
    .section-divider h1 {
      margin: 0;
      font-size: 2.5em;
      text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
    }
    
    .section-divider h1::before {
      content: "";
    }
    
    /* Quick reference boxes */
    .quick-ref {
      background: #fff3cd;
      border: 1px solid #ffeaa7;
      border-radius: 8px;
      padding: 1em;
      margin: 1em 0;
      page-break-inside: avoid;
    }
    
    .quick-ref h3 {
      margin-top: 0;
      color: #856404;
    }
    
    /* Clickable navigation styles */
    .anchor-link {
      position: absolute;
      left: -9999px;
    }
    
    .toc-link {
      color: #0066cc !important;
      text-decoration: underline;
      cursor: pointer;
      transition: color 0.2s ease;
    }
    
    .toc-link:hover {
      color: #004499 !important;
      text-decoration: underline;
    }
    
    .internal-link {
      color: #0066cc;
      text-decoration: underline;
      cursor: pointer;
    }
    
    .internal-link:hover {
      color: #004499;
      text-decoration: underline;
    }
    
    /* Enhanced clickable TOC entries */
    .clickable-toc-entry {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin: 0.5em 0;
      padding: 0.5em;
      border: 1px solid #e0e0e0;
      border-radius: 4px;
      background: #fafafa;
      transition: all 0.2s ease;
    }
    
    .clickable-toc-entry:hover {
      background: #f0f8ff;
      border-color: #0066cc;
      transform: translateX(2px);
    }
    
    .clickable-toc-entry a {
      color: #0066cc !important;
      text-decoration: none;
      font-weight: 500;
      flex-grow: 1;
    }
    
    .clickable-toc-entry a:hover {
      text-decoration: underline;
    }
    
    .toc-chapter-number {
      background: #0066cc;
      color: white;
      padding: 0.2em 0.5em;
      border-radius: 3px;
      font-size: 0.9em;
      font-weight: bold;
      margin-right: 0.5em;
      min-width: 2em;
      text-align: center;
    }
  `,
  pdf_options: {
    format: 'A4',
    printBackground: true,
    displayHeaderFooter: true,
    headerTemplate: `
      <div style="font-size: 10px; width: 100%; text-align: center; color: #666; margin-top: 5px;">
        <span style="float: left; margin-left: 20mm;">Практический TypeScript</span>
        <span style="float: right; margin-right: 20mm;">Глава <span class="pageNumber"></span></span>
      </div>
    `,
    footerTemplate: `
      <div style="font-size: 10px; text-align: center; width: 100%; margin-bottom: 5px; color: #666;">
        <span>Страница <span class="pageNumber"></span> из <span class="totalPages"></span></span>
      </div>
    `,
    margin: {
      top: '25mm',
      right: '20mm',
      bottom: '25mm',
      left: '20mm'
    },
    // Enhanced PDF navigation features
    tagged: true,
    outline: true,
    generateDocumentOutline: true,
    // Enable PDF bookmarks and internal links
    preferCSSPageSize: true,
    omitBackground: false,
    // Enable JavaScript for enhanced navigation
    javascriptEnabled: true,
    // Wait for content to load
    waitForSelector: 'body',
    // Launch options for better PDF generation
    launch_options: {
      args: ['--no-sandbox', '--disable-setuid-sandbox']
    }
  },
  marked_options: {
    headerIds: true,
    mangle: false
  },
  // Enhanced table of contents with clickable links
  toc: true,
  tocDepth: 2
};