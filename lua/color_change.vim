let color_scheme = system('gsettings get org.gnome.desktop.interface color-scheme')
  " remove newline character from color_scheme
  let color_scheme = substitute(color_scheme, "\n", "", "")
  " Remove quote marks
  let color_scheme = substitute(color_scheme, "'", "", "g")

  if color_scheme == 'prefer-dark'
    set background=dark
  else
    " With disabled night mode, value seems to be to 'default' on my system.
    set background=light
  endif
