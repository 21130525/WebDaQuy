package service;

public class EncryptAndDencrypt {
    public String encrypt(String pass){
        return pass+"hihi";
    }
    public String decrypt(String pass){

        return  pass.substring(0, pass.length() - 4);
    }
}
