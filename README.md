
<p align="center" >
<img src="logo.png" title="TCZKit logo" float=left>
</p>

# TCZKit
####一种简单、快捷的方式创建UI
做 [觅友购](https://itunes.apple.com/cn/app/mi-you-gou/id1168242067?l=en&mt=8) 和 [密语](https://itunes.apple.com/cn/app/mi-yu-ji-zhi-an-quan/id954996058?mt=8) 项目时，我发现我们的一半或者更多的时间都在做`UI`方面的事情，但是发现这些页面很相似，虽然使用了继承，减少了很多工作量，但是感觉这种实现方式很不好，使用起来也不友好，于是我们团队就想做一个框架来快速的创建UI。做到简单快捷。

#说明
`TCZKit`是为了能够更简单的搭建UI，由 `MeTalk（iOS）`团队开发，将会成为 [觅友购](https://itunes.apple.com/cn/app/mi-you-gou/id1168242067?l=en&mt=8) 和 [密语](https://itunes.apple.com/cn/app/mi-yu-ji-zhi-an-quan/id954996058?mt=8) 项目主要的UI框架。如果您在使用的过程中有什么问题，都可以和我们联系，邮箱地址`iMetalk@163.com`。

#安装

`TCZKit` 支持 iOS 8.0 或 iOS8.0 以上的系统，Swift3.0。
主要有以下三种方式集成:
- 手动集成`TCZKit`
- CocoaPods
- Carthage

#### 手动安装
下载 `TCZKitDemo` 到本地，直接将 `TCZKit` 复制到项目中。`TCZKit`使用 `SnapKit` 作为自动布局,  如果你的项目中没有集成过[SnapKit](https://github.com/SnapKit/SnapKit)，需要集成。

#### CocoaPods

```
platform :ios, '8.0'
pod 'TCZKit', '~>1.0'
```
#### Carthage

#开始使用

####主要文件说明：   

`Configuration\TCZConstant.swift`: 主要的常量
`Extension`: 扩展，主要用于创建UI元素
`Utils`: 工具，常见的View
`ViewControllers\TCZBaseTableViewController.swift`: 你所创建的视图控制器必须继承自`TCZBaseTableViewController`
`ViewControllers\TCZTableViewData.swift`:创建Cell的数据源
`ViewControllers\TCZTableViewDelegate.swift`:主要的协议
`Views\Cells`: 所有的Cell，若果创建自定义的Cell，必须继承到`TCZBaseCell.swift`

####数据源
`TCZTableViewItem`: 最基本的数据源，你所创建的Cell，必须通过配置数据源`TCZTableViewItem`,这样`TCZKit`才能正常解析。

####所支持的Cell


#支持
如果你在使用的过程中遇到问题，欢迎反馈，或直接提issue，邮箱`iMetalk@163.com`

#协议
`TCZKit` 被许可在 MIT 协议下使用。查阅 LICENSE 文件来获得更多信息。


