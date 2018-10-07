import sys
import mac_config

def get_plugins():
    return [
        mac_config.BrewPlugin(),
        mac_config.AtomPlugin()
    ]

def main():
    configuration = mac_config.Configuration(sys.argv[1])
    for plugin in get_plugins():
        configuration.register(plugin)

    configuration.apply()

if __name__ == '__main__':
    main()
