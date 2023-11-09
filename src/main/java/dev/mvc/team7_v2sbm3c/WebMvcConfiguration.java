package dev.mvc.team7_v2sbm3c;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import dev.mvc.car.Car;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
      // Windows: path = "C:/kd/deploy/honeycar3_blog/car/storage";
      // ▶ file:///C:/kd/deploy/honeycar3_blog/car/storage
    
      // Ubuntu: path = "/home/ubuntu/deploy/honeycar3_blog/car/storage";
      // ▶ file:////home/ubuntu/deploy/honeycar3_blog/car/storage
    
      // JSP 인식되는 경로: http://localhost:9092/car/storage";
      registry.addResourceHandler("/car/storage/**").addResourceLocations("file:///" +  Car.getUploadDir());
      
      // JSP 인식되는 경로: http://localhost:9092/attachfile/storage";
      // registry.addResourceHandler("/attachfile/storage/**").addResourceLocations("file:///" +  Tool.getOSPath() + "/attachfile/storage/");
      
      // JSP 인식되는 경로: http://localhost:9092/member/storage";
      // registry.addResourceHandler("/member/storage/**").addResourceLocations("file:///" +  Tool.getOSPath() + "/member/storage/");
  }
}
