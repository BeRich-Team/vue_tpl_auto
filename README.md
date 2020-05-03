# vue-tpl
> 使用 vue-cli4.x搭建，另加代码格式化的vue模板项目，为了代码整洁、易读，必须遵守文档规范。

## 代码规范问题！
- 绝对不允许通过`--no-verify to bypass`这种方式绕过检测！有不合理`lint`可以提`issue`讨论，整改！

## 项目目录结构
> 项目目录结构规范一定要看！注释只是样本，独立模块，解藕思想很重要！保证代码整洁
```bash
├── public
│   ├── favicon.ico
│   └── index.html
├── src
│   ├── App.vue
│   ├── assets
│   │   ├── images
│   │   │   └── logo.png
│   │   └── styles # 所有公共样式文件必须存放此处
│   ├── components # 所有公共组件必须存放此处，规范如下，每个组件必须建文件夹并附有README
│   │   └── demo
│   │       ├── HelloWorld.vue
│   │       └── README.md
│   ├── main.js
│   ├── router
│   │   └── index.js
│   ├── store
│   │   └── index.js
│   └── views
│       └── home # 一个页面一个文件夹，页面子组件超过两个必须建立components文件夹存放
│           ├── Home.vue
│           └── components
└── vue.config.js
```

## Project setup

```
npm install
```

### Compiles and hot-reloads for development

```
npm run serve
```

### Compiles and minifies for production

```
npm run build
```

### Lints and fixes files

```
npm run lint
```

### Customize configuration

See [Configuration Reference](https://cli.vuejs.org/config/).

