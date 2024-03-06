if status is-interactive
    set -gx PATH $PATH $HOME/.local/bin /opt/bin $HOME/.cargo/bin $HOME/.local/dotnet $HOME/.local/go/bin $HOME/dev/go/bin $HOME/.cargo/bin
    set -gx DOTNET_ROOT $HOME/.local/dotnet
    set -gx NVM_DIR $HOME/.nvm 
    # if test -e $NVM_DIR/nvm.sh 
    #     . $NVM_DIR/nvm.sh 
    # end
    # if test -e $NVM_DIR/bash_completion 
    #     . $NVM_DIR/bash_completion 
    # end
end