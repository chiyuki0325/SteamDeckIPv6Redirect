#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")

echo "===== Steam Deck 下载 CDN IPv6 重定向工具 ====="

if [ "$(whoami)" != "root" ]; then
    konsole -e "/bin/bash" -c "sudo ${SCRIPT}"
    exit 1
fi

echo "-> 正在解析 Steam CDN IPv6 地址..."
ip_addr="$("${DIR}/dig" @2400:3200::1 AAAA dl.steam.clngaa.com | grep AAAA | tail -1 | awk -F" " '{print $5}')"
echo "   解析到的 IPv6 地址为 ${ip_addr}"

echo "-> 正在写入 hosts 文件..."
cat <<EOF >>/etc/hosts
${ip_addr} dl.steam.clngaa.com #CDN2V6
127.0.0.19 cdn-ws.content.steamchina.com #CDN2V6
127.0.0.19 cdn.mileweb.cs.steampowered.com.8686c.com #CDN2V6
127.0.0.19 st.dl.eccdnx.com #CDN2V6
127.0.0.19 st.dl.bscstorage.net #CDN2V6
127.0.0.19 steampipe.steamcontent.tnkjmec.com #CDN2V6
127.0.0.19 cdn-qc.content.steamchina.com #CDN2V6
127.0.0.19 cdn-ali.content.steamchina.com #CDN2V6
127.0.0.19 xz.pphimalayanrt.com #CDN2V6
127.0.0.19 lv.queniujq.cn #CDN2V6
EOF
echo "   hosts 文件写入完成"

echo "-> 正在启动反代服务器..."
"${DIR}/caddy_linux_amd64" run --config "${DIR}/Caddyfile" >/dev/null 2>/dev/null &
caddy_pid=$!
echo "   反代服务器启动完成，PID: ${caddy_pid}"

echo "   请在快捷菜单中，把脚本置于后台，在 Steam 中下载游戏。"
echo "   按下键盘任意键退出 ... (按下手柄的 Steam + X 打开键盘)"
read -n 1 -s -r
kill "${caddy_pid}"

echo "-> 正在清理 hosts 文件..."
sed -i '/#CDN2V6/d' /etc/hosts
# sed -i '${/^$/d}' /etc/hosts
echo "-> 你现在可以在快捷菜单中关闭本脚本了。"
