abbr -a ls lsd
abbr -a la "lsd -lth" 
abbr -a lb "lsd -lath"
abbr -a emacs "emacs -nw"
abbr -a dinfo "screenfetch -A 'Arch Linux' | lolcat"

set -U fish_user_paths /usr/local/sbin /usr/local/bin /usr/bin /bin /home/bobo/.cargo/bin 

#Local Proxy
set -xg http_proxy http://127.0.0.1:6666
set -xg https_proxy http://127.0.0.1:6666
# set -xg HTTP_PROXY http://127.0.0.1:6666
# set -xg HTTPS_PROXY https://127.0.0.1:6666

#set git proxy here:
# git config --global http.proxy 'socks5://127.0.0.1:1080'
# git config --global https.proxy 'socks5://127.0.0.1:1080'
# git config --global http.proxy 'http://10.10.114.193:1087'
# git config --global https.proxy 'https://10.10.114.193:1087'
# git config --global --unset https.proxy
# git config --global --unset http.proxy

#GOlang
set -xg GOPATH $HOME/go
set -Ux fish_user_paths $GOPATH/bin $fish_user_paths
set -xg GO111MODULE on

# source $HOME/.cargo/env
set -xg RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -xg RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup
setenv LD_LIBRARY_PATH (rustc +nightly --print sysroot)"/lib:$LD_LIBRARY_PATH"
setenv RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"
set -xg WASM_BUILD_TYPE release

# set for download electron.
#npm config set registry https://registry.npm.taobao.org/
#npm config set ELECTRON_MIRROR http://npm.taobao.org/mirrors/electron/

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

if status --is-interactive
    tmux ^ /dev/null; and exec true
    screenfetch -A 'Arch Linux' | lolcat
end