import subprocess as sp
from schema import Schema
from lib.config_plugin import *

class BrewPlugin(ConfigPlugin):

    def __init__(self):
        self.schema = Schema({
            'packages': [str],
            'casks': [str]
        })

    def section(self) -> str:
        return 'brew'

    def validate(self, config: dict) -> bool:
        try:
            self.schema.validate(config)
            return True
        except:
            return False

    def apply(self, config: dict):
        for package in config['packages']:
            self.install(package)
        for cask in config['casks']:
            self.cask_install(cask)

    def install(self, package: str):
        if self.is_installed(package):
            print("Already installed brew package {}. Skipping...".format(package))
        else:
            sp.run(['brew', 'install', package])

    def uninstall(self, package: str):
        sp.run(['brew', 'uninstall', package])

    def cask_install(self, package: str):
        if self.is_installed(package, cask=True):
            print("Already installed brew package {}. Skipping...".format(package))
        else:
            sp.run(['brew', 'cask', 'install', package])

    def is_installed(self, package_name: str, cask=False) -> bool:
        """Given a package, determine whether brew has it installed or not."""
        command = ['brew', 'ls', '--versions', package_name]
        if cask:
            command.insert(1, 'cask')

        output = sp.run(command, capture_output=True).stdout.decode('utf-8')
        return output != ''
