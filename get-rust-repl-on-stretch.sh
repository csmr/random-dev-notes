# Copypaste into shell to quickly get rust repl in debian stretch
sudo apt remove rustc '^libstd-rust*'
curl https://sh.rustup.rs -sSf | sh
# [ hit enter for default]
source $HOME/.cargo/env
rustc --version
cargo --version
cargo install evcxr_repl
evcxr
