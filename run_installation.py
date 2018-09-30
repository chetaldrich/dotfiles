import lib.atom as atom
import lib.brew as brew

def get_brew_packages():
    return [
        'python3',
        'trash-cli'
    ]

def get_brew_casks():
    return [
        'atom',
        'chrome',
        '1password'
    ]

def install_brew_packages():
    for package in get_brew_packages():
        brew.install(package)

def setup_atom():
    brew.cask_install('atom')
    atom.install_atom_packages()

def main():
    setup_atom()
    install_brew_packages()

if __name__ == '__main__':
    main()
