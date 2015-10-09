# EPS8266 plugin framework

WORK IN PROGRESS  


Software unstable, alpha, ...  
Documentation incomplete  


## Getting this to work

Copy `example_config.lua` to `config.lua` and put your wifi credentials and settings in it.  
Activate the plugins you want to use by adding them to the PLUGINS array (plugin name = filename without `lua` ending).

Upload the files `init.lua`, `config.lua`, `pluginloader.lua`, `wifi_connect.lua` and the plugins you activated (with their dependencies)
to your ESP.

```
./luatool.py -f init.lua
./luatool.py -f config.lua
./luatool.py -f wifi_connect.lua
```

Alternatively use and/or adjust `flash_initial.sh`.

## Troubleshooting

If you get `Not enough memory` errors compile the lib you want to load (via console on the esp):

```
> node.compile('file.lua')
```

Or upload the file with `luatool.py -c`

Then restart and it should work.


# Available plugins

## dht_reader.lua

Push DHT22 data with ESP8266 to api.dusti.xyz

### Dependencies

* [dht_lib.lua](https://github.com/nodemcu/nodemcu-firmware/tree/master/lua_modules/dht_lib/dht_lib.lua)
* `drf_api.lua`

### Instructions

Define `config.PIN_DHT`and connect the DHT22 to that PIN.


## WS2801 led strip stuff

https://github.com/dirkmb/npfng-ledstrip

Work in progress

## Doorguard

https://github.com/asmaps/npfng-doorguard

Doorguard plugin for npfng. Monitor your doors and windows with reed switches from a central master node.

# Writing your own plugin

1. Create a new git repo called how you want to name your plugin typically `npfng-<pluginname>`
2. Copy the contents of the folder [plugin_template](https://github.com/npfng/npfng/tree/master/plugin_template) into
   your plugin repo
3. Probably you also want to copy the
   [example_config.lua](https://github.com/npfng/npfng/blob/master/example_config.lua) as a starting point.
4. Fill out the `README.md` and rename `pluginname.lua` according to your plugin name.
5. Put your code into `pluginname.lua`. The `start()` function will be called when your plugin is loaded.

# External sources

* `NodeMCU` from https://github.com/nodemcu/nodemcu-firmware
* `luatool.py` from https://github.com/4refr0nt/luatool
