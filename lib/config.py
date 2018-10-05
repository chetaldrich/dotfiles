import yaml
from lib.config_plugin import ConfigPlugin

class Configuration:
    def __init__(self):
        self.config = self.load_yaml()['configuration']
        self.plugins = []

    def register(self, plugin: ConfigPlugin):
        if plugin.section() in self.config and plugin.validate(self.config[plugin.section()]):
            self.plugins.append(plugin)

    def apply(self):
        for plugin in self.plugins:
            plugin.apply(self.config[plugin.section()])

    def load_yaml(self):
        with open("config.yaml", 'r') as stream:
            try:
                return yaml.safe_load(stream)
            except yaml.YAMLError as exc:
                print(exc)
                exit(1)
