# warning C4566: 由通用字符名称“\u0639”表示的字符不能在当前代码页(936)中表示出来
* windows下 ""包的字符常量最终会转化为当前代码页(编码)
* 例如 "送" 无论源文件本身编码是什么，都会转化为当前代码页(编码)
* 而 当前代码页(编码) 需要通过系统设置并重启才能修改
* 具体解释请移步： https://blog.csdn.net/audi2/article/details/51248975


# if not defined npm_config_node_gyp 
* 警告提示： 如果没有定义npm的配置变量 node_gyp ,则使用 npm 模块的node_moudles目录下的 node_modules\node-gyp\bin\node-gyp.js 配置脚本
* 通过npm config set node_gyp="" 设置
* 通过npm config get node_gyp 查看
* 更多npm配置命令，简单参考： https://www.cnblogs.com/huang0925/archive/2013/05/17/3083207.html 和其他文档
