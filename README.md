# iOS 虛擬鍵盤控制

##  按下鍵盤上的「完成」後隱藏虛擬鍵盤

`ViewController.swift` 加入以下程式碼
```swift
func textFieldShouldReturn(textField: UITextField) -> Bool {
	textField.resignFirstResponder()
	return true
}
```

### 執行

![enter image description here](https://8085studio.files.wordpress.com/2015/06/ios-hide-keyboard-p31.gif)

## 使用手勢操作來隱藏虛擬鍵盤

`ViewController.swift` 加入以下程式碼
```swift
override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
	self.view.endEditing(true)
}
```

### 執行

![enter image description here](https://8085studio.files.wordpress.com/2015/06/ios-hide-keyboard-p4.gif)

## 參考資訊

  - [iOS筆記: 虛擬鍵盤part. 1 – 隱藏虛擬鍵盤](https://8085studio.wordpress.com/2015/06/21/ios%E7%AD%86%E8%A8%98-%E8%99%9B%E6%93%AC%E9%8D%B5%E7%9B%A4part-1-%E9%9A%B1%E8%97%8F%E8%99%9B%E6%93%AC%E9%8D%B5%E7%9B%A4/)
  - [捌零捌伍工作室](https://8085studio.wordpress.com/)
