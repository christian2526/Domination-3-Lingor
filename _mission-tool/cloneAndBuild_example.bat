@echo off

set GITSH="C:\Program Files\Git\bin\sh.exe"
set GIT_REPO="https://github.com/christian2526/Domination-3-Lingor"
set MISSIONFOLDER="Domination.Lingor3"
set FINAL_PBO="%MISSIONFOLDER%.pbo"

echo ###################################
echo Starting GIT CLONE
echo ###################################
%GITSH% --login cloneAndParse.sh "%GIT_REPO%" "%MISSIONFOLDER%"
echo GIT CLONE finished

echo ######################################
echo let's build our final pbo with cpbo
echo ######################################
cpbo -y -p "%MISSIONFOLDER%"
rd /s /q "%MISSIONFOLDER%"
