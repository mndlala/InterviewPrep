public class HttpDeleteService implements IHttpDeleteService {

    private HttpClientEngine engine = new HttpClientEngine();

    public HttpResponse HttpDelete(HttpModal httpModal) {
        return engine.send('DELETE', httpModal);
    }
}