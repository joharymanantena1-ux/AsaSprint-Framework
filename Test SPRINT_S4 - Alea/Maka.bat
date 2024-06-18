@echo off

rem Votre destination pour le transfere du lib
set destination="lib"

if exist "%destination%" (
    rd /S /Q "%destination%"
    echo Le dossier %destination% et son contenu ont ete supprimes avec succes.
)

mkdir "%destination%"
echo Le nouveau dossier %destination% a ete cree avec succes.

rem Copie les lib .jar dans le lib
for /r "J:\Perso\Work\I.T.University\Licence\L2\S4\WEB DYNAMIQUE (Mr Naina)\SPRINT_S4\lib" %%f in (*.jar) do copy "%%f" "%destination%\"

echo Copie effectuez avec succes...

pause