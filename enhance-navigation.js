#!/usr/bin/env node

/**
 * Post-processing script to enhance PDF navigation
 * This script adds clickable navigation features to the generated HTML
 */

const fs = require('fs');
const path = require('path');

function enhanceNavigation(htmlContent) {
  // Add navigation enhancement script
  const navigationScript = `
    <script>
      // Enhance PDF navigation
      document.addEventListener('DOMContentLoaded', function() {
        // Add click handlers for TOC links
        const tocLinks = document.querySelectorAll('.toc-link, .nav-link');
        tocLinks.forEach(link => {
          link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            const targetElement = document.getElementById(targetId);
            if (targetElement) {
              targetElement.scrollIntoView({ behavior: 'smooth' });
              // Add visual feedback
              targetElement.style.backgroundColor = '#fff3cd';
              setTimeout(() => {
                targetElement.style.backgroundColor = '';
              }, 2000);
            }
          });
        });
        
        // Enhance headings with anchor links
        const headings = document.querySelectorAll('h1, h2, h3, h4, h5, h6');
        headings.forEach(heading => {
          if (!heading.id) {
            // Generate ID from text content
            const text = heading.textContent.trim();
            const id = text.toLowerCase()
              .replace(/[^\\w\\u0400-\\u04FF\\s]/g, '')
              .replace(/\\s+/g, '-')
              .replace(/^-+|-+$/g, '');
            heading.id = id;
          }
          
          // Add anchor link
          const anchor = document.createElement('a');
          anchor.className = 'anchor-link';
          anchor.href = '#' + heading.id;
          anchor.innerHTML = '🔗';
          anchor.style.opacity = '0';
          anchor.style.marginLeft = '0.5em';
          anchor.style.fontSize = '0.8em';
          anchor.style.textDecoration = 'none';
          
          heading.appendChild(anchor);
          
          // Show anchor on hover
          heading.addEventListener('mouseenter', () => {
            anchor.style.opacity = '0.7';
          });
          heading.addEventListener('mouseleave', () => {
            anchor.style.opacity = '0';
          });
        });
        
        // Add back-to-top functionality
        const backToTop = document.createElement('div');
        backToTop.innerHTML = '⬆️ Наверх';
        backToTop.style.cssText = \`
          position: fixed;
          bottom: 20px;
          right: 20px;
          background: #0066cc;
          color: white;
          padding: 10px 15px;
          border-radius: 5px;
          cursor: pointer;
          font-size: 14px;
          z-index: 1000;
          opacity: 0;
          transition: opacity 0.3s;
        \`;
        
        document.body.appendChild(backToTop);
        
        backToTop.addEventListener('click', () => {
          window.scrollTo({ top: 0, behavior: 'smooth' });
        });
        
        // Show/hide back to top button
        window.addEventListener('scroll', () => {
          if (window.scrollY > 300) {
            backToTop.style.opacity = '0.8';
          } else {
            backToTop.style.opacity = '0';
          }
        });
      });
    </script>
  `;
  
  // Add enhanced CSS for better clickable navigation
  const enhancedCSS = `
    <style>
      /* Enhanced clickable navigation */
      .toc-link, .nav-link {
        position: relative;
        transition: all 0.2s ease;
      }
      
      .toc-link:hover, .nav-link:hover {
        transform: translateX(3px);
        color: #004499 !important;
      }
      
      .toc-link::before, .nav-link::before {
        content: '→';
        position: absolute;
        left: -15px;
        opacity: 0;
        transition: opacity 0.2s ease;
      }
      
      .toc-link:hover::before, .nav-link:hover::before {
        opacity: 1;
      }
      
      /* Smooth scrolling for all internal links */
      html {
        scroll-behavior: smooth;
      }
      
      /* Highlight target sections */
      :target {
        background-color: #fff3cd !important;
        padding: 0.5em;
        border-radius: 4px;
        animation: highlight 2s ease-out;
      }
      
      @keyframes highlight {
        0% { background-color: #ffeb3b; }
        100% { background-color: #fff3cd; }
      }
      
      /* Enhanced section dividers */
      .section-divider {
        position: relative;
        overflow: hidden;
      }
      
      .section-divider::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        animation: shimmer 3s infinite;
      }
      
      @keyframes shimmer {
        0% { left: -100%; }
        100% { left: 100%; }
      }
      
      /* Print-friendly navigation */
      @media print {
        .anchor-link,
        [style*="position: fixed"] {
          display: none !important;
        }
        
        .toc-link, .nav-link {
          color: #0066cc !important;
          text-decoration: underline !important;
        }
      }
    </style>
  `;
  
  // Insert enhancements before closing head tag
  let enhanced = htmlContent.replace('</head>', enhancedCSS + navigationScript + '</head>');
  
  // Enhance TOC entries with better structure
  enhanced = enhanced.replace(
    /<div class="clickable-toc-entry">/g,
    '<div class="clickable-toc-entry" role="navigation" aria-label="Table of contents entry">'
  );
  
  // Add ARIA labels for better accessibility
  enhanced = enhanced.replace(
    /class="toc-link"/g,
    'class="toc-link" role="link" tabindex="0"'
  );
  
  return enhanced;
}

// Main execution
if (require.main === module) {
  const args = process.argv.slice(2);
  if (args.length !== 1) {
    console.error('Usage: node enhance-navigation.js <html-file>');
    process.exit(1);
  }
  
  const htmlFile = args[0];
  
  if (!fs.existsSync(htmlFile)) {
    console.error(`File not found: ${htmlFile}`);
    process.exit(1);
  }
  
  try {
    const htmlContent = fs.readFileSync(htmlFile, 'utf8');
    const enhanced = enhanceNavigation(htmlContent);
    fs.writeFileSync(htmlFile, enhanced);
    console.log(`✓ Enhanced navigation for ${htmlFile}`);
  } catch (error) {
    console.error(`Error enhancing navigation: ${error.message}`);
    process.exit(1);
  }
}

module.exports = { enhanceNavigation };