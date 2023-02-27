# Personal Dot Files

My personal settings, for *vim*, *tmux*, *bashrc*, and more coming
(not finished).

Heavily inspired by [rwxrob](https://github.com/rwxrob) and his [dot files](https://github.com/rwxrob/dot) with additional changes made by myself.

### Instant Setup

By using the [setup file](https://github.com/gardm1/setup) we can automatically setup wanted dependencies for Linux/Ubuntu. <br />
If it's not an executable allready, you can make it one, by using the ```chmod +x <File_Name>``` command.

#### How To Use

After retriving the setup file

```bash
./setup [Dependencie you wish to install]
```

You can also use the **help** command to list all the available packages for installation 

```bash
./setup help
```


# Setup X11 Forwarding
(Windows as client-side)

**X11 Forwarding is not needed, outdated and forgotten <br />
WSL already has this set up using a better approach**

Refrences: 
* [Run Linux GUI apps with WSL](https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps)
* [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install)

---

1. Download [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
2. Download [Xming X Server](https://sourceforge.net/projects/xming/)

3. In server-side you need to edit the '/etc/ssh/sshd_config' file

```bash
sudo vim /etc/ssh/sshd_config
```
Uncomment ```X11Forwarding``` to be ```X11Forwarding yes``` 

4. Restart the ssh daemon
 
```bash
service sshd restart
```

5. **Optional** Create profile in Windows Terminal for your saved PuTTY session <br />
and add a ping service for before you try to enter your session.

Add this [file](https://github.com/gardm1/dot/tree/main/PuTTY) to your home directory on Windows <br />
and then add this profile to your Windows Terminal .json file.

```json
{
    "commandline": "\"C:\\Users\\Your-Name\\puttyping.bat\" Ip-Adress \"Your-Putty-Session\"",
    "guid": "{141d171c-4fd9-426d-9008-8cbc4b0b05d3}",
    "icon": "ms-appx:///ProfileIcons/{9acb9455-ca41-5af7-950f-6bca1bc9722f}.png",
    "name": "Name-Showed-In-Windows-Terminal"
}
```

You can also use *plink.exe*, but plink does not give support for the arrow keys, the <br />
escape key, nor the function keys, but in return acts more like an interactive session.

# Use X11 Forwarding in ssh client

1. In PuTTY go to 'session', and enter  ```username@ip-adress```

2. Then go to 'connection &rarr; SSH &rarr; X11' and tick the box ```Enable X11 forwarding``` <br />
and type ```localhost:0``` in X display location

3. Connect to your virtual machine through PuTTY and test if it's working correctly using *xclock*

### Testing

Install the graphical application *xclock* for testing. For Ubuntu or Debian, xclock is <br /> 
included in the ```x11-apps package```, and can be installed and ran as follows:

 ```bash
sudo apt -y install x11-apps
```

```bash
xclock
```

If *xclock* is opened, X11 forwarding is set up correctly.
