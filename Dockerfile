# Gunakan image web server (contoh menggunakan Nginx)
FROM nginx:latest

# Salin file-file proyek web statis ke dalam direktori default Nginx
COPY . /usr/share/nginx/html
