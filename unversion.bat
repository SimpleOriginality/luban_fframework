@echo off
setlocal enabledelayedexpansion

:: 设置要查找的目录名
set "TARGET_DIRS=bin obj .vs"

:: 遍历所有目标目录
for %%d in (%TARGET_DIRS%) do (
    echo Searching for directories named %%d...

    :: 遍历目录
    for /r %%p in (.) do (
        if exist "%%p\%%d\" (
            echo Found directory: %%p\%%d
            echo Removing from version control: %%p\%%d
            svn rm --keep-local "%%p\%%d"
        )
    )
)

echo Done.
endlocal
