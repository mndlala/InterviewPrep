public class HttpGetService implements IHttpGetService {

    private HttpClientEngine engine = new HttpClientEngine();

    public HttpResponse HttpGet(HttpModal httpModal) {
        return engine.send('GET', httpModal);
    }
}