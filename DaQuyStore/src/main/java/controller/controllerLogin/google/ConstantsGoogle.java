package controller.controllerLogin.google;

public class ConstantsGoogle {
    public static String GOOGLE_CLIENT_ID = "148020390265-4ka22fe3kos1go2u59qgf9o335me06uu.apps.googleusercontent.com";
    //secret với client id trong maáy tai
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/AccessGoogle/login-google";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
