Raspberry Pi Command Center
===========================

A simple web application that helps you power up your home server using [magic packets](https://en.wikipedia.org/wiki/Wake-on-LAN#Magic_packet).


![Screenshot of Raspberry Pi Command Center](http://i.imgur.com/GLBElsF.png)

## Configuration

Rename ``config-example.yml`` to ``config.yml``and fill in corresponding fields accordingly.

|      Field      | Description |
| --------------- | ----------- |
|   ``mac_addr``  | Mac address of your ethernet device.<br> You can use ``ifconfig`` to check it. Look for ``HWaddr`` in the output.|
|   ``local_ip``  | The local IP address for your home server.<br>  This is used to check whether your home server is up or down.  |
|   ``username``  | Username for basic HTTP  authentication. |
|   ``password``  | Password for basic HTTP authentication. |

## License

[The GNU General Public License v3.0](http://www.gnu.org/licenses/gpl-3.0.txt)

## Special Thanks

Special thanks to the baby seal who maintained the air-flow in my room by always keeping the window wide open. Our cores wouldn't run as cool without him.

![Baby Seal](http://i.imgur.com/diFo3if.jpg)
