package data;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;

@WebServlet("/XMLServlet")
public class XMLServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InputStream inputStream = null;
        try {
            String xmlFilePath = getServletContext().getRealPath("/WEB-INF/display.xml");
            System.out.println("XML file path: " + xmlFilePath);

            inputStream = getServletContext().getResourceAsStream("/WEB-INF/display.xml");
            if (inputStream == null) {
                System.err.println("File /WEB-INF/display.xml not found");
                throw new ServletException("File /WEB-INF/display.xml not found");
            }

            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            factory.setNamespaceAware(true);
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(inputStream);

            if (doc != null) {
                System.out.println("XML Document parsed successfully.");
            } else {
                System.out.println("Failed to parse XML Document.");
            }

            System.out.println("Root element: " + doc.getDocumentElement().getNodeName());

            NodeList items = doc.getElementsByTagName("item");
            if (items == null || items.getLength() == 0) {
                System.err.println("No items found in XML file");
            } else {
                System.out.println("Number of items found: " + items.getLength());
                for (int i = 0; i < items.getLength(); i++) {
                    Element item = (Element) items.item(i);
                    String name = item.getElementsByTagName("name").item(0).getTextContent();
                    String price = item.getElementsByTagName("price").item(0).getTextContent();
                    System.out.println("Item: " + name + ", Price: " + price);
                }
            }

            request.setAttribute("items", items);
            request.getRequestDispatcher("/display.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error parsing XML", e);
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}