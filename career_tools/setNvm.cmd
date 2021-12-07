@echo off
rmdir "C:\Program Files\nodejs"
if exist D:\software\nvm\%1 (
   mklink /j "C:\Program Files\nodejs" D:\software\nvm\%1
@REM 判断node32存在node64不存在
if exist "D:\software\nvm\%1\node32.exe" (
   if not exist "D:\software\nvm\%1\node64.exe" (
      if exist "D:\software\nvm\%1\node.exe" (
         dir "D:\software\nvm\%1\node.exe" | findstr "<SYMLINK>" > nul || rename "D:\software\nvm\%1\node.exe" node64.exe

      )
   )
   if exist "D:\software\nvm\%1\node.exe" (
      del "D:\software\nvm\%1\node.exe"
   )
   if exist "D:\software\nvm\%1\node%2.exe" (
      mklink "D:\software\nvm\%1\node.exe"  "D:\software\nvm\%1\node%2.exe"
   )
) else (
   @REM 判断node64存在node32不存在
   if exist "D:\software\nvm\%1\node64.exe" (
      if not exist "D:\software\nvm\%1\node32.exe" (
         if exist "D:\software\nvm\%1\node.exe" (
            @REM 判断node.exe存在但是判断
            dir "D:\software\nvm\%1\node.exe" | findstr "<SYMLINK>" > nul || rename "D:\software\nvm\%1\node.exe" node32.exe
         )
      )
      if exist "D:\software\nvm\%1\node.exe" (
         del "D:\software\nvm\%1\node.exe"
      )
      if exist "D:\software\nvm\%1\node%2.exe" (
         mklink "D:\software\nvm\%1\node.exe"  "D:\software\nvm\%1\node%2.exe"
      )
   )
)
@echo on   
) else (
   echo "node版本替换失败！"
@echo on   
)
