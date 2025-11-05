# -*- mode: python ; coding: utf-8 -*-

block_cipher = None

a = Analysis(
    ['Page2.py'],
    pathex=[],
    binaries=[],
    datas=[
        ('config.py', '.'),
        ('.env', '.'),
    ],
    hiddenimports=[
        'flet',
        'sqlite3',
        'supabase',
        'dotenv',
        'weasyprint',
        'jinja2',
        'cairocffi',
        'tinycss2',
        'cssselect2',
        'Pyphen',
        'pikepdf',
        'Pillow',
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='BulletinPro',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
