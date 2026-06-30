public class HttpClientEngine {

    public HttpResponse send(String method, HttpModal modal) {

        Http http = new Http();
        HttpRequest req = new HttpRequest();

        req.setMethod(method);
        req.setEndpoint(buildEndpoint(modal));

        if (modal.headers != null) {
            for (String key : modal.headers.keySet()) {
                req.setHeader(key, modal.headers.get(key));
            }
        }

        if (modal.body != null) {
            req.setBody(modal.body);
        }

        return http.send(req);
    }

    private String buildEndpoint(HttpModal modal) {

        if (modal.useNamedCredential == true) {
            return 'callout:' + modal.namedCredentialName + modal.endpoint;
        }

        return modal.endpoint;
    }
}