import subprocess as sp
import lib.brew as brew

def get_atom_packages():
    return [
        'vim-mode-plus',
        'ex-mode',
    ]

def apm_install(package_name: str):
    command = ['apm', 'install', package_name]
    sp.run(command)

def install_atom_packages():
    for package in get_atom_packages():
        apm_install(package)
