@echo on

mkdir builddir
exit 1
if errorlevel 1 (
  type builddir\meson-logs\meson-log.txt
  exit /b 1
)

:: `pip install dist\pandas*.whl` does not work on windows,
:: so use a loop; there's only one wheel in dist/ anyway
for /f %%f in ('dir /b /S .\dist') do (
    pip install %%f
    if %ERRORLEVEL% neq 0 exit 1
)
