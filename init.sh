read -p "只适用于Ubuntu初始化。y继续，输入其他退出：" var

if [ $var = 'y' ]
then
    echo "continue"
else
    echo "输入不符，退出..." && exit
fi


read -p "替换Ubuntu的软件源为清华源，请输入Ubuntu版本（18.04 | 19.04 | 19.10）: " version
case $version in
    '18.04') version='bionic'
    ;;
    '19.04') version='disco'
    ;;
    '19.10') version='eoan'
    ;;
esac

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $version main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $version main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $version-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $version-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $version-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $version-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $version-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $version-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $version-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $version-proposed main restricted universe multiverse
" >> /etc/apt/sources.list

sudo apt-get update
sudo apt-get upgrade

# 等待手动安装完成shadowsocks
echo "请手动安装Shadowsocks，并配置Socks 1080代理"
echo "代理规则：\nhttps://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"
read -p "安装完成后输入会车" var



echo "设置git代理..."
if command -v git >/dev/null 2>&1; then
    echo "Git exists in PATH"
else
    sudo apt install git
fi
git config --global http.proxy 'socks5://127.0.0.1:1080'
git config --global https.proxy 'socks5://127.0.0.1:1080'


echo "安装zsh及vim"
sudo apt install zsh vim


read -p "安装Oh-my-zsh" var
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ./.zshrc ~/.zshrc

read -p "安装pure主题" var
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

read -p "安装git插件" var
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

zsh

echo -p "配置Vimrc..." var
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh


read -p "配置tmux..." var
sudo apt install tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


echo "配置Rust..."
mkdir ~/.cargo
echo "[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"
replace-with = 'ustc'
[source.ustc]
registry = "git://mirrors.ustc.edu.cn/crates.io-index"
" >> $HOME/.cargo/config


