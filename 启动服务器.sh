#!/bin/bash

# 中医古籍典藏 - 启动脚本

echo "======================================"
echo "  中医古籍典藏 - TCM Ancient Books"
echo "======================================"
echo ""

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# 检查端口是否被占用
PORT=8000
while lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null 2>&1 ; do
    echo "⚠️  端口 $PORT 已被占用，尝试使用端口 $((PORT+1))"
    PORT=$((PORT+1))
done

echo "✅ 启动本地HTTP服务器..."
echo "📂 目录: $SCRIPT_DIR"
echo "🌐 端口: $PORT"
echo ""
echo "请在浏览器中访问："
echo "👉 http://localhost:$PORT/index.html"
echo ""
echo "按 Ctrl+C 停止服务器"
echo "======================================"
echo ""

# 启动服务器
python3 -m http.server $PORT

# 如果Python3不可用，尝试Python2
if [ $? -ne 0 ]; then
    echo "Python3 不可用，尝试使用 Python2..."
    python -m SimpleHTTPServer $PORT
fi
