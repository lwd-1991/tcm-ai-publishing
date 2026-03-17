# 推送到GitHub步骤

## 当前状态

✅ 代码已提交到本地仓库
- Commit: a1394c8
- 分支: gh-pages
- 消息: "添加TXT编辑器和完善功能"

❌ 推送到远程仓库失败
- 原因: 网络连接GitHub超时（443端口和22端口都无法连接）

## 解决方案

### 方案一：配置网络代理（推荐）

如果你有代理服务器，可以配置Git使用代理：

```bash
# HTTP代理
git config --global http.proxy http://127.0.0.1:7890
git config --global https.proxy http://127.0.0.1:7890

# SOCKS5代理
git config --global http.proxy socks5://127.0.0.1:7890
git config --global https.proxy socks5://127.0.0.1:7890

# 然后推送
cd /Volumes/PSSD/TCM-Ancient-Books
git push origin gh-pages
```

取消代理：
```bash
git config --global --unset http.proxy
git config --global --unset https.proxy
```

### 方案二：使用GitHub Desktop

1. 下载并安装 [GitHub Desktop](https://desktop.github.com/)
2. 打开 GitHub Desktop
3. File → Add Local Repository
4. 选择 `/Volumes/PSSD/TCM-Ancient-Books`
5. 点击 "Push origin" 按钮

### 方案三：使用GitHub CLI

```bash
# 登录GitHub
gh auth login

# 推送代码
cd /Volumes/PSSD/TCM-Ancient-Books
git push origin gh-pages
```

### 方案四：手动上传（不推荐）

1. 访问 https://github.com/westwolf-lwd/TCM-Ancient-Books
2. 点击 "Add file" → "Upload files"
3. 手动上传修改的文件：
   - editor.html
   - index.html
   - README.md
   - 使用说明.md
   - 启动服务器.sh

### 方案五：等待网络恢复后推送

```bash
cd /Volumes/PSSD/TCM-Ancient-Books
git push origin gh-pages
```

## 已修改的文件

- ✅ editor.html（新增）- TXT编辑器
- ✅ index.html（修改）- 删除阅读/下载按钮，添加提示
- ✅ README.md（修改）- 完善项目说明
- ✅ 使用说明.md（新增）- 详细使用指南
- ✅ 启动服务器.sh（新增）- 一键启动脚本

## 推送后的访问地址

推送成功后，网站将在以下地址可访问：
- https://westwolf-lwd.github.io/TCM-Ancient-Books/

## 检查推送状态

```bash
cd /Volumes/PSSD/TCM-Ancient-Books
git status
git log --oneline -5
```

## 常见问题

### Q: 推送时提示"Failed to connect"？
**A:** 网络无法连接GitHub，请配置代理或使用GitHub Desktop。

### Q: 推送时提示"Permission denied"？
**A:** 需要配置GitHub认证，运行 `gh auth login` 或使用GitHub Desktop。

### Q: 如何查看推送进度？
**A:** 使用 `GIT_CURL_VERBOSE=1 git push origin gh-pages` 查看详细日志。

---

**当前推荐：使用GitHub Desktop或配置代理后推送**
