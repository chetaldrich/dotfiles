import subprocess as sp
import lib.brew as brew
from schema import Schema, And, Use, Optional
from lib.config_plugin import *

class AtomPlugin(ConfigPlugin):
    def __init__(self):
        self.schema = Schema({
            'packages': [str]
        })

    def section(self) -> str:
        return 'atom'

    def validate(self, config: dict) -> bool:
        try:
            self.schema.validate(config)
            return True
        except:
            return False

    def apply(self, config: dict):
        for package in config['packages']:
            self.apm_install(package)

    def apm_install(self, package_name: str):
        command = ['apm', 'install', package_name]
        sp.run(command)
