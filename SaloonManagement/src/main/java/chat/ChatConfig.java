package chat;

import jakarta.websocket.server.ServerEndpointConfig;
import jakarta.websocket.server.ServerEndpointConfig.Configurator;
import jakarta.websocket.server.ServerContainer;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ChatConfig implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            ServerContainer container =
                (ServerContainer) sce.getServletContext()
                .getAttribute("jakarta.websocket.server.ServerContainer");

            container.addEndpoint(ChatEndpoint.class);

            System.out.println("✅ WebSocket Registered Successfully");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
