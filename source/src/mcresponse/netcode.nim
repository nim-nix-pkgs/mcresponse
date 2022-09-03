# standard HTTP network status codes and texts

import tables, httpcore

## HTTP status codes
const
    # # RFC 7231, 6.2.1 */
    StatusCodeContinue* = HttpCode(100)
    # RFC 7231 6.2.2 */
    StatusCodeSwitchingProtocols* = HttpCode(101)
    # RFC 2518, 10.1 */
    StatusCodeProcessing* = HttpCode(102)
    # RFC 8297 **/
    StatusCodeEarlyHints* = HttpCode(103)
    # RFC 7231 6.3.1 */
    StatusCodeOK* = HttpCode(200)
    # RFC 7231 6.3.2 */
    StatusCodeCreated* = HttpCode(201)
    # RFC 7231 6.3.3 */
    StatusCodeAccepted* = HttpCode(202)
    # RFC 7231 6.3.4 */
    StatusCodeNonAuthoritativeInfo* = HttpCode(203)
    # RFC 7231 6.3.5 */
    StatusCodeNoContent* = HttpCode(204)
    # RFC 7231 6.3.6 */
    StatusCodeResetContent* = HttpCode(205)
    # RFC 7233 4.1 */
    StatusCodePartialContent* = HttpCode(206)
    # RFC 4918 11.1 */
    StatusCodeMultiStatus* = HttpCode(207)
    # RFC 5842 7.1 */
    StatusCodeAlreadyReported* = HttpCode(208)
    # RFC 3229 10.4.1 */
    StatusCodeIMUsed* = HttpCode(226)
    # RFC 7231 6.4.1 */
    StatusCodeMultipleChoices* = HttpCode(300)
    # RFC 7231 6.4.2 */
    StatusCodeMovedPermanently* = HttpCode(301)
    # RFC 7231 6.4.3 */
    StatusCodeFound* = HttpCode(302)
    # RFC 7231 6.4.4 */
    StatusCodeSeeOther* = HttpCode(303)
    # RFC 7232 4.1 */
    StatusCodeNotModified* = HttpCode(304)
    # RFC 7231 6.4.5 */
    StatusCodeUseProxy* = HttpCode(305)
    # RFC 7231 6.4.7 */
    StatusCodeTemporaryRedirect* = HttpCode(307)
    # RFC 7538 3 */
    StatusCodePermanentRedirect* = HttpCode(308)

    # RFC 7231 6.5.1 */
    StatusCodeBadRequest* = HttpCode(400)
    # RFC 7235 3.1 */
    StatusCodeUnauthorized* = HttpCode(401)
    # RFC 7231 6.5.2 */
    StatusCodePaymentRequired* = HttpCode(402)
    # RFC 7231 6.5.3 */
    StatusCodeForbidden* = HttpCode(403)
    # RFC 7231 6.5.4 */
    StatusCodeNotFound* = HttpCode(404)
    # RFC 7231 6.5.5 */
    StatusCodeMethodNotAllowed* = HttpCode(405)
    # RFC 7231 6.5.6 */
    StatusCodeNotAcceptable* = HttpCode(406)
    # RFC 7235 3.2 */
    StatusCodeProxyAuthRequired* = HttpCode(407)
    # RFC 7231 6.5.7 */
    StatusCodeRequestTimeout* = HttpCode(408)
    # RFC 7231 6.5.8 */
    StatusCodeConflict* = HttpCode(409)
    # RFC 7231 6.5.9 */
    StatusCodeGone* = HttpCode(410)
    # RFC 7231 6.5.10 */
    StatusCodeLengthRequired* = HttpCode(411)
    # RFC 7232 4.2 */
    StatusCodePreconditionFailed* = HttpCode(412)
    # RFC 7231 6.5.11 */
    StatusCodeRequestEntityTooLarge* = HttpCode(413)
    # RFC 7231 6.5.12 */
    StatusCodeRequestURITooLong* = HttpCode(414)
    # RFC 7231 6.5.13 */
    StatusCodeUnsupportedMediaType* = HttpCode(415)
    # RFC 7233 4.4 */
    StatusCodeRequestedRangeNotSatisfiable* = HttpCode(416)
    # RFC 7231 6.5.14 
    StatusCodeExpectationFailed* = HttpCode(417)
    # RFC 7168 2.3.3 */
    StatusCodeTeapot* = HttpCode(418)
    # RFC 7540 9.1.2 */
    StatusCodeMisdirectedRequest* = HttpCode(421)
    # RFC 4918 11.2 */
    StatusCodeUnprocessableEntity* = HttpCode(422)
    # RFC 4918 11.3 */
    StatusCodeLocked* = HttpCode(423)
    # RFC 4918 11.4 */
    StatusCodeFailedDependency* = HttpCode(424)
    # RFC 8470 5.2 */
    StatusCodeTooEarly* = HttpCode(425)
    # RFC 7231 6.5.15 */
    StatusCodeUpgradeRequired* = HttpCode(426)
    # RFC 6585 3 */
    StatusCodePreconditionRequired* = HttpCode(428)
    # RFC 6585 4 */
    StatusCodeTooManyRequests* = HttpCode(429)
    # RFC 6585 5 */
    StatusCodeRequestHeaderFieldsTooLarge* = HttpCode(431)
    # RFC 7725 3 */
    StatusCodeUnavailableForLegalReasons* = HttpCode(451)
    # RFC 7231 6.6.1 */
    StatusCodeInternalServerError* = HttpCode(500)
    # RFC 7231 6.6.2 */
    StatusCodeNotImplemented* = HttpCode(501)
    # RFC 7231 6.6.3 */
    StatusCodeBadGateway* = HttpCode(502)
    # RFC 7231 6.6.4 */
    StatusCodeServiceUnavailable* = HttpCode(503)
    # RFC 7231 6.6.5 */
    StatusCodeGatewayTimeout* = HttpCode(504)
    # RFC 7231 6.6.6 */
    StatusCodeHTTPVersionNotSupported* = HttpCode(505)
    # RFC 2295 8.1 */
    StatusCodeVariantAlsoNegotiates* = HttpCode(506)
    # RFC 4918 11.5 */
    StatusCodeInsufficientStorage* = HttpCode(507)
    # RFC 5842 7.2 */
    StatusCodeLoopDetected* = HttpCode(508)
    # RFC 2774 7 */
    StatusCodeNotExtended* = HttpCode(510)
    # RFC 6585 6 */
    StatusCodeNetworkAuthenticationRequired* = HttpCode(511)

