package com.erdenee.ecomerce.config;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public final class CryptoUtil {

    private static final String TRANSFORMATION = "AES/GCM/NoPadding";
    private static final int IV_LENGTH = 12;
    private static final int TAG_LENGTH = 128;

    /*
     * Keep the same secret for encryption and decryption.
     * In a real application, do not publish or commit this key.
     */
    private static final String SECRET = "my-ecommerce-secret-key";

    private CryptoUtil() {
    }

    private static SecretKey getKey() {
        try {
            byte[] fullKey = MessageDigest
                    .getInstance("SHA-256")
                    .digest(SECRET.getBytes(StandardCharsets.UTF_8));

            byte[] aesKey = Arrays.copyOf(fullKey, 16);

            return new SecretKeySpec(aesKey, "AES");

        } catch (Exception e) {
            throw new RuntimeException("Could not create AES key", e);
        }
    }

    public static String encrypt(String plainText) throws RuntimeException, InvalidKeyException, InvalidAlgorithmParameterException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {
    	byte[] iv = new byte[IV_LENGTH];
        new SecureRandom().nextBytes(iv);
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        GCMParameterSpec parameterSpec = new GCMParameterSpec(TAG_LENGTH, iv);

        cipher.init(Cipher.ENCRYPT_MODE,getKey(),parameterSpec);

        byte[] encryptedBytes = cipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8));

        byte[] result = ByteBuffer.allocate(iv.length + encryptedBytes.length).put(iv).put(encryptedBytes).array();

        return Base64.getEncoder().encodeToString(result);
    
    }

    public static String decrypt(String encryptedText) throws RuntimeException, InvalidKeyException, InvalidAlgorithmParameterException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {
    	byte[] decoded = Base64
                .getDecoder()
                .decode(encryptedText);

        ByteBuffer buffer = ByteBuffer.wrap(decoded);

        byte[] iv = new byte[IV_LENGTH];
        buffer.get(iv);

        byte[] encryptedBytes =
                new byte[buffer.remaining()];

        buffer.get(encryptedBytes);

        Cipher cipher = Cipher.getInstance(TRANSFORMATION);

        GCMParameterSpec parameterSpec =
                new GCMParameterSpec(TAG_LENGTH, iv);

        cipher.init(
                Cipher.DECRYPT_MODE,
                getKey(),
                parameterSpec
        );

        byte[] decryptedBytes =
                cipher.doFinal(encryptedBytes);

        return new String(
                decryptedBytes,
                StandardCharsets.UTF_8
        );
    }
}