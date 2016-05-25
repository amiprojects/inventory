package com.kaanish.sarvlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javafx.scene.layout.Border;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.kaanish.ejb.Ejb;
import com.kaanish.model.Purchase_Product_Details;

@WebServlet("/barcode")
public class BarcodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private Ejb ejb;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("application/pdf");
		try {
			Document document = new Document();
			document.setMargins(15, 0, 10, 0);
			Rectangle rec = new Rectangle((float) (3.8 * 72),
					(float) (2.0 * 72));
			document.setPageSize(rec);
			PdfWriter wr = PdfWriter.getInstance(document,
					resp.getOutputStream());
			document.open();
			PdfContentByte cb = new PdfContentByte(wr);

			String purProdDetIdLst[] = req.getParameterValues("prodCheck");
			String qtyLst[] = req.getParameterValues("qtyProd");
			List<Purchase_Product_Details> purProdDetLst = new ArrayList<Purchase_Product_Details>();
			for (int q = 0; q < purProdDetIdLst.length; q++) {
				if (!qtyLst[q].equals(null) || !qtyLst[q].equals("")) {
					Purchase_Product_Details ppd = ejb
							.getPurchaseProductDetailsById(Integer
									.parseInt(purProdDetIdLst[q]));
					ppd.setNumberForBarcodePrint(Integer.parseInt(qtyLst[q]));
					purProdDetLst.add(ppd);
					ppd = null;
				}
			}

			String compName[] = req.getParameterValues("compname");
			for (int i = 0; i < purProdDetLst.size(); i++) {
				for (int j = 0; j < purProdDetLst.get(i)
						.getNumberForBarcodePrint(); j++) {
					document.newPage();

					// document.add(new Paragraph(compName[i]));
					// document.add(new Paragraph(purProdDetLst.get(i)
					// .getProductDetail().getUniversalCode()
					// + "     "
					// + ejb.getMRPlh(purProdDetLst.get(i).getMrp())));

					document.add(new Paragraph(new Phrase(10F, compName[i],
							FontFactory.getFont(FontFactory.TIMES, 20f))));
					document.add(new Paragraph(new Phrase(20F, purProdDetLst
							.get(i).getProductDetail().getUniversalCode()
							+ "     "
							+ ejb.getMRPlh(purProdDetLst.get(i).getMrp()),
							FontFactory.getFont(FontFactory.TIMES, 20f))));
					String code = purProdDetLst.get(i).getId() + "/"
							+ purProdDetLst.get(i).getLotNumber() + "/"
							+ purProdDetLst.get(i).getProductDetail().getCode();

					Barcode128 code128 = new Barcode128();
					code128.setBaseline(15);
					code128.setSize(17);
					// code128.setX(1.7F);
					code128.setBarHeight(50F);

					code128.setCode(code);
					code128.setCodeType(Barcode128.CODE128);
					Image code128Image = code128.createImageWithBarcode(cb,
							null, null);

					code128Image.setScaleToFitLineWhenOverflow(true);
					document.add(code128Image);

					// PdfPTable table = new PdfPTable(1);
					// // PdfPCell cellOne = new PdfPCell(code128Image);
					// // cellOne.setBorder(Rectangle.NO_BORDER);
					// table.addCell(code128Image);
					// document.add(table);
				}
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
