#Задание 

Есть папки:
20160118//  20160208//  20160222//  20160311//  20160321//  20160404//  20160411//  20160425//  20160516//  20160523//  20160607//  20160616//  20160624//  20160704//  20160711//  20160721//
20160201//  20160215//  20160309//  20160314//  20160329//  20160405//  20160418//  20160511//  20160519//  20160601//  20160608//  20160623//  20160629//  20160708//  20160713//  20160722//
temp/ restore/ file1.txt 2.txt 12file.txt /zzz 1234 9823 982a 324v5

Написать как запаковать в tar.gz все папки, начинающиеся с 2016 или содержащие в начале имени 4 цифры и удалить их после запаковки.

#########################################################################################################
#Решение 

#!/bin/bash

when=$(date '+%Y-%m-%d')

tar -czvf $when.tar.gz [0-9][0-9][0-9][0-9]* | while read I ; do rm -rf "$I" ; done
