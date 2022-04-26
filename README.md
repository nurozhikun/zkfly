<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

app:
- zk_app:(ZkApp)作为整个GUI的基类，一个进程只能有一个对象；
- zk_app_filter:(ZkFilter)是对Widget的状态和动作的封装，一个widget关联一个，多个widget可以共享一个，一个进程可以有多个对象
- zk_app_shared:(ZkShared)是对本地需要持久化存储的共享数据封装，一个进程也只需要一个对象
- zk_app_api:app内部会用到的各种独立App封装；(ZkHttpApi)是对Http客户端模块的封装，一个进程只需要一个对象
- zk_key:app内部的常用键值定义
getxapp:
- zk_getx_app:(ZkGetxApp)利用Getx框架的App封装

## Features

TODO: List what your package can do. Maybe include images, gifs.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
