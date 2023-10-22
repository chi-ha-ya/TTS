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
echo "Run TTS_EN"
edge-tts -f "./IN.txt" --write-media "./OUT.mp3" --write-subtitles "./OUT.srt" --voice en-US-JennyNeural