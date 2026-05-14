# .bash_profile
#
# macOS sources .bash_profile for login shells (new terminal windows/tabs).
# Interactive non-login shells source .bashrc instead.
# To keep one unified config, .bash_profile simply sources .bashrc.
# Machine-specific config (work/personal) goes in ~/.bash_local (not tracked in git).

[ -f ~/.bashrc ] && source ~/.bashrc
