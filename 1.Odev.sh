###########################
# Author :   Rukiye AKINCI
# Date   :   29/05/2022

#crontab -u root -e
# 05 23 * * * ./1.Odev.sh
#############################



name=$(hostname)			# hostname'i name değişkeninine atadık
tarih=$(date +"%m_%d_%Y_%H_%M_%S")	# Tarih ve saat formatını belirledik
yedekSaati=$(date "+%H_%M_%S")		# Yedekleme zamanını aldık
arsiv="$name"_"$tarih.tar.gz"		# Yedeğin alınacağı dosya adını (hostname ve tarih) belirledik
echo "Yedek Alınıyor..."		# Ekrana yedekleme başladığına dair mesaj bastık

log="tmp/log.log"			# tmp dosyası altında log dosyasını tuttuk
tar -czf "/mnt/"$arsiv "/home/"		# mnt dizinine /home dizinini arşivler
md5=$(md5sum /mnt/$arsiv)		# Dosyayı md5 şifreleme yöntemiyle şifreledik

# 1. Yedek adı: hostname ve oluşturulma adı
# 2. MD5 Şifresi: md5.txt dosyası
# 3. Yedekleme saati ile birlikte .log dosyasının içine atar

echo "Yedek Adı:" $arsiv"\n"$md5".md5.txt\n"$(date "+%T")": /tmp/$yedekSaati.log\n" >> /tmp/log.log

echo "Yedekleme Tamamlandı."

#crontab -u root -e
# 05 23 * * * ./1.Odev.sh
