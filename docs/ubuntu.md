# Ubuntu

## xkeysnail

https://github.com/mooz/xkeysnail よりインストール後に下記を順々に実行。

`type xkeysnail` で場所を確認し、 `/usr/local/bin/xkeysnail` 以外の場所に入ってたら `.xkeysnail/start.sh` の編集および下記のスクリプトの修正も必要。

```bash
cd ~
ln -s ~/ghq/github.com/macoshita/dotfiles/.xkeysnail
ln -s ~/ghq/github.com/macoshita/dotfiles/.config/autostart/xkeysnail.desktop .config/autostart/
sudo visudo /etc/sudoers.d/xkeysnail
# macoshita ALL=(ALL) NOPASSWD: /usr/local/bin/xkeysnail
```

`.xkeysnail/config.py` は現状下記の設定がなされる

- 右 ALT 単体押しで「変換」
- 左 ALT 単体押しで「無変換」
- CAPS LOCK を CTRL にできる。

あとは Mozc の設定で下記のようにしてやれば、左右 ALT 単体押しで IME の有効・無効を切り替えられる。

![Mozc](./images/mozc.png)

