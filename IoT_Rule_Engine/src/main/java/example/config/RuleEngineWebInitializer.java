package example.config;

        import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
        import example.web.WebConfig;

public class RuleEngineWebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[]{RootConfig.class};
    }

    //Servlet配置
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{WebConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

}