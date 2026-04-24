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

App 側の Swift ソースでは `import LibAlias` と書きます。

```swift
import LibAlias

let obj = LibAlias.Lib(name: "Module Alias")
print(obj.message())
```

## `LibAlias.` 修飾の挙動

`AppPackage/Package.swift` に追加で `.target(name: "Lib")` を入れている場合、App から見る `Lib` がローカル target と alias された product dependency の両方に関係するため、名前解決が曖昧になります。この状態では、`LibAlias.Lib(...)` のような module 名による修飾が許されます。

一方で、`AppPackage/Package.swift` から追加の `.target(name: "Lib")` 参照を外すと、App 側から見える依存関係が曖昧でなくなります。その結果、`LibAlias.` で型を修飾する書き方はエラーとして扱われます。

## 確認方法

```sh
cd AppPackage
swift run
```
