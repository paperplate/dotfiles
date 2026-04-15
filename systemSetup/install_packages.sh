#!/bin/bash

echo "Starting Omarchy package restoration..."

# 1. Install Official Packages
if [[ -s pkglist_repo.txt ]]; then
  echo "Installing official repository packages..."
  # xargs reads the list and passes it to the omarchy-pkg-add command
  xargs -a pkglist_repo.txt omarchy-pkg-add
else
  echo "No official package list found (pkglist_repo.txt)."
fi

# 2. Install AUR Packages
if [[ -s pkglist_aur.txt ]]; then
  echo "Installing AUR packages..."
  # xargs reads the list and passes it to the omarchy-pkg-aur-add command
  xargs -a pkglist_aur.txt omarchy-pkg-aur-add
else
  echo "No AUR package list found (pkglist_aur.txt)."
fi

echo "All done! Your packages have been restored."
