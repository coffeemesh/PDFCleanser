ECHO PDF METADATA CLEAN
ECHO PDF must be named: mypdf.pdf
exiftool mypdf.pdf -all:all= 
exiftool mypdf.pdf -update:all=
exiftool "-Author=shrek" mypdf.pdf
exiftool "-Title=mypdf.pdf" mypdf.pdf
exiftool "-Creator=shrek" mypdf.pdf
exiftool "-CreateDate=0000:00:00 00:00.00" mypdf.pdf
exiftool "-ModDate=0000:00:00 00:00.00" mypdf.pdf
exiftool "-AccessDate=0000:00:00 00:00.00" mypdf.pdf
exiftool "-FileCreateDate=0000:00:00 00:00.00" mypdf.pdf
exiftool "-FileModifyDate=0000:00:00 00:00.00" mypdf.pdf
exiftool "-FileAccessDate=0000:00:00 00:00.00" mypdf.pdf
ECHO NEW METADATA
exiftool -all:all mypdf.pdf
pause
