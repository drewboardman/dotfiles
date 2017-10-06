#!/bin/sh

cd ~/dotfiles

for stow in $(cat ~/dotfiles/stows)
do
  stow $stow
done

cd
