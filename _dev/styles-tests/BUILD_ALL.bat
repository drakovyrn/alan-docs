:: "BUILD_ALL.bat" v1.0.0 (2018/10/07) by Tristano Ajmone
:: -----------------------------------------------------------------------------
:: This script is released into public domain via the Unlicense:
::     http://unlicense.org/
:: -----------------------------------------------------------------------------
@ECHO OFF
CLS

ECHO ==============================================================================
ECHO Converting Styles Tests Docs to All Formats
ECHO ==============================================================================

CALL HTML_BUILD.bat
CALL PDF_BUILD.bat

EXIT /B
