# cbr2pdf



cbr2pdf is a bash script which converts all `.cbr` and `.cbz` files recursively from a folder to PDF files. This script uses `7zip` to extract each archive, obtaining several `.jpg` files in various folders, and `img2pdf` to convert and merge the `.jpg` files in each folder into one PDF file.