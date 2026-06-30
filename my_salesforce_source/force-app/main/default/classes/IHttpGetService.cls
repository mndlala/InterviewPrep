public interface IHttpGetService {
    //HttpResponse HttpGet(String endpoint, Map<String, String> headers);
	HttpResponse HttpGet(HttpModal httpModal);
}