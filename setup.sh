#!/bin/bash

# AI Workflow Agents Setup Script
# Usage: ./setup.sh --target /path/to/project --template java-ddd

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE="java-ddd"
INSTALL_GLOBAL=true
TARGET_PROJECT=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --target|-t)
            TARGET_PROJECT="$2"
            shift 2
            ;;
        --template)
            TEMPLATE="$2"
            shift 2
            ;;
        --no-global)
            INSTALL_GLOBAL=false
            shift
            ;;
        -h|--help)
            echo "Usage: ./setup.sh --target <project-path> [--template <template>] [--no-global]"
            echo ""
            echo "Options:"
            echo "  --target, -t   Target project path (required)"
            echo "  --template     Template to use (default: java-ddd)"
            echo "  --no-global    Skip global rules installation"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}========================================"
echo -e "  AI Workflow Agents Setup"
echo -e "========================================${NC}"
echo ""

# Validate target
if [ -z "$TARGET_PROJECT" ]; then
    echo -e "${RED}[ERROR] Target project is required${NC}"
    echo "Usage: ./setup.sh --target /path/to/project"
    exit 1
fi

if [ ! -d "$TARGET_PROJECT" ]; then
    echo -e "${RED}[ERROR] Target project not found: $TARGET_PROJECT${NC}"
    exit 1
fi

# Validate template
TEMPLATE_PATH="$SCRIPT_DIR/templates/$TEMPLATE"
if [ ! -d "$TEMPLATE_PATH" ]; then
    echo -e "${RED}[ERROR] Template not found: $TEMPLATE${NC}"
    echo "Available templates:"
    ls -1 "$SCRIPT_DIR/templates" | sed 's/^/  - /'
    exit 1
fi

# Copy template
echo -e "${GREEN}[1/4] Copying workflow template '$TEMPLATE'...${NC}"
AGENT_DIR="$TARGET_PROJECT/.agent"
mkdir -p "$AGENT_DIR"
cp -r "$TEMPLATE_PATH/.agent/"* "$AGENT_DIR/"
echo -e "  ${GREEN}[OK] Workflows copied to $AGENT_DIR${NC}"

# Copy rules
echo -e "${GREEN}[2/4] Copying rules library...${NC}"
cp -r "$SCRIPT_DIR/rules" "$TARGET_PROJECT/"
echo -e "  ${GREEN}[OK] Rules library copied${NC}"

# Install global
if [ "$INSTALL_GLOBAL" = true ]; then
    echo -e "${GREEN}[3/4] Installing global rules...${NC}"
    GEMINI_DIR="$HOME/.gemini"
    mkdir -p "$GEMINI_DIR"
    
    if [ -f "$GEMINI_DIR/GEMINI.md" ]; then
        echo -e "  ${YELLOW}[WARN] Global GEMINI.md exists. Creating backup...${NC}"
        cp "$GEMINI_DIR/GEMINI.md" "$GEMINI_DIR/GEMINI.md.backup"
    fi
    
    cp "$SCRIPT_DIR/global/GEMINI.md" "$GEMINI_DIR/"
    echo -e "  ${GREEN}[OK] Global rules installed${NC}"
else
    echo -e "${YELLOW}[3/4] Skipping global rules installation${NC}"
fi

# Cursor compatibility
echo -e "${GREEN}[4/4] Creating Cursor compatibility files...${NC}"
if [ ! -f "$TARGET_PROJECT/.cursorrules" ]; then
    cp "$SCRIPT_DIR/global/.cursorrules" "$TARGET_PROJECT/"
    echo -e "  ${GREEN}[OK] .cursorrules created${NC}"
else
    echo -e "  ${YELLOW}[SKIP] .cursorrules already exists${NC}"
fi

echo ""
echo -e "${CYAN}========================================"
echo -e "  Setup Complete!"
echo -e "========================================${NC}"
echo ""
echo "Run '/master-pipeline' to start the full workflow!"
