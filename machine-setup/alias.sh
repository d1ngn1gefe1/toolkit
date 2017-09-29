#!/bin/bash

echo "alias python='python3.5'" >> ~/.bash_aliases
echo "alias nf='find . -type f | wc -l'" >> ~/.bash_aliases
echo "alias nd='find . -mindepth 1 -maxdepth 1 -type d | wc -l'" >> ~/.bash_aliases
source ~/.bashrc