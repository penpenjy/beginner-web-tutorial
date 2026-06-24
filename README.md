# 🚀 Beginner Web Tutorial

> 一个面向新手的 Web 开发入门教程项目，只需一条命令即可完成部署，非常适合初学者快速体验 Web 开发的乐趣。

## 📖 项目简介

本项目旨在帮助编程新手快速上手 Web 开发。你不需要安装复杂的开发环境，只需克隆本仓库并运行一键部署脚本，即可在浏览器中看到你的第一个网页。项目自带一个轻量级本地服务器（基于 Go 编写，零依赖），开箱即用。

## 🛠 技术栈

- **前端**：纯 HTML + CSS（零依赖，新手友好）
- **本地服务器**：项目内置轻量 HTTP 服务（Go 编译，无需 Node.js）
- **自动化部署**：Shell 脚本一键完成

## ⚡ 快速开始

```bash
# 1. 克隆仓库
git clone https://github.com/penpenjy/beginner-web-tutorial.git
cd beginner-web-tutorial

# 2. 一键部署
bash scripts/setup.sh
```

部署完成后浏览器打开 `http://localhost:3000`，你就能看到你的第一个 Web 页面了！

## 📂 项目结构

```
beginner-web-tutorial/
├── README.md              # 本文件
├── package.json           # 项目配置
├── scripts/
│   ├── setup.sh           # 一键部署脚本
│   └── dev.sh             # 开发辅助脚本
├── bin/
│   └── serve              # 项目内置本地服务器
└── src/
    └── index.html         # 你的第一个网页！
```

## 📝 下一步

- 修改 `src/index.html`，创建你自己的页面
- 学习 CSS 添加更多样式
- 学习 JavaScript 给页面添加交互

Happy Coding! 🎉

## 📄 License

MIT License - 自由使用、修改和分发
