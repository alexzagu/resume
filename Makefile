.PHONY: all clean install fullstack-en fullstack-fr ios-en ios-fr

# Output directory
OUTPUT_DIR = output

# RenderCV command
RENDERCV = rendercv render

# Shared files
DESIGN = rendercv/design/shared.yaml
LOCALE_EN = rendercv/locale/english.yaml
LOCALE_FR = rendercv/locale/french.yaml

# Content files
CONTENT_FULLSTACK_EN = rendercv/content/fullstack_en.yaml
CONTENT_FULLSTACK_FR = rendercv/content/fullstack_fr.yaml
CONTENT_IOS_EN = rendercv/content/ios_en.yaml
CONTENT_IOS_FR = rendercv/content/ios_fr.yaml

# Default target: build all CVs
all: fullstack-en fullstack-fr ios-en ios-fr

# Install RenderCV
install:
	@echo "Installing RenderCV..."
	uv tool install "rendercv[full]"

# Build Full Stack English CV
fullstack-en:
	@echo "Building Full Stack (English) CV..."
	$(RENDERCV) $(CONTENT_FULLSTACK_EN) \
		--design $(DESIGN) \
		--locale-catalog $(LOCALE_EN) \
		--output-folder $(OUTPUT_DIR)/fullstack_en

# Build Full Stack French CV
fullstack-fr:
	@echo "Building Full Stack (French) CV..."
	$(RENDERCV) $(CONTENT_FULLSTACK_FR) \
		--design $(DESIGN) \
		--locale-catalog $(LOCALE_FR) \
		--output-folder $(OUTPUT_DIR)/fullstack_fr

# Build iOS English CV
ios-en:
	@echo "Building iOS (English) CV..."
	$(RENDERCV) $(CONTENT_IOS_EN) \
		--design $(DESIGN) \
		--locale-catalog $(LOCALE_EN) \
		--output-folder $(OUTPUT_DIR)/ios_en

# Build iOS French CV
ios-fr:
	@echo "Building iOS (French) CV..."
	$(RENDERCV) $(CONTENT_IOS_FR) \
		--design $(DESIGN) \
		--locale-catalog $(LOCALE_FR) \
		--output-folder $(OUTPUT_DIR)/ios_fr

# Clean output directory
clean:
	@echo "Cleaning output directory..."
	rm -rf $(OUTPUT_DIR)

# Help target
help:
	@echo "Available targets:"
	@echo "  make all          - Build all CVs (default)"
	@echo "  make fullstack-en - Build Full Stack English CV"
	@echo "  make fullstack-fr - Build Full Stack French CV"
	@echo "  make ios-en       - Build iOS English CV"
	@echo "  make ios-fr       - Build iOS French CV"
	@echo "  make clean        - Clean output directory"
	@echo "  make install      - Install RenderCV"
