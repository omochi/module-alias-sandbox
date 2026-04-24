# ModuleAliasSandbox

SwiftPM module alias の検証用プロジェクトです。

## 構成

- `AppPackage` / `App`: executable target
- `LibPackage` / `Lib`: library product / target

`AppPackage/Package.swift` で、`App` から横並びの `LibPackage` の `Lib` product を次のように参照しています。

```swift
.product(
    name: "Lib",
    package: "LibPackage",
    moduleAliases: [
        "Lib": "LibAlias",
    ]
)
```

この指定により、ビルド成果物は `LibAlias.swiftmodule` として生成されます。

注意点として、App 側の Swift ソースでは `import LibAlias` ではなく `import Lib` と書きます。`import LibAlias` と書くと、Swift コンパイラは `cannot refer to module as 'LibAlias' because it has been aliased; use 'Lib' instead` で失敗します。

## 確認方法

```sh
cd AppPackage
swift build
swift run App
find .build -path '*LibAlias*' -print
```

Xcode では `AppPackage/Package.swift` を開きます。`LibPackage` は `../LibPackage` のローカル package dependency として参照されます。
