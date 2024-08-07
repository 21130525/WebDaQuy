package controller.controllerUser.facebook;

import com.google.gson.Gson;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.json.JsonObject;
import com.restfb.types.User;
import org.apache.hc.client5.http.ClientProtocolException;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

public class RestFB {
    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String link = String.format(ConstantsFacebook.FACEBOOK_LINK_GET_TOKEN, ConstantsFacebook.FACEBOOK_APP_ID, ConstantsFacebook.FACEBOOK_APP_SECRET, ConstantsFacebook.FACEBOOK_REDIRECT_URL, code);
        String response = Request.Get(link).execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static User getUserInfo(String accessToken) {
        FacebookClient facebookClient = new DefaultFacebookClient(accessToken, ConstantsFacebook.FACEBOOK_APP_SECRET, Version.LATEST);
        return facebookClient.fetchObject("me", User.class);
    }
}
