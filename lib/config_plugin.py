from abc import ABC, abstractmethod

class ConfigPlugin(ABC):
    @abstractmethod
    def validate():
        pass

    @abstractmethod
    def register():
        pass

    @abstractmethod
    def apply():
        pass
