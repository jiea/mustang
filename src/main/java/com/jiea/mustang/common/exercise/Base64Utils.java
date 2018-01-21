package com.jiea.mustang.common.exercise;

import org.apache.commons.codec.binary.Base64;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.IOException;

/**
 * Base64 算法 三种实现方式
 */
public class Base64Utils {

    private static String str = "test";

    public static void main(String[] args) {
        jdkBase64();
        commonsCodecBase64();
        bouncyCastleBase64();
    }

    /**
     * jdk 实现方式（不建议使用）
     */
    public static void jdkBase64(){
        BASE64Encoder encoder = new BASE64Encoder();
        String encode = encoder.encode(str.getBytes());
        System.out.println("encode: " + encode);

        BASE64Decoder decoder = new BASE64Decoder();
        try {
            byte[] bytes = decoder.decodeBuffer(encode);
            System.out.println("decode: " + new String(bytes));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * Apache commons codec 实现方式
     */
    public static void commonsCodecBase64(){
        byte[] bytes = Base64.encodeBase64(str.getBytes());
        System.out.println("encode: " + new String(bytes));

        byte[] bytes1 = Base64.decodeBase64(bytes);
        System.out.println("decode: " + new String(bytes1));
    }


    /**
     * bouncy castle 实现方式
     */
    public static void bouncyCastleBase64(){
        byte[] encode = org.bouncycastle.util.encoders.Base64.encode(str.getBytes());
        System.out.println("encode: " + new String(encode));

        byte[] decode = org.bouncycastle.util.encoders.Base64.decode(encode);
        System.out.println("decode: " + new String(decode));
    }

}
