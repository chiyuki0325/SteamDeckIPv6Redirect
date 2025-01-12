## 🌐 Steam Deck 下载 CDN 重定向 IPv6 工具

适用于 Steam Deck 和其它 Linux 发行版的网络小工具，把 Steam 的下载请求重定向到 IPv6，以达到部分高校教育网下的 IPv6 免流。

### 安装

- 进入 Deck 桌面模式，打开本页面
- 下载 [发布页](https://github.com/chiyuki0325/SteamDeckIPv6Redirect/releases/latest) 中的 `SteamDeckIPv6Redirect_v1.tar.gz`
- 随便在主目录（Home）中找个地方解压
- 在桌面模式中打开 Steam，把解压好的文件夹中的 `SteamDeckIPv6Redirect.sh` 作为非 Steam 游戏添加到游戏库中

### 使用

- 回到掌机模式（在桌面模式也可以 ...?）
- 在库中找到刚刚添加好的 `SteamDeckIPv6Redirect.sh`（如果觉得不顺眼可以改名字），并启动之
- 按下 Steam + X 快捷键，在虚拟键盘中输入**管理员密码**（不会显示，如果没设置过请先参考[此文章](https://www.bilibili.com/opus/726184510708777001)），然后按下回车
- 提示服务器启动成功后，按下 Steam 快捷菜单回到游戏库，即可实现高速的 IPv6 下载游戏
- 下载完后从快捷菜单返回本工具，打开虚拟键盘**按任意键**即可退出。
  **不要使用「退出游戏」**，如果误点到可以再次启动本工具，然后用正确方法退出。

### 致谢

[羽翼城](https://www.dogfight360.com/blog/18273/) 的重定向方法