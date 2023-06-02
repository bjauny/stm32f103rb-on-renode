# Demonstration of the Renode framework

> Where blinking a LED means the world

---

## Brief

This is intended as a showcase for the Renode framework from AntMicro. It allows to simulate hardware and run embedded firmwares with no physical board and without changing/instrumenting your code.
This is all developed on Windows but can be applied to any other OS as long as the toolchains and Renode are available.

---

## Pre-requisites

- Renode: 1.13.3
- STM32CubeIDE: 1.12.1

---

## Setup

You basically just need to buld the STM32Cube project. It has been generated using STM32CubeMX v6.8.1 for a NUCLEO F103RB board. The only feature is to toggle the user LED when you press and release the user button. Nothing crazy but you have to start somewhere.
The default script uses the `Debug` configuration in the case you want to start a GDB server. Feel free to build the `Release` but note that you'll have to edit the `load_and_start_renode.resc` file to use the correct binary file.

## Usage

With the project built, you can now include the `load_and_start_renode.resc` file in a Renode instance. The last line of the script can be uncommented to start a GDB server.
Start the machine. Nothing crazy should happen. You can now play with the user button in Renode :
```shell
gpioPortC.UserButton PressAndRelease
```

You should see the results in the log window :
```
[NOISY] gpioPortA.UserLED: LED state changed to True
```

## Debug

The STM32CubeIDE contains a Debug configuration to connect to the remote GDB server from Renode. From now you can debug as usual like you would with a JTAG probe or any other debug device with a local physical board.