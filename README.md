# Resume Generator with RenderCV

This repository contains Markdown and YAML files to generate professional CVs using [RenderCV](https://github.com/rendercv/rendercv).

## Structure

```
.
├── Makefile                    # Build automation
├── rendercv/
│   ├── content/               # CV content (one per track/language)
│   │   ├── fullstack_en.yaml
│   │   ├── fullstack_fr.yaml
│   │   ├── ios_en.yaml
│   │   └── ios_fr.yaml
│   ├── design/                # Shared design configuration
│   │   └── shared.yaml
│   └── locale/                # Language settings
│       ├── english.yaml
│       └── french.yaml
```

## Tracks & Languages

We generate **4 CVs** (2 tracks × 2 languages):

- **Full Stack Track**: English and French
- **iOS Track**: English and French

## Prerequisites

Install RenderCV:

```bash
make install
# or manually:
uv tool install "rendercv[full]"
```

## Usage

### Build all CVs

```bash
make all
```

This generates PDFs in the `output/` directory:
- `output/fullstack_en/Alejandro_Zamudio_CV.pdf`
- `output/fullstack_fr/Alejandro_Zamudio_CV.pdf`
- `output/ios_en/Alejandro_Zamudio_CV.pdf`
- `output/ios_fr/Alejandro_Zamudio_CV.pdf`

### Build individual CVs

```bash
make fullstack-en   # Full Stack English
make fullstack-fr   # Full Stack French
make ios-en         # iOS English
make ios-fr         # iOS French
```

### Clean output

```bash
make clean
```

### Watch mode (auto-rebuild on changes)

For development, you can use RenderCV's watch mode:

```bash
rendercv render rendercv/content/fullstack_en.yaml \
  --design rendercv/design/shared.yaml \
  --locale-catalog rendercv/locale/english.yaml \
  --output-folder output/fullstack_en \
  --watch
```

## Customization

### Update content

Edit the YAML files in `rendercv/content/` to modify CV content for each track and language.

### Change design

Edit `rendercv/design/shared.yaml` to customize the visual appearance. All CVs share the same design.

Available themes: `classic`, `harvard`, `engineeringresumes`, `engineeringclassic`, `sb2nov`, `moderncv`

### Modify locales

Edit files in `rendercv/locale/` to customize language-specific settings like date formats and month names.

## File Organization

- **Shared design**: All CVs use the same design from `rendercv/design/shared.yaml`
- **Separate content**: Each track/language combination has its own content file
- **Locale files**: Language settings are separated for English and French

This multi-file approach makes it easy to:
- Update design once for all CVs
- Maintain separate content for different tracks
- Support multiple languages with proper localization
