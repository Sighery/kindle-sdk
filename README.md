# Kindle-SDK

This is an unofficial Kindle SDK designed to complement a `koxtoolchain` installation.

For more info see our [documentation](https://kindlemodding.org/kindle-dev/kindle-sdk.html)

## Modes

### Simple

Simple mode offers a simpler set up for a few select device and firmware
versions. You can run `./gen-sdk.sh -h` for the most up to date information.

### Expert

Expert mode is accessed with `./gen-sdk.sh expert`. In this mode, you need to
manually provide all the values, so you should know what you're doing. The
syntax is as follows:

```
./gen-sdk.sh expert <toolchain> <platform> <firmware_url> [path]
```

1. `toolchain` might be something like `arm-kindlehf-linux-gnueabihf`. This will
   match what `koxtoolchain` will create based on its `platform` choice
2. `platform` matches the argument from `koxtoolchain`
3. `firmware_url` is the full URL of the firmware device and version you want to
   use
4. `path` is optional. Only needed when you have changed the installation
   directory in `koxtoolchain` installation step. Otherwise just passing the
   proper `toolchain` argument will find the proper path

As you can see, to use expert mode you should know what you're doing. There is
no checks whatsoever for the combinations of
`toolchain`/`platform`/`firmware_url`. So only use if you know what you're
doing, and you have specific device/firmware requirements that aren't served by
the simple mode.

Kindle Scribe 1 with 5.17.3 firmware:

```sh
./gen-sdk.sh expert arm-kindlehf-linux-gnueabihf kindlehf https://s3.amazonaws.com/firmwaredownloads/update_kindle_scribe_5.17.3.bin
```

Kindle Paperwhite 5 Signature Edition with 5.16.2.1.1 firmware:

```sh
./gen-sdk.sh expert arm-kindlepw2-linux-gnueabi kindlepw2 https://s3.amazonaws.com/firmwaredownloads/update_kindle_all_new_paperwhite_11th_5.16.2.1.1.bin
```

## Prebuilt packages

With the help of Github Actions I'm building the packages, similarly to how
`koxtoolchain` also builds their packages. Sadly, once you get to the
`kindle-sdk` step, you need to settle on a specific device and firmware
version, and I can't just build every possible combination of device +
firmware. That means I just support a few device/firmware combinations. As of
now, these are:

* Kindle PW5 with 5.16.2.1.1
* Kindle Scribe 1 with 5.17.3

These can be found [in the releases tab][releases]. Always pick the latest
release.


[sighery/kindle-builder]: https://hub.docker.com/r/sighery/kindle-builder
[releases]: https://github.com/Sighery/kindle-sdk/releases
