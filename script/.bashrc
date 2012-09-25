# .bashrc

function rails {
   if [ -e "script/rails" ]; then
      ruby script/rails $@
   else
      `which rails` $@
   fi
}

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f ~/.bash_alias ]; then
  . ~/.bash_alias
fi

PATH=$PATH:$HOME/.rvm/bin
PATH=$PATH:$HOME/my_script/bin
PATH=$PATH:$HOME/.rvm/gems/ruby-1.9.3-p125/bin

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
export EDITOR=vim
