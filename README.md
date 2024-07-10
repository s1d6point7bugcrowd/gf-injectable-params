# Automated URL Extraction for Injection Testing

This script automates the extraction of URLs from a specified target website, filtering them based on injection patterns using various tools and techniques.

## Features

- **Dynamic URL Crawling**: Uses `gospider` to crawl the target website and collect URLs.
- **Injection Pattern Matching**: Utilizes `gf` with predefined patterns to filter URLs susceptible to various injection types:
  - IDOR (Insecure Direct Object Reference)
  - LFI (Local File Inclusion)
  - RCE (Remote Code Execution)
  - Redirect vulnerabilities
  - SQL Injection (SQLi)
  - SSRF (Server-Side Request Forgery)
  - SSTI (Server-Side Template Injection)
  - XSS (Cross-Site Scripting)
- **Automated Cleaning**: Cleans URLs for injection testing by removing unnecessary parameters.
- **Duplicate Removal**: Ensures unique URLs are extracted for efficient testing.

## Prerequisites

Before using the script, ensure you have the following tools installed:

- `gospider`: For web crawling and URL extraction.
- `gf`: A grep tool specifically designed for extracting URLs based on predefined patterns.
- Basic command-line tools (`sed`, `grep`, `awk`) typically available on Unix-like systems.

## Usage

1. **Clone the gf-patterns repository**:
   ```bash
   git clone https://github.com/rix4uni/gf-patterns.git ~/.gf
