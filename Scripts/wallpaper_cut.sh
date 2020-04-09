# cut wallpaper path from .fehbg

wallpaper_path=$(tail -n 1 /$HOME/.fehbg | cut -d "'" --output-delimiter "'" -f 2)

