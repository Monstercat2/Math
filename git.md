# Git分布式版本控制工具
## 1.目标
* 了解Git基本概念
* 能够概述git工作流程
* 能够使用Git常用命令
* 熟悉Git代码托管服务
* 能够使用idea操作git
## 2.概述
分布式版本控制系统没有“中央服务器”，每个人的电脑上都是一个完整的版本库，这样工作的时候，无需要联网了，因为版本库就在你自己的电脑上。多人协作只需要各自的修改推送给对方，就能互相看到对方的修改了。

## Git常用概念
1. clone(克隆):从远程仓库中克隆代码到本地仓库。
2. checkout (检出) :从本地仓库中检出一个仓库分支然后进行修订。
3. add （(添加)∶在提交前先将代码提交到暂存区。
4. commit(提交)︰提交到本地仓库。本地仓库中保存修改的各个历史版本。
5. fetch (抓取)∶从远程库，抓取到本地仓库，不进行任何的合并动作，一般操作比较少。
6. pull (拉取)︰从远程库拉到本地库，自动进行合并(merge)，然后放到到工作区，相当于fetch+merge。
7. push (推送)∶修改完成后，需要和团队成员共享代码时，将代码推送到远程仓库。
## 能够使用Git常用命令
本教程里的git命令例子都是在Git Bash中演示的，会用到一些基本的linux命令，在此为大家提前列举:
* ls/ll   查看当前目录
* cat     查看文件内容
* touch   创建文件
* vi      vi编辑器（使用vi编辑器是为了方便展示效果，学员可以记事本、editPlus、notPad++等其它编辑器)
* Git GUI: Git提供的图形界面工具
* Git Bash: Git提供的命令行工具

当安装Git后首先要做的事情是设置用户名称和email地址。这是非常重要的，因为每次Git提交都会使用该用户信息。
## 基本配置
1. 打开Git Bash
2. 设置用户信息
```bash
git config --global user.name "yuzengyi"
git config --global user.email "1159521080@qq.com”
```
查看配置信息
```bash
git config --global user.name
git config --global user.email
```
## 获取本地仓库
要使用Git对我们的代码进行版本控制，首先需要获得本地仓库
1. 在电脑的任意位置创建一个空目录（例如test)作为我们的本地Git仓库
2. 进入这个目录中，点击右键打开Git bash窗口
3. 执行命令`git init`
4. 如果创建成功后可在文件夹下看到隐藏的.git目录。
## 基础操作指令 
Git工作目录下对于文件的修改(增加、删除、更新)会存在几个状态，这些修改的状态会随着我们执行Git的命令而发生变化。
本章节主要讲解如何使用命令来控制这些状态之间的转换:
1. `git add "filename"` (工作区-->暂存区)|`git add .` 提交所有文件到暂存区
2. `git commit` (暂存区-->本地仓库)|`git commit -m "add filename"` ""内文字不唯一
3. `touch filename.txt`  创建文本文件
4. `git status`  查看修改的状态
5. `git log` 查看提交的信息
6. `git reflog` 查看已经删除的提交记录
7. `git reset --hard commitID` 
   * commitID 可以使用`git log`查看
## 添加文件至忽略列表
一般我们总会有些文件无需纳入Git 的管理，也不希望它们总出现在未跟踪文件列表。通常都是些自动生成的文件，比如日志文件，或者编译过程中创建的临时文件等。在这种情况下，我们可以在工作目录中创建一个名为.gitignore 的文件(文件名称固定)，列出要忽略的文件模式。
## 分支
一个文件所处的状态只能是其中一个分支
1. `git branch` 查看分支|`git branch 分支名` 增加分支
2. `git checkout 分支名` 切换分支|`git checkout -b 分支名` 创建并切换分支
3. `git merge 分支名` 一个分支上的提交可以合并到另一个分支
4. `git branch -D 分支名` 强制删除
## Git远程仓库——以github为例
### 创建远程仓库别名
基本语法
1. `git remote -v`  查看当前所有远程地址别名
2. `git remote add 别名 远程地址`
### 推送、拉取、克隆内容到远程仓库
1. `git push 仓库名 分支名` 推送
2. `git pull 仓库名 分支名` 拉取
3. `git clone 远程地址` 克隆
### 团队邀请
settings中的Manage access中邀请，生成邀请链接发送给成员，让成员接受即可。

