import java.io.DataOutputStream;
import java.net.Socket;
public class Main {
    public static void main(String[] args) {
        String serverName = "127.0.0.1"; // IP address of the server
        int port = 10020; // Port number

        try {
            System.out.println("Connecting to " + serverName + " on port " + port);
            Socket client = new Socket(serverName, port);

            System.out.println("Connected to " + client.getRemoteSocketAddress());
            DataOutputStream out = new DataOutputStream(client.getOutputStream());

            // Send the message "A" to trigger the if condition
            out.writeBytes("A,-1.5");

            client.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}