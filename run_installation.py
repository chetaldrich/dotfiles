import lib.atom as atom
import lib.brew as brew
import lib.config as config

def get_brew_packages():
    return [
        'python3',
        'trash-cli'
    ]

def get_brew_casks():
    return [
        'atom',
        'chrome',
        '1password',
        'dropbox'
    ]

def install_brew_packages():
    plugin = brew.BrewPlugin()
    for package in get_brew_packages():
        plugin.install(package)

def setup_atom():
    plugin = brew.BrewPlugin()
    plugin.cask_install('atom')
    atom.install_atom_packages()

def main():
    configuration = config.Configuration()

    # atom_installation = atom.AtomInstallation()
    # atom_installation.install_atom_packages()
    install_brew_packages()

if __name__ == '__main__':
    main()
