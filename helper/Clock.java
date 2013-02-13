import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Calendar;


public class Clock {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		if(args.length < 1) {
			System.out.println("Usage: java clock /path/to/node/ [debug]");
			System.exit(0);
		}
		nodeCode = args[0];

		if(args.length >= 2) {
			debug = true;
		}

		// weather/analogclock/clock/set:3600

                // calculate the seconds since midnight
		Calendar c = Calendar.getInstance();
		long now = c.getTimeInMillis();
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		long passed = now - c.getTimeInMillis();
		sendMessage(nodeCode+"clock/set:"+passed/1000);

	}

	private static boolean debug = false;
	private static String host = "127.0.0.1";
        private static int port = 4444;
	private static String nodeCode = "analogclock/clock/";


	private static void sendMessage(String messageIn) {
		try {
		      byte[] message = messageIn.getBytes();

		      // Get the internet address of the specified host
		      InetAddress address = InetAddress.getByName(host);

		      // Initialize a datagram packet with data and address
		      DatagramPacket packet = new DatagramPacket(message, message.length,
		          address, port);

		      // Create a datagram socket, send the packet through it, close it.
		      DatagramSocket dsocket = new DatagramSocket();

                      if(debug) {
		          System.out.println("Send message: " + messageIn);
		      }

		      dsocket.send(packet);
		      dsocket.close();
		    } catch (Exception e) {
		      System.err.println(e);
		    }
	}

}
