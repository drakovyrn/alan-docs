:: "_dev\styles-tests\PDF_BUILD.bat"    v3.0.1 | 2019/09/10 | by Tristano Ajmone
:: -----------------------------------------------------------------------------
:: This script is released into public domain via the Unlicense:
::     http://unlicense.org/
::
:: To run this script these applications must be installed on your system:
::
::    Asciidoctor (Ruby Gem):
::    https://github.com/asciidoctor/asciidoctor
::
::    asciidoctor-fopub:
::    https://github.com/asciidoctor/asciidoctor-fopub
:: -----------------------------------------------------------------------------
@ECHO OFF

:: Set some required env vars
SET "CURRDIR=%CD%"
SET "FOPUB_DIR=..\..\_assets\alan-xsl-fopub\"

ECHO ==============================================================================
ECHO Converting to PDF
ECHO ==============================================================================
FOR /R %%i IN (*.asciidoc) DO (
    CALL :ADoc2PDF %%i
)
EXIT /B

:: =============================================================================
:: func:                         Convert to PDF
:: =============================================================================
:ADoc2PDF

:: Need to switch working directory to "//_assets/alan-xsl-fopub/" for FOP:
CD %FOPUB_DIR%

ECHO Converting to PDF:  %~n1.pdf
CALL asciidoctor^
    -b docbook^
    -a data-uri!^
    --safe-mode unsafe^
    --verbose^
    %1
CALL fopub^
    -t xsl-fopub^
    %~dpn1.xml
ECHO ------------------------------------------------------------------------------
:: Restore origignal script working directory:
CD %CURRDIR%

EXIT /B
