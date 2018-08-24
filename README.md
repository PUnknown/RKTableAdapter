# RKTableAdapter

[![CI Status](https://img.shields.io/travis/DaskiOFF/RKTableAdapter.svg?style=flat)](https://travis-ci.org/DaskiOFF/RKTableAdapter)
[![Cocoapods compatible](https://img.shields.io/badge/Cocoapods-compatible-4BC51D.svg?style=flat)](https://cocoapods.org/)
[![Version](https://img.shields.io/cocoapods/v/RKTableAdapter.svg?style=flat)](https://cocoapods.org/pods/RKTableAdapter)
[![Platform](https://img.shields.io/cocoapods/p/RKTableAdapter.svg?style=flat)](https://cocoapods.org/pods/RKTableAdapter)
[![Swift Version](https://img.shields.io/badge/Swift-4.0–4.2-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
[![License](https://img.shields.io/cocoapods/l/RKTableAdapter.svg?style=flat)](https://cocoapods.org/pods/RKTableAdapter)

## Content
- [Documentations](#documentations)
- [Usage UITableView](#usage-uitableview)
- [Usage UICollectionView](#usage-uicollectionview)
- [Cell Templates](#cell-templates)
    - [Usage templates](#usage-templates)
- [Installation](#installation)
- [Author](#author)
- [License](#license)
- [Info](#dependencies)

## Documentations

https://daskioff.github.io/RKTableAdapter/

How use -> https://daskioff.github.io/RKTableAdapter/Classes/TableViewAdapter.html

## Usage UITableView 

- Ячейка должна реализовывать протокол ConfigurableCell
- ViewModel ячейки должна наследоваться от CellVM
- Необходимо его создать используя UITableView

```swift

```

## Usage UICollectionView

## Cell Templates
Generate Cell from templates with [Jessica](https://github.com/daskioff/jessica)

Download cell templates

```
jessica generator pull github.com/daskioff/jessica_templates rk_table_adapter
```

Fix `output_paths` in `templates.yml` for your project

### Usage templates

[Jessica Generator](https://github.com/DaskiOFF/jessica#generator)

```
jessica generator gen cell CELL_NAME

or

jessica generator gen cell_calc CELL_NAME
```

## Installation

RKTableAdapter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RKTableAdapter', '~> 0.1'
```

## Author

DaskiOFF, waydeveloper@gmail.com

## License

RKTableAdapter is available under the MIT license. See the LICENSE file for more info.

## [Dependencies](https://ios-factor.com/dependencies)
Последний раз проект собирался с версией **Xcode** указанной в файле ```.xcode-version``` ([Подробнее](https://github.com/fastlane/ci/blob/master/docs/xcode-version.md))

Последний раз проект собирался с версией **Swift** указанной в файле ```.swift-version```
