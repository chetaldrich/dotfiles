from abc import ABC, abstractmethod

class ConfigPlugin(ABC):

    @abstractmethod
    def section() -> str:
        """ Specifies which section of the YAML config used to run this plugin
        """
        pass


    @abstractmethod
    def validate(config: dict) -> bool:
        """ Given the desired section of the configuration,
            determine if the configuration for your plugin is valid.
        """
        pass

    @abstractmethod
    def register():
        pass

    @abstractmethod
    def apply():
        pass
