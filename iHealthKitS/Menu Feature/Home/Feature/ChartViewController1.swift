//
//  ChartViewController1.swift
//  iHealthS
//
//  Created by Apple on 2019/4/10.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

import UIKit
import MessageKit
import MessageInputBar
//import ApiAI



struct Member {
    let name: String
    let color: UIColor
}

struct Message {
    let member: Member
    let text: String
    let messageId: String
}

extension Message: MessageType {
    var sender: Sender {
        return Sender(id: member.name, displayName: member.name)
    }
    
    var sentDate: Date {
        return Date()
    }
    
    var kind: MessageKind {
        return .text(text)
    }
}

class ChartViewController1: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    let sender = Sender(id: "any_unique_id", displayName: "Steven")
    var messages: [Message] = []
    var member: Member!
    func currentSender() -> Sender {
        return Sender(id: member.name, displayName: member.name)
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = AIDefaultConfiguration()
        configuration.clientAccessToken = "ab5b714e9fce4701942d924ed2ad4829"
        ApiAI.shared()?.configuration = configuration
        
        member = Member(name: "bluemoon", color: .blue)
        let rect = view.frame
        messagesCollectionView.frame = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: rect.size.height-500)
        view.backgroundColor = UIColor.red
        print("abc")
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self

        let botMember =  Member(name: "bot", color: .gray)
        messages.append(Message(member: botMember, text: "欢迎与我们的 bot 聊天", messageId: "fskdfjk"))
    }

}


extension ChartViewController1: MessageInputBarDelegate {
    func messageInputBar( _ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        let newMessage = Message(
            member: member,
            text: text,
            messageId: UUID().uuidString)

        messages.append(newMessage)
        print(text)
        let request = ApiAI.shared()?.textRequest()
        request?.query = text
        request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            let responseStr = response.result.fulfillment.speech
            let botMember =  Member(name: "bot", color: .gray)
            self.messages.append(Message(member: botMember, text: responseStr!, messageId: "fskdfjk"))
            self.messagesCollectionView.reloadData()
            print(responseStr)
        }, failure: { (request, error) in
            
        })
        ApiAI.shared()?.enqueue(request)
        inputBar.inputTextView.text = ""
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)
    }
}
