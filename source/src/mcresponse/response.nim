#
#              mconnect solutions
#        (c) Copyright 2020 Abi Akindele (mconnect.biz)
#
#    See the file "LICENSE.md", included in this
#    distribution, for details about the copyright / license.
# 
#             Response Message Procedure
#

## This procedure returns stardard response for any transactions 
## 
## 

import json, httpcore, tables
import ./messages
import ./netcode

proc msgFunc*(mcCode: MessageCode; mcMsg: string; mcResCode: HttpCode; mcValue: JsonNode;): ResponseMessage =
    result = ResponseMessage(
        code   : mcCode,
        resCode: mcResCode,
        value  : mcValue,
        message: mcMsg)

proc getResMessage*(messageType: MessageCode = MessageCode.UnknownCode;  options: ResponseMessage = ResponseMessage()): ResponseMessage = 
    var
        value: JsonNode
        code: MessageCode
        resCode: HttpCode
        message: string

    # check for the messageType in the standard responseMessages
    if messageType != MessageCode.UnknownCode and responseMessages.hasKey(messageType):
        code = messageType
    elif responseMessages.hasKey(options.code):
        code = options.code
    else:
        code = messageType

    # Obtain the standard response, will always return valid result
    let stdRes =  responseMessages[code]
    
    resCode = stdRes.resCode

    if options.message != "":
        message = options.message
    else:
        message = stdRes.message

    if options.value != nil:
        value = options.value
    else: 
        value = nil
    

    result = msgFunc(mcCode = code, mcMsg = message, mcResCode = resCode, mcValue = value )

when isMainModule:
    # standard response message
    var resMsg = responseMessages[MessageCode.SuccessCode]
    echo "\n"
    echo resMsg
    echo "\n"

    type
        Person = object
            firstName: string
            lastName: string
            age: Natural

    const person: Person = Person(firstName: "Abi", lastName: "Akindele", age: 100)
    const person2: Person = Person(firstName: "Ola", lastName: "Akindele", age: 200)

    let personInfo = %*([person, person2])

    var options = ResponseMessage(value: personInfo, message: "personal info")

    echo getResMessage(MessageCode.SuccessCode, options)
