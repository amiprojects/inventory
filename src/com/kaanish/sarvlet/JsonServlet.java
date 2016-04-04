package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.kaanish.model.Department;
import com.kaanish.model.JobAssignmentProducts;
import com.kaanish.model.JobPlan;
import com.kaanish.model.JobsForDesignCostSheet;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.ProductImage;
import com.kaanish.model.ProductsForDesignCostSheet;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.Purchase_Product_Details;
import com.kaanish.model.QtyUnit;
import com.kaanish.model.QtyUnitConversionPK;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.RawMaterialsStock;
import com.kaanish.model.ReadyGoodsStock;
import com.kaanish.model.SampleDesignCostSheet;
import com.kaanish.model.SerialNumber;
import com.kaanish.model.State;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Vendor;
import com.kaanish.model.VoucherDetails;
import com.kaanish.util.Base64;
import com.kaanish.util.DateConverter;
import com.kaanish.util.DepartmentCotractor;

@WebServlet({ "/getcountry", "/addNewUOMtype", "/getUOMtype",
		"/getAllDepartments", "/getProductByDescription", "/getStateByCountry",
		"/getStateByCountryByStateName", "/getCity", "/getCityByName",
		"/getQtyUnit", "/getQtyUnitConversion", "/getVendorByVendorType",
		"/getQtyConversion", "/getVendorByVendorId", "/getAccountByVendorId",
		"/getTaxGroupById", "/getproductPro", "/getPurchasebyPro",
		"/getAccountDetails", "/getProductDetailById", "/getCategoryById",
		"/getProductImageByProductid", "/getJobberDetailsByName",
		"/getProdDetByPurchaseProdDetailsId", "/getStateByCityName",
		"/getAllQtyUnitByNameOrAbv", "/getAgentDetails",
		"/getCityByStateByCityName", "/getVendorTypeById",
		"/getProductbyProductCode",
		"/getSaleblePurchaseProductDetailsByProductCodeAndQuantity",
		"/getVendorsByVendorTypeJobberAndName", "/getProductsForSaleByCode",
		"/deleteUOM", "/getVendorsByVendorTypeSalesAgentAndName",
		"/getSalesAgentDetailsById", "/getPurchaseProductDetailsByIdForSale",
		"/getCustomerByPh", "/checkPcode", "/addVendorbyjson", "/addAgen",
		"/getVendorByType", "/addUOMjson", "/getuomByType", "/getDeptjson",
		"/getSubByDepjson", "/getCatBySubjson", "/addJsonCity",
		"/addJsonState", "/addJsonCountry", "/productSumaryJson",
		"/getVendorsByNameAndType", "/getVendorsByVendorTypeVendorAndName",
		"/getVendorsByVendorTypePurchaseAgentAndName", "/getCustomerByName",
		"/getCriticalStock", "/getSampleDesignCostSheetByDesignNumber",
		"/getProductDetailsByDesignNumberAndQuantity",
		"/getPurchaseProductDetailsByProductCode",
		"/getJobsForDesignCostSheetByProductSForSampleId",
		"/getProductImagejson",
		"/getPlannedSampleDesignCostSheetByDesignNumber",
		"/getAllOngoingJobPlanByDesignNumber",
		"/getProductAndDesignDetailsAndJobPlanByJobPlanId",
		"/getJobsForDesignCostSheetByPlanId",
		"/getOngoingJobAssignmentsByPlanId", "/getJonsonDateFinancial",
		"/getVendorsByVendorTypeDesignerAndName",
		"/getDesignImageBySampleJobId", "/getPlanNumbersById",
		"/updatePurchaseEntry", "/updatePurchaseproduct",
		"/getAllJobPlanByDesignNumber", "/getAllJobPlans",
		"/setPurchaseProduct",
		"/getSampleDesignCostSheetByDesignNumberForDuplicateCheck",
		"/getItmProductsForSampleByProductId" })
