"c:\Program Files (x86)\WinRAR\winrar.exe" a -afzip -r goblins.love "assets" "game" "libraries" "states"
"c:\Program Files (x86)\WinRAR\winrar.exe" a -afzip goblins.love *.lua
move goblins.love distr
copy "assets\icons\game.ico" distr
copy README.txt distr
cd distr
rename game.ico love.ico
copy /b love.exe+goblins.love goblins.exe
"c:\Program Files (x86)\WinRAR\winrar.exe" a -afzip goblins.zip goblins.exe *.dll README.txt
copy goblins.zip ..\
del goblins.*
del *.ico
del *.txt
pause