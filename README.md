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

## 進入文字方塊輸入時向上移動畫面，結束時向下移動畫面

`ViewController.swift` 加入以下程式碼

```swift
private var currentTextField: UITextField?
private var isKeyboardShown = false

override func viewDidLoad() {
    super.viewDidLoad()
    NSNotificationCenter.defaultCenter().addObserver(
        self,
        selector: "keyboardWillShow:",
        name: UIKeyboardWillShowNotification,
        object: nil)
    NSNotificationCenter.defaultCenter().addObserver(
        self,
        selector: "keyboardWillHide:",
        name: UIKeyboardWillHideNotification,
        object: nil)
}

func textFieldDidBeginEditing(textField: UITextField) {
    currentTextField = textField
}

func keyboardWillShow(note: NSNotification) {
    if isKeyboardShown {
        return
    }
    if (currentTextField != textBottom) {
        return
    }
    let keyboardAnimationDetail = note.userInfo as! [String: AnyObject]
    let duration = NSTimeInterval(keyboardAnimationDetail[UIKeyboardAnimationDurationUserInfoKey]! as! NSNumber)
    let keyboardFrameValue = keyboardAnimationDetail[UIKeyboardFrameBeginUserInfoKey]! as! NSValue
    let keyboardFrame = keyboardFrameValue.CGRectValue()
    
    UIView.animateWithDuration(duration, animations: { () -> Void in
        self.view.frame = CGRectOffset(self.view.frame, 0, -keyboardFrame.size.height)
    })
    isKeyboardShown = true
}

func keyboardWillHide(note: NSNotification) {
    let keyboardAnimationDetail = note.userInfo as! [String: AnyObject]
    let duration = NSTimeInterval(keyboardAnimationDetail[UIKeyboardAnimationDurationUserInfoKey]! as! NSNumber)
    UIView.animateWithDuration(duration, animations: { () -> Void in
        self.view.frame = CGRectOffset(self.view.frame, 0, -self.view.frame.origin.y)
    })
    isKeyboardShown = false
}
```

### 執行

![enter image description here](https://8085studio.files.wordpress.com/2015/07/ios-hide-keyboard-p5.gif)

## 參考資訊

  - [iOS筆記: 虛擬鍵盤part. 1 – 隱藏虛擬鍵盤](https://8085studio.wordpress.com/2015/06/21/ios%E7%AD%86%E8%A8%98-%E8%99%9B%E6%93%AC%E9%8D%B5%E7%9B%A4part-1-%E9%9A%B1%E8%97%8F%E8%99%9B%E6%93%AC%E9%8D%B5%E7%9B%A4/)
  - [iOS筆記: 虛擬鍵盤part. 2 – 不讓鍵盤阻擋文字方塊](https://8085studio.wordpress.com/2015/07/16/ios%e7%ad%86%e8%a8%98-%e8%99%9b%e6%93%ac%e9%8d%b5%e7%9b%a4part-2-%e4%b8%8d%e8%ae%93%e9%8d%b5%e7%9b%a4%e9%98%bb%e6%93%8b%e6%96%87%e5%ad%97%e6%96%b9%e5%a1%8a/)
  - [捌零捌伍工作室](https://8085studio.wordpress.com/)
