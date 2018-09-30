import subprocess as sp

def install(package: str):
    if is_installed(package):
        print("Already installed brew package {}. Skipping...".format(package))
    else:
        sp.run(['brew', 'install', package])

def uninstall(package: str):
    sp.run(['brew', 'uninstall', package])

def cask_install(package: str):
    if is_installed(package, cask=True):
        print("Already installed brew package {}. Skipping...".format(package))
    else:
        sp.run(['brew', 'cask', 'install', package_name])

def is_installed(package_name: str, cask=False) -> bool:
    """Given a package, determine whether brew has it installed or not."""
    command = ['brew', 'ls', '--versions', package_name]
    if cask:
        command.insert(1, 'cask')

    output = sp.run(command,
                    capture_output=True).stdout.decode('utf-8')
    return output != ''
