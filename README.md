### What it does

Create an Apache VirtualHost with a simple bash command.

**This is intended to use in macOS XAMPP.**
___

### How it works

1. Checks if the parameter that you've set as VirtualHost name is a folder's name that already exists in XAMPP's `htdocs` path. If it does, the whole process will stop. If it doesn't, the folder will be created with that name.

2. Will give you current user permissions for edit the folder.

3. Will add the configuration to XAMPP's `httpd-vhosts.conf` file. This will create an empty log file for that VH. You can modify any of this configuration inside the `.bash_profile` file.

4.  Will add the VH domain to the system's hosts file (`/private/etc/hosts`).

5. Ready to use!

#### Notes

- It requires `sudo` to work.
- Remember to show the hidden files in order to show `~/.bash_profile`.

___

### "Install"

Create or edit the `.bash_profile` file.

```
$ nano ~/.bash_profile
```

If you do not have that file, just download it from the repository and place it in `~/`. If you already have it in your system, paste the repository's code at the end of your own file.

And apply the changes:

```
$ source ~/.bash_profile
```

___

### Usage

This is the basic usage for create a VH:

```
$ vhost your-virtualhost-name
```

You can ask to XAMPP's Apache to restart for apply the VH config file changes using `-ra` (_**r**estart **a**pache_)

```
$ vhost your-virtualhost-name -ra
```

The **default domain** is `.local` but you can set a **custom domain** using:

```
$ vhost your-virtualhost-name -D yourdomain
```

You can also set a domain _and_ restart:

```
$ vhost your-virtualhost-name -D yourdomain -ra
```

Now just go to `http://your-virtualhost-name.yourdomain` :smile:

___

### Troubleshooting

#### Restart Apache takes long time

Please check that you don't have unnecessary VH entries in your XAMPP's `httpd-vhosts.conf` file. Also check the `/private/etc/hosts` file and remove any local domains that you do not need.
