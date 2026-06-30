public interface IHttpDeleteService {
    //HttpResponse HttpDelete(String endpoint, Map<String, String> headers);
    HttpResponse HttpDelete(HttpModal httpModal);
}