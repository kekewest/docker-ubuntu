# docker-ubuntu
SSHサーバが備わっているシンプルなUbuntuのDockerコンテナのイメージです

初期状態では以下のようなツールが入っています

- sudo
- vim
- git
- wget
- openssh

## 使用方法
Dockerコンテナのイメージを作成するため、Dockerfileがあるディレクトリで以下のコマンドを実行してください
```
$ docker build -t kekewest/docker-ubuntu .
```

## Dockerコンテナのセットアップと起動
作成したDockerコンテナのイメージを起動させます。-uオプションを使用することによって、起動時にユーザーを作成することができます。
```
$ docker run --name testcontainer -i -d -t kekewest/docker-ubuntu \
-u "user1;password" \
-u "user2;password"
```
また、-hオプションを使用した以下のコマンドでヘルプを表示することができます。
```
$ docker run --rm -i -t kekewest/docker-ubuntu -h
Usage in run.sh [-opt]
Options (field in '<>' are required):
    -h This help
    -u "<username;password>"    Add a user
               required arg: "<username>;<password>"
               <username> for user
               <password> for user

```

