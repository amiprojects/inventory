package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.json.stream.JsonGeneratorFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.AccountDetails;
import com.kaanish.model.City;
import com.kaanish.model.CompanyInfo;
import com.kaanish.model.Country;
import com.kaanish.model.CustomerEntry;
import com.kaanish.model.Department;
import com.kaanish.model.JobAssignmentProducts;
import com.kaanish.model.JobClass;
import com.kaanish.model.JobPlan;
import com.kaanish.model.JobPlanProducts;
import com.kaanish.model.JobsForDesignCostSheet;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.PaymentDetailsForViaAgents;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.ProductImage;
import com.kaanish.model.ProductsForDesignCostSheet;
import com.kaanish.model.PurchaseReturn;
import com.kaanish.model.PurchaseReturnProductDetails;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.Purchase_Product_Details;
import com.kaanish.model.QtyUnit;
import com.kaanish.model.QtyUnitConversionPK;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.RawMaterialsStock;
import com.kaanish.model.ReadyGoodsStock;
import com.kaanish.model.SalesEntry;
import com.kaanish.model.SalesProductDetails;
import com.kaanish.model.SalesProductReturnDetail;
import com.kaanish.model.SalesReturn;
import com.kaanish.model.SampleDesignCostSheet;
import com.kaanish.model.State;
import com.kaanish.model.Stoct;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Vendor;
import com.kaanish.model.VoucherAssign;
import com.kaanish.model.VoucherDetails;
import com.kaanish.model.VoucherDetailsForViaAgents;
import com.kaanish.util.Base64;
import com.kaanish.util.DateConverter;
import com.kaanish.util.DepartmentCotractor;

@WebServlet({
		"/getcountry",
		"/addNewUOMtype",
		"/getUOMtype",
		"/getAllDepartments",
		"/getProductByDescription",
		"/getStateByCountry",
		"/getStateByCountryByStateName",
		"/getCity",
		"/getCityByName",
		"/getQtyUnit",
		"/getQtyUnitConversion",
		"/getVendorByVendorType",
		"/getQtyConversion",
		"/getVendorByVendorId",
		"/getAccountByVendorId",
		"/getTaxGroupById",
		"/getproductPro",
		"/getPurchasebyPro",
		"/getAccountDetails",
		"/getProductDetailById",
		"/getCategoryById",
		"/getProductImageByProductid",
		"/getJobberDetailsByName",
		"/getProdDetByPurchaseProdDetailsId",
		"/getStateByCityName",
		"/getAllQtyUnitByNameOrAbv",
		"/getAgentDetails",
		"/getCityByStateByCityName",
		"/getVendorTypeById",
		"/getProductbyProductCode",
		"/getSaleblePurchaseProductDetailsByProductCodeAndQuantity",
		"/getVendorsByVendorTypeJobberAndName",
		"/getProductsForSaleByCode",
		"/deleteUOM",
		"/getVendorsByVendorTypeSalesAgentAndName",
		"/getSalesAgentDetailsById",
		"/getPurchaseProductDetailsByIdForSale",
		"/getCustomerByPh",
		"/checkPcode",
		"/addVendorbyjson",
		"/addAgen",
		"/getVendorByType",
		"/addUOMjson",
		"/getuomByType",
		"/getDeptjson",
		"/getSubByDepjson",
		"/getCatBySubjson",
		"/addJsonCity",
		"/addJsonState",
		"/addJsonCountry",
		"/productSumaryJson",
		"/getVendorsByNameAndType",
		"/getVendorsByVendorTypeVendorAndName",
		"/getVendorsByVendorTypePurchaseAgentAndName",
		"/getCustomerByName",
		"/getCriticalStock",
		"/getSampleDesignCostSheetByDesignNumber",
		"/getProductDetailsByDesignNumberAndQuantity",
		"/getPurchaseProductDetailsByProductCode",
		"/getJobsForDesignCostSheetByProductSForSampleId",
		"/getProductImagejson",
		"/getPlannedSampleDesignCostSheetByDesignNumber",
		"/getAllOngoingJobPlanByDesignNumber",
		"/getProductAndDesignDetailsAndJobPlanByJobPlanId",
		"/getJobsForDesignCostSheetByPlanId",
		"/getOngoingJobAssignmentsByPlanId",
		"/getJonsonDateFinancial",
		"/getVendorsByVendorTypeDesignerAndName",
		"/getDesignImageBySampleJobId",
		"/getPlanNumbersById",
		"/updatePurchaseEntry",
		"/updatePurchaseproduct",
		"/getAllJobPlanByDesignNumber",
		"/getAllJobPlans",
		"/setPurchaseProduct",
		"/getSampleDesignCostSheetByDesignNumberForDuplicateCheck",
		"/getItmProductsForSampleByProductIdAndProductForDesignId",
		"/getJobPlanProductsByPlanId",
		"/getAllDesignNoFromSampleDesignCostSheetAndProductsByDesignNumberForDuplicateCheck",
		"/getProductDetailByDesignNumber",
		"/isExistProductDetailByDesignNumber",
		"/getPurchaseProductDetailsByLotNumber",
		"/getPaymentDetailsByJobAssignId",
		"/getAllVoucherDetailsByJobAssignId", "/getCustomerById", "/testcase",
		"/testcase1", "/getLastPurchaseProductDetailsByProductId",
		"/getProductByCategory", "/getAllCategoryByCategoryName",
		"/getProductByDesignNo", "/validity", "/updateSalesproduct",
		"/updateSalesEntry", "/getCurrentDebitNoteByCustomerId",
		"/getCurrentCreditNoteByVendorId",
		"/getPaymentDetails4ViaAgentBySalesEntryId",
		"/getAllVoucherDetails4ViaAgentBySalesEntryId",
		"/getCurrentCreditNote4ViaAgentByAgentId",
		"/getAllVoucherDetails4ViaAgentByPurchaseEntryId",
		"/getPaymentDetails4ViaAgentByPurchaseEntryId" })
