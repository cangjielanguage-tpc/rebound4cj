<div align="center">
<h1>rebound4cj</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v0.0.1-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v0.51.4-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-90.6%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## 介绍

本项目基于开源库 https://github.com/facebookarchive/rebound

rebound4cj 是一个模拟弹簧动力学，用于驱动物理动画的库。

### 特性

- 🚀 创建弹簧对象，设置弹簧树形，实现弹簧动画效果

### 源码目录

```shell
.
├─AppScope
├─doc
├─entry
│  └─src
│      └─main
│          ├─cangjie
│          └─resources
├─hvigor
├─rebound
│  └─src
│      └─main
│          ├─cangjie
│            └─src
│                └─rebound

```

- `AppScope` 全局资源存放目录和应用全局信息配置目录
- `doc` API文档和使用手册存放目录
- `entry` 工程模块 - 编译生成一个HAP
- `entry src` APP代码目录
- `entry src main` APP项目目录
- `entry src main cangjie` 仓颉UI示例目录
- `entry src main resources` 资源文件目录
- `rebound` 工程模块 - 编译生成一个har包
- `rebound src` 模块代码目录
- `rebound src main` 模块项目目录
- `rebound src main cangjie` 仓颉代码目录
- `hvigor` 构建工具目录

### 接口说明

主要类和函数接口说明详见 [API](doc/feature_api.md)

## 使用说明

### 编译构建

### 功能示例

**entry -> src -> main -> cangjie -> src 目录下 index.cj，运行可以展示示例效果。**

## 约束与限制

## 开源协议

[LICENSE](/LICENSE)

## 参与贡献

欢迎给我们提交PR，欢迎给我们提交Issue，欢迎参与任何形式的贡献。
