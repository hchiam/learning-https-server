# Learning quick setup of HTTPS server

Just one of the things I'm learning. <https://github.com/hchiam/learning>

## Usage

(Mac only:)

```bash
bash localhost-ssl-mac.sh
```

Then you run `https-server` (note the "s") in the folder of your choice. (If you see the "command not found" message, then try running `source ~/.bash_profile` and then try `https-server` again.)

For example:

```bash
cd example-folder
https-server
# then open https://localhost:8080
```

Since you created the self-signed certificate, you should be able to trust your own localhost site.

## References

<https://medium.com/@jonsamp/how-to-set-up-https-on-localhost-for-macos-b597bcf935ee>

<https://gist.github.com/jonsamp/587b78b7698be7c7fd570164a586e6b7>

`http-server`: <https://github.com/http-party/http-server>
