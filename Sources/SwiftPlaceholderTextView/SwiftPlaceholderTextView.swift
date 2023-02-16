/// SwiftPlaceholderTextView
/// Copyright © 2022 Giuseppe Bruno (https://gbrunodev.it)

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

public class SwiftPlaceholderTextView: UIView, UITextViewDelegate {
    
    private let label = UILabel()
    private lazy var textView = UITextView()
    
    /// TextView corner radius. Default: 8
    public var cornerRadius: CGFloat = 8
    /// TextView border width. Default: 1
    public var borderWidth: CGFloat = 1
    /// TextView border color. Default: black
    public var borderColor: CGColor = UIColor.black.cgColor
    /// TextView placeholder text
    public var placeholder: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    /// TextView placeholder font. Default: system font
    public var placeholderFont: UIFont? = .systemFont(ofSize: 16)
    /// TextView placeholder text color. Default: #CACACC
    public var placeholderTextColor: UIColor? = UIColor(red: 202/255, green: 202/255, blue: 204/255, alpha: 1)
    /// TextView text font. Default: system font
    public var font: UIFont? = .systemFont(ofSize: 16)
    /// TextView text color. Default: black
    public var textColor: UIColor? = .black
    /// TextView text
    public var text: String? {
        get {
            return textView.text
        }
        set {
            textView.text = newValue
        }
    }
    /// TextView return button
    public var returnKeyType: UIReturnKeyType = .default
    /// TextView keyboard type
    public var keyboardType: UIKeyboardType = .default
    /// Return key should dismiss keyboard. Default: true
    public var returnKeyShouldDismissKeyboard: Bool = true
    
    func setupView() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        
        textView.delegate = self
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        textView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        textView.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    public override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        label.font = placeholderFont
        label.textColor = placeholderTextColor
        
        textView.backgroundColor = .clear
        textView.font = font
        textView.textColor = textColor
        textView.returnKeyType = returnKeyType
        textView.keyboardType = keyboardType
        
        if text != nil && text?.trimmingCharacters(in: .whitespaces).isEmpty == false {
            label.isHidden = true
        }
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        label.isHidden = textView.text != ""
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if returnKeyShouldDismissKeyboard && text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
