@echo off
setlocal enabledelayedexpansion

rem === Configuration du projet ===
set "nameProject=HALASPRINT"
set "temp=temp"
set "librairie=lib"
set "src=src"
set "view=view"
set "xml=web.xml"
set "deployPath=C:\Program Files\Apache Software Foundation\Tomcat 10.1\webapps"

set "deslibrairie=%temp%\WEB-INF\lib"
set "desxml=%temp%\WEB-INF"
set "desview=%temp%\view"
set "desclasses=%temp%\WEB-INF\classes"

rem === Nettoyage de l'ancien dossier temporaire ===
if exist "%temp%" (
    rd /S /Q "%temp%"
    echo [INFO] Ancien dossier %temp% supprime avec succes.
)
mkdir "%deslibrairie%"
mkdir "%desxml%"
mkdir "%desview%"
mkdir "%desclasses%"
echo [INFO] Structure du dossier temporaire %temp% creee avec succes.

rem === Copie des dependances, vues et web.xml ===
xcopy "%librairie%" "%deslibrairie%" /E /I /Y >nul
xcopy "%view%" "%desview%" /E /I /Y >nul
copy "%xml%" "%desxml%" >nul
echo [INFO] Fichiers necessaires copies avec succes.

rem === Compilation des fichiers Java ===
echo [INFO] Compilation des fichiers Java en cours...
set sources=
for /r "%src%" %%f in (*.java) do (
    set sources=!sources! "%%f"
)

if "!sources!"=="" (
    echo [ERREUR] Aucun fichier Java trouve dans le dossier %src%.
    pause
    exit /b 1
)

javac -parameters -cp "%deslibrairie%\*" -d "%desclasses%" !sources!
if %errorlevel% neq 0 (
    echo [ERREUR] La compilation des fichiers Java a echoue.
    pause
    exit /b 1
)

echo [INFO] Compilation reussie. Fichiers .class generes dans %desclasses%.

rem === Liste des fichiers compiles ===
echo [INFO] Fichiers compiles :
dir /B /S "%desclasses%\*.class"

rem === Creation du fichier WAR ===
set "projet=%nameProject%.war"
jar -cvf "%projet%" -C "%temp%" . >nul
if %errorlevel% neq 0 (
    echo [ERREUR] Erreur lors de la creation du fichier WAR.
    pause
    exit /b 1
)
echo [INFO] Fichier WAR %projet% cree avec succes.

rem === Deploiement sur Tomcat ===
echo [INFO] Deploiement vers Tomcat en cours...
move "%projet%" "%deployPath%\" >nul
if %errorlevel% neq 0 (
    echo [ERREUR] echec du deploiement dans %deployPath%.
    pause
    exit /b 1
)

echo [SUCCeS] Le projet %nameProject% a ete deploye dans Tomcat.

@REM === Nettoyage final ===
@REM rd /S /Q "%temp%"
@REM echo [INFO] Nettoyage du dossier temporaire termine.

pause
