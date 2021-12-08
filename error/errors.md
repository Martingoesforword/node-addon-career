
# NODE_GYP
## gyp ERR! find Python 
* 通过在构建命令后加入 --verbose 了解find Python，find msvc，find gyp-node的完整日志
* 早发现这个 参数就好了

## TypeError [ERR_INVALID_ARG_TYPE]: The "original" argument must be of type function
* 使用旧版本node（10.0.0及以下）及其默认的npm版本 安装node-gyp并执行node-gyp rebuild会出现上述问题
* 原因在于： 安装的node-gyp要求 node-gyp@8.4.1: wanted: {"node":">= 10.12.0"} (current: {"node":"4.2.0","npm":"2.14.7"})
    * 但是当前node版本低于10.12.0，也就是npm 默认安装的node-gyp版本完全不支持node版本，所以执行rebuild出现语法错误
* 解决方案： 自定义安装node-gyp版本, 例如： npm install -g node-gyp@6.0.0
    * 或者使用 yarn包管理器，安装新包的时候会在第一阶段(Resolving packages...)检查node版本兼容性，并报错，停止安装，避免之后的无效工作 semver@7.3.5: The engine "node" is incompatible with this module. Expected version ">=10". Got "8.16.0"
        * 如果安装兼容的版本，则会安装成功
        * 同时，其还会展示分析依赖的整个过程，例如
            * warning node-gyp > request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
            * warning node-gyp > request > har-validator@5.1.5: this library is no longer supported
            * warning node-gyp > request > uuid@3.4.0: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
    * 还可以使用新版本的node（例如16.1.0）在执行node-gyp的时候指定所使用的 --target版本（也就是node-gyp版本）
        * 例如 node-gyp rebuild --target=v4.3.0
        * 因为新版node语法肯定是兼容旧版的，所以一般不会出错
* 心得：其实node-gyp版本的区别是v8头文件和nan头文件的区别
    * 不同版本node使用的v8解释器不同，所以需要不同的v8头文件，所以才出现上述的不兼容情况。

# NVM
## exit status 1: Access is denied.
* 通过nvm设置当前node版本号，出现上述错误
* 尝试多次无法解决，通过自己实现的setNvm脚本解决

