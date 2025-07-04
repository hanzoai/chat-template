# Hanzo AI Chat Branding Assets

This directory contains the branding assets for Hanzo AI Chat.

## Logo Files

- **logo-adaptive.svg** - Main logo that uses `currentColor` to adapt to the parent element's color
- **logo-light.svg** - Logo optimized for light backgrounds (dark gray with blue accent)
- **logo-dark.svg** - Logo optimized for dark backgrounds (gradient fill)
- **logo.svg** - Legacy logo with CSS media queries for theme detection
- **favicon.svg** - 32x32 favicon with gradient background

## Usage

The chat application can be configured to use different logos for light and dark modes:

```env
# Single adaptive logo
BRAND_LOGO_URL=/assets/brand/logo-adaptive.svg

# Or separate logos for each theme
BRAND_LOGO_LIGHT_URL=/assets/brand/logo-light.svg
BRAND_LOGO_DARK_URL=/assets/brand/logo-dark.svg
```

## Customization

To use your own branding:

1. Replace the SVG files in this directory with your own logos
2. Update the environment variables in `.env` to point to your logo files
3. Optionally update `BRAND_COLOR` and `BRAND_COLOR_SECONDARY` for your brand colors

## Logo Design

The Hanzo logo is a stylized "H" with:
- Clean, modern design using geometric shapes
- An AI indicator dot to represent the AI-powered nature
- Blue gradient (#3B82F6 to #8B5CF6) for the brand colors
- Adaptive coloring for light/dark theme support