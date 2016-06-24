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
			document.setMargins(5, 5, 5, 5);
//			Rectangle rec = new Rectangle((float) (3.8 * 72),
//					(float) (2.0 * 72));
			Rectangle rec = new Rectangle((float) (3.5 * 30),
					(float) (1.8 * 30));
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

			for (int i = 0; i < purProdDetLst.size(); i++) {
				for (int j = 0; j < purProdDetLst.get(i)
						.getNumberForBarcodePrint(); j++) {
					document.newPage();
					String barcodeHeader = ejb.getCompanyInfo()
							.getBarcodeHeader();
					float price;
					if (ejb.getCompanyInfo().isMRPbarcode()) {
						price = purProdDetLst.get(i).getMrp();
					} else {
						price = purProdDetLst.get(i).getWsp();
					}

					// document.add(new Paragraph(barcodeHeader);
					// document.add(new Paragraph(purProdDetLst.get(i)
					// .getProductDetail().getUniversalCode()
					// + "     "
					// + ejb.getMRPlh(float price)));

					document.add(new Paragraph(new Phrase(7F, barcodeHeader,
							FontFactory.getFont(FontFactory.TIMES, 6f))));
					
					document.add(new Paragraph(new Phrase(5F, purProdDetLst
							.get(i).getProductDetail().getUniversalCode()
							+ "     " + ejb.getMRPlh(price), FontFactory
							.getFont(FontFactory.TIMES, 6f))));
					
					String code = purProdDetLst.get(i).getId() + "/"
							+ purProdDetLst.get(i).getLotNumber() + "/"
							+ purProdDetLst.get(i).getProductDetail().getCode();

					Barcode128 code128 = new Barcode128();
					code128.setBaseline(8);
					code128.setSize(6);
					//code128.setX(.5F);
					code128.setBarHeight(25F);

					code128.setCode(code.trim());
					code128.setCodeType(Barcode128.CODE128);
					Image code128Image = code128.createImageWithBarcode(cb,
							null, null);
					code128Image.setAbsolutePosition(5,3);
			        code128Image.scalePercent(75);

					//code128Image.setScaleToFitLineWhenOverflow(true);
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
