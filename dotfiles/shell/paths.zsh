# PATH additions loaded after the shared baseline.

if [[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]]; then
  if (( ${path[(Ie)/Applications/Visual Studio Code.app/Contents/Resources/app/bin]} == 0 )); then
    path=("/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $path)
  fi
fi
