*This project is designed ONLY for ev3dev project. See https://www.ev3dev.org/*<br>
# ev3dev-snake
My attempt to make the fastest and lightest snake game.

*Used libraries:*
- fastrand 1.8.0

(the list might be updated any time)

## Comparisons
*(todo)*

## Install
There are 2 ways to install the game:
- Using source Python script file(faster to run, may be slower when running)
- Using [Cython](https://cython.org/)(requires individual .pyd building which can be very slow, but faster when running)
### Using source
To run the file using source .py file, download or clone the source using git:
```sh
git clone https://github.com/f1refa11/ev3dev-snake
```
switch to downloaded directory:
```sh
cd ev3dev-snake
```
and run these commands:
```sh
pip3 install -r requirements.txt
```
### Using [Cython](https://cython.org/):
Firstly, download or clone the source using git:
```sh
git clone https://github.com/f1refa11/ev3dev-snake
```
To run the game using Cython, you need to build the .pyd and .c files using `install.sh` script, which can be run from ev3dev file manager itself - just go to `ev3dev-snake` directory and run the `install.sh` script. Or you can launch the script using SSH:
```sh
cd ev3dev-snake
./install.sh
```
Notice from `install.sh` script: **The device will beep when the installation is finished**.
## Launching the game
If you used [Source script method](#using-source), you can run the game from the ev3dev file manager - just go to `ev3dev-snake` directory and run the `srcmain.py` script. Or you can run the game using SSH:
```sh
python3 srcmain.py
```
If you used [Cython method](#using-cython), run the `run.sh` script from ev3dev file manager or run it from SSH:
```sh
./run.sh
```
## License
See [LICENSE](LICENSE)