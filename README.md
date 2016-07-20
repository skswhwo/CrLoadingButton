# CrLoadingButton

UIButton that include loading state

![alt text](https://github.com/skswhwo/CrLoadingButton/blob/master/sample1.gif "demo")

## Installation

CrLoadingButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod "CrLoadingButton"
```

And then run:

```
$ pod install
```

## Usage

```objective-c
- (void)addButton
{
    button.hideButtonWhenActive = true;
    [button setDidSelect:^(CrLoadingButton *button) {
        button.active = true;
        [self performSelector:@selector(endButton:) withObject:button afterDelay:1];
    }];
}

- (void)endButton:(CrLoadingButton *)button
{
    button.active = false;
}
```

## Author

skswhwo, skswhwo@gmail.com

## License

CrLoadingButton is available under the MIT license. See the LICENSE file for more info.
