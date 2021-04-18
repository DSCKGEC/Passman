# Issues

## Minor

### Passwords checks
The password currently does not undergo any checks as a result an empty string can also be set as a password, this is a problem how ever as encryption requires the master password to be of atleast 4 characters long.

### Documentations
The code requires a lot of documentations,an overview of how things work is given in [details.md](details.md).

## Major

### Firebase integration
Everything is stored locally so if the app is uninstalled data is lost, to avoid this the data need to be symc with firebase.

## Contributing

Please read [contributing.md](contributing.md) for details on our code of conduct, and the process for submitting pull requests to us.
