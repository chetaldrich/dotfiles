import yaml

class Configuration:
    def __init__(self):
        pass

    def load_yaml(self):
        with open("config.yaml", 'r') as stream:
            try:
                return yaml.safe_load(stream)
            except yaml.YAMLError as exc:
                print(exc)
                exit(1)
