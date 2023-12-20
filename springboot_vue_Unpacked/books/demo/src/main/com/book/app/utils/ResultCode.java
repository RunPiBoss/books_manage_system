package com.book.app.utils;

/*
*
* 在Java中，枚举类型（Enum）用于定义一组可以枚举的常量。在你的例子中，ResultCode 是一个枚举类型，它实现了 IErrorCode 接口
* */
public enum ResultCode  implements IErrorCode{

    SUCCESS(200, "操作成功"),
    FAILED(500, "操作失败"),
    VALIDATE_FAILED(404, "参数检验失败"),
    UNAUTHORIZED(401, "暂未登录或token已经过期"),
    FORBIDDEN(403, "没有相关权限");
    private long code;
    private String message;

    private ResultCode(long code, String message) {
        this.code = code;
        this.message = message;
    }

    public long getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
