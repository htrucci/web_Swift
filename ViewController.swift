//
//  ViewController.swift
//  web_Swift
//
//  Created by Htrucci on 2017. 6. 16..
//  Copyright © 2017년 Htrucci. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var txtUrl: UITextField!
    
    func loadWebPage(url: String){
        let myUrl = NSURL(string: url)
        let myRequest = NSURLRequest(url: myUrl! as URL )
        myWebView.loadRequest(myRequest as URLRequest)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.delegate = self
        loadWebPage(url: "http://archive.htrucci.com")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicator.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicator.stopAnimating()
    }
    func checkUrl(url: String) -> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag{ // "http://" 를 가지고 있지 않다면??
            strUrl = "http://" + strUrl
        }
        return strUrl
    }

    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(url: txtUrl.text!)
        txtUrl.text = myUrl
        loadWebPage(url: myUrl)
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage(url: "http://www.naver.com")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage(url: "http://www.daum.net")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML STring </h1><p> String 변수를 이용한 웹페이지 </p> <p> <a href=\"http://htrucci.com\">htrucci.com</a>으로 이동 </p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let myHtmlBundle = Bundle.main
        let filePath = myHtmlBundle.path(forResource: "htmlView", ofType: "html")
        loadWebPage(url: filePath!)
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myActivityIndicator.stopAnimating()
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myActivityIndicator.stopAnimating()
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