## HTTP status texts
var StatusText = initTable[HttpCode, string]()

StatusText = {
    StatusCodeContinue: "Continue",
    StatusCodeSwitchingProtocols: "Switching Protocols", 
    StatusCodeProcessing: "Processing",
    StatusCodeEarlyHints: "Early Hints",
    StatusCodeOK: "OK",
    StatusCodeCreated: "Created",
    StatusCodeAccepted: "Accepted",
    StatusCodeNonAuthoritativeInfo: "Non-Authoritative Information",
    StatusCodeNoContent: "No Content",
    StatusCodeResetContent: "Reset Content",
    StatusCodePartialContent: "Partial Content",
    StatusCodeMultiStatus: "Multi-Status",
    StatusCodeAlreadyReported: "Already Reported",
    StatusCodeIMUsed: "IM Used",
    StatusCodeMultipleChoices: "Multiple Choices",
    StatusCodeMovedPermanently: "Moved Permanently",
    StatusCodeFound: "Found",
    StatusCodeSeeOther: "See Other",
    StatusCodeNotModified: "Not Modified",
    StatusCodeUseProxy: "Use Proxy",
    StatusCodeTemporaryRedirect: "Temporary Redirect",
    StatusCodePermanentRedirect: "Permanent Redirect",
    StatusCodeBadRequest: "Bad Request",
    StatusCodeUnauthorized: "Unauthorized",
    StatusCodePaymentRequired: "Payment Required",
    StatusCodeForbidden: "Forbidden",
    StatusCodeNotFound: "Not Found",
    StatusCodeMethodNotAllowed: "Method Not Allowed",
    StatusCodeNotAcceptable: "Not Acceptable",
    StatusCodeProxyAuthRequired: "Proxy Authentication Required",
    StatusCodeRequestTimeout: "Request Timeout",
    StatusCodeConflict: "Conflict",
    StatusCodeGone: "Gone",
    StatusCodeLengthRequired: "Length Required",
    StatusCodePreconditionFailed: "Precondition Failed",
    StatusCodeRequestEntityTooLarge: "Request Entity Too Large",
    StatusCodeRequestURITooLong: "Request URI Too Long",
    StatusCodeUnsupportedMediaType: "Unsupported Media Type",
    StatusCodeRequestedRangeNotSatisfiable: "Requested Range Not Satisfiable",
    StatusCodeExpectationFailed: "Expectation Failed",
    StatusCodeTeapot: "I'm a teapot",
    StatusCodeMisdirectedRequest: "Misdirected Request",
    StatusCodeUnprocessableEntity: "Unprocessable Entity",
    StatusCodeLocked: "Locked",
    StatusCodeFailedDependency: "Failed Dependency",
    StatusCodeTooEarly: "Too Early",
    StatusCodeUpgradeRequired: "Upgrade Required",
    StatusCodePreconditionRequired: "Precondition Required",
    StatusCodeTooManyRequests: "Too Many Requests",
    StatusCodeRequestHeaderFieldsTooLarge: "Request Header Fields Too Large",
    StatusCodeUnavailableForLegalReasons: "Unavailable For Legal Reasons",
    StatusCodeInternalServerError: "Internal Server Error",
    StatusCodeNotImplemented: "Not Implemented",
    StatusCodeBadGateway: "Bad Gateway",
    StatusCodeServiceUnavailable: "Service Unavailable",
    StatusCodeGatewayTimeout: "Gateway Timeout",
    StatusCodeHTTPVersionNotSupported: "HTTP Version Not Supported",
    StatusCodeVariantAlsoNegotiates: "Variant Also Negotiates",
    StatusCodeInsufficientStorage: "Insufficient Storage",
    StatusCodeLoopDetected: "Loop Detected",
    StatusCodeNotExtended: "Not Extended",
    StatusCodeNetworkAuthenticationRequired: "Network Authentication Required",
}.toTable


type MessageCode* = enum
    CheckErrorCode = "checkError",
    ParamErrorCode = "paramError",
    ConnectionErrorCode = "connectionError",
    ValidateErrorCode = "validateError",
    TokenExpiredCode = "tokenExpired",
    UnAuthorizedCode = "unAuthorized",
    NotFoundCode = "notFound",
    SuccessCode = "success",
    RemoveDeniedCode = "removeDenied",
    RemoveErrorCode = "removeError",
    RemovedCode = "removed",
    SubItemsCode = "subItems",
    DuplicateRecordCode = "duplicateRecord",
    UpdatedCode = "updated",
    UpdateErrorCode = "updateError",
    UpdateDeniedCode = "updateDenied"
    InsertedCode = "inserted",
    InsertErrorCode = "insertError",
    RecordExistCode = "recordExist",
    TaskErrorCode = "taskError",
    UnknownCode = "unknown",
