import unittest, json

import mcresponse

# standard response message
type
    Person = object
        firstName: string
        lastName: string
        age: Natural

const person: Person = Person(firstName: "Abi", lastName: "Akindele", age: 100)
const person2: Person = Person(firstName: "Ola", lastName: "Akindele", age: 200)

let personInfo = %*([person, person2])

var options = ResponseMessage(value: personInfo, message: "Request completed")
var resMsg = getResMessage(MessageCode.SuccessCode, options)
echo "\n"
echo resMsg
echo "\n"
echo "msgCode: ", resMsg.code
echo "\n"
echo "resCode: ", resMsg.resCode.repr
echo "\n"
# (code: "success", resCode: ..., message: "Request completed successfully [personal info]",
# value: [{"firstName":"Abi","lastName":"Akindele","age":100},{"firstName":"Ola","lastName":"Akindele","age":200}]) 
#

test "will response with the correct standard response: ":
    check resMsg.code.repr == "success"
    check resMsg.message == "Request completed"
    check resMsg.value == %*([{"firstName":"Abi","lastName":"Akindele","age":100},{"firstName":"Ola","lastName":"Akindele","age":200}])
    check resMsg.resCode.repr == "200"