docker for cnpmjs.org
=======

## What is this?

This a docker repository for the offical cnpmjs.org project. which provide a quick deployment for private npm server.

Get more detail from [cnpmjs.org repo](https://github.com/cnpm/cnpmjs.org)

## Quick start

#### 1. run the simple one

```
docker run -d --name mycnpmjs.org -p 7001:7001 -p 7002:7002 zzswang/docker-cnpmjs.org
```

**note**: It will start the pre-configured cnpmjs.org server. You could use `open http://localhost:7002` to visit the homepage.

Use following command to connect your local npm client to this server.

```
npm install -g cnpm
cnpm set registry http://localhost:7001  // the default registry for cnpm: https://registry.npm.taobao.org
cnpm login
## Username: dev
## Password: ***
## Email: (this IS public) dev@36node.com
```


#### 2. run with your own config.json and data backup

First you should prepare a config.json file for yourself. the default one in this docker is:

```
{
  "admins": {
    "dev": "dev@36node.com"
  },
  "scopes": [
    "@36node"
  ],
  "enablePrivate": true,
  "bindingHost": "0.0.0.0"
}
```

There are more configs, please read the [config file in offical repo](https://github.com/cnpm/cnpmjs.org/blob/master/config/index.js)

Prepare a folder, like /data, and put your config.json into it. Then start the docker like:

```
docker run -d --name mycnpmjs.org -p 7001:7001 -p 7002:7002 -v /data:/data/.npmjs.org zzswang/docker-cnpmjs.org
```


## License

[MIT](LICENSE.txt)
