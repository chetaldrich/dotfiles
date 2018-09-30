import subprocess as sp

def install(package_name: str):
    sp.run(['brew', 'install', package_name])

def uninstall(package: str):
    sp.run(['brew', 'uninstall', package])

def cask_install(package_name: str):
    sp.run(['brew', 'cask', 'install', package_name])

def is_installed(package_name: str) -> bool:
    output = sp.run(['brew', 'ls', '--versions', package_name],
                    capture_output=True).stdout.decode('utf-8')
    return output != ''
