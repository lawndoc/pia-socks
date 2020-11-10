# A socks5 proxy via Private Internet Access.

An [Alpine](https://alpinelinux.org/) Linux container running a socks5 proxy (using [dante](https://www.inet.no/dante/)) via Private Internet Access (OpenVPN).

You will need a [PrivateInternetAccess](https://www.privateinternetaccess.com/pages/how-it-works) account.
If you don't have one, you can [sign up here](https://www.privateinternetaccess.com/pages/buy-vpn) for one.


## Starting the VPN Proxy

```sh
docker-compose up -d --build
```

Substitute the environment variables for `REGION`, `USERNAME`, `PASSWORD` as indicated in the docker-compose.yml file. Or, better yet, set them in your deployment environment to reduce risk of committing them to a public repo :)


### Environment Variables

`REGION` is optional. The default region is set to `US Chicago`. The spelling/formatting for`REGION` should match the corresponding `.opvn` config name for that region.

See the [PIA VPN Tunnel Network page](https://www.privateinternetaccess.com/pages/network) for details.
Use the `Location` value for your `REGION`.

`USERNAME` / `PASSWORD` - Credentials to connect to PIA. It is recommended to set environment variables on the host machine rather than in the docker-compose.yml file.


### Test connection

- curl:

```shell
# socks5h so the dns is done over the socks proxy
$ curl -x socks5h://<ip_of_host>:1080
```

## Credits

- [OneOfOne/pia-socks-proxy](https://github.com/oneofone/pia-socks-proxy) I borrowed a lot from this repo. It was unmaintained and no longer working (broken dependency), so I broke out the DNSSEC service (unbound) into its own container to adopt a microservices model. I have reworked the Dante config file a little and heavily modified both the docker-compose.yml provided and the Dockerfile. But even then, most of the work was already done for me, so props to OneOfOne for his cool container.
