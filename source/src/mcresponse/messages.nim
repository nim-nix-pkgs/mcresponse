#
#              mconnect solutions
#        (c) Copyright 2020 Abi Akindele (mconnect.biz)
#
#    See the file "LICENSE.md", included in this
#    distribution, for details about the copyright / license.
# 
#             Standard Default Responses
#

import json, httpcore, tables
import netcode

## Type definition for the stardard responses / messages
type
    ResponseMessage* = object
        code*: MessageCode
        resCode*: HttpCode
        message*: string
        value*: JsonNode
    
## Standard default responses: includes app-code, http-code, message and transaction value (json-object)
## 
var responseMessages* = initTable[MessageCode, ResponseMessage]()

responseMessages = {
        MessageCode.CheckErrorCode: ResponseMessage(
        code   : MessageCode.ParamErrorCode,
        resCode: StatusCodeNotAcceptable,
        message: "Parameters checking error",
        value  : JsonNode(nil) ),
        
        MessageCode.ConnectionErrorCode: ResponseMessage(
        code   : MessageCode.ConnectionErrorCode,
        resCode: StatusCodeServiceUnavailable,
        message: "Connection error",
        value  : JsonNode(nil) ),

        MessageCode.ValidateErrorCode: ResponseMessage(
        code   : MessageCode.ParamErrorCode,
        resCode: StatusCodeNotAcceptable,
        message: "Validation error for inputs parameters",
        value  : JsonNode(nil) ),

        MessageCode.TokenExpiredCode: ResponseMessage(
        code   : MessageCode.TokenExpiredCode,
        resCode: StatusCodeUnAuthorized,
        message: "Unauthorized. Token / Access-key has expired. Please login again",
        value  : JsonNode(nil) ),

        MessageCode.UnAuthorizedCode: ResponseMessage(
        code   : MessageCode.UnAuthorizedCode,
        resCode: StatusCodeUnAuthorized,
        message: "Unauthorised Action or Task",
        value  : JsonNode(nil) ),
        
        MessageCode.NotFoundCode: ResponseMessage(
        code   :MessageCode.NotFoundCode,
        resCode: StatusCodeNotFound,
        message: "Requested information not found",
        value  : JsonNode(nil) ),

        MessageCode.SuccessCode: ResponseMessage(
        code   : MessageCode.SuccessCode,
        resCode: StatusCodeOK,
        message: "Request completed successfully",
        value  : JsonNode(nil) ),

        MessageCode.RemoveDeniedCode: ResponseMessage(
        code   : MessageCode.RemoveDeniedCode,
        resCode: StatusCodeUnAuthorized,
        message: "Remove action/task denied/unauthorised",
        value  : JsonNode(nil) ),

        MessageCode.RemoveErrorCode: ResponseMessage(
        code   : MessageCode.RemoveErrorCode,
        resCode: StatusCodeExpectationFailed,
        message: "Error removing/deleting information, retry or contact system-admin",
        value  : JsonNode(nil) ),

        MessageCode.RemovedCode: ResponseMessage(
        code   : MessageCode.RemovedCode,
        resCode: StatusCodeOK,
        message: "Record(s) deleted/removed successfully",
        value  : JsonNode(nil) ),

        MessageCode.SubItemsCode: ResponseMessage(
        code   : MessageCode.SubItemsCode,
        resCode: StatusCodeNotImplemented,
        message: "Record includes sub-items, which must be removed first",
        value  : JsonNode(nil) ),

        MessageCode.DuplicateRecordCode: ResponseMessage(
        code   : MessageCode.DuplicateRecordCode,
        resCode: StatusCodeNotAcceptable,
        message: "Duplicate record exists",
        value  : JsonNode(nil) ),

        MessageCode.UpdatedCode: ResponseMessage(
        code   : MessageCode.UpdatedCode,
        resCode: StatusCodeOK,
        message: "Information update action completed successfully",
        value  : JsonNode(nil) ),

        MessageCode.UpdateDeniedCode: ResponseMessage(
        code   : MessageCode.UpdateDeniedCode,
        resCode: StatusCodeNotImplemented,
        message: "Error updating information/record(s)",
        value  : JsonNode(nil) ),

        MessageCode.UpdateDeniedCode: ResponseMessage(
        code   : MessageCode.UpdateDeniedCode,
        resCode: StatusCodeUnAuthorized,
        message: "Update action/task not authorised",
        value  : JsonNode(nil) ),

        MessageCode.InsertedCode: ResponseMessage(
        code   : MessageCode.InsertedCode,
        resCode: StatusCodeOK,
        message: "Information/record(s) inserted/created successfully",
        value  : JsonNode(nil) ),

        MessageCode.InsertErrorCode: ResponseMessage(
        code   : MessageCode.InsertErrorCode,
        resCode: StatusCodeNotImplemented,
        message: "Error inserting/creating new information/record",
        value  : JsonNode(nil) ),

        MessageCode.RecordExistCode: ResponseMessage(
        code   : MessageCode.RecordExistCode,
        resCode: StatusCodeNotImplemented,
        message: "Document/record exists",
        value  : JsonNode(nil) ),

        MessageCode.TaskErrorCode: ResponseMessage(
        code   : MessageCode.TaskErrorCode,
        resCode: StatusCodeOK,
        message: "Application or Task Specific Error",
        value  : JsonNode(nil) ),

        MessageCode.UnknownCode: ResponseMessage(
        code   : MessageCode.UnknownCode,
        resCode: StatusCodeOK,
        message: "Unspecified/Unknown response/error message",
        value  : JsonNode(nil) )

}.toTable
