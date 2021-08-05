# Korean Admin
Informations in RS2 WebAdmin are encoded in iso-8859-1 as default, causing all the Korean characters break down.
The most painful part here is being blocked to send messages in web admin.

This mod is server-side mutator for server(s) running in Korea, which gives an option to utilize web admin chat console.
When server receives a message in following format, broadcast handler renders it as complemented one:

>(from web)  /kaTest! /BB34/C2A8 /C77C/C774/C5D0/C694/003F?
>
>(in game)   Test! 무슨 일이에요?
