# AI Training & Scraping Policy

> **Last Updated**: 2026-04-26

## Our Position on AI Training

We **do not consent** to our content being used for training artificial intelligence models without explicit, written permission.

This includes but is not limited to:
- Large Language Models (LLMs)
- Image generation models
- Code generation models
- Any other AI/ML training purposes

## What We're Doing

### 1. robots.txt Configuration

We have configured `robots.txt` to explicitly block known AI training crawlers:

```
User-agent: GPTBot
Disallow: /

User-agent: ChatGPT-User
Disallow: /

User-agent: Claude-Web
Disallow: /

User-agent: Google-Extended
Disallow: /

User-agent: PerplexityBot
Disallow: /

# ... and more
```

### 2. License Restrictions

Our content is released under MIT License with explicit restrictions on AI training without permission.

### 3. Technical Measures

We may implement additional technical measures to prevent unauthorized scraping.

## Why This Matters

### For Content Creators
- Our content represents thousands of hours of work
- We have the right to control how it's used
- AI training often occurs without compensation or attribution

### For the AI Industry
- We believe in ethical AI development
- Consent should be obtained before using others' work
- The industry needs sustainable content licensing models

## If You're an AI Company

### Legitimate Uses
We welcome:
- Search engines indexing our content
- Users reading our tutorials
- Proper citations and attributions
- Research and analysis (fair use)

### To Request Permission
If you want to use our content for AI training, please:
1. Open an issue on our GitHub repository
2. Describe the intended use
3. Provide information about your model and training practices
4. We will review and respond

### For Search & Discovery
We allow legitimate search engines (Google, Bing, DuckDuckGo, etc.) to crawl our content for indexing purposes.

## How We Detect Violations

We monitor for:
- Unusual crawling patterns
- Known AI crawler signatures
- Violations of robots.txt

## Reporting Violations

If you believe our content is being used in violation of this policy:

1. Document the evidence
2. Open an issue on GitHub
3. We will investigate and take appropriate action

## Alternatives for AI Developers

If you're building an AI application and need educational content:

1. **Use public datasets**: Many organizations license content for AI training
2. **Create your own content**: Original work is always best
3. **License properly**: Many creators are willing to license content for fair compensation
4. **Use public APIs**: Some services provide API access to licensed content

## Legal Framework

This policy is based on:
- Copyright law
- Terms of service of major AI companies
- Industry best practices for content creators
- Our rights as the content creators

## Changes to This Policy

We may update this policy as the AI industry evolves. Significant changes will be announced through our GitHub repository.

---

## Quick Summary

| Action | Status |
|--------|--------|
| AI Training | ❌ Not Allowed (without permission) |
| Search Engine Indexing | ✅ Allowed |
| Personal/Educational Use | ✅ Allowed |
| Proper Citations | ✅ Required |

---

*Questions? Open an issue on [GitHub](https://github.com/Fz2hOpenSource/robotics-course/issues)*
