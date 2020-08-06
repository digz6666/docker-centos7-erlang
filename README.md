Centos 7 with erlang 18.0

### Build docker image
```
docker build --tag digz6666/centos7-erlang18:$version .
```

### Push docker image
```
docker push digz6666/centos7-erlang18:$version
```

### Push tags to maintain image on docker hub
```
git tag -a "$version" -m "version $version"
git push --tags
```