public class JsonServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;
	private QtyUnitType qtyUnitType;
	private PrintWriter pw;
	private String name;
	private Purchase_Entry purchase_Entry;
	private VoucherDetailsForViaAgents voucherDetForViaAgent;
	private PaymentDetailsForViaAgents payDetForViaAgent;
	private VoucherAssign voucherAssign;
	private CustomerEntry customerEntry;
	private VoucherDetails voucherDetails;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		resp.setContentType("application/json; charset=utf-8");
		HttpSession httpSession = req.getSession();

		try {
			switch (url) {
			case "getcountry":
				pw = resp.getWriter();
				pw.print(ejb.getCountryByName(req.getParameter("term")));
				break;

			case "addNewUOMtype":
				pw = new PrintWriter(resp.getOutputStream());
				JsonGeneratorFactory factory = Json
						.createGeneratorFactory(null);
				JsonGenerator gen = factory.createGenerator(pw);
				qtyUnitType = new QtyUnitType();
				name = req.getParameter("typeName");
				int flag = 0;
				for (QtyUnitType qut : ejb.getAllQtyUnitTypes()) {
					if (qut.getName().equalsIgnoreCase(name)) {
						flag = 1;
						break;
					}
				}
				if (flag == 0) {
					qtyUnitType.setName(name);
					ejb.setQtyUnitType(qtyUnitType);
					gen.writeStartObject().write("response", "success")
							.writeEnd().close();
				} else {
					gen.writeStartObject().write("response", "already exist")
							.writeEnd().close();
				}
				break;

			case "getJonsonDateFinancial":
				JsonGeneratorFactory factoryf = Json
						.createGeneratorFactory(null);
				JsonGenerator genf = factoryf.createGenerator(resp
						.getOutputStream());
				genf.writeStartObject()
						.write("finantialYear",
								ejb.getFinancialYearByDate(req
										.getParameter("date")))
						.write("lastChallanNo",
								ejb.getLastPurchaseChallanNumberByFinantialYr(ejb
										.getFinancialYearByDate(req
												.getParameter("date"))))
						.writeEnd().close();
				break;

			case "getItmProductsForSampleByProductIdAndProductForDesignId":
				resp.getWriter()
						.print(ejb
								.getItmProductsForSampleByProductIdAndProductForDesignId(
										Integer.parseInt(req
												.getParameter("pId")),
										Integer.parseInt(req
												.getParameter("pdcsId"))));
				break;

			case "getProductDetailByDesignNumber":
				resp.getWriter().print(
						ejb.getProductDetailByDesignNumber(req
								.getParameter("dNo")));
				break;

			case "isExistProductDetailByDesignNumber":
				JsonGeneratorFactory factoryIE = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorIE = factoryIE.createGenerator(resp
						.getOutputStream());
				generatorIE
						.writeStartObject()
						.write("isExist",
								ejb.isExistProductDetailByDesignNumber(req
										.getParameter("dNo"))).writeEnd()
						.close();
				break;

			case "getUOMtype":
				pw = resp.getWriter();
				pw.print(ejb.getAllQtyUnitTypes());
				break;
			case "getAllDepartments":
				pw = resp.getWriter();
				name = req.getParameter("name");
				List<DepartmentCotractor> lst = new ArrayList<>();
				DepartmentCotractor cotractor;
				for (Department d : ejb.getAllDepartmentsByName(name)) {
					cotractor = new DepartmentCotractor();
					cotractor.setId(d.getId());
					cotractor.setName(d.getName() + "(Department)");
					cotractor.setpName("");
					cotractor.setStatus(1);
					lst.add(cotractor);
				}
				for (SubDepartment d : ejb.getAllSubDepartmentsByName(name)) {
					cotractor = new DepartmentCotractor();
					cotractor.setId(d.getId());
					cotractor.setName(d.getName() + "(Sub-Department)");
					cotractor.setpName(d.getDepartment().getName());
					cotractor.setStatus(2);
					lst.add(cotractor);
				}

				pw.print(lst);
				break;

			case "getStateByCountry":
				pw = resp.getWriter();
				pw.print(ejb.getAllStatesByCountryId(Integer.parseInt(req
						.getParameter("id"))));
				break;

			case "getVendorByVendorType":
				pw = resp.getWriter();
				pw.print(ejb.getVendorsByVendorTypeIdByName(
						Integer.parseInt(req.getParameter("id")),
						req.getParameter("term")));
				break;

			case "getVendorTypeById":
				resp.getWriter().print(
						ejb.getVendorTypeById(Integer.parseInt(req
								.getParameter("id"))));
				break;

			case "getPlanNumbersById":
				resp.getWriter().print(
						ejb.getJobPlanById(Integer.parseInt(req
								.getParameter("id"))));
				break;

			case "getVendorsByVendorTypeJobberAndName":
				resp.getWriter().print(
						ejb.getVendorsByVendorTypeJobberAndName(req
								.getParameter("name")));
				break;
			case "getVendorsByVendorTypeDesignerAndName":
				resp.getWriter().print(
						ejb.getVendorsByVendorTypeDesignerAndName(req
								.getParameter("name")));
				break;
			case "getVendorsByVendorTypeVendorAndName":
				resp.getWriter().print(
						ejb.getVendorsByVendorTypeVendorAndName(req
								.getParameter("name")));
				break;
			case "getVendorsByVendorTypePurchaseAgentAndName":
				resp.getWriter().print(
						ejb.getVendorsByVendorTypePurchaseAgentAndName(req
								.getParameter("name")));
				break;
			case "getVendorsByVendorTypeSalesAgentAndName":
				resp.getWriter().print(
						ejb.getVendorsByVendorTypeSalesAgentAndName(req
								.getParameter("name")));
				break;

			case "getSalesAgentDetailsById":
				resp.getWriter().print(
						ejb.getVendorById(Integer.parseInt(req
								.getParameter("id"))));
				break;

			case "getAccountDetails":
				resp.getWriter().print(
						ejb.getAccountDetailsByVendorId(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getTaxGroupById":
				resp.getWriter().print(
						ejb.getTax_Type_GroupById(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getProductDetailById":
				resp.getWriter().print(
						ejb.getProductDetailsById(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getJobberDetailsByName":
				resp.getWriter().print(
						ejb.getVendorById(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getProdDetByPurchaseProdDetailsId":
				resp.getWriter().print(
						ejb.getPurchaseProductDetailsById(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getCategoryById":
				resp.getWriter().print(
						ejb.getCategoryById(Integer.parseInt(req
								.getParameter("id"))));
				break;

			case "getAgentDetails":
				resp.getWriter().print(
						ejb.getVendorById(Integer.parseInt(req
								.getParameter("id"))));
				break;

			case "getVendorByVendorId":
				resp.getWriter().print(
						ejb.getVendorById(Integer.parseInt(req
								.getParameter("id"))));
				break;

			case "getCustomerById":
				resp.getWriter().print(
						ejb.getCustomerEntryById(Integer.parseInt(req
								.getParameter("id"))));
				break;

			case "getAccountByVendorId":
				resp.getWriter().print(
						ejb.getAccountDetailsByVendorId(Integer.parseInt(req
								.getParameter("id"))));
				;
				break;

			case "getStateByCountryByStateName":
				pw = resp.getWriter();
				pw.print(ejb.getStateByName(req.getParameter("name"),
						Integer.parseInt(req.getParameter("cid"))));
				break;

			case "getCityByStateByCityName":
				pw = resp.getWriter();
				pw.print(ejb.getCityByNameAjax(req.getParameter("name1"),
						Integer.parseInt(req.getParameter("cid1"))));
				break;

			case "getCity":
				pw = resp.getWriter();
				pw.print(ejb.getCityByState(Integer.parseInt(req
						.getParameter("id"))));
				break;

			case "getCityByName":
				pw = resp.getWriter();
				pw.print(ejb.getCityByName(req.getParameter("name")));
				break;
			case "getCustomerByPh":
				pw = resp.getWriter();
				pw.print(ejb.getCustomerByPh(req.getParameter("ph")));
				break;

			case "getCustomerByName":
				pw = resp.getWriter();
				pw.print(ejb.getCustomerByName(req.getParameter("name")));
				break;

			case "getCurrentDebitNoteByCustomerId":
				JsonGeneratorFactory factoryCDN = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorCDN = factoryCDN.createGenerator(resp
						.getOutputStream());
				// voucherDetails =
				// ejb.getLastVoucherDetailsByCustomerId(Integer
				// .parseInt(req.getParameter("id")));
				// generatorCDN
				// .writeStartObject()
				// .write("vdId", voucherDetails.getId())
				// .write("currentDebitNote",
				// voucherDetails.getTotalDebitNote()).writeEnd();
				voucherDetails = ejb.getLastVoucherDetailsByCustomerId(Integer
						.parseInt(req.getParameter("id")));
				if (voucherDetails == null) {
					generatorCDN.writeStartObject()
							.write("currentDebitNote", 0).writeEnd();
				} else {
					generatorCDN
							.writeStartObject()
							.write("vdId", voucherDetails.getId())
							.write("currentDebitNote",
									ejb.getCurrentDebitNoteByCustomerId(Integer
											.parseInt(req.getParameter("id"))))
							.writeEnd();
				}
				generatorCDN.close();
				break;

			case "getCurrentCreditNoteByVendorId":
				JsonGeneratorFactory factoryVDN = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorVDN = factoryVDN.createGenerator(resp
						.getOutputStream());
				// voucherDetails = ejb.getLastVoucherDetailsByVendorId(Integer
				// .parseInt(req.getParameter("id")));
				// if (voucherDetails != null) {
				// generatorVDN
				// .writeStartObject()
				// .write("currentCreditNote",
				// voucherDetails.getTotalCreditNote())
				// .writeEnd();
				// } else {
				// generatorVDN.writeStartObject()
				// .write("currentCreditNote", 0).writeEnd();
				// }
				generatorVDN
						.writeStartObject()
						.write("currentCreditNote",
								ejb.getCurrentCreditNoteByVendorId(Integer
										.parseInt(req.getParameter("id"))))
						.writeEnd();
				generatorVDN.close();
				break;

			case "getCurrentCreditNote4ViaAgentByAgentId":
				JsonGeneratorFactory factory4VA = Json
						.createGeneratorFactory(null);
				JsonGenerator generator4VA = factory4VA.createGenerator(resp
						.getOutputStream());
				generator4VA
						.writeStartObject()
						.write("currentCreditNote",
								ejb.getCurrentCreditNote4ViaAgentByAgentId(Integer
										.parseInt(req.getParameter("id"))))
						.writeEnd();
				generator4VA.close();
				break;

			case "getSaleblePurchaseProductDetailsByProductCodeAndQuantity":
				pw = resp.getWriter();
				pw.print(ejb
						.getSaleblePurchaseProductDetailsByProductCodeAndQuantity(
								req.getParameter("code"),
								DateConverter.getDate(req.getParameter("date"))));
				break;

			case "getPurchaseProductDetailsByProductCode":
				pw = resp.getWriter();
				pw.print(ejb.getPurchaseProductDetailsByProductCode(
						req.getParameter("code"),
						DateConverter.getDate(req.getParameter("date"))));
				break;

			case "getProductbyProductCode":
				pw = resp.getWriter();
				pw.print(ejb.getAllProductByProductCode(req
						.getParameter("code")));
				break;

			case "getProductDetailsByDesignNumberAndQuantity":
				JsonGeneratorFactory factory3 = Json
						.createGeneratorFactory(null);
				JsonGenerator generator3 = factory3.createGenerator(resp
						.getOutputStream());
				generator3.writeStartArray();
				for (ProductsForDesignCostSheet pdcs : ejb
						.getSampleDesignCostSheetById(
								Integer.parseInt(req.getParameter("did")))
						.getProductsForDesignCostSheets()) {
					generator3
							.writeStartObject()
							.write("ProductCode",
									pdcs.getProductDetail().getCode())
							.write("ProductId", pdcs.getProductDetail().getId())
							.write("ProductDesc",
									pdcs.getProductDetail().getDescription())
							.write("ProductUOMid",
									pdcs.getProductDetail().getQtyUnit()
											.getId())
							.write("ProductUOMName",
									pdcs.getProductDetail().getQtyUnit()
											.getName())
							.write("ProductRemainingQty",
									pdcs.getProductDetail().isRaw() ? pdcs
											.getProductDetail()
											.getRawMaterialsStock()
											.getRemainingQty() : pdcs
											.getProductDetail()
											.getReadyGoodsStock()
											.getRemainingQty())
							.write("ProductQtyForSample", pdcs.getQty())
							.write("ProductRateForSample", pdcs.getRate())
							.write("ProductAmountForSample", pdcs.getAmmount())
							.write("ProductForSampleId", pdcs.getId())
							.write("itemId",
									ejb.getItmProductsForSampleByProductIdAndProductForDesignId(
											pdcs.getProductDetail().getId(),
											pdcs.getId()).getItemDetails()
											.getId())
							.write("itemNm",
									ejb.getItmProductsForSampleByProductIdAndProductForDesignId(
											pdcs.getProductDetail().getId(),
											pdcs.getId()).getItemDetails()
											.getName()).writeEnd();
				}
				generator3.writeEnd().close();
				break;

			case "getProductAndDesignDetailsAndJobPlanByJobPlanId":
				JsonGeneratorFactory factoryM = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorM = factoryM.createGenerator(resp
						.getOutputStream());
				generatorM.writeStartArray();
				for (ProductsForDesignCostSheet pdcs : ejb
						.getJobPlanById(
								Integer.parseInt(req.getParameter("pId")))
						.getDesignCostSheet().getProductsForDesignCostSheets()) {
					if (ejb.getJobAssignmentProductDetailsByproductAndJobPlanId(
							pdcs.getProductDetail().getId(),
							Integer.parseInt(req.getParameter("pId"))) != null) {
						generatorM
								.writeStartObject()
								.write("ProductCode",
										pdcs.getProductDetail().getCode())
								.write("ProductId",
										pdcs.getProductDetail().getId())
								.write("ProductDesc",
										pdcs.getProductDetail()
												.getDescription())
								.write("ProductUOMid",
										pdcs.getProductDetail().getQtyUnit()
												.getId())
								.write("ProductUOMName",
										pdcs.getProductDetail().getQtyUnit()
												.getName())
								.write("ProductRemainingQty",
										pdcs.getProductDetail().isRaw() ? pdcs
												.getProductDetail()
												.getRawMaterialsStock()
												.getRemainingQty() : pdcs
												.getProductDetail()
												.getReadyGoodsStock()
												.getRemainingQty())

								.write("DesignNo",
										pdcs.getSampleDesignCostSheet()
												.getDesignNumber())

								.write("JobAssignmentId",
										ejb.getJobAssignmentProductDetailsByproductAndJobPlanId(
												pdcs.getProductDetail().getId(),
												Integer.parseInt(req
														.getParameter("pId")))
												.getJobAssignmentDetails()
												.getId())
								.write("ProductTotalAmount",
										ejb.getJobAssignmentProductDetailsByproductAndJobPlanId(
												pdcs.getProductDetail().getId(),
												Integer.parseInt(req
														.getParameter("pId")))
												.getEstimatedCost())
								.write("japRemQty",
										ejb.getJobAssignmentProductDetailsByproductAndJobPlanId(
												pdcs.getProductDetail().getId(),
												Integer.parseInt(req
														.getParameter("pId")))
												.getRemaninQty())
								.write("japId",
										ejb.getJobAssignmentProductDetailsByproductAndJobPlanId(
												pdcs.getProductDetail().getId(),
												Integer.parseInt(req
														.getParameter("pId")))
												.getId())
								.write("japYesOrNo", "yes")
								.write("jobCycle",
										ejb.getJobAssignmentProductDetailsByproductAndJobPlanId(
												pdcs.getProductDetail().getId(),
												Integer.parseInt(req
														.getParameter("pId")))
												.getJobPlanProducts()
												.getJobCycle())

								.write("IsComplete",
										ejb.getJobAssignmentProductDetailsByproductAndJobPlanId(
												pdcs.getProductDetail().getId(),
												Integer.parseInt(req
														.getParameter("pId")))
												.getJobPlanProducts()
												.isComplete())

								.write("ProductQtyForSample", pdcs.getQty())
								.write("ProductRateForSample", pdcs.getRate())
								.write("ProductAmountForSample",
										pdcs.getAmmount())
								.write("ProductForSampleId", pdcs.getId())
								.writeEnd();
					} else {
						generatorM
								.writeStartObject()
								.write("ProductCode",
										pdcs.getProductDetail().getCode())
								.write("ProductId",
										pdcs.getProductDetail().getId())
								.write("ProductDesc",
										pdcs.getProductDetail()
												.getDescription())
								.write("ProductUOMid",
										pdcs.getProductDetail().getQtyUnit()
												.getId())
								.write("ProductUOMName",
										pdcs.getProductDetail().getQtyUnit()
												.getName())
								.write("ProductRemainingQty",
										pdcs.getProductDetail().isRaw() ? pdcs
												.getProductDetail()
												.getRawMaterialsStock()
												.getRemainingQty() : pdcs
												.getProductDetail()
												.getReadyGoodsStock()
												.getRemainingQty())

								.write("DesignNo",
										pdcs.getSampleDesignCostSheet()
												.getDesignNumber())

								.write("JobAssignmentId",
										ejb.getOngoingJobAssignmentsByPlanId(
												Integer.parseInt(req
														.getParameter("pId")))
												.getId())
								.write("ProductTotalAmount",
										ejb.getTotalProductCostInJobPlanProductStockBySampleProductIdAndPlanId(
												pdcs.getId(),
												Integer.parseInt(req
														.getParameter("pId"))))
								.write("japYesOrNo", "no")
								.write("jobCycle", 0)

								.write("ProductQtyForSample", pdcs.getQty())
								.write("ProductRateForSample", pdcs.getRate())
								.write("ProductAmountForSample",
										pdcs.getAmmount())
								.write("ProductForSampleId", pdcs.getId())
								.writeEnd();
					}
				}
				generatorM.writeEnd().close();
				break;

			case "getJobsForDesignCostSheetByPlanId":
				JsonGeneratorFactory factoryJ = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorJ = factoryJ.createGenerator(resp
						.getOutputStream());
				generatorJ.writeStartArray();
				for (JobsForDesignCostSheet jdcs : ejb
						.getProductsForDesignCostSheetById(
								Integer.parseInt(req.getParameter("pid")))
						.getJobsForDesignCostSheets()) {
					if (!req.getParameter("japId").equals("0")) {
						if (ejb.getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
								Integer.parseInt(req.getParameter("japId")),
								jdcs.getId()) != null) {
							if (ejb.getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
									Integer.parseInt(req.getParameter("japId")),
									jdcs.getId()).getJobPlanJobStock()
									.isComplete()) {
								generatorJ
										.writeStartObject()
										.write("JobId", jdcs.getId())
										.write("JobName",
												jdcs.getJobTypes().getJobName())
										.write("JobRateOfSample",
												jdcs.getRate())
										.write("JobQtyOfSample", jdcs.getQty())
										.write("JobUOMOfSample",
												jdcs.getQtyUnit().getName())
										.write("JobAmountOfSample",
												jdcs.getAmmount())
										.write("Status", "Completed")

										.write("RemQty", "NA")
										.write("PresentRate",
												ejb.getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
														Integer.parseInt(req
																.getParameter("japId")),
														jdcs.getId()).getRate())
										.write("AssignQty", "NA")
										.write("Amount", "NA")
										.write("EstSubDate", "NA").writeEnd();
							} else {
								if (ejb.getJobAssignmentProductById(
										Integer.parseInt(req
												.getParameter("japId")))
										.getRemaninQty() > 0
										&& ejb.getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
												Integer.parseInt(req
														.getParameter("japId")),
												jdcs.getId()) != null) {
									generatorJ
											.writeStartObject()
											.write("JobId", jdcs.getId())
											.write("JobName",
													jdcs.getJobTypes()
															.getJobName())
											.write("JobRateOfSample",
													jdcs.getRate())
											.write("JobQtyOfSample",
													jdcs.getQty())
											.write("JobUOMOfSample",
													jdcs.getQtyUnit().getName())
											.write("JobAmountOfSample",
													jdcs.getAmmount())
											.write("Status", "Assigned")

											.write("PresentRate",
													ejb.getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
															Integer.parseInt(req
																	.getParameter("japId")),
															jdcs.getId())
															.getRate())
											.write("AssignQty",
													ejb.getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
															Integer.parseInt(req
																	.getParameter("japId")),
															jdcs.getId())
															.getQty())
											.write("Amount",
													ejb.getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
															Integer.parseInt(req
																	.getParameter("japId")),
															jdcs.getId())
															.getAmmount())
											.write("EstSubDate",
													ejb.getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
															Integer.parseInt(req
																	.getParameter("japId")),
															jdcs.getId())
															.getEstimatedCompletionDate()
															.toString())
											.writeEnd();
								} else {
									generatorJ
											.writeStartObject()
											.write("JobId", jdcs.getId())
											.write("JobName",
													jdcs.getJobTypes()
															.getJobName())
											.write("JobRateOfSample",
													jdcs.getRate())
											.write("JobQtyOfSample",
													jdcs.getQty())
											.write("JobUOMOfSample",
													jdcs.getQtyUnit().getName())
											.write("JobAmountOfSample",
													jdcs.getAmmount())
											.write("Status", "Not Completed")

											.write("PresentRate",
													ejb.getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
															Integer.parseInt(req
																	.getParameter("japId")),
															jdcs.getId())
															.getRate())
											.write("AssignQty", "NA")
											.write("Amount", "NA")
											.write("EstSubDate", "NA")
											.writeEnd();
								}
							}
						} else {
							if (ejb.getJobAssignmentJobDetailsByPlanIdAndJobsForDesignCostSheetId(
									Integer.parseInt(req.getParameter("planId")),
									jdcs.getId()) != null) {
								generatorJ
										.writeStartObject()
										.write("JobId", jdcs.getId())
										.write("JobName",
												jdcs.getJobTypes().getJobName())
										.write("JobRateOfSample",
												jdcs.getRate())
										.write("JobQtyOfSample", jdcs.getQty())
										.write("JobUOMOfSample",
												jdcs.getQtyUnit().getName())
										.write("JobAmountOfSample",
												jdcs.getAmmount())
										.write("Status", "Not Completed")

										.write("PresentRate",
												ejb.getJobAssignmentJobDetailsByPlanIdAndJobsForDesignCostSheetId(
														Integer.parseInt(req
																.getParameter("planId")),
														jdcs.getId()).getRate())
										.write("AssignQty", "NA")
										.write("Amount", "NA")
										.write("EstSubDate", "NA").writeEnd();
							} else {
								generatorJ
										.writeStartObject()
										.write("JobId", jdcs.getId())
										.write("JobName",
												jdcs.getJobTypes().getJobName())
										.write("JobRateOfSample",
												jdcs.getRate())
										.write("JobQtyOfSample", jdcs.getQty())
										.write("JobUOMOfSample",
												jdcs.getQtyUnit().getName())
										.write("JobAmountOfSample",
												jdcs.getAmmount())
										.write("Status", "Not Assigned")

										.write("RemQty", jdcs.getQty())
										.write("PresentRate", "NA")
										.write("AssignQty", "NA")
										.write("Amount", "NA")
										.write("EstSubDate", "NA").writeEnd();
							}
						}
					} else {
						generatorJ
								.writeStartObject()
								.write("JobId", jdcs.getId())
								.write("JobName",
										jdcs.getJobTypes().getJobName())
								.write("JobRateOfSample", jdcs.getRate())
								.write("JobQtyOfSample", jdcs.getQty())
								.write("JobUOMOfSample",
										jdcs.getQtyUnit().getName())
								.write("JobAmountOfSample", jdcs.getAmmount())
								.write("Status", "Not Assigned")

								.write("RemQty", jdcs.getQty())
								.write("PresentRate", "NA")
								.write("AssignQty", "NA").write("Amount", "NA")
								.write("EstSubDate", "NA").writeEnd();
					}
				}
				generatorJ.writeEnd().close();
				break;

			case "getJobsForDesignCostSheetByProductSForSampleId":
				JsonGeneratorFactory factory4 = Json
						.createGeneratorFactory(null);
				JsonGenerator generator4 = factory4.createGenerator(resp
						.getOutputStream());
				generator4.writeStartArray();
				for (JobsForDesignCostSheet jdcs : ejb
						.getProductsForDesignCostSheetById(
								Integer.parseInt(req.getParameter("pid")))
						.getJobsForDesignCostSheets()) {
					generator4
							.writeStartObject()
							.write("JobId", jdcs.getId())
							.write("JobName", jdcs.getJobTypes().getJobName())
							.write("JobRateOfSample", jdcs.getRate())
							.write("JobQtyOfSample", jdcs.getQty())
							.write("JobUOMOfSample",
									jdcs.getQtyUnit().getName())
							.write("JobAmountOfSample", jdcs.getAmmount())
							.writeEnd();
				}
				generator4.writeEnd().close();
				break;

			case "getOngoingJobAssignmentsByPlanId":
				JsonGeneratorFactory factoryJA = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorJA = factoryJA.createGenerator(resp
						.getOutputStream());
				generatorJA.writeStartArray();
				for (JobAssignmentProducts jap : ejb
						.getOngoingJobAssignmentsByPlanId(
								Integer.parseInt(req.getParameter("pid")))
						.getJobAssignmentProducts()) {
					generatorJA.writeStartObject().write("japId", jap.getId())
							.writeEnd();
				}
				generatorJA.writeEnd().close();
				break;

			case "getPaymentDetailsByJobAssignId":
				JsonGeneratorFactory factoryPD = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorPD = factoryPD.createGenerator(resp
						.getOutputStream());
				generatorPD.writeStartArray();
				for (PaymentDetails pd : ejb
						.getPaymentDetailsByJobAssignId(Integer.parseInt(req
								.getParameter("id")))) {
					String desc;
					String pType;
					if (pd.getDescription() != null) {
						desc = pd.getDescription();
					} else {
						desc = "NA";
					}
					if (pd.getPaymentType() != null) {
						pType = pd.getPaymentType().getType();
					} else {
						pType = "NA";
					}
					generatorPD
							.writeStartObject()
							.write("paymentId", pd.getId())
							.write("paymentDescription", desc)
							.write("paymentAmount", pd.getPaidAmount())
							.write("paymentDate",
									pd.getPaymentDate().toString())
							.write("payTotalAmount", pd.getTotalAmount())
							.write("paymentStatus",
									pd.getPaymentStatus().getStatus())
							.write("paymentMethod", pType).writeEnd();
				}
				generatorPD.writeEnd().close();
				break;

			case "getPaymentDetails4ViaAgentBySalesEntryId":
				JsonGeneratorFactory factoryPD4VA = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorPD4VA = factoryPD4VA
						.createGenerator(resp.getOutputStream());
				generatorPD4VA.writeStartArray();
				for (PaymentDetailsForViaAgents pd : ejb
						.getPaymentDetails4ViaAgentBySalesEntryId(Integer
								.parseInt(req.getParameter("id")))) {
					String desc;
					String pType;
					if (pd.getDescription() != null) {
						desc = pd.getDescription();
					} else {
						desc = "NA";
					}
					if (pd.getPaymentTypeId() != 0) {
						if (pd.getSalesReturnId() != 0) {
							pType = ejb.getPaymentTypeById(
									pd.getPaymentTypeId()).getType()
									+ " (Return Value)";
						} else {
							pType = ejb.getPaymentTypeById(
									pd.getPaymentTypeId()).getType();
						}
					} else {
						pType = "NA";
					}
					generatorPD4VA
							.writeStartObject()
							.write("paymentId", pd.getId())
							.write("paymentDescription", desc)
							.write("paymentAmount", pd.getPaidAmount())
							.write("paymentDate",
									pd.getPaymentDate().toString())
							.write("paymentStatus",
									ejb.getPaymentStatusById(
											pd.getPaymentStatusId())
											.getStatus())
							.write("paymentMethod", pType).writeEnd();
				}
				generatorPD4VA.writeEnd().close();
				break;

			case "getPaymentDetails4ViaAgentByPurchaseEntryId":
				JsonGeneratorFactory factoryPDPE = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorPDPE = factoryPDPE.createGenerator(resp
						.getOutputStream());
				generatorPDPE.writeStartArray();
				for (PaymentDetailsForViaAgents pd : ejb
						.getPaymentDetails4ViaAgentByPurchaseEntryId(Integer
								.parseInt(req.getParameter("id")))) {
					String desc;
					String pType;
					if (pd.getDescription() != null) {
						desc = pd.getDescription();
					} else {
						desc = "NA";
					}
					if (pd.getPaymentTypeId() != 0) {
						if (pd.getPurchaseReturnId() != 0) {
							pType = ejb.getPaymentTypeById(
									pd.getPaymentTypeId()).getType()
									+ " (Return Value)";
						} else {
							pType = ejb.getPaymentTypeById(
									pd.getPaymentTypeId()).getType();
						}
					} else {
						pType = "NA";
					}
					generatorPDPE
							.writeStartObject()
							.write("paymentId", pd.getId())
							.write("paymentDescription", desc)
							.write("paymentAmount", pd.getPaidAmount())
							.write("paymentDate",
									pd.getPaymentDate().toString())
							.write("paymentStatus",
									ejb.getPaymentStatusById(
											pd.getPaymentStatusId())
											.getStatus())
							.write("paymentMethod", pType).writeEnd();
				}
				generatorPDPE.writeEnd().close();
				break;

			case "getJobPlanProductsByPlanId":
				JsonGeneratorFactory factoryJPP = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorJPP = factoryJPP.createGenerator(resp
						.getOutputStream());
				generatorJPP.writeStartArray();
				for (JobPlanProducts jpp : ejb
						.getJobPlanProductsByPlanId(Integer.parseInt(req
								.getParameter("pId")))) {
					generatorJPP.writeStartObject()
							.write("jppQty", jpp.getQty())
							.write("jppRemQty", jpp.getRemainingQty())
							.writeEnd();
				}
				generatorJPP.writeEnd().close();
				break;

			case "getProductByDescription":
				pw = resp.getWriter();
				pw.print(ejb.getAllProductByProductDescription(req
						.getParameter("descriptionName")));
				break;
			case "getProductByCategory":
				pw = resp.getWriter();
				pw.print(ejb.getAllProductByCategory(req.getParameter("cat")));
				break;
			case "getQtyUnit":
				pw = resp.getWriter();
				pw.print(ejb.getQtyUnitById(Integer.parseInt(req
						.getParameter("id"))));
				break;
			case "getproductPro":
				pw = resp.getWriter();
				pw.print(ejb.getProductDetailById(Integer.parseInt(req
						.getParameter("id"))));
				break;
			case "getPurchasebyPro":
				pw = resp.getWriter();
				pw.print(ejb
						.getInitialPurchase_Product_DetailsByProductIdAndCompany(Integer
								.parseInt(req.getParameter("id"))));
				break;
			case "getQtyUnitConversion":
				pw = resp.getWriter();
				pw.print(ejb.getAllQtyUnitConversionByQtyUnitId(Integer
						.parseInt(req.getParameter("id"))));
				break;
			case "getQtyConversion":
				pw = resp.getWriter();
				QtyUnitConversionPK qpk = new QtyUnitConversionPK();
				qpk.setQtyUnitId1(Integer.parseInt(req.getParameter("id1")));
				qpk.setQtyUnitId2(Integer.parseInt(req.getParameter("id2")));
				pw.print(ejb.getQtyUnitConversionById(qpk));
				break;

			case "getProductImageByProductid":
				resp.getWriter().print(
						ejb.getAllProductImageByProductId(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getDesignImageBySampleJobId":
				resp.getWriter().print(
						ejb.getAllDesignImageBySampleJobId(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getStateByCityName":
				resp.getWriter().print(
						ejb.getStateByCityName(req.getParameter("nm")));
				break;
			case "getAllQtyUnitByNameOrAbv":
				resp.getWriter().print(
						ejb.getAllQtyUnitByNameOrAbv(req.getParameter("name")));
				break;
			case "getProductsForSaleByCode":
				resp.getWriter().print(
						ejb.getSalebleProductsByQtyAndCodeAndCompany(req
								.getParameter("codeParts")));
				break;
			case "deleteUOM":
				PrintWriter pw = new PrintWriter(resp.getOutputStream());
				JsonGeneratorFactory fac = Json.createGeneratorFactory(null);
				JsonGenerator gen1 = fac.createGenerator(pw);
				try {
					ejb.deleteUOMById(Integer.parseInt(req.getParameter("id")));
					gen1.writeStartObject().write("response", "success")
							.writeEnd().close();
				} catch (Exception e) {
					gen1.writeStartObject().write("response", "failed")
							.writeEnd().close();
				}
				break;
			case "getPurchaseProductDetailsByIdForSale":
				resp.getWriter().print(
						ejb.getPurchaseProductDetailsByIdForSale(
								Integer.parseInt(req.getParameter("id")),
								req.getParameter("date")));
				break;

			case "addVendorbyjson":
				resp.setContentType("application/json");
				JsonGeneratorFactory jsg = Json.createGeneratorFactory(null);
				JsonGenerator gen2 = jsg
						.createGenerator(resp.getOutputStream());
				httpSession = req.getSession();

				Vendor vendor = new Vendor();

				List<Vendor> vend = ejb.getAllVendors();

				int counter2 = 0;
				for (Vendor ven : vend) {

					if (ven.getPh1().equals(req.getParameter("vendorPh1"))) {

						counter2 = 1;
						break;
					}
				}
				if (counter2 == 0) {

					vendor = new Vendor();
					AccountDetails accountDetails = new AccountDetails();
					Date dt = new Date();

					vendor.setName(req.getParameter("vendorName").toUpperCase());
					vendor.setLastModifiedDate(dt);

					if (!req.getParameter("vendorAddress").equals("")) {
						vendor.setAddress(req.getParameter("vendorAddress"));
					} else {
						vendor.setAddress("NA");
					}
					if (!req.getParameter("vendorAlias").equals("")) {
						vendor.setAliseName(req.getParameter("vendorAlias"));
					} else {
						vendor.setAliseName("NA");
					}
					vendor.setCity(ejb.getCityById(Integer.parseInt(req
							.getParameter("vendorCityId"))));

					if (!req.getParameter("vendorCompanyName").equals("")) {
						vendor.setCompanyName(req
								.getParameter("vendorCompanyName"));
					} else {
						vendor.setCompanyName("NA");
					}
					if (!req.getParameter("vendorMail").equals("")) {
						vendor.setEmail(req.getParameter("vendorMail"));
					} else {
						vendor.setEmail("NA");
					}

					vendor.setPh1(req.getParameter("vendorPh1"));

					if (!req.getParameter("vendorPh2").equals("")) {

						vendor.setPh2(req.getParameter("vendorPh2"));
					} else {
						vendor.setPh2("NA");
					}
					if (!req.getParameter("vendorPin").equals("")) {
						vendor.setPinCode(req.getParameter("vendorPin"));
					} else {
						vendor.setPinCode("NA");
					}
					vendor.setVendorType(ejb.getVendorTypeById(Integer
							.parseInt(req.getParameter("vendorType"))));
					vendor.setUsers(ejb.getUserById((String) httpSession
							.getAttribute("user")));

					accountDetails.setBankAccountNumber(req
							.getParameter("bankAccNo"));
					accountDetails.setBankChequeLable(req
							.getParameter("bankCheckLebel"));
					accountDetails.setBankIFSCnumber(req
							.getParameter("bankIFSC"));
					accountDetails.setBankMICRnumber(req
							.getParameter("bankMICR"));
					accountDetails.setBankName(req.getParameter("bankName"));
					accountDetails.setBankRTGCnumber(req
							.getParameter("bankRTGS"));
					accountDetails.setBranch(req.getParameter("bankBranch"));

					if (!req.getParameter("bankCity").equals("")) {
						accountDetails.setCity(ejb.getCityById(Integer
								.parseInt(req.getParameter("bankCity"))));
					}

					accountDetails
							.setCstNumber(req.getParameter("vendorCSTno"));
					if (!req.getParameter("vendorCSTregDate").equals("")) {
						accountDetails.setCstRegistrationDate(DateConverter
								.getDate(req.getParameter("vendorCSTregDate")));
					}
					if (!req.getParameter("vendorExciseRegDate").equals("")) {
						accountDetails.setCstRegistrationDate(DateConverter
								.getDate(req
										.getParameter("vendorExciseRegDate")));
					}
					if (!req.getParameter("vendorServiceTaxRegDate").equals("")) {
						accountDetails
								.setCstRegistrationDate(DateConverter.getDate(req
										.getParameter("vendorServiceTaxRegDate")));
					}
					if (!req.getParameter("vendorVATregDate").equals("")) {
						accountDetails.setCstRegistrationDate(DateConverter
								.getDate(req.getParameter("vendorVATregDate")));
					}

					accountDetails.setExciseRegistrationNumber(req
							.getParameter("vendorExciseRegNo"));
					accountDetails
							.setPanNumber(req.getParameter("vendorPANno"));

					accountDetails.setServiceTaxRegistrationNumber(req
							.getParameter("vendorServiceTaxRegNo"));
					accountDetails
							.setVatNumber(req.getParameter("vendorVATno"));

					if (!req.getParameter("taxTypeGroupId").equals("0")) {
						accountDetails.setTax_Type_Group(ejb
								.getTax_Type_GroupById(Integer.parseInt(req
										.getParameter("taxTypeGroupId"))));
					}
					accountDetails.setUsers(ejb
							.getUserById((String) httpSession
									.getAttribute("user")));
					accountDetails.setVendor(vendor);

					ejb.setVendor(vendor);
					ejb.setAccountDetails(accountDetails);

					gen2.writeStartObject()
							.write("result", "vendor added successfully")
							.write("vid", vendor.getId())
							.write("vname", vendor.getName())
							.write("vvadd", vendor.getAddress())
							.write("vph1", vendor.getPh1())
							.write("vph2", vendor.getPh2()).writeEnd().close();

				} else {

					gen2.writeStartObject()
							.write("result", "Duplicate vendor Entry")
							.writeEnd().close();
				}
				break;
			/**************************** AgentShorcut **************/
			case "addAgen":
				resp.setContentType("application/json");
				JsonGeneratorFactory jsg2 = Json.createGeneratorFactory(null);
				JsonGenerator gen22 = jsg2.createGenerator(resp
						.getOutputStream());
				HttpSession httpSession2 = req.getSession();

				Vendor vendor2 = new Vendor();

				List<Vendor> vend2 = ejb.getAllVendors();
				int counter22 = 0;
				for (Vendor ven2 : vend2) {

					if (ven2.getPh1().equals(req.getParameter("vendorPh12"))) {

						counter22 = 1;
						break;
					}
				}
				if (counter22 == 0) {

					vendor2 = new Vendor();
					AccountDetails accountDetails2 = new AccountDetails();
					Date dt2 = new Date();

					vendor2.setName(req.getParameter("vendorName2")
							.toUpperCase());
					vendor2.setLastModifiedDate(dt2);
					if (!req.getParameter("vendorAddress2").equals("")) {

						vendor2.setAddress(req.getParameter("vendorAddress2"));
					} else {
						vendor2.setAddress("NA");
					}
					if (!req.getParameter("vendorAlias2").equals("")) {
						vendor2.setAliseName(req.getParameter("vendorAlias2"));
					} else {
						vendor2.setAliseName("NA");
					}
					vendor2.setCity(ejb.getCityById(Integer.parseInt(req
							.getParameter("vendorCityId2"))));

					if (!req.getParameter("vendorCompanyName2").equals("")) {
						vendor2.setCompanyName(req
								.getParameter("vendorCompanyName2"));
					} else {
						vendor2.setCompanyName("NA");
					}
					if (!req.getParameter("vendorMail2").equals("")) {
						vendor2.setEmail(req.getParameter("vendorMail2"));
					} else {
						vendor2.setEmail("NA");
					}
					vendor2.setPh1(req.getParameter("vendorPh12"));

					if (!req.getParameter("vendorPh22").equals("")) {
						vendor2.setPh2(req.getParameter("vendorPh22"));
					} else {
						vendor2.setPh2("NA");
					}
					if (!req.getParameter("vendorPin2").equals("")) {
						vendor2.setPinCode(req.getParameter("vendorPin2"));
					} else {
						vendor2.setPinCode("NA");
					}
					vendor2.setVendorType(ejb.getVendorTypeById(Integer
							.parseInt(req.getParameter("vendorType2"))));
					vendor2.setUsers(ejb.getUserById((String) httpSession2
							.getAttribute("user")));

					accountDetails2.setBankAccountNumber(req
							.getParameter("bankAccNo2"));
					accountDetails2.setBankChequeLable(req
							.getParameter("bankCheckLebel2"));
					accountDetails2.setBankIFSCnumber(req
							.getParameter("bankIFSC2"));
					accountDetails2.setBankMICRnumber(req
							.getParameter("bankMICR2"));
					accountDetails2.setBankName(req.getParameter("bankName2"));
					accountDetails2.setBankRTGCnumber(req
							.getParameter("bankRTGS2"));
					accountDetails2.setBranch(req.getParameter("bankBranch2"));

					if (!req.getParameter("bankCity6").equals("")) {
						accountDetails2.setCity(ejb.getCityById(Integer
								.parseInt(req.getParameter("bankCity6"))));
					}

					accountDetails2.setCstNumber(req
							.getParameter("vendorCSTno2"));
					if (!req.getParameter("vendorCSTregDate2").equals("")) {
						accountDetails2
								.setCstRegistrationDate(DateConverter.getDate(req
										.getParameter("vendorCSTregDate2")));
					}
					if (!req.getParameter("vendorExciseRegDate2").equals("")) {
						accountDetails2.setCstRegistrationDate(DateConverter
								.getDate(req
										.getParameter("vendorExciseRegDate2")));
					}
					if (!req.getParameter("vendorServiceTaxRegDate2")
							.equals("")) {
						accountDetails2
								.setCstRegistrationDate(DateConverter.getDate(req
										.getParameter("vendorServiceTaxRegDate2")));
					}
					if (!req.getParameter("vendorVATregDate2").equals("")) {
						accountDetails2
								.setCstRegistrationDate(DateConverter.getDate(req
										.getParameter("vendorVATregDate2")));
					}

					accountDetails2.setExciseRegistrationNumber(req
							.getParameter("vendorExciseRegNo2"));
					accountDetails2.setPanNumber(req
							.getParameter("vendorPANno2"));

					accountDetails2.setServiceTaxRegistrationNumber(req
							.getParameter("vendorServiceTaxRegNo2"));
					accountDetails2.setVatNumber(req
							.getParameter("vendorVATno2"));

					if (!req.getParameter("taxTypeGroupId2").equals("0")) {
						accountDetails2.setTax_Type_Group(ejb
								.getTax_Type_GroupById(Integer.parseInt(req
										.getParameter("taxTypeGroupId2"))));
					}

					accountDetails2.setUsers(ejb
							.getUserById((String) httpSession2
									.getAttribute("user")));
					accountDetails2.setVendor(vendor2);

					ejb.setVendor(vendor2);
					ejb.setAccountDetails(accountDetails2);

					gen22.writeStartObject()
							.write("result", "Agent added successfully")
							.write("vendorid", vendor2.getId())
							.write("vendorName", vendor2.getName())
							.write("vendorAddress", vendor2.getAddress())
							.write("vendorPh1", vendor2.getPh1())
							.write("vendorPh2", vendor2.getPh2()).writeEnd()
							.close();

				} else {

					gen22.writeStartObject()
							.write("result", "Duplicate Agent Entry")
							.writeEnd().close();
				}
				break;
			/************* Ajax form drop down **********************/
			case "getVendorByType":
				resp.getWriter().print(
						ejb.getVendorsByVendorTypeId(Integer.parseInt(req
								.getParameter("id"))));
				break;

			case "getuomByType":
				resp.getWriter().print(ejb.getAllQtyUnit());
				break;

			/**********************************************/
			case "addUOMjson":
				resp.setContentType("application/json");
				JsonGeneratorFactory jsg22 = Json.createGeneratorFactory(null);
				JsonGenerator gen222 = jsg22.createGenerator(resp
						.getOutputStream());

				QtyUnit qtyUnit = new QtyUnit();
				int flagg = 0;
				for (QtyUnit qut : ejb.getAllQtyUnit()) {
					if ((qut.getName().equalsIgnoreCase(
							req.getParameter("nameuom")) || (qut
							.getAbbreviation().equalsIgnoreCase(req
							.getParameter("abbreviationuom"))))) {
						flagg = 1;
						break;
					}
				}
				if (flagg == 0) {
					qtyUnit = new QtyUnit();
					qtyUnit.setName(req.getParameter("nameuom").toUpperCase());
					qtyUnit.setAbbreviation(req.getParameter("abbreviationuom")
							.toUpperCase());
					qtyUnit.setDescription(req.getParameter("descriptionuom")
							.toUpperCase());
					qtyUnit.setQtyUnitType(ejb.getQtyUnitTypeById(Integer
							.parseInt(req.getParameter("qtyUnitTypeIduom"))));
					ejb.setQtyUnit(qtyUnit);
					gen222.writeStartObject()
							.write("result", "UOM added successfully")
							.writeEnd().close();
				} else {
					gen222.writeStartObject()
							.write("result", "Duplicate UOM Entry").writeEnd()
							.close();
				}

				break;

			case "getDeptjson":
				resp.getWriter().print(ejb.getAllDepartments());
				break;

			case "getSubByDepjson":
				resp.getWriter().print(
						ejb.getAllSubDepartmentsByDepartmentId(Integer
								.parseInt(req.getParameter("id"))));
				break;

			case "getCatBySubjson":
				resp.getWriter().print(
						ejb.getAllCategoryBySubDepartmentId(Integer
								.parseInt(req.getParameter("id"))));
				break;

			case "getAllCategoryByCategoryName":
				resp.getWriter().print(
						ejb.getAllCategoryByCategoryName(req
								.getParameter("cat")));
				break;

			case "addJsonCountry":
				resp.setContentType("application/json");
				JsonGeneratorFactory jjss = Json.createGeneratorFactory(null);
				JsonGenerator genn = jjss.createGenerator(resp
						.getOutputStream());

				int flagg1 = 0;
				List<Country> cuty = ejb.getAllCountry();
				for (Country coty : cuty) {
					if (coty.getCountryName().equals(
							req.getParameter("name").toUpperCase())) {
						flagg1 = 1;
						break;
					}

				}
				if (flagg1 == 0) {
					Country country = new Country();
					country.setCountryName(req.getParameter("name")
							.toUpperCase());
					ejb.setCountry(country);

					genn.writeStartObject()
							.write("result", "Country added successfully")
							.writeEnd().close();
				} else {
					genn.writeStartObject()
							.write("result", "Duplicate Country Entry")
							.writeEnd().close();
				}

				break;

			case "addJsonState":
				resp.setContentType("application/json");
				JsonGeneratorFactory stateA = Json.createGeneratorFactory(null);
				JsonGenerator stateG = stateA.createGenerator(resp
						.getOutputStream());

				List<State> sList = ejb.getAllStatesByCountryId(Integer
						.parseInt(req.getParameter("id")));
				int flag1 = 0;
				for (State st : sList) {
					if (st.getStateName().equals(
							req.getParameter("nameqaz").toUpperCase())) {
						flag1 = 1;
						break;
					}
				}
				if (flag1 == 0) {
					State state = new State();
					state.setStateName(req.getParameter("nameqaz")
							.toUpperCase());
					state.setCountry(ejb.getCountryById(Integer.parseInt(req
							.getParameter("id"))));
					ejb.setState(state);

					stateG.writeStartObject()
							.write("result", "State added successfully")
							.writeEnd().close();
				} else {
					stateG.writeStartObject()
							.write("result", "Duplicate State Entry")
							.writeEnd().close();
				}

				break;

			case "addJsonCity":
				resp.setContentType("application/json");
				JsonGeneratorFactory cityA = Json.createGeneratorFactory(null);
				JsonGenerator cityAj = cityA.createGenerator(resp
						.getOutputStream());
				City city = new City();
				List<City> cities = ejb.getCityByState(Integer.parseInt(req
						.getParameter("id")));
				int flag2 = 0;
				for (City c : cities) {
					if (c.getCityName().equals(
							req.getParameter("namezxc").toUpperCase())) {
						flag2 = 1;
						break;
					}
				}
				if (flag2 == 0) {

					city.setCityName(req.getParameter("namezxc").toUpperCase());
					city.setState(ejb.getStateById(Integer.parseInt(req
							.getParameter("id"))));

					ejb.setCity(city);

					cityAj.writeStartObject()
							.write("result", "City added successfully")
							.write("cityAid", city.getId())
							.write("cityAname", city.getCityName()).writeEnd()
							.close();
				} else {
					cityAj.writeStartObject()
							.write("result", "Duplicate City Entry").writeEnd()
							.close();
				}

			case "productSumaryJson":
				resp.setContentType("application/json");
				JsonGeneratorFactory jasonF = Json.createGeneratorFactory(null);
				JsonGenerator jsonG = jasonF.createGenerator(resp
						.getOutputStream());
				HttpSession httpSession1 = req.getSession();

				ProductDetail productDetail = new ProductDetail();
				Purchase_Product_Details purchaseProductDetails = new Purchase_Product_Details();
				ReadyGoodsStock readyGoodsStock = new ReadyGoodsStock();
				RawMaterialsStock rawMaterialsStock = new RawMaterialsStock();
				CompanyInfo companyInfo;

				companyInfo = ejb.getUserById(
						(String) httpSession1.getAttribute("user"))
						.getCompanyInfo();

				int flaggq = 0;
				List<ProductDetail> pro1 = ejb.getAllProductDetail();
				for (ProductDetail pqu : pro1) {
					if (pqu.getCode().equals(
							req.getParameter("productCode").toUpperCase())) {
						flagg = 1;
						break;
					}

				}
				if (flaggq == 0) {

					productDetail.setCode(req.getParameter("productCode")
							.toUpperCase());
					productDetail.setDescription(req
							.getParameter("description").toUpperCase());
					productDetail.setUniversalCode(req.getParameter("upc")
							.toUpperCase());
					productDetail.setQtyUnit(ejb.getQtyUnitById(Integer
							.parseInt(req.getParameter("uom"))));
					productDetail.setRaw(Boolean.parseBoolean(req
							.getParameter("isRaw")));
					productDetail.setSaleble(Boolean.parseBoolean(req
							.getParameter("isSalebi")));
					productDetail.setCategory(ejb.getCategoryById(Integer
							.parseInt(req.getParameter("catagoryId"))));
					productDetail.setActive(true);
					ejb.setProductDetail(productDetail);

					if (Boolean.parseBoolean(req.getParameter("isRaw"))) {
						rawMaterialsStock.setProductDetail(productDetail);
						rawMaterialsStock.setRemainingQty(0);
						rawMaterialsStock.setCompanyInfo(companyInfo);
						ejb.setRawMaterialsStocktDetail(rawMaterialsStock);
						rawMaterialsStock = null;
					} else {
						readyGoodsStock.setProductDetail(productDetail);
						readyGoodsStock.setRemainingQty(0);
						readyGoodsStock.setCompanyInfo(companyInfo);
						ejb.setReadyGoodsStockDetail(readyGoodsStock);
						readyGoodsStock = null;
					}

					if (req.getParameter("addini").equals("add")) {
						purchaseProductDetails.setMrp(Float.parseFloat(req
								.getParameter("mrp1")));
						purchaseProductDetails.setWsp(Float.parseFloat(req
								.getParameter("wsp1")));
						purchaseProductDetails.setQuantity(Float.parseFloat(req
								.getParameter("qty1")));
						purchaseProductDetails.setCost(Float.parseFloat(req
								.getParameter("ucost")));
						purchaseProductDetails.setAttrValue1(req
								.getParameter("att1"));
						purchaseProductDetails.setAttrValue2(req
								.getParameter("att2"));
						purchaseProductDetails.setAttrValue3(req
								.getParameter("att3"));
						purchaseProductDetails.setAttrValue4(req
								.getParameter("att4"));
						purchaseProductDetails.setAttrValue5(req
								.getParameter("att5"));
						purchaseProductDetails.setAttrValue6(req
								.getParameter("att6"));
						purchaseProductDetails.setRemaining_quantity(Float
								.parseFloat(req.getParameter("qty1")));
						purchaseProductDetails.setInitialInventory(true);
						purchaseProductDetails.setProductDetail(productDetail);
						purchaseProductDetails.setLotNumber(req
								.getParameter("lotnumberS"));
						purchaseProductDetails.setCompanyInfo(ejb.getUserById(
								(String) httpSession1.getAttribute("user"))
								.getCompanyInfo());
						ejb.setPurchaseProductDetails(purchaseProductDetails);

						if (productDetail.isRaw()) {
							rawMaterialsStock = ejb
									.getRawMeterialStoctByProductAndCompanyId(
											productDetail.getId(),
											companyInfo.getId());
							rawMaterialsStock
									.setRemainingQty(rawMaterialsStock
											.getRemainingQty()
											+ Float.parseFloat(req
													.getParameter("qty1")));
							ejb.updateRawMaterialStockDetail(rawMaterialsStock);
						} else {
							readyGoodsStock = ejb
									.getReadyGoodStoctByProductAndCompanyId(
											productDetail.getId(),
											companyInfo.getId());
							readyGoodsStock
									.setRemainingQty(readyGoodsStock
											.getRemainingQty()
											+ Float.parseFloat(req
													.getParameter("qty1")));
							ejb.updateReadyGoodsStockDetail(readyGoodsStock);
						}

					}

					String imgstr = req.getParameter("proImage1");

					ProductImage proimg = new ProductImage();
					proimg.setProductDetail(productDetail);
					proimg.setImage(Base64.decode(imgstr));
					ejb.setProductImage(proimg);

					jsonG.writeStartObject()
							.write("result", "Product added successfully")
							.writeEnd().close();
				} else {
					jsonG.writeStartObject()
							.write("result", "Duplicate Product Entry")
							.writeEnd().close();
				}

				break;
			case "getVendorsByNameAndType":
				resp.getWriter().print(
						ejb.getVendorByTypeAndName(req.getParameter("type"),
								req.getParameter("name")));
				break;

			case "getCriticalStock":
				JsonGeneratorFactory factory1 = Json
						.createGeneratorFactory(null);
				JsonGenerator generator = factory1.createGenerator(resp
						.getOutputStream());
				generator.writeStartArray();

				for (ProductDetail pd : ejb.getAllProductDetail()) {
					if ((pd.isRaw() ? pd.getRawMaterialsStock()
							.getRemainingQty() : pd.getReadyGoodsStock()
							.getRemainingQty()) < 10) {
						generator
								.writeStartObject()
								.write("productId", pd.getId())
								.write("productCode", pd.getCode())
								.write("productDescription",
										pd.getDescription()).writeEnd();
					}
				}
				generator.writeEnd().close();
				break;

			case "getSampleDesignCostSheetByDesignNumber":
				JsonGeneratorFactory factoryD = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorD = factoryD.createGenerator(resp
						.getOutputStream());
				generatorD.writeStartArray();

				for (SampleDesignCostSheet sdcs : ejb
						.getSampleDesignCostSheetByDesignNumber(req
								.getParameter("dNo"))) {
					generatorD.writeStartObject().write("dId", sdcs.getId())
							.write("dNumber", sdcs.getDesignNumber())
							.write("dDEsc", sdcs.getDesignDescription())
							.writeEnd();
				}
				generatorD.writeEnd().close();
				break;

			case "getSampleDesignCostSheetByDesignNumberForDuplicateCheck":
				JsonGeneratorFactory factoryDC = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorDC = factoryDC.createGenerator(resp
						.getOutputStream());
				generatorDC.writeStartArray();

				for (SampleDesignCostSheet sdcs : ejb
						.getSampleDesignCostSheetByDesignNumberForDuplicateCheck(req
								.getParameter("dNo"))) {
					generatorDC.writeStartObject().write("dId", sdcs.getId())
							.write("dNumber", sdcs.getDesignNumber())
							.write("dDEsc", sdcs.getDesignDescription())
							.writeEnd();
				}
				generatorDC.writeEnd().close();
				break;

			case "getAllDesignNoFromSampleDesignCostSheetAndProductsByDesignNumberForDuplicateCheck":
				JsonGeneratorFactory factoryDN = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorDN = factoryDN.createGenerator(resp
						.getOutputStream());
				generatorDN.writeStartArray();
				for (int i = 0; i < ejb
						.getAllDesignNoFromSampleDesignCostSheetAndProductsByDesignNumberForDuplicateCheck(
								req.getParameter("dNo")).size(); i++) {
					generatorDN
							.writeStartObject()
							.write("dNumber",
									ejb.getAllDesignNoFromSampleDesignCostSheetAndProductsByDesignNumberForDuplicateCheck(
											req.getParameter("dNo")).get(i))
							.writeEnd();
				}
				generatorDN.writeEnd().close();
				break;

			case "getAllVoucherDetailsByJobAssignId":
				JsonGeneratorFactory jgf = Json.createGeneratorFactory(null);
				JsonGenerator jg = jgf.createGenerator(resp.getOutputStream());
				int voucherDetailSize = 0;
				if (ejb.getAllVoucherDetailsByJobAssignId(
						Integer.parseInt(req.getParameter("id"))).size() == 0) {
					voucherDetailSize = 0;
				} else {
					voucherDetailSize = ejb.getAllVoucherDetailsByJobAssignId(
							Integer.parseInt(req.getParameter("id"))).size();
				}
				jg.writeStartObject()
						.write("voucherDetailSize", voucherDetailSize)
						.writeEnd().close();
				break;

			case "getAllVoucherDetails4ViaAgentBySalesEntryId":
				JsonGeneratorFactory jgf4va = Json.createGeneratorFactory(null);
				JsonGenerator jg4va = jgf4va.createGenerator(resp
						.getOutputStream());
				int voucherDetSize = 0;
				if (ejb.getAllVoucherDetails4ViaAgentBySalesEntryId(
						Integer.parseInt(req.getParameter("id"))).size() == 0) {
					voucherDetSize = 0;
				} else {
					voucherDetSize = ejb
							.getAllVoucherDetails4ViaAgentBySalesEntryId(
									Integer.parseInt(req.getParameter("id")))
							.size();
				}
				jg4va.writeStartObject()
						.write("voucherDetailSize", voucherDetSize).writeEnd()
						.close();
				break;

			case "getAllVoucherDetails4ViaAgentByPurchaseEntryId":
				JsonGeneratorFactory jgf4vap = Json
						.createGeneratorFactory(null);
				JsonGenerator jg4vap = jgf4vap.createGenerator(resp
						.getOutputStream());
				int vouDetSize = 0;
				if (ejb.getAllVoucherDetails4ViaAgentByPurchaseEntryId(
						Integer.parseInt(req.getParameter("id"))).size() == 0) {
					vouDetSize = 0;
				} else {
					vouDetSize = ejb
							.getAllVoucherDetails4ViaAgentByPurchaseEntryId(
									Integer.parseInt(req.getParameter("id")))
							.size();
				}
				jg4vap.writeStartObject()
						.write("voucherDetailSize", vouDetSize).writeEnd()
						.close();
				break;

			case "getPurchaseProductDetailsByLotNumber":
				resp.getWriter().print(
						ejb.getPurchaseProductDetailsByLotNumber(req
								.getParameter("lotNo")));
				break;

			case "checkPcode":
				resp.getWriter().print(
						ejb.getProductByProductCode(req
								.getParameter("productCode4")));
				break;

			case "getProductByDesignNo":
				resp.getWriter().print(
						ejb.getProductByDesignNo(req.getParameter("dNo")));
				break;

			case "getAllOngoingJobPlanByDesignNumber":
				JsonGeneratorFactory factoryJP = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorJP = factoryJP.createGenerator(resp
						.getOutputStream());
				generatorJP.writeStartArray();
				for (JobPlan jp : ejb
						.getAllOngoingJobPlanByDesignNumber(Integer
								.parseInt(req.getParameter("dId")))) {
					generatorJP.writeStartObject().write("jpId", jp.getId())
							.write("jpDate", jp.getPlanDate().toString())
							.write("jpQty", jp.getQty()).writeEnd();
				}
				generatorJP.writeEnd().close();
				break;

			case "getAllJobPlanByDesignNumber":
				JsonGeneratorFactory factoryJP1 = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorJP1 = factoryJP1.createGenerator(resp
						.getOutputStream());
				generatorJP1.writeStartArray();
				for (JobPlan jp : ejb.getAllJobPlanByDesignNumber(Integer
						.parseInt(req.getParameter("dId")))) {
					generatorJP1.writeStartObject().write("jpId", jp.getId())
							// .write("jpDesc", jp.getDescription())
							.write("jpDate", jp.getPlanDate().toString())
							.write("jpQty", jp.getQty()).writeEnd();
				}
				generatorJP1.writeEnd().close();
				break;

			case "getAllJobPlans":
				JsonGeneratorFactory factoryJP2 = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorJP2 = factoryJP2.createGenerator(resp
						.getOutputStream());
				generatorJP2.writeStartArray();
				for (JobPlan jp : ejb.getAllJobPlan()) {
					generatorJP2
							.writeStartObject()
							.write("jpId", jp.getId())
							// .write("jpDesc", jp.getDescription())
							.write("dNo",
									jp.getDesignCostSheet().getDesignNumber())
							.write("jpDate", jp.getPlanDate().toString())
							.write("jpQty", jp.getQty()).writeEnd();
				}
				generatorJP2.writeEnd().close();
				break;

			case "getPlannedSampleDesignCostSheetByDesignNumber":
				JsonGeneratorFactory factoryDP = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorDP = factoryDP.createGenerator(resp
						.getOutputStream());
				generatorDP.writeStartArray();

				for (SampleDesignCostSheet sdcs : ejb
						.getPlannedSampleDesignCostSheetByDesignNumber(req
								.getParameter("dNo"))) {
					generatorDP.writeStartObject().write("dId", sdcs.getId())
							.write("dNumber", sdcs.getDesignNumber())
							.write("dDEsc", sdcs.getDesignDescription())
							.writeEnd();
				}
				generatorDP.writeEnd().close();
				break;

			case "updateSalesproduct":
				JsonGeneratorFactory factorySP = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorSP = factorySP.createGenerator(resp
						.getOutputStream());
				try {
					SalesProductDetails spd = ejb
							.getSalesProductDetailsById(Integer.parseInt(req
									.getParameter("id")));

					purchaseProductDetails = spd.getPurchase_Product_Details();
					purchaseProductDetails
							.setRemaining_quantity(purchaseProductDetails
									.getRemaining_quantity()
									+ spd.getQuantity()
									- Float.parseFloat(req.getParameter("qty")));
					ejb.updatePurchaseProductDetails(purchaseProductDetails);

					if (purchaseProductDetails.getProductDetail().isRaw()) {
						rawMaterialsStock = ejb
								.getRawMeterialStoctByProductId(purchaseProductDetails
										.getProductDetail().getId());
						rawMaterialsStock.setRemainingQty(rawMaterialsStock
								.getRemainingQty()
								+ spd.getQuantity()
								- Float.parseFloat(req.getParameter("qty")));
						ejb.updateRawMaterialStockDetail(rawMaterialsStock);
					} else {
						readyGoodsStock = ejb
								.getReadyGoodsStoctByProductId(purchaseProductDetails
										.getProductDetail().getId());
						readyGoodsStock.setRemainingQty(readyGoodsStock
								.getRemainingQty()
								+ spd.getQuantity()
								- Float.parseFloat(req.getParameter("qty")));
						ejb.updateReadyGoodsStockDetail(readyGoodsStock);
					}

					SalesProductDetails salesProductDetails = ejb
							.getSalesProductDetailsById(Integer.parseInt(req
									.getParameter("id")));
					salesProductDetails.setQuantity(Float.parseFloat(req
							.getParameter("qty")));
					salesProductDetails.setSalesPrice(Float.parseFloat(req
							.getParameter("price")));
					ejb.updateSalesProductDetails(salesProductDetails);

					generatorSP
							.writeStartObject()
							.write("error", false)
							.write("msg",
									"sales product details updated successfully")
							.writeEnd().close();

				} catch (Exception e) {
					generatorSP.writeStartObject().write("error", true)
							.write("msg", e.getMessage()).writeEnd().close();
					e.printStackTrace();
				}

				break;

			case "updateSalesEntry":
				JsonGeneratorFactory factorySE = Json
						.createGeneratorFactory(null);
				JsonGenerator generatorSE = factorySE.createGenerator(resp
						.getOutputStream());
				try {
					SalesEntry salesEntry = ejb.getSalesEntryById(Integer
							.parseInt(req.getParameter("id")));
					salesEntry.setSubTotal(Float.parseFloat(req
							.getParameter("st")));
					salesEntry.setTaxAmount(Float.parseFloat(req
							.getParameter("taxAmount")));
					salesEntry.setTransportcCharge(Float.parseFloat(req
							.getParameter("trCharge")));
					salesEntry.setSurcharge(Float.parseFloat(req
							.getParameter("surCharge")));
					salesEntry.setRoundOf(Float.parseFloat(req
							.getParameter("roundvalue")));
					salesEntry.setTotalCost(Float.parseFloat(req
							.getParameter("gt")));
					salesEntry.setDescription(req.getParameter("salesDesc")
							.toUpperCase());
					if (!req.getParameter("aId").equals("")) {
						salesEntry.setVendor(ejb.getVendorById(Integer
								.parseInt(req.getParameter("aId"))));
						if (req.getParameter("isEffective").equals(
								"efectiveYes")) {
							salesEntry.setEfectiveProfit(true);
						} else {
							salesEntry.setEfectiveProfit(false);
						}
						if (req.getParameter("profitType").equals("profitFlat")) {
							salesEntry.setFlatProfitAgent(true);
						} else {
							salesEntry.setFlatProfitAgent(false);
						}
						salesEntry.setAgentProfitValue(Float.parseFloat(req
								.getParameter("profitVal")));
						salesEntry.setAgentProfitTotal(Float.parseFloat(req
								.getParameter("profitValue")));
					} else {
						salesEntry.setVendor(null);

						salesEntry.setEfectiveProfit(true);
						salesEntry.setFlatProfitAgent(true);
						salesEntry.setAgentProfitValue(0);
						salesEntry.setAgentProfitTotal(0);
					}

					if (req.getParameter("disType").equals("disFlat")) {
						salesEntry.setFlatDiscount(true);
					} else {
						salesEntry.setFlatDiscount(false);
					}
					salesEntry.setDiscountValue(Float.parseFloat(req
							.getParameter("discount")));
					ejb.updateSalesEntry(salesEntry);

					int paySize = ejb.getPaymentDetailsBySalesEntryId(
							salesEntry.getId()).size();
					PaymentDetails paymentDetails = ejb
							.getPaymentDetailsBySalesEntryId(salesEntry.getId())
							.get(paySize - 1);
					if (Float.parseFloat(req.getParameter("gt"))
							- paymentDetails.getPaidAmount() == 0) {
						paymentDetails.setPaymentStatus(ejb
								.getPaymentStatusByStatus("Full Paid"));

						// if (ejb.getAllVoucherDetailsBySalesEntryId(
						// salesEntry.getId()).size() > 0) {
						// voucherDetails = ejb
						// .getAllVoucherDetailsBySalesEntryId(
						// salesEntry.getId()).get(0);
						// voucherDetails.setValue(Float.parseFloat(req
						// .getParameter("gt"))
						// - paymentDetails.getPaidAmount());
						// ejb.updateVoucherDetails(voucherDetails);
						// }
					} else {
						if (paymentDetails.getPaidAmount() != 0) {
							paymentDetails.setPaymentStatus(ejb
									.getPaymentStatusByStatus("Semi Paid"));
						} else {
							paymentDetails.setPaymentStatus(ejb
									.getPaymentStatusByStatus("Not Paid"));
						}

						// if (ejb.getAllVoucherDetailsBySalesEntryId(
						// salesEntry.getId()).size() > 0) {
						// voucherDetails = ejb
						// .getAllVoucherDetailsBySalesEntryId(
						// salesEntry.getId()).get(0);
						// voucherDetails.setValue(Float.parseFloat(req
						// .getParameter("gt"))
						// - paymentDetails.getPaidAmount());
						// ejb.updateVoucherDetails(voucherDetails);
						// } else {
						// voucherAssign = ejb
						// .getVoucherAssignByCustomerId(salesEntry
						// .getCustomer().getId());
						//
						// voucherDetails = new VoucherDetails();
						// voucherDetails.setSalesEntry(salesEntry);
						// voucherDetails.setCredit(false);
						// voucherDetails.setValue(Float.parseFloat(req
						// .getParameter("gt"))
						// - paymentDetails.getPaidAmount());
						// voucherDetails.setVoucherDate(salesEntry
						// .getSales_date());
						// voucherDetails.setUsers(ejb
						// .getUserById((String) httpSession
						// .getAttribute("user")));
						// voucherDetails.setVoucherAssign(voucherAssign);
						// ejb.setVoucherDetails(voucherDetails);
						// }
					}
					voucherDetails = ejb.getAllVoucherDetailsBySalesEntryId(
							salesEntry.getId()).get(0);
					voucherDetails.setValue(Float.parseFloat(req
							.getParameter("gt"))
							- paymentDetails.getPaidAmount());
					ejb.updateVoucherDetails(voucherDetails);
					paymentDetails.setTotalAmount(Float.parseFloat(req
							.getParameter("gt")));
					// if (paymentDetails.getPaymentStatus().getStatus()
					// .equals("Full Paid")) {
					// paymentDetails.setTotalAmount(Float.parseFloat(req
					// .getParameter("gt")));
					// paymentDetails.setPaidAmount(Float.parseFloat(req
					// .getParameter("gt")));
					// } else {
					// paymentDetails.setTotalAmount(Float.parseFloat(req
					// .getParameter("gt")));
					// VoucherDetails vd = ejb
					// .getAllVoucherDetailsBySalesEntryId(
					// salesEntry.getId()).get(0);
					// vd.setValue(Float.parseFloat(req.getParameter("gt"))
					// - paymentDetails.getPaidAmount());
					// ejb.updateVoucherDetails(vd);
					// }
					ejb.updatePaymentDetails(paymentDetails);

					// new to check
					if (salesEntry.getVendor() != null) {
						if (ejb.getVoucherAssignByVendorId(
								salesEntry.getVendor().getId()).size() == 0) {
							voucherAssign = new VoucherAssign();
							vendor = ejb.getVendorById(salesEntry.getVendor()
									.getId());
							voucherAssign.setVendor(vendor);
							voucherAssign.setVoucherDetailsNumber(vendor
									.getPh1());
							ejb.setVoucherAssign(voucherAssign);
						} else {
							voucherAssign = ejb.getVoucherAssignByVendorId(
									salesEntry.getVendor().getId()).get(0);
						}

						if (ejb.getAllVoucherDetails4ViaAgentBySalesEntryId(
								salesEntry.getId()).size() > 0) {
							voucherDetForViaAgent = ejb
									.getAllVoucherDetails4ViaAgentBySalesEntryId(
											salesEntry.getId()).get(0);
							voucherDetForViaAgent.setValue(Float.parseFloat(req
									.getParameter("profitValue")));
							ejb.updateVoucherDetails4ViaAgent(voucherDetForViaAgent);

							for (VoucherDetailsForViaAgents voucherDetForViaAgent : ejb
									.getAllVoucherDetails4ViaAgentBySalesEntryId(salesEntry
											.getId())) {
								voucherDetForViaAgent.setAgentId(salesEntry
										.getVendor().getId());
								ejb.updateVoucherDetails4ViaAgent(voucherDetForViaAgent);
							}
						} else {
							voucherDetForViaAgent = new VoucherDetailsForViaAgents();
							voucherDetForViaAgent.setVoucherAssignId(ejb
									.getVoucherAssignByVendorId(
											salesEntry.getVendor().getId())
									.get(0).getId());
							voucherDetForViaAgent.setAgentId(salesEntry
									.getVendor().getId());
							voucherDetForViaAgent.setSalesEntryId(salesEntry
									.getId());
							voucherDetForViaAgent.setCredit(true);
							voucherDetForViaAgent.setValue(salesEntry
									.getAgentProfitTotal());
							voucherDetForViaAgent.setVoucherDate(salesEntry
									.getSales_date());
							voucherDetForViaAgent.setEntryDate(new Date());
							voucherDetForViaAgent
									.setUserId((String) httpSession
											.getAttribute("user"));
							ejb.setVoucherDetails4ViaAgent(voucherDetForViaAgent);

							int uniqueNo = ejb
									.getLastUniqueNoOfPayDet4ViaAgent() + 1;
							payDetForViaAgent = new PaymentDetailsForViaAgents();
							payDetForViaAgent.setPaymentDate(salesEntry
									.getSales_date());
							payDetForViaAgent.setEntryDate(new Date());
							payDetForViaAgent.setPaidAmount(0);
							payDetForViaAgent.setSalesEntryId(salesEntry
									.getId());
							payDetForViaAgent.setPaymentStatusId(ejb
									.getPaymentStatusByStatus("Not Paid")
									.getId());
							payDetForViaAgent.setUniqueNo(uniqueNo);
							payDetForViaAgent.setUserId((String) httpSession
									.getAttribute("user"));
							ejb.setPaymentDetails4ViaAgent(payDetForViaAgent);
						}
					} else {
						if (ejb.getAllVoucherDetails4ViaAgentBySalesEntryId(
								salesEntry.getId()).size() > 0) {
							for (VoucherDetailsForViaAgents voucherDetForViaAgent : ejb
									.getAllVoucherDetails4ViaAgentBySalesEntryId(salesEntry
											.getId())) {
								ejb.deleteVoucherDetails4ViaAgentById(voucherDetForViaAgent
										.getId());
							}
						}
						if (ejb.getPaymentDetails4ViaAgentBySalesEntryId(
								salesEntry.getId()).size() > 0) {
							for (PaymentDetailsForViaAgents payDetailsForViaAgents : ejb
									.getPaymentDetails4ViaAgentBySalesEntryId(salesEntry
											.getId())) {
								ejb.deletePaymentDetails4ViaAgent(payDetailsForViaAgents
										.getId());
							}
						}
					}

					for (SalesReturn sr : ejb
							.getSalesReturnBySalesEntryId(salesEntry.getId())) {
						float subTotal = 0;
						for (SalesProductReturnDetail sprd : sr
								.getSalesProductReturnDetail()) {
							subTotal = subTotal
									+ (sprd.getQtyReturn() * sprd
											.getSalesProductDetails()
											.getSalesPrice());
						}
						float discount = 0;
						if (sr.getSalesEntry().isFlatDiscount()) {
							discount = subTotal
									* sr.getSalesEntry().getDiscountValue()
									/ sr.getSalesEntry().getSubTotal();
						} else {
							discount = subTotal
									* sr.getSalesEntry().getDiscountValue()
									/ 100;
						}
						float profit = 0;
						if (sr.getSalesEntry().isEfectiveProfit()) {
							if (sr.getSalesEntry().isFlatProfitAgent()) {
								profit = subTotal
										* sr.getSalesEntry()
												.getAgentProfitValue()
										/ sr.getSalesEntry().getSubTotal();
							} else {
								profit = (subTotal - discount)
										* sr.getSalesEntry()
												.getAgentProfitValue() / 100;
							}
						}
						float tax = 0;
						if (sr.getSalesEntry().getTax_Type_Group() != null) {
							tax = (subTotal - discount)
									* sr.getSalesEntry().getTax_Type_Group()
											.getTotalTaxValue() / 100;
						}

						float total = subTotal + tax - discount;
						float round = Math.round(total);
						float roundValue = round - total;
						float grandtotal = round;

						sr.setRoundOff(roundValue);
						sr.setTotalReCost(grandtotal);
						sr.setRetAgentProfitTotal(profit);
						ejb.updateSalesReturn(sr);

						PaymentDetails payDetails = ejb
								.getPaymentDetailsBySalesReturnId(sr.getId())
								.get(0);
						payDetails.setPaidAmount(grandtotal);
						voucherDetails = ejb
								.getAllVoucherDetailsBySalesReturnId(sr.getId())
								.get(0);
						voucherDetails.setValue(grandtotal);
						ejb.updateVoucherDetails(voucherDetails);

						ejb.updatePaymentDetails(payDetails);

						if (salesEntry.getVendor() != null
								&& salesEntry.isEfectiveProfit()) {
							if (ejb.getAllVoucherDetails4ViaAgentBySalesReturnId(
									sr.getId()).size() > 0) {
								voucherDetForViaAgent = ejb
										.getAllVoucherDetails4ViaAgentBySalesReturnId(
												sr.getId()).get(0);
								voucherDetForViaAgent.setValue(profit);
								ejb.updateVoucherDetails4ViaAgent(voucherDetForViaAgent);

								for (VoucherDetailsForViaAgents voucherDetForViaAgent : ejb
										.getAllVoucherDetails4ViaAgentBySalesReturnId(sr
												.getId())) {
									voucherDetForViaAgent.setAgentId(salesEntry
											.getVendor().getId());
									ejb.updateVoucherDetails4ViaAgent(voucherDetForViaAgent);
								}
							} else {
								voucherDetForViaAgent = new VoucherDetailsForViaAgents();
								voucherDetForViaAgent.setVoucherAssignId(ejb
										.getVoucherAssignByVendorId(
												salesEntry.getVendor().getId())
										.get(0).getId());
								voucherDetForViaAgent.setAgentId(salesEntry
										.getVendor().getId());
								voucherDetForViaAgent
										.setSalesEntryId(salesEntry.getId());
								voucherDetForViaAgent.setSalesReturnId(sr
										.getId());
								voucherDetForViaAgent.setCredit(false);
								voucherDetForViaAgent.setValue(sr
										.getRetAgentProfitTotal());
								voucherDetForViaAgent.setVoucherDate(sr
										.getReturnDate());
								voucherDetForViaAgent.setEntryDate(new Date());
								voucherDetForViaAgent
										.setUserId((String) httpSession
												.getAttribute("user"));
								ejb.setVoucherDetails4ViaAgent(voucherDetForViaAgent);

								int uniqueNo = ejb
										.getLastUniqueNoOfPayDet4ViaAgent() + 1;
								payDetForViaAgent = new PaymentDetailsForViaAgents();
								payDetForViaAgent.setPaymentDate(sr
										.getReturnDate());
								payDetForViaAgent.setEntryDate(new Date());
								payDetForViaAgent.setPaidAmount(sr
										.getRetAgentProfitTotal());
								payDetForViaAgent.setSalesEntryId(salesEntry
										.getId());
								payDetForViaAgent.setSalesReturnId(sr.getId());
								payDetForViaAgent.setPaymentTypeId(ejb
										.getPaymentTypeByType("Credit Note")
										.getId());
								payDetForViaAgent.setPaymentStatusId(ejb
										.getPaymentStatusByStatus("Semi Paid")
										.getId());
								payDetForViaAgent.setUniqueNo(uniqueNo);
								payDetForViaAgent
										.setUserId((String) httpSession
												.getAttribute("user"));
								ejb.setPaymentDetails4ViaAgent(payDetForViaAgent);
							}

							if (ejb.getPaymentDetails4ViaAgentBySalesReturnId(
									sr.getId()).size() > 0) {
								payDetForViaAgent = ejb
										.getPaymentDetails4ViaAgentBySalesReturnId(
												sr.getId()).get(0);
								payDetForViaAgent.setPaidAmount(profit);
								ejb.updatePaymentDetails4ViaAgent(payDetForViaAgent);
							} else {
								int uniqueNo = ejb
										.getLastUniqueNoOfPayDet4ViaAgent() + 1;

								payDetForViaAgent = new PaymentDetailsForViaAgents();
								payDetForViaAgent.setPaymentDate(sr
										.getReturnDate());
								payDetForViaAgent.setEntryDate(new Date());
								payDetForViaAgent.setPaidAmount(sr
										.getRetAgentProfitTotal());
								payDetForViaAgent.setSalesEntryId(salesEntry
										.getId());
								payDetForViaAgent.setSalesReturnId(sr.getId());
								payDetForViaAgent.setPaymentTypeId(ejb
										.getPaymentTypeByType("Credit Note")
										.getId());
								payDetForViaAgent.setPaymentStatusId(ejb
										.getPaymentStatusByStatus("Semi Paid")
										.getId());
								payDetForViaAgent.setUniqueNo(uniqueNo);
								payDetForViaAgent
										.setUserId((String) httpSession
												.getAttribute("user"));
								ejb.setPaymentDetails4ViaAgent(payDetForViaAgent);
							}
						} else {
							if (ejb.getAllVoucherDetails4ViaAgentBySalesReturnId(
									sr.getId()).size() > 0) {
								voucherDetForViaAgent = ejb
										.getAllVoucherDetails4ViaAgentBySalesReturnId(
												sr.getId()).get(0);
								ejb.deleteVoucherDetails4ViaAgentById(voucherDetForViaAgent
										.getId());
							}

							if (ejb.getPaymentDetails4ViaAgentBySalesReturnId(
									sr.getId()).size() > 0) {
								payDetForViaAgent = ejb
										.getPaymentDetails4ViaAgentBySalesReturnId(
												sr.getId()).get(0);
								ejb.deletePaymentDetails4ViaAgent(payDetForViaAgent
										.getId());
							}
						}
					}
					// new to check

					// correcting voucherdetails totaldebitnote for the
					// customer

					// VoucherAssign va = ejb
					// .getVoucherAssignByCustomerId(salesEntry
					// .getCustomer().getId());
					// float totCr = 0;
					// float totDb = 0;
					//
					// for (int ind = 0; ind < ejb
					// .getAllVoucherDetailsByVoucherAssignId(va.getId())
					// .size(); ind++) {
					// voucherDetails = ejb
					// .getAllVoucherDetailsByVoucherAssignId(
					// va.getId()).get(ind);
					// if (voucherDetails.isCredit()) {
					// totCr = totCr + voucherDetails.getValue();
					// } else {
					// totDb = totDb + voucherDetails.getValue();
					// }
					//
					// voucherDetails.setTotalDebitNote(totDb - totCr);
					// ejb.updateVoucherDetails(voucherDetails);
					// }

					// correcting voucherdetails totaldebitnote for the
					// customer

					// correcting sales entry payment details
					int pSize = ejb.getPaymentDetailsBySalesEntryId(
							salesEntry.getId()).size();
					if (pSize > 0) {
						float tot = ejb
								.getPaymentDetailsBySalesEntryId(
										salesEntry.getId()).get(pSize - 1)
								.getTotalAmount();
						for (int ind = ejb.getPaymentDetailsBySalesEntryId(
								salesEntry.getId()).size() - 1; ind > -1; ind--) {
							paymentDetails = ejb
									.getPaymentDetailsBySalesEntryId(
											salesEntry.getId()).get(ind);
							paymentDetails.setTotalAmount(tot);
							tot = tot - paymentDetails.getPaidAmount();
							ejb.updatePaymentDetails(paymentDetails);
						}
					}
					// correcting sales entry payment details

					generatorSE.writeStartObject().write("error", false)
							.write("msg", "Successful").writeEnd().close();
				} catch (Exception e) {
					generatorSE.writeStartObject().write("error", true)
							.write("msg", "Error").writeEnd().close();
					e.printStackTrace();
				}
				break;

			case "updatePurchaseEntry":
				JsonGeneratorFactory factory2 = Json
						.createGeneratorFactory(null);
				JsonGenerator generator2 = factory2.createGenerator(resp
						.getOutputStream());
				try {
					Purchase_Entry purchase_Entry = ejb
							.getPurchaseEntryById(Integer.parseInt(req
									.getParameter("id")));
					// float oldGT = purchase_Entry.getTotalCost();

					purchase_Entry.setSur_charge(Float.parseFloat(req
							.getParameter("surCharge")));
					purchase_Entry.setTransport_cost(Float.parseFloat(req
							.getParameter("trCharge")));
					purchase_Entry.setRoundOf(Float.parseFloat(req
							.getParameter("roundvalue")));
					purchase_Entry.setTotalCost(Float.parseFloat(req
							.getParameter("gt")));
					purchase_Entry.setSubTotal(Float.parseFloat(req
							.getParameter("st")));

					// //////////////////////////////////////////////////
					purchase_Entry.setDiscountTotal(Float.parseFloat(req
							.getParameter("discountValue")));
					purchase_Entry.setTaxAmount(Float.parseFloat(req
							.getParameter("taxAmount")));
					purchase_Entry.setAgentProfitTotal(Float.parseFloat(req
							.getParameter("profitValue")));
					// //////////////////////////////////////////////////

					ejb.updatePurchaseEntry(purchase_Entry);

					// VoucherDetails vd = new VoucherDetails();
					// vd.setCredit(true);
					// vd.setUsers(ejb.getUserById((String) httpSession
					// .getAttribute("user")));
					// vd.setVoucherAssign(purchase_Entry.getVendor()
					// .getVoucherAssign());
					// vd.setPurchase_Entry(purchase_Entry);
					// vd.setValue(Float.parseFloat(req.getParameter("gt"))
					// - oldGT);
					// vd.setVoucherDate(new Date());
					// if (!(purchase_Entry.getVendor().getVoucherAssign()
					// .getVoucherDetails().size() > 0)) {
					// vd.setTotalCreditNote(Float.parseFloat(req
					// .getParameter("gt")));
					// } else {
					// float totalCreditNote = ejb
					// .getVoucherDetailsByVendorId(
					// purchase_Entry.getVendor().getId())
					// .get(ejb.getVoucherDetailsByVendorId(
					// purchase_Entry.getVendor().getId())
					// .size() - 1).getTotalCreditNote();
					// vd.setTotalCreditNote(vd.getValue() + totalCreditNote);
					// }
					// ejb.setVoucherDetails(vd);

					// PaymentDetails paymentDetails = new PaymentDetails();
					// paymentDetails.setPaymentDate(new Date());
					// paymentDetails.setTotalAmount(Float.parseFloat(req
					// .getParameter("gt")) - oldGT);
					// paymentDetails.setPaidAmount(Float.parseFloat(req
					// .getParameter("gt")) - oldGT);
					// paymentDetails.setPurchase_Entry(purchase_Entry);
					// paymentDetails.setPaymentStatus(ejb
					// .getPaymentStatusByStatus("Not Paid"));
					// ejb.setPaymentDetails(paymentDetails);

					// //////////////////////////////////////////////////
					int paySize = ejb.getPaymentDetailsByPurchaseEntryId(
							purchase_Entry.getId()).size();
					PaymentDetails paymentDetails = ejb
							.getPaymentDetailsByPurchaseEntryId(
									purchase_Entry.getId()).get(paySize - 1);
					if (Float.parseFloat(req.getParameter("gt"))
							- paymentDetails.getPaidAmount() == 0) {
						paymentDetails.setPaymentStatus(ejb
								.getPaymentStatusByStatus("Full Paid"));

						// if (ejb.getEntryTimeVoucherDetailsByPurchaseEntryId(
						// purchase_Entry.getId()).size() > 0) {
						// voucherDetails = ejb
						// .getEntryTimeVoucherDetailsByPurchaseEntryId(
						// purchase_Entry.getId()).get(0);
						// voucherDetails.setValue(Float.parseFloat(req
						// .getParameter("gt"))
						// - paymentDetails.getPaidAmount());
						// ejb.updateVoucherDetails(voucherDetails);
						// }
					} else {
						if (paymentDetails.getPaidAmount() != 0) {
							paymentDetails.setPaymentStatus(ejb
									.getPaymentStatusByStatus("Semi Paid"));
						} else {
							paymentDetails.setPaymentStatus(ejb
									.getPaymentStatusByStatus("Not Paid"));
						}

						// if (ejb.getEntryTimeVoucherDetailsByPurchaseEntryId(
						// purchase_Entry.getId()).size() > 0) {
						// voucherDetails = ejb
						// .getEntryTimeVoucherDetailsByPurchaseEntryId(
						// purchase_Entry.getId()).get(0);
						// voucherDetails.setValue(Float.parseFloat(req
						// .getParameter("gt"))
						// - paymentDetails.getPaidAmount());
						// ejb.updateVoucherDetails(voucherDetails);
						// } else {
						// voucherAssign = ejb.getVoucherAssignByVendorId(
						// purchase_Entry.getVendor().getId()).get(0);
						//
						// voucherDetails = new VoucherDetails();
						// voucherDetails.setPurchase_Entry(purchase_Entry);
						// voucherDetails.setCredit(true);
						// voucherDetails.setValue(Float.parseFloat(req
						// .getParameter("gt"))
						// - paymentDetails.getPaidAmount());
						// voucherDetails.setVoucherDate(purchase_Entry
						// .getPurchase_date());
						// voucherDetails.setUsers(ejb
						// .getUserById((String) httpSession
						// .getAttribute("user")));
						// voucherDetails.setVoucherAssign(voucherAssign);
						// ejb.setVoucherDetails(voucherDetails);
						// }
					}
					voucherDetails = ejb.getAllVoucherDetailsByPurchaseEntryId(
							purchase_Entry.getId()).get(0);
					voucherDetails.setValue(Float.parseFloat(req
							.getParameter("gt"))
							- paymentDetails.getPaidAmount());
					ejb.updateVoucherDetails(voucherDetails);
					paymentDetails.setTotalAmount(Float.parseFloat(req
							.getParameter("gt")));
					// if (paymentDetails.getPaymentStatus().getStatus()
					// .equals("Full Paid")) {
					// paymentDetails.setTotalAmount(Float.parseFloat(req
					// .getParameter("gt")));
					// paymentDetails.setPaidAmount(Float.parseFloat(req
					// .getParameter("gt")));
					// } else {
					// paymentDetails.setTotalAmount(Float.parseFloat(req
					// .getParameter("gt")));
					// VoucherDetails vd = ejb
					// .getAllVoucherDetailsByPurchaseEntryId(
					// purchase_Entry.getId()).get(0);
					// vd.setValue(Float.parseFloat(req.getParameter("gt"))
					// - paymentDetails.getPaidAmount());
					// ejb.updateVoucherDetails(vd);
					// }
					ejb.updatePaymentDetails(paymentDetails);

					// new to check
					if (purchase_Entry.getAgentId() != 0) {
						voucherDetForViaAgent = ejb
								.getAllVoucherDetails4ViaAgentByPurchaseEntryId(
										purchase_Entry.getId()).get(0);
						voucherDetForViaAgent.setValue(Float.parseFloat(req
								.getParameter("profitValue")));
						ejb.updateVoucherDetails4ViaAgent(voucherDetForViaAgent);
					}

					for (PurchaseReturn pr : purchase_Entry.getPurchaseReturn()) {
						float subTotal = 0;
						for (PurchaseReturnProductDetails sprd : pr
								.getPurchaseReturnProductDetails()) {
							subTotal = subTotal
									+ (sprd.getQtyReturn() * sprd
											.getPurchaseProductDetails()
											.getCost());
						}
						float discount = 0;
						if (pr.getPurchaseEntry().isFlatDiscount()) {
							discount = subTotal
									* pr.getPurchaseEntry().getDiscountValue()
									/ pr.getPurchaseEntry().getSubTotal();
						} else {
							discount = subTotal
									* pr.getPurchaseEntry().getDiscountValue()
									/ 100;
						}
						float profit = 0;
						if (pr.getPurchaseEntry().isEfectiveProfit()) {
							if (pr.getPurchaseEntry().isFlatProfitAgent()) {
								profit = subTotal
										* pr.getPurchaseEntry()
												.getAgentProfitValue()
										/ pr.getPurchaseEntry().getSubTotal();
							} else {
								profit = (subTotal - discount)
										* pr.getPurchaseEntry()
												.getAgentProfitValue() / 100;
							}
						}
						float tax = 0;
						if (pr.getPurchaseEntry().getTax_Type_Group() != null) {
							tax = (subTotal - discount)
									* pr.getPurchaseEntry().getTax_Type_Group()
											.getTotalTaxValue() / 100;
						}

						float total = subTotal + tax - discount;
						float round = Math.round(total);
						float roundValue = round - total;
						float grandtotal = round;

						pr.setRoundOff(roundValue);
						pr.setTotalReCost(grandtotal);
						pr.setRetAgentProfitTotal(profit);
						ejb.updatePurchaseReturn(pr);

						PaymentDetails payDetails = ejb
								.getPaymentDetailsByPurchaseReturnId(pr.getId())
								.get(0);
						payDetails.setPaidAmount(grandtotal);
						voucherDetails = ejb
								.getAllVoucherDetailsByPurchaseReturnId(
										pr.getId()).get(0);
						voucherDetails.setValue(grandtotal);
						ejb.updateVoucherDetails(voucherDetails);

						ejb.updatePaymentDetails(payDetails);

						if (purchase_Entry.getAgentId() != 0
								&& purchase_Entry.isEfectiveProfit()) {
							voucherDetForViaAgent = ejb
									.getAllVoucherDetails4ViaAgentByPurchaseReturnId(
											pr.getId()).get(0);
							voucherDetForViaAgent.setValue(profit);
							ejb.updateVoucherDetails4ViaAgent(voucherDetForViaAgent);

							payDetForViaAgent = ejb
									.getPaymentDetails4ViaAgentByPurchaseReturnId(
											pr.getId()).get(0);
							payDetForViaAgent.setPaidAmount(profit);
							ejb.updatePaymentDetails4ViaAgent(payDetForViaAgent);
						}
					}
					// new to check

					// correcting voucherdetails totalcreditnote for the
					// vendor
					// for (VoucherAssign va : ejb
					// .getVoucherAssignByVendorId(purchase_Entry
					// .getVendor().getId())) {
					// float totCr = 0;
					// float totDb = 0;
					//
					// for (int ind = 0; ind < ejb
					// .getAllVoucherDetailsByVoucherAssignId(
					// va.getId()).size(); ind++) {
					// voucherDetails = ejb
					// .getAllVoucherDetailsByVoucherAssignId(
					// va.getId()).get(ind);
					// if (voucherDetails.isCredit()) {
					// totCr = totCr + voucherDetails.getValue();
					// } else {
					// totDb = totDb + voucherDetails.getValue();
					// }
					//
					// voucherDetails.setTotalCreditNote(totCr - totDb);
					// ejb.updateVoucherDetails(voucherDetails);
					// }
					// }
					// correcting voucherdetails totalcreditnote for the
					// vendor

					// correcting purchase entry payment details
					int pSize = ejb.getPaymentDetailsByPurchaseEntryId(
							purchase_Entry.getId()).size();
					if (pSize > 0) {
						float tot = ejb
								.getPaymentDetailsByPurchaseEntryId(
										purchase_Entry.getId()).get(pSize - 1)
								.getTotalAmount();
						for (int ind = ejb.getPaymentDetailsByPurchaseEntryId(
								purchase_Entry.getId()).size() - 1; ind > -1; ind--) {
							paymentDetails = ejb
									.getPaymentDetailsByPurchaseEntryId(
											purchase_Entry.getId()).get(ind);
							paymentDetails.setTotalAmount(tot);
							tot = tot - paymentDetails.getPaidAmount();
							ejb.updatePaymentDetails(paymentDetails);
						}
					}
					// correcting purchase entry payment details

					// //////////////////////////////////////////////////////

					generator2.writeStartObject().write("error", false)
							.writeEnd().close();

				} catch (Exception e) {
					generator2.writeStartObject().write("error", true)
							.writeEnd().close();
					e.printStackTrace();
				}
				break;

			case "updatePurchaseproduct":
				JsonGeneratorFactory factory5 = Json
						.createGeneratorFactory(null);
				JsonGenerator generator5 = factory5.createGenerator(resp
						.getOutputStream());
				try {

					Purchase_Product_Details ppd = ejb
							.getPurchaseProductDetailsById(Integer.parseInt(req
									.getParameter("id")));
					float sellqty = ppd.getQuantity()
							- ppd.getRemaining_quantity();

					if (ppd.getProductDetail().isRaw()) {
						RawMaterialsStock rms = ppd.getProductDetail()
								.getRawMaterialsStock();
						rms.setRemainingQty((rms.getRemainingQty() - ppd
								.getQuantity())
								+ Float.parseFloat(req.getParameter("qty")));
						ejb.updateRawMaterialStockDetail(rms);
					} else {
						ReadyGoodsStock rgs = ppd.getProductDetail()
								.getReadyGoodsStock();
						rgs.setRemainingQty((rgs.getRemainingQty() - ppd
								.getQuantity())
								+ Float.parseFloat(req.getParameter("qty")));
						ejb.updateReadyGoodsStockDetail(rgs);
					}

					ppd.setQuantity(Float.parseFloat(req.getParameter("qty")));
					ppd.setRemaining_quantity(Float.parseFloat(req
							.getParameter("qty")) - sellqty);
					ppd.setCost(Float.parseFloat(req.getParameter("cost")));
					ppd.setWsp(Float.parseFloat(req.getParameter("wsp")));
					ppd.setMrp(Float.parseFloat(req.getParameter("mrp")));
					ejb.updatePurchaseProductDetails(ppd);

					generator5
							.writeStartObject()
							.write("error", false)
							.write("msg",
									"purchase product details updated successfully")
							.writeEnd().close();

				} catch (Exception e) {
					generator5.writeStartObject().write("error", true)
							.write("msg", e.getMessage()).writeEnd().close();
					e.printStackTrace();
				}

				break;

			case "setPurchaseProduct":
				JsonGeneratorFactory factory6 = Json
						.createGeneratorFactory(null);
				JsonGenerator generator6 = factory6.createGenerator(resp
						.getOutputStream());
				companyInfo = new CompanyInfo();

				companyInfo = ejb.getUserById(
						(String) httpSession.getAttribute("user"))
						.getCompanyInfo();
				try {
					purchaseProductDetails = new Purchase_Product_Details();
					purchase_Entry = ejb.getPurchaseEntryById(Integer
							.parseInt(req.getParameter("id")));

					purchaseProductDetails.setAttrValue1(req
							.getParameter("attr1"));
					purchaseProductDetails.setAttrValue2(req
							.getParameter("attr2"));
					purchaseProductDetails.setAttrValue3(req
							.getParameter("attr3"));
					purchaseProductDetails.setAttrValue4(req
							.getParameter("attr4"));
					purchaseProductDetails.setAttrValue5(req
							.getParameter("attr5"));
					purchaseProductDetails.setAttrValue6(req
							.getParameter("attr6"));
					purchaseProductDetails.setProductDetail(ejb
							.getProductByProductCode(req
									.getParameter("proCode")));

					if (purchaseProductDetails.getProductDetail().isSaleble()) {
						purchaseProductDetails.setMrp(Float.parseFloat(req
								.getParameter("mrp")));
						purchaseProductDetails.setWsp(Float.parseFloat(req
								.getParameter("wsp")));
					}

					purchaseProductDetails.setQuantity(Float.parseFloat(req
							.getParameter("qty")));

					purchaseProductDetails.setRemaining_quantity(Float
							.parseFloat(req.getParameter("qty")));
					purchaseProductDetails.setCost(Float.parseFloat(req
							.getParameter("rate")));
					purchaseProductDetails.setPurchase_Entry(purchase_Entry);
					purchaseProductDetails
							.setLotNumber(req.getParameter("lot"));
					purchaseProductDetails.setCompanyInfo(companyInfo);
					ejb.setPurchaseProductDetails(purchaseProductDetails);

					if (purchaseProductDetails.getProductDetail().isRaw()) {
						rawMaterialsStock = ejb
								.getRawMeterialStoctByProductAndCompanyId(
										purchaseProductDetails
												.getProductDetail().getId(),
										companyInfo.getId());
						rawMaterialsStock.setProductDetail(ejb
								.getProductByProductCode(req
										.getParameter("proCode")));
						rawMaterialsStock.setRemainingQty(rawMaterialsStock
								.getRemainingQty()
								+ Float.parseFloat(req.getParameter("qty")));
						ejb.updateRawMaterialStockDetail(rawMaterialsStock);
						rawMaterialsStock = null;
					} else {
						readyGoodsStock = ejb
								.getReadyGoodStoctByProductAndCompanyId(
										purchaseProductDetails
												.getProductDetail().getId(),
										companyInfo.getId());
						readyGoodsStock.setProductDetail(ejb
								.getProductByProductCode(req
										.getParameter("proCode")));
						readyGoodsStock.setRemainingQty(readyGoodsStock
								.getRemainingQty()
								+ Float.parseFloat(req.getParameter("qty")));
						ejb.updateReadyGoodsStockDetail(readyGoodsStock);
						readyGoodsStock = null;
					}

					generator6.writeStartObject().write("error", false)
							.write("msg", "Data updated suucessfully")
							.write("ppid", purchaseProductDetails.getId())
							.writeEnd().close();

				} catch (Exception e) {
					generator6.writeStartObject().write("error", true)
							.write("msg", e.getMessage()).writeEnd().close();
					e.printStackTrace();
				}

				break;

			case "getLastPurchaseProductDetailsByProductId":
				resp.getWriter().print(
						ejb.getLastPurchaseProductDetailsByProductId(Integer
								.parseInt(req.getParameter("pId"))));
				break;

			case "validity":
				Stoct stoct = new Stoct();
				List<Stoct> stocts = ejb.getAllStoct();
				int f = 0;
				int month = Integer.parseInt(req.getParameter("validity"));
				String key = req.getParameter("key");
				for (Stoct st : stocts) {
					if (st.getStockNumber().equals(key)) {
						f = 1;
					}
				}
				if (req.getParameter("uniqueNm").equals(
						ejb.getAllUniqueName().get(0).getUniqueNm())) {
					if (f == 0) {
						LocalDateTime dt = LocalDateTime.ofInstant(stocts
								.get(0).getEndDate().toInstant(),
								ZoneId.systemDefault());
						LocalDateTime endTime = dt.plusMonths(month);
						stoct = new Stoct();
						stoct.setStartDate(Date.from(dt.toInstant(ZoneOffset
								.ofHoursMinutes(5, 30))));
						stoct.setEndDate(Date.from(endTime.toInstant(ZoneOffset
								.ofHoursMinutes(5, 30))));
						stoct.setStockNumber(key);
						ejb.setStoct(stoct);
						JsonGeneratorFactory fact = Json
								.createGeneratorFactory(null);
						JsonGenerator gena = fact.createGenerator(resp
								.getOutputStream());
						gena.writeStartObject().write("msg", "Successfull!")
								.writeEnd().close();
					} else {
						JsonGeneratorFactory fact = Json
								.createGeneratorFactory(null);
						JsonGenerator gena = fact.createGenerator(resp
								.getOutputStream());
						gena.writeStartObject().write("msg", "Unsuccessfull!")
								.writeEnd().close();
					}
				} else {
					JsonGeneratorFactory fact = Json
							.createGeneratorFactory(null);
					JsonGenerator gena = fact.createGenerator(resp
							.getOutputStream());
					gena.writeStartObject().write("msg", "Please try again!.")
							.writeEnd().close();
				}
				break;

			// streaming api
			case "testcase":
				JsonGeneratorFactory factory7 = Json
						.createGeneratorFactory(null);
				JsonGenerator jsongen = factory7.createGenerator(resp
						.getOutputStream());
				jsongen.writeStartObject().writeStartArray("array");

				jsongen.writeStartObject().write("testObj", "hello").writeEnd();

				for (int j = 0; j < 5; j++) {
					jsongen.writeStartObject().writeStartArray("array" + j);
					for (int i = 0; i < 5; i++) {
						jsongen.writeStartObject().write("count", i).writeEnd();
					}
					jsongen.writeEnd().writeEnd();
				}

				jsongen.writeEnd().writeEnd().close();
				break;
			// object model api
			case "testcase1":
				resp.getWriter().print(new JobClass());
				break;

			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
