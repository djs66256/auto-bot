# auto-bot
Bots run automatically

编辑 crontab 文件：
```bash
crontab -e
```

添加定时任务： 在打开的编辑器中，添加一行来指定定时任务。
```bash
30 9 * * * /path/to/your/script.sh 2>&1
```

验证 crontab 文件： 你可以通过以下命令查看当前用户的 cron 任务列表，确认你的任务是否已经添加成功：
```bash
crontab -l
```

确保你的脚本有可执行权限，可以通过以下命令添加权限：

```bash
chmod +x /path/to/your/script.sh
```

Operation not permitted：
you have to add cron as "parent" app to the user's Security & Privacy > Privacy > Full Disk Access apps/execs.

1. click the `+` button
2. hit `⌘⇧G`
3. enter `/usr/sbin`
4. double click the `cron` file.

## 代理设置

科学上网，对ssh设置代理，在ssh配置文件（~/.ssh/config）中添加以下内容：

```bash
Host github.com
    HostName ssh.github.com
    Port 443
    User git
    ProxyCommand nc -v -x 127.0.0.1:1080 %h %p
```