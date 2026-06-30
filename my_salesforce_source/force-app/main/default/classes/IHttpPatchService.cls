public interface IHttpPatchService {
    //HttpResponse HttpPatch(String endpoint, String body, Map<String, String> headers);
	HttpResponse HttpPatch(HttpModal httpModal);
}