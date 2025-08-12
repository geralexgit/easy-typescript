module.exports = {
  stylesheet: ['./styles.css'],
  css: `
    @page {
      margin: 20mm;
      /* Remove default page numbers from bottom */
    }
    
    /* Enhanced smooth scrolling for all internal links */
    html {
      scroll-behavior: smooth;
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
      padding: 0.75em 0;
      border: 2px solid #0066cc;
      border-radius: 6px;
      text-decoration: none;
      color: #0066cc !important;
      font-weight: 500;
      text-align: center;
      transition: all 0.2s;
      cursor: pointer;
    }
    
    .nav-link:hover {
      background: #0066cc;
      color: white !important;
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0, 102, 204, 0.2);
    }
    
    /* Chapter numbering - only for main content, not navigation */
    .main-content {
      counter-reset: chapter;
    }
    
    /* Navigation sections should not have chapter numbering */
    .toc h1,
    .nav-section h1,
    .section-divider h1 {
      counter-increment: none;
    }
    
    .toc h1::before,
    .nav-section h1::before,
    .section-divider h1::before {
      content: "";
    }
    
    /* Main content chapters get numbering */
    .main-content h1 {
      counter-increment: chapter;
      page-break-before: always;
      position: relative;
    }
    
    .main-content h1::before {
      content: "Глава " counter(chapter) ": ";
      font-weight: bold;
      color: #0066cc;
    }
    
    /* Alternative: Use attribute selector for numbered chapters */
    h1[data-chapter] {
      counter-increment: chapter;
      page-break-before: always;
      position: relative;
    }
    
    h1[data-chapter]::before {
      content: "Глава " counter(chapter) ": ";
      font-weight: bold;
      color: #0066cc;
    }
    
    /* Navigation bookmarks for PDF outline */
    .bookmark {
      position: absolute;
      left: -9999px;
    }
    
    /* Section dividers - visible for navigation */
    .section-divider {
      margin: 2em 0;
      page-break-before: always;
      page-break-inside: avoid;
    }
    
    .section-divider h1 {
      background: linear-gradient(135deg, #0066cc, #004499);
      color: white;
      padding: 1em;
      margin: 0;
      border-radius: 8px;
      text-align: center;
      font-size: 1.5em;
      box-shadow: 0 4px 8px rgba(0, 102, 204, 0.2);
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
    
    /* Invisible anchors for reference materials navigation */
    .invisible-anchor {
      display: block;
      height: 0;
      width: 0;
      margin: 0;
      padding: 0;
      border: none;
      outline: none;
      overflow: hidden;
      opacity: 0;
      pointer-events: none;
      position: static;
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
      transition: all 0.2s ease;
    }
    
    .clickable-toc-entry:hover {
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
    
    /* Clickable reference materials section */
    .reference-materials {
      margin: 2em 0;
      page-break-inside: avoid;
    }
    
    .reference-materials h3 {
      color: #0066cc;
      border-bottom: 2px solid #0066cc;
      padding-bottom: 0.5em;
      margin-bottom: 1em;
    }
    
    .reference-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 1em;
      margin-top: 1em;
    }
    
    .reference-item {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 1em;
      transition: all 0.2s ease;
      cursor: pointer;
    }
    
    .reference-item:hover {
      border-color: #0066cc;
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0, 102, 204, 0.1);
    }
    
    .reference-item h4 {
      margin-top: 0;
      color: #0066cc;
      font-size: 1.1em;
    }
    
    .reference-item p {
      margin: 0.5em 0;
      color: #666;
      font-size: 0.9em;
    }
    
    .reference-link {
      display: inline-block;
      color: #0066cc !important;
      text-decoration: none;
      font-weight: 500;
      padding: 0.3em 0.8em;
      border: 1px solid #0066cc;
      border-radius: 4px;
      margin-top: 0.5em;
      transition: all 0.2s ease;
    }
    
    .reference-link:hover {
      background: #0066cc;
      color: white !important;
      text-decoration: none;
    }
    
    /* Enhanced reference materials navigation */
    .ref-nav-section {
      border-left: 4px solid #28a745;
      padding: 1em;
      margin: 1em 0;
      page-break-inside: avoid;
    }
    
    .ref-nav-section h3 {
      margin-top: 0;
      color: #28a745;
      font-size: 1.2em;
    }
    
    .ref-nav-links {
      display: flex;
      flex-wrap: wrap;
      gap: 0.5em;
      margin-top: 1em;
    }
    
    .ref-nav-link {
      display: inline-block;
      padding: 0.5em 1em;
      border: 1px solid #28a745;
      border-radius: 6px;
      text-decoration: none;
      color: #28a745;
      font-weight: 500;
      transition: all 0.2s ease;
      cursor: pointer;
    }
    
    .ref-nav-link:hover {
      background: #28a745;
      color: white;
      text-decoration: none;
      transform: translateY(-1px);
    }
  `,
  pdf_options: {
    format: 'A4',
    printBackground: true,
    displayHeaderFooter: false,
    footerTemplate: `
      <div style="font-size: 9px; width: 100%; padding: 0 20mm; display: flex; justify-content: space-between; align-items: center; color: #444; border-top: 1px solid #ddd; padding-top: 3px; margin-bottom: 8px;">
        <span>© 2025 TypeScript Guide</span>
        <span style="font-weight: 500;">Страница <span class="pageNumber"></span> из <span class="totalPages"></span></span>
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