public class JsonServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;
	private QtyUnitType qtyUnitType;
	private PrintWriter pw;
	private String name;
	private Purchase_Product_Details purchase_Product_Details;
	private Purchase_Entry purchase_Entry;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		resp.setContentType("application/json");
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

			case "getItmProductsForSampleByProductId":
				resp.getWriter().print(
						ejb.getItmProductsForSampleByProductId(Integer
								.parseInt(req.getParameter("id"))));
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

			case "getProductbyProductCode":
				pw = resp.getWriter();
				pw.print(ejb.getAllProductByProductCode(req
						.getParameter("code")));
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
							.writeEnd();
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

								// if
								// (ejb.getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
								// Integer.parseInt(req
								// .getParameter("japId")),
								// jdcs.getId()).getRemQty() > 0
								// &&
								// ejb.getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
								// Integer.parseInt(req
								// .getParameter("japId")),
								// jdcs.getId()).getRemQty() == ejb
								// .getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
								// Integer.parseInt(req
								// .getParameter("japId")),
								// jdcs.getId()).getQty()) {

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

			case "getProductByDescription":
				pw = resp.getWriter();
				pw.print(ejb.getProductDetailByCode(req
						.getParameter("descriptionName")));
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
			case "checkPcode":

				resp.getWriter().print(
						ejb.getProductByProductCode(req
								.getParameter("productCode4")));
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
					System.out.println(req.getParameter("isRaw"));
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
							// .write("jpDesc", jp.getDescription())
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

			case "updatePurchaseEntry":
				JsonGeneratorFactory factory2 = Json
						.createGeneratorFactory(null);
				JsonGenerator generator2 = factory2.createGenerator(resp
						.getOutputStream());
				try {
					Purchase_Entry purchase_Entry = ejb
							.getPurchaseEntryById(Integer.parseInt(req
									.getParameter("id")));
					float oldGT = purchase_Entry.getTotalCost();

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

					ejb.updatePurchaseEntry(purchase_Entry);

					VoucherDetails vd = new VoucherDetails();
					vd.setCredit(true);
					vd.setUsers(ejb.getUserById((String) httpSession
							.getAttribute("user")));
					vd.setVoucherAssign(purchase_Entry.getVendor()
							.getVoucherAssign());
					vd.setPurchase_Entry(purchase_Entry);
					vd.setValue(Float.parseFloat(req.getParameter("gt"))
							- oldGT);
					vd.setVoucherDate(new Date());

					if (!(purchase_Entry.getVendor().getVoucherAssign()
							.getVoucherDetails().size() > 0)) {
						vd.setTotalCreditNote(Float.parseFloat(req
								.getParameter("gt")));
					} else {
						float totalCreditNote = ejb
								.getVoucherDetailsByVendorId(
										purchase_Entry.getVendor().getId())
								.get(ejb.getVoucherDetailsByVendorId(
										purchase_Entry.getVendor().getId())
										.size() - 1).getTotalCreditNote();
						vd.setTotalCreditNote(vd.getValue() + totalCreditNote);
					}

					ejb.setVoucherDetails(vd);

					PaymentDetails paymentDetails = new PaymentDetails();

					paymentDetails.setPaymentDate(new Date());
					paymentDetails.setTotalAmount(Float.parseFloat(req
							.getParameter("gt")) - oldGT);
					paymentDetails.setPaidAmount(Float.parseFloat(req
							.getParameter("gt")) - oldGT);

					paymentDetails.setPurchase_Entry(purchase_Entry);

					paymentDetails.setPaymentStatus(ejb
							.getPaymentStatusByStatus("Not Paid"));
					ejb.setPaymentDetails(paymentDetails);

					generator2.writeStartObject().write("error", false)
							.writeEnd().close();

				} catch (Exception e) {
					generator2.writeStartObject().write("error", true)
							.writeEnd().close();
					System.out.println(e.getMessage());
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
