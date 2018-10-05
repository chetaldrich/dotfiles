import lib.atom as atom
import lib.brew as brew
import lib.config as config

def setup_atom():
    plugin = brew.BrewPlugin()
    plugin.cask_install('atom')
    atom.install_atom_packages()

def main():
    configuration = config.Configuration()
    configuration.register(brew.BrewPlugin())
    configuration.register(atom.AtomPlugin())
    configuration.apply()

if __name__ == '__main__':
    main()
