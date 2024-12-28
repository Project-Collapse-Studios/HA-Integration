@echo off

echo Cleaning up...
rmdir /s /q build
mkdir build

echo Exporting postcompiler patch...

python .\HammerAddons\src\hammeraddons\unify_fgd.py -d .\HammerAddons\fgd export_pcp -o build\patch.fgd P2CE

echo Building FGD

python .\FGD\unify_fgd.py -d .\FGD\fgd\ --extra .\build\patch.fgd exp -o build\psc.fgd P2CE SRCTOOLS

del .\build\patch.fgd

echo Copying configuration with ContentBuilder
python .\contentbuilder\ContentBuilder.py --filemanifest .\contentbuilder\contentbuilder_cfg.json -s


echo Building postcompiler
pyinstaller --distpath build/ --workpath pc_build -y HammerAddons/postcompiler.spec

echo Finished!
pause