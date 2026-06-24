#!/bin/bash
# ============================================================
# Beginner Web Tutorial - 一键部署脚本
# 适用于 Linux / macOS 环境
# ============================================================

set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo -e "${CYAN}============================================${NC}"
echo -e "${CYAN}   Beginner Web Tutorial - 一键部署脚本   ${NC}"
echo -e "${CYAN}============================================${NC}"
echo ""

# -------------------- 1. 检测系统环境 --------------------
echo -e "${GREEN}[1/3]${NC} 检测系统环境..."
if command -v node &> /dev/null; then
    echo "  Node.js $(node --version)"
else
    echo "  Node.js 未安装（非必须，跳过）"
fi
echo ""

# -------------------- 2. 安装前端依赖（可选）------------------
echo -e "${GREEN}[2/3]${NC} 安装项目依赖..."
if [ -f "$PROJECT_DIR/package.json" ] && command -v npm &> /dev/null; then
    cd "$PROJECT_DIR" && npm install --silent 2>/dev/null && echo "  依赖安装完成"
else
    echo "  无需额外依赖"
fi
echo ""

# -------------------- 3. 启动本地服务器 --------------------
echo -e "${GREEN}[3/3]${NC} 启动本地开发服务器..."
echo ""

SERVE_BIN="$PROJECT_DIR/bin/serve"

if [ -f "$SERVE_BIN" ]; then
    chmod +x "$SERVE_BIN" 2>/dev/null
    # 后台启动内置服务器
    cd "$PROJECT_DIR"
    nohup "$SERVE_BIN" > /dev/null 2>&1 &
    SERVER_PID=$!
    sleep 1
    if kill -0 $SERVER_PID 2>/dev/null; then
        echo "  服务器已启动 (PID: $SERVER_PID)"
    else
        echo "  服务器已在后台启动"
    fi
else
    # 降级方案：用 npx serve
    echo "  使用 npx serve 启动..."
    nohup npx serve "$PROJECT_DIR/src" -p 3000 > /dev/null 2>&1 &
fi

echo ""
echo -e "${CYAN}============================================${NC}"
echo -e "${CYAN}   部署完成！${NC}"
echo -e "${CYAN}   打开浏览器访问 http://localhost:3000${NC}"
echo -e "${CYAN}============================================${NC}"
