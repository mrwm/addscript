:: A script that counts non-stop and writes the output into a file. Thus maxing out the (CPU and) storage space.

::=== START ===
:: Variables:
  :: `SET /P %Variables%="..." ` asks the user for an input.
SET /P delay="Enter desired number of delay from 0.1 to 1 second(s): "
SET /P name="Enter the desired name of output file: "
  :: Set a initial number for the bat file
SET num=1

:: Variables without prompt:
SET targetdir=%homepath%/Desktop/ :: Dir. whrere we want the file to be in.
SET number=%num%+1 :: Variable where we add 1 and append to on the file.

cd %targetdir%       :: Go to the directory specified on line 10.
echo %num% > %name%    :: Create the file specified on line 7.

:: The loop:
:loop
SET number=%num%+1
 :: ^^ Add one to the number prior to the one before it.

echo %command% >> %name% :: Write number on last line of the file.
sleep %delay%            :: Delay for the amount specified on line 6.
goto loop                :: End of loop
