public class EndpointResolver {

    public static String resolve(Boolean useNamedCredential, String base, String path) {

        if (useNamedCredential) {
            return 'callout:' + base + path;
        }

        return base + path;
    }
}