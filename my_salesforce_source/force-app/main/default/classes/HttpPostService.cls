public class HttpPostService implements IHttpPostService {

    private HttpClientEngine engine = new HttpClientEngine();

    public HttpResponse HttpPost(HttpModal httpModal) {
        return engine.send('POST', httpModal);
    }
}