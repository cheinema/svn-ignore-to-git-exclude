package de.saxsys.svn;

import java.io.InputStream;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class Transform {

    public static void main(String[] args) throws Exception {
        InputStream xsltResource = Transform.class.getResourceAsStream("ignore.xslt");

        Source xmlSource = new StreamSource(System.in);
        Source xsltSource = new StreamSource(xsltResource);

        TransformerFactory transFact = TransformerFactory.newInstance();
        Transformer trans = transFact.newTransformer(xsltSource);

        trans.transform(xmlSource, new StreamResult(System.out));

        xsltResource.close();
    }
}
