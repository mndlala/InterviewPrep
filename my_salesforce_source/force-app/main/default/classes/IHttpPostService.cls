public interface IHttpPostService {
    //HttpResponse HttpPost(String endpoint, String body, Map<String, String> headers);
	HttpResponse HttpPost(HttpModal httpModal);
}