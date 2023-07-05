@echo off
cd /D "%~dp0"
if exist .venv goto :start

echo "Setup VENV"
python -m venv .venv
call .venv\Scripts\activate.bat

echo "Install dependencies"
pip install edge-tts -i https://mirrors.aliyun.com/pypi/simple/
goto :run

:start
echo "Start VENV"
call .venv\Scripts\activate.bat
goto :run

:run
echo "Run TTS_JA"
python .venv\Scripts\edge-tts.exe -f "./IN.txt" --write-media "./OUT.mp3" --voice ja-JP-NanamiNeural
