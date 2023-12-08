package org.util;

import org.apache.logging.log4j.LogManager;

public class Logger {

    // 로거 이니셜라이즈
    private static final org.apache.logging.log4j.Logger logger = LogManager.getLogger(Logger.class);

    // 예외와 함께 에러 레벨의 로그 출력 메소드
    public static void error(String message, Throwable throwable) {
        logger.error(message, throwable);
    }

    // 디버그 레벨의 로그 출력 메소드
    public static void debug(String message) {
        logger.debug(message);
    }

    // 정보 레벨의 로그 출력 메소드
    public static void info(String message) {
        logger.info(message);
    }

    // 경고 레벨의 로그 출력 메소드
    public static void warn(String message) {
        logger.warn(message);
    }

    // 에러 레벨의 로그 출력 메소드
    public static void error(String message) {
        logger.error(message);
    }
}