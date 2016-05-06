package com.kaanish.sarvlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/barcode")
public class BarcodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("application/pdf");
		try {
			Document document = new Document();
			document.setMargins(15, 0, 0, 0);
			Rectangle rec = new Rectangle((float) (3.8 * 72),
					(float) (2.0 * 72));
			document.setPageSize(rec);
			PdfWriter wr = PdfWriter.getInstance(document,
					resp.getOutputStream());
			document.open();
			PdfContentByte cb = new PdfContentByte(wr);

			for (int i = 0; i < 5; i++) {
				document.newPage();

				document.add(new Paragraph("Hello World"));
				document.add(new Paragraph("LAXMI"));
				String code = "198751/sad/" + i;

				Barcode128 code128 = new Barcode128();
				code128.setBaseline(15);
				code128.setSize(12);
				code128.setX(1.7F);
				code128.setBarHeight(50F);

				code128.setCode(code);
				code128.setCodeType(Barcode128.CODE128);
				Image code128Image = code128.createImageWithBarcode(cb, null,
						null);

				document.add(code128Image);
			}

			document.close();
		} catch (DocumentException de) {
			throw new IOException(de.getMessage());
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
