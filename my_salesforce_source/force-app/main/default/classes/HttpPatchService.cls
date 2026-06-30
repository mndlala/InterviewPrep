public class HttpPatchService implements IHttpPatchService {

    private HttpClientEngine engine = new HttpClientEngine();

    public HttpResponse HttpPatch(HttpModal httpModal) {
        return engine.send('PATCH', httpModal);
    }
}