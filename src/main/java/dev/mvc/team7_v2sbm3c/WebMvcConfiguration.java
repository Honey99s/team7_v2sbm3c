package dev.mvc.team7_v2sbm3c;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import dev.mvc.car.Car;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
      // Windows: path = "C:/kd/deploy/honeycar3_blog/car/storage";
      // ▶ file:///C:/kd/deploy/honeycar3_blog/car/storage
    
      // Ubuntu: path = "/home/ubuntu/deploy/team7_v2sbm3c_blog/car/storage";
      // ▶ file:////home/ubuntu/deploy/team7_v2sbm3c_blog/car/storage
    
      // JSP 인식되는 경로: http://localhost:9093/car/storage";
      registry.addResourceHandler("/car/storage/**").addResourceLocations("file:///" +  Car.getUploadDir());
      
      // JSP 인식되는 경로: http://localhost:9093/attachfile/storage";
      // registry.addResourceHandler("/attachfile/storage/**").addResourceLocations("file:///" +  Tool.getOSPath() + "/attachfile/storage/");
      
      // JSP 인식되는 경로: http://localhost:9093/member/storage";
      // registry.addResourceHandler("/member/storage/**").addResourceLocations("file:///" +  Tool.getOSPath() + "/member/storage/");
  }
  
  @Override
  public void addCorsMappings(CorsRegistry registry) {
      registry.addMapping("/**")
              .allowedOrigins("http://localhost:3000") // React 앱의 URL
              .allowedMethods("GET", "POST", "PUT", "DELETE")
              .allowedHeaders("*")
              .allowCredentials(true);
  }
}
