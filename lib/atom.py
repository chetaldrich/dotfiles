import subprocess as sp
import lib.brew as brew
from lib.config_plugin import *

class AtomPlugin(ConfigPlugin):
    def __init__(self):
        pass

    def validate():
        pass

    def register():
        pass

    def apply():
        pass

    def desired_atom_packages(self):
        return [
            'vim-mode-plus',
            'ex-mode',
        ]

    def apm_install(self, package_name: str):
        command = ['apm', 'install', package_name]
        sp.run(command)

    def install_atom_packages(self):
        for package in self.desired_atom_packages():
            self.apm_install(package)
