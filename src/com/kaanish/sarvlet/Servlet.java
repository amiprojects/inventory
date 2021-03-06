package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.omg.PortableInterceptor.INACTIVE;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.AccountDetails;
import com.kaanish.model.ApprovalEntry;
import com.kaanish.model.ApprovalProductDetails;
import com.kaanish.model.ApprovalReturn;
import com.kaanish.model.ApprovalReturnProductDetails;
import com.kaanish.model.Bill_setup;
import com.kaanish.model.Category;
import com.kaanish.model.City;
import com.kaanish.model.CompanyInfo;
import com.kaanish.model.Country;
import com.kaanish.model.CustomerEntry;
import com.kaanish.model.Department;
import com.kaanish.model.DesignImage;
import com.kaanish.model.ItemDetails;
import com.kaanish.model.ItmProductsForSample;
import com.kaanish.model.JobAssignmentDetails;
import com.kaanish.model.JobAssignmentJobDetails;
import com.kaanish.model.JobAssignmentProducts;
import com.kaanish.model.JobPlan;
import com.kaanish.model.JobPlanJobStock;
import com.kaanish.model.JobPlanProductStock;
import com.kaanish.model.JobPlanProducts;
import com.kaanish.model.JobReceiveJobDetails;
import com.kaanish.model.JobRecieveProductsDetails;
import com.kaanish.model.JobRecievedDetails;
import com.kaanish.model.JobStock;
import com.kaanish.model.JobTypes;
import com.kaanish.model.JobsForDesignCostSheet;
import com.kaanish.model.PageList;
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
import com.kaanish.model.QtyUnitConversion;
import com.kaanish.model.QtyUnitConversionPK;
import com.kaanish.model.RawMaterialsStock;
import com.kaanish.model.ReadyGoodsStock;
import com.kaanish.model.SalesEntry;
import com.kaanish.model.SalesProductDetails;
import com.kaanish.model.SalesProductReturnDetail;
import com.kaanish.model.SalesReturn;
import com.kaanish.model.SampleDesignCostSheet;
import com.kaanish.model.SecurityAnswers;
import com.kaanish.model.SerialNumber;
import com.kaanish.model.State;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.UserGroup;
import com.kaanish.model.Users;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;
import com.kaanish.model.VoucherAssign;
import com.kaanish.model.VoucherDetails;
import com.kaanish.model.VoucherDetailsForViaAgents;
import com.kaanish.util.Base64;
import com.kaanish.util.DateConverter;
import com.kaanish.util.GetMacId;

@MultipartConfig
@WebServlet({ "/logout", "/addTax", "/addTaxGroup", "/editTax", "/deleteTax",
		"/editTaxGroup", "/deleteTaxGroup", "/stockDetailShow", "/createDept",
		"/deleteDept", "/createSubDept", "/deleteSubDept",
		"/editproductSummary", "/createCategory", "/deleteCategory",
		"/newVendorType", "/addCountry", "/addState", "/createProduct",
		"/deleteCountry", "/addVendor", "/addUOM", "/editVendorType",
		"/deleteVendorType", "/addCity", "/deleteState", "/deleteCity",
		"/productSumary", "/addNewConversion", "/purchaseEntry",
		"/updateConversion", "/addBillSetup", "/updateCompanyInfo",
		"/updateVendor", "/purchaseSearchByDate", "/uploadProductImage",
		"/deleteProductImage", "/jobAssignment", "/jobAssignSearchByDate",
		"/salesEntry", "/createUserGroup", "/updateUserGroup", "/updateUser",
		"/goStockView", "/jChallanSearch", "/jobRecieve", "/createNewUser",
		"/goJobDetailShow", "/goProView", "/purchaseView", "/changePass",
		"/goSearchVendor", "/purchaseSearchByPurchaseChallanNo",
		"/purchaseSearchByVendorName", "/purchaseSearchByAgentName",
		"/purchaseSearchByProductCode", "/jobSearchByJobChallanNo",
		"/jobSearchByProductCode", "/jobSearchByJobberName", "/goSalesReturn",
		"/salesSearchByDate", "/salesSearchBySalesChallanNo",
		"/salesSearchByAgentName", "/salesSearchByCustomerName",
		"/salesSearchByProductCode", "/salesView", "/purchaseBarCode",
		"/salesReturnServlet", "/purchaseSearchAll", "/salesSearchAll",
		"/jobSearchAll", "/forgotPassUserCheck", "/forgotPassVarify",
		"/resetPass", "/purchaseSearchForReturn", "/purchaseReturn",
		"/setJobTypes", "/updateJob", "/sampleJobCost", "/allPurchaseReport",
		"/purchaseReportByProductCode", "/purchaseReportByVendorName",
		"/purchaseReportByDate", "/purchaseReportByAgentName",
		"/purchaseProductView", "/purchaseReportView", "/salesProductView",
		"/salesReportView", "/salesReportByCustomerName",
		"/salesReportByAgentName", "/dayBookreport",
		"/jobAssignmentForParticularDesignNumber",
		"/jobAssignmentForOngoingJobs", "/sampleJobSearchAll",
		"/sampleJobSearchByDesignNo", "/sampleJobSearchByDesignerName",
		"/sampleJobCostSheetView", "/jobSearchByPlanNo", "/purchaseEdit",
		"/jobReceiveFromSearch", "/setItems", "/updateItems",
		"/completePlanAndProductSumaryProduction", "/purchaseProductionView",
		"/purchaseProductionSearchAll", "/purchaseProductionSearchByDate",
		"/purchaseProductionSearchByPurchaseChallanNo",
		"/purchaseProductionSearchByProductCode", "/jobSearchAllForPayment",
		"/jobAssignSearchByDateForPayment",
		"/jobSearchByJobChallanNoForPayment",
		"/jobSearchByProductCodeForPayment",
		"/jobSearchByJobberNameForPayment", "/jobSearchByPlanNoForPayment",
		"/jobPayment", "/purchasePayment", "/salesPayment",
		"/creditNoteByVendorName", "/creditNoteByAgentName",
		"/creditNoteByJobber", "/debitNoteByCustomer", "/testServManage",
		"/salesReturnSearchAll", "/salesReturnView",
		"/salesRerturnSearchByDate", "/salesReturnSearchByChallanNo",
		"/salesReturnSearchByRefChallanNo", "/salesReturnSearchByCustomerName",
		"/salesReturnSearchByAgentName", "/salesReturnSearchByProductCode",
		"/salesEdit", "/purchaseReturnSearchAll", "/purchaseReturnView",
		"/purchaseReturnSearchByDate", "/purchaseRetSearchByRefChallanNo",
		"/purchaseRetSearchByProductCode", "/purchaseRetSearchByVendorName",
		"/purchaseRetSearchByAgentName", "/purchaseRetSearchByChallanNo",
		"/salesSearchAllForAgent", "/salesSearchByDateForAgent",
		"/salesSearchBySalesChallanNoForAgent",
		"/salesSearchByAgentNameForAgent",
		"/salesSearchByCustomerNameForAgent",
		"/salesSearchByProductCodeForAgent", "/salesAgentPayment",
		"/creditNoteBySalesAgentName", "/purchaseSearchAllForViaPurchaseAgent",
		"/purchaseSearchByDateForViaPurchaseAgent",
		"/purchaseSearchByPurchaseChallanNoForViaPurchaseAgent",
		"/purchaseSearchByProductCodeForViaPurchaseAgent",
		"/purchaseSearchByVendorNameForViaPurchaseAgent",
		"/purchaseSearchByAgentNameForViaPurchaseAgent",
		"/purchaseSearchByViaAgentName", "/purchaseRetSearchByViaAgentNamet",
		"/purchaseAgentPayment", "/creditNoteByViaPurchaseAgentName",
		"/jobSearchByDesignNo", "/jobSearchByDesignNoForPayment",
		"/uploadSampleCostSheetImage", "/deleteSampleCostSheetImage",
		"/approvalEntry", "/approvalSearchAll", "/approvalSearchByDate",
		"/approvalSearchByChallanNumber", "/approvalSearchByAgentName",
		"/approvalSearchByCustomerName", "/approvalSearchByProductCode",
		"/approvalView", "/approvalSearchForReturn", "/approvalReturn",
		"/approvalReturnSearchAll", "/approvalRerturnSearchByDate",
		"/approvalReturnSearchByBillNo", "/approvalReturnSearchByRefBillNo",
		"/approvalReturnSearchByAgentName",
		"/approvalReturnSearchByCustomerName",
		"/approvalReturnSearchByProductCode", "/approvalReturnView" })
public class Servlet extends HttpServlet {
	static final long serialVersionUID = 1L;

	@EJB
	private Ejb ejb;
	private HttpSession httpSession;
	private Date dt;
	private Users users;
	private String page;
	private String msg;
	private String url;
	private Tax tax;
	private Tax_Type_Group tax_type_group;
	private Department department;
	private SubDepartment subDepartment;
	private Category category;
	private VendorType vendorType;
	private Country country;
	private State state;
	private City city;
	private ProductDetail productDetail;
	private Vendor vendor;
	private AccountDetails accountDetails;
	private QtyUnit qtyUnit;
	private QtyUnitConversion qtyUnitConversion;
	private QtyUnitConversionPK qtyUnitConversionPK;
	private Bill_setup billSetup;
	private CompanyInfo companyInfo;
	private Purchase_Entry purchaseEntry;
	private Purchase_Product_Details purchaseProductDetails;
	private RawMaterialsStock rawMaterialsStock;
	private ReadyGoodsStock readyGoodsStock;
	private SerialNumber serialNumber;
	private PaymentDetails paymentDetails;
	private JobAssignmentDetails jobAssignmentDetails;
	private JobAssignmentProducts jobAssignmentProducts;
	private JobRecievedDetails jobRecievedDetails;
	private JobStock jobStock;
	private CustomerEntry customerEntry;
	private SalesEntry salesEntry;
	private UserGroup userGroup;
	private Users usr;
	private SalesProductDetails salesProductDetails;
	private SalesReturn salesReturn;
	private SalesProductReturnDetail salesProductReturnDetail;
	private SecurityAnswers securityAnswers;
	private VoucherAssign voucherAssign;
	private VoucherDetails voucherDetails;
	private PurchaseReturn purchaseReturn;
	private PurchaseReturnProductDetails purchaseReturnProductDetails;
	private JobTypes jobTypes;
	private SampleDesignCostSheet sampleDesignCostSheet;
	private JobsForDesignCostSheet jobsForDesignCostSheet;
	private ProductsForDesignCostSheet productsForDesignCostSheet;
	private DesignImage designImage;
	private JobPlan jobPlan;
	private JobPlanProductStock jobPlanProductStock;
	private JobAssignmentJobDetails jobAssignmentJobDetails;
	private JobPlanProducts jobPlanProducts;
	private JobPlanJobStock jobPlanJobStock;
	private JobRecieveProductsDetails jobRecieveProductsDetails;
	private JobReceiveJobDetails jobReceiveJobDetails;
	private ItemDetails itemDetails;
	private ItmProductsForSample itmProductsForSample;
	private VoucherDetailsForViaAgents voucherDetForViaAgent;
	private PaymentDetailsForViaAgents payDetForViaAgent;
	int uniqueNo;
	private ApprovalEntry approvalEntry;
	private ApprovalProductDetails approvalProductDetails;
	private ApprovalReturn approvalReturn;
	private ApprovalReturnProductDetails approvalReturnProductDetails;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		httpSession = req.getSession();

		if (httpSession.getAttribute("user") == null) {
			if (!(url.equals("forgotPassUserCheck")
					|| url.equals("forgotPassVarify") || url
						.equals("resetPass"))) {
				// System.exit(0);
				page = "index.jsp";
				httpSession.removeAttribute("user");
				httpSession.removeAttribute("sip");
				httpSession.removeAttribute("port");
				msg = "Login please!";
			}
		} else {

			if (!GetMacId
					.getSerialNumberOfKaanishExternalHDD(
							"USBSTORDISK&VEN_SEAGATE&PROD_EXPANSION&REV_0636NA49JMSK&0",
							httpSession.getAttribute("user").toString())) {
				page = "index.jsp";
				httpSession.removeAttribute("user");
				httpSession.removeAttribute("sip");
				httpSession.removeAttribute("port");
				msg = "No Data Found!";
			} else {

				try {
					switch (url) {

					case "testServManage":
						if (verifyParams(req, resp, "name", "desc")) {
							page = "tempTestServManage.jsp";
							req.setAttribute("msg", "Please try again!");
							req.getRequestDispatcher(page).forward(req, resp);
							return;
						}

						if (req.getParameter("yn").equals("yes")) {
							if (verifyParams(req, resp, "iName")) {
								page = "tempTestServManage.jsp";
								req.setAttribute("msg", "Please try again (i)!");
								req.getRequestDispatcher(page).forward(req,
										resp);
								return;
							}
						}

						page = "tempTestServManage.jsp";
						jobTypes = new JobTypes();
						jobTypes.setJobName(req.getParameter("name"));
						jobTypes.setJobDescription(req.getParameter("desc"));
						ejb.setJobTypes(jobTypes);
						if (req.getParameter("yn").equals("yes")) {
							itemDetails = new ItemDetails();
							itemDetails.setName(req.getParameter("iName"));
							ejb.setItemDetails(itemDetails);
						}
						msg = "Successfull";
						break;

					case "logout":
						page = "index.jsp";
						httpSession.removeAttribute("user");
						httpSession.removeAttribute("sip");
						httpSession.removeAttribute("port");
						msg = "Logout Successfull.";
						break;

					case "changePass":
						String user = (String) httpSession.getAttribute("user");
						if (ejb.getCheckLogin(user,
								req.getParameter("curPassword"))) {
							users = ejb.getUserById(user);
							users.setPassword(req.getParameter("newPassword"));
							ejb.updateUser(users);
							msg = "Password changed successfully.";
							page = "index.jsp";
						} else {
							msg = "Invalid current Password.";
							page = "changePassword.jsp";
							// httpSession.removeAttribute("user");
						}
						break;
					case "forgotPassUserCheck":
						int uChk = 0;
						for (Users u : ejb.getAllUsers()) {
							if (u.getUserId().equals(
									req.getParameter("userName"))) {
								uChk = 1;
							}
						}
						if (uChk == 1) {
							page = "forgotPasswordVarification.jsp";
							req.setAttribute("userName",
									req.getParameter("userName"));
							msg = "";
						} else {
							page = "forgotPassword.jsp";
							msg = "UserId does not exist...";
						}
						break;
					case "forgotPassVarify":
						page = "forgotPasswordReset.jsp";
						msg = "";
						req.setAttribute("uId", req.getParameter("uId"));
						break;
					case "resetPass":
						page = "index.jsp";
						usr = ejb.getUserById(req.getParameter("uId"));
						usr.setPassword(req.getParameter("newPassword"));
						ejb.updateUser(usr);
						msg = "Password reset is successfull...";
						break;

					case "updateCompanyInfo":
						page = "setupCompanyInfo.jsp";
						companyInfo = ejb.getUserById(
								(String) httpSession.getAttribute("user"))
								.getCompanyInfo();

						// if (companyInfo.getChangeCount() < 3) {
						companyInfo.setCompname(req.getParameter("name")
								.toUpperCase());
						companyInfo.setEmail(req.getParameter("email"));
						companyInfo.setMobile(req.getParameter("mono"));
						companyInfo.setPhone(req.getParameter("phno"));
						companyInfo.setAddr(req.getParameter("adress")
								.toUpperCase());
						companyInfo.setCity(req.getParameter("city")
								.toUpperCase());
						companyInfo.setCountry1(req.getParameter("country1")
								.toUpperCase());
						companyInfo.setState(req.getParameter("state")
								.toUpperCase());
						companyInfo.setVatno(req.getParameter("vatno")
								.toUpperCase());
						companyInfo.setCstno(req.getParameter("cstno")
								.toUpperCase());
						companyInfo.setTinno(req.getParameter("tinno")
								.toUpperCase());
						companyInfo.setServicetaxno(req
								.getParameter("servicet"));
						companyInfo.setVatdate(req.getParameter("vatdate"));
						companyInfo.setCstdate(req.getParameter("cstDate"));
						companyInfo.setTindate(req.getParameter("tinDate"));
						companyInfo.setServtaxdate(req
								.getParameter("serviceDate"));
						companyInfo
								.setChangeCount(companyInfo.getChangeCount() + 1);

						Part p = req.getPart("proImg");
						InputStream is = p.getInputStream();
						byte[] content = new byte[is.available()];
						is.read(content);
						if (!(content.length == 0)) {
							companyInfo.setImage(content);
						}

						companyInfo.setBarcodeHeader(req.getParameter(
								"barcodeHeader").toUpperCase());
						if (req.getParameter("isMRPbarcode").equals("mrpBar")) {
							companyInfo.setMRPbarcode(true);
						} else {
							companyInfo.setMRPbarcode(false);
						}
						if (req.getParameter("isPurchaseAgentShow").equals(
								"yes")) {
							companyInfo.setPurchaseAgentShow(true);
						} else {
							companyInfo.setPurchaseAgentShow(false);
						}
						if (req.getParameter("isSalesAgentShow").equals("yes")) {
							companyInfo.setSalesAgentShow(true);
						} else {
							companyInfo.setSalesAgentShow(false);
						}
						ejb.updateCompanyInfo(companyInfo);
						msg = "Company info updated successfully.";
						// } else {
						// msg = "You have already change companyinfo maximum
						// limit.";
						// }

						break;
					case "createProduct":
						page = "setupDepartment.jsp";
						productDetail = new ProductDetail();
						productDetail.setProductType(req.getParameter("name"));
						productDetail.setName(req.getParameter("productName"));
						productDetail.setCode(req.getParameter("productCode"));
						productDetail.setCategory(ejb.getCategoryById(Integer
								.parseInt(req.getParameter("catId"))));

						ejb.setProductDetail(productDetail);
						msg = "Product detail added successfully.";
						break;

					case "productSumary":
						page = "MaterialPartDetailsGenerals.jsp";
						companyInfo = ejb.getUserById(
								(String) httpSession.getAttribute("user"))
								.getCompanyInfo();

						int flagg = 0;
						List<ProductDetail> pro1 = ejb.getAllProductDetail();
						for (ProductDetail pqu : pro1) {
							if (pqu.getCode().equals(
									req.getParameter("productCode")
											.toUpperCase())) {
								flagg = 1;
								break;
							}

						}
						if (flagg == 0) {
							productDetail = new ProductDetail();
							purchaseProductDetails = new Purchase_Product_Details();
							productDetail.setCode(req.getParameter(
									"productCode").toUpperCase());
							productDetail.setDescription(req.getParameter(
									"description").toUpperCase());
							productDetail.setUniversalCode(req.getParameter(
									"upc").toUpperCase());
							productDetail.setQtyUnit(ejb.getQtyUnitById(Integer
									.parseInt(req.getParameter("uom"))));
							productDetail.setRaw(Boolean.parseBoolean(req
									.getParameter("isRaw")));
							productDetail.setSaleble(Boolean.parseBoolean(req
									.getParameter("isSalebi")));
							productDetail.setCategory(ejb
									.getCategoryById(Integer.parseInt(req
											.getParameter("catagoryId"))));
							productDetail.setActive(true);
							ejb.setProductDetail(productDetail);

							if (Boolean.parseBoolean(req.getParameter("isRaw"))) {
								rawMaterialsStock = new RawMaterialsStock();
								rawMaterialsStock
										.setProductDetail(productDetail);
								rawMaterialsStock.setRemainingQty(0);
								rawMaterialsStock.setCompanyInfo(companyInfo);
								ejb.setRawMaterialsStocktDetail(rawMaterialsStock);
							} else {
								readyGoodsStock = new ReadyGoodsStock();
								readyGoodsStock.setProductDetail(productDetail);
								readyGoodsStock.setRemainingQty(0);
								readyGoodsStock.setCompanyInfo(companyInfo);
								ejb.setReadyGoodsStockDetail(readyGoodsStock);
								readyGoodsStock = null;
							}

							if (req.getParameter("addini").equals("add")) {

								purchaseProductDetails.setMrp(Float
										.parseFloat(req.getParameter("mrp1")));
								purchaseProductDetails.setWsp(Float
										.parseFloat(req.getParameter("wsp1")));
								purchaseProductDetails.setQuantity(Float
										.parseFloat(req.getParameter("qty1")));
								purchaseProductDetails.setCost(Float
										.parseFloat(req.getParameter("ucost")));
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
								purchaseProductDetails
										.setRemaining_quantity(Float
												.parseFloat(req
														.getParameter("qty1")));
								purchaseProductDetails
										.setInitialInventory(true);
								purchaseProductDetails
										.setProductDetail(productDetail);
								purchaseProductDetails.setLotNumber(req
										.getParameter("lotnumberS"));
								purchaseProductDetails.setCompanyInfo(ejb
										.getUserById(
												(String) httpSession
														.getAttribute("user"))
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

							msg = "Added successfully.";
						} else {
							msg = "Duplicate Product entry";
						}

						break;

					case "completePlanAndProductSumaryProduction":
						page = "jobPlanSearch.jsp";
						companyInfo = ejb.getUserById(
								(String) httpSession.getAttribute("user"))
								.getCompanyInfo();

						List<Purchase_Entry> purEntry = ejb
								.getAllPurchaseEntry();
						int chP = 0;
						for (Purchase_Entry pe : purEntry) {
							if (pe.getChallanNumber().equals(
									req.getParameter("challanNumber"))) {
								chP = 1;
								break;
							}
						}
						if (chP == 0) {
							if (req.getParameter("isExistProdInSample").equals(
									"yes")) {
								productDetail = ejb
										.getProductDetailByDesignNumber(req
												.getParameter("upc"));
							} else {
								productDetail = new ProductDetail();
								productDetail.setCode(req.getParameter(
										"productCode").toUpperCase());
								productDetail.setDescription(req.getParameter(
										"description").toUpperCase());
								productDetail.setUniversalCode(req
										.getParameter("upc").toUpperCase());
								productDetail.setQtyUnit(ejb
										.getQtyUnitById(Integer.parseInt(req
												.getParameter("uom"))));
								productDetail.setRaw(false);
								productDetail.setSaleble(true);
								productDetail.setCategory(ejb
										.getCategoryById(Integer.parseInt(req
												.getParameter("catagoryId"))));
								productDetail.setActive(true);
								ejb.setProductDetail(productDetail);

								readyGoodsStock = new ReadyGoodsStock();
								readyGoodsStock.setProductDetail(productDetail);
								readyGoodsStock.setRemainingQty(0);
								readyGoodsStock.setCompanyInfo(companyInfo);
								ejb.setReadyGoodsStockDetail(readyGoodsStock);
								readyGoodsStock = null;
							}

							// ///////////////////////////////////////////
							purchaseEntry = new Purchase_Entry();
							dt = new Date();
							purchaseEntry.setVendor_bill_no("Production Bill");
							purchaseEntry.setChallan_no(Integer.parseInt(req
									.getParameter("challanNo")));
							purchaseEntry.setChallanSuffix(Integer.parseInt(req
									.getParameter("challanSuffix")));
							purchaseEntry.setChallanNumber(req
									.getParameter("challanNumber"));
							purchaseEntry.setPurchase_date(dt);
							purchaseEntry.setVendor(ejb
									.getVendorByVendorTypeAndName("Vendor",
											"Production Vendor"));
							purchaseEntry.setUsers(ejb.getUserById(httpSession
									.getAttribute("user").toString()));
							purchaseEntry.setEntry_date(dt);
							purchaseEntry.setSur_charge(0);
							purchaseEntry.setTransport_cost(0);
							// purchaseEntry.setTotalCost(Float.parseFloat(req
							// .getParameter("totalCost")));
							// purchaseEntry.setSubTotal(Float.parseFloat(req
							// .getParameter("totalCost")));
							purchaseEntry.setTotalCost(0);
							purchaseEntry.setSubTotal(0);
							purchaseEntry.setTaxAmount(0);
							purchaseEntry.setCompanyInfo(ejb.getUserById(
									(String) httpSession.getAttribute("user"))
									.getCompanyInfo());
							purchaseEntry.setRoundOf(0);
							ejb.setPurchaseEntry(purchaseEntry);

							if (ejb.getVoucherAssignByVendorId(
									ejb.getVendorByVendorTypeAndName("Vendor",
											"Production Vendor").getId())
									.size() == 0) {
								voucherAssign = new VoucherAssign();
								vendor = ejb.getVendorByVendorTypeAndName(
										"Vendor", "Production Vendor");
								voucherAssign.setVendor(vendor);
								voucherAssign.setVoucherDetailsNumber(vendor
										.getPh1());
								ejb.setVoucherAssign(voucherAssign);
							}

							paymentDetails = new PaymentDetails();
							paymentDetails.setPaymentDate(dt);
							paymentDetails.setTotalAmount(0);
							paymentDetails.setPaidAmount(0);
							paymentDetails
									.setDescription("This is Production Entry");
							paymentDetails.setPurchase_Entry(purchaseEntry);
							paymentDetails.setPaymentType(ejb
									.getPaymentTypeByType("Cash"));
							paymentDetails.setPaymentStatus(ejb
									.getPaymentStatusByStatus("Full Paid"));
							paymentDetails.setUniqueNo(Integer.parseInt(req
									.getParameter("uniqueNo")));
							ejb.setPaymentDetails(paymentDetails);
							// ////////////////////////////////////////////////////

							purchaseProductDetails = new Purchase_Product_Details();
							purchaseProductDetails
									.setPurchase_Entry(purchaseEntry);
							purchaseProductDetails.setMrp(Float.parseFloat(req
									.getParameter("mrp1")));
							purchaseProductDetails.setWsp(Float.parseFloat(req
									.getParameter("wsp1")));
							purchaseProductDetails.setQuantity(Float
									.parseFloat(req.getParameter("qty1")));
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
							purchaseProductDetails
									.setProductDetail(productDetail);
							purchaseProductDetails.setLotNumber(req
									.getParameter("lotnumberS"));
							purchaseProductDetails.setCompanyInfo(ejb
									.getUserById(
											(String) httpSession
													.getAttribute("user"))
									.getCompanyInfo());
							ejb.setPurchaseProductDetails(purchaseProductDetails);

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

							String imgstrng = req.getParameter("proImage1");
							ProductImage prodimg = new ProductImage();
							prodimg.setProductDetail(productDetail);
							prodimg.setImage(Base64.decode(imgstrng));
							ejb.setProductImage(prodimg);

							jobPlan = ejb.getJobPlanById(Integer.parseInt(req
									.getParameter("planNo1")));
							jobPlan.setComplete(true);
							ejb.updateJobPlan(jobPlan);
							for (JobPlanProducts jpp : jobPlan
									.getJobPlanProducts()) {
								for (int i = 0; i < jobPlan
										.getJobPlanProducts().size(); i++) {
									jobPlanProducts = ejb
											.getJobPlanProductsById(jpp.getId());
									jobPlanProducts.setComplete(true);
									ejb.updateJobPlanProducts(jobPlanProducts);
									for (JobPlanJobStock jpjs : jobPlanProducts
											.getJobPlanJobStock()) {
										jobPlanJobStock = ejb
												.getJobPlanJobStockById(jpjs
														.getId());
										jobPlanJobStock.setComplete(true);
										ejb.updateJobPlanJobStock(jobPlanJobStock);
									}
								}
							}

							msg = "Successful";
						} else {
							msg = "Duplicate Entry! Not allowed!";
						}

						break;

					case "addBillSetup":
						page = "billSetup.jsp";
						billSetup = new Bill_setup();
						billSetup
								.setCompanyInitial(req.getParameter("comname"));
						billSetup.setBillType(req.getParameter("type"));
						billSetup.setSufix(req.getParameter("suffix"));
						billSetup.setCompanyInfo(ejb.getUserById(
								(String) httpSession.getAttribute("user"))
								.getCompanyInfo());
						ejb.setBillSetup(billSetup);

						msg = "Bill created successfully.";
						break;

					case "newVendorType":
						page = "purchasingVendorType.jsp";
						vendorType = new VendorType();
						List<VendorType> lst = new ArrayList<VendorType>();
						lst = ejb.getAllVendorType();
						int i = 0;
						for (VendorType vt : lst) {
							if (vt.getType().equals(req.getParameter("name"))) {
								i = 1;
								break;
							}
						}
						if (i == 0) {
							vendorType.setType(req.getParameter("name"));

							ejb.setVendorType(vendorType);
							msg = "Vendor type added successfully.";
						} else
							msg = "Vendor type already exist.";
						break;

					case "editVendorType":
						page = "purchasingVendorType.jsp";
						vendorType = ejb.getVendorTypeById(Integer.parseInt(req
								.getParameter("id")));
						vendorType.setType(req.getParameter("name"));

						ejb.updateVendorType(vendorType);
						msg = "Vendor type updated successfully.";
						break;

					case "editproductSummary":
						// page = "MaterialPartDetailsGenerals.jsp";
						int proId = Integer.parseInt(req
								.getParameter("productid"));
						page = "editPro.jsp?id=" + proId;

						productDetail = ejb.getProductDetailsById(Integer
								.parseInt(req.getParameter("productid")));
						productDetail.setDescription(req.getParameter(
								"description123").toUpperCase());
						productDetail.setQtyUnit(ejb.getQtyUnitById(Integer
								.parseInt(req.getParameter("uom123"))));
						ejb.updateProductDetail(productDetail);

						purchaseProductDetails = ejb
								.getInitialPurchase_Product_DetailsByProductId(
										proId).get(0);
						purchaseProductDetails.setQuantity(Float.parseFloat(req
								.getParameter("qty")));
						purchaseProductDetails.setRemaining_quantity(Float
								.parseFloat(req.getParameter("remQty")));
						purchaseProductDetails.setCost(Float.parseFloat(req
								.getParameter("cost")));
						purchaseProductDetails.setWsp(Float.parseFloat(req
								.getParameter("wsp")));
						purchaseProductDetails.setMrp(Float.parseFloat(req
								.getParameter("mrp")));
						ejb.updatePurchaseProductDetails(purchaseProductDetails);

						if (productDetail.isRaw()) {
							rawMaterialsStock = ejb
									.getRawMaterialStocktDetailByProductId(proId);
							rawMaterialsStock
									.setRemainingQty(rawMaterialsStock
											.getRemainingQty()
											- Float.parseFloat(req
													.getParameter("qtyH"))
											+ Float.parseFloat(req
													.getParameter("qty")));
							ejb.updateRawMaterialStockDetail(rawMaterialsStock);
							rawMaterialsStock = null;
						} else {
							readyGoodsStock = ejb
									.getReadyGoodsStocktDetailByProductId(proId);
							readyGoodsStock
									.setRemainingQty(readyGoodsStock
											.getRemainingQty()
											- Float.parseFloat(req
													.getParameter("qtyH"))
											+ Float.parseFloat(req
													.getParameter("qty")));
							ejb.updateReadyGoodsStockDetail(readyGoodsStock);
							readyGoodsStock = null;
						}

						msg = "updated successfully.";

						break;
					case "deleteVendorType":
						page = "purchasingVendorType.jsp";
						ejb.deleteVendorTypeById(Integer.parseInt(req
								.getParameter("id")));
						msg = "Vendor type deleted successfully.";
						break;

					case "addTax":
						page = "setupTaxManagement.jsp";
						tax = new Tax();
						List<Tax> list = new ArrayList<Tax>();
						list = ejb.getAllTax();
						int f = 0;
						for (Tax t : list) {
							if (t.getName().equals(
									req.getParameter("name").toUpperCase())
									&& t.isActive()) {
								f = 1;
								break;
							}
						}
						if (f == 0) {
							tax.setName(req.getParameter("name").toUpperCase());
							tax.setValue(Float.parseFloat(req
									.getParameter("value")));
							tax.setActive(true);
							tax.setUsers(ejb.getUserById((String) httpSession
									.getAttribute("user")));

							ejb.setTax(tax);
							msg = "Tax added successfully.";
						} else {
							msg = "Tax already exists/active.";
						}

						break;

					case "addTaxGroup":
						page = "setupTaxManagement.jsp";
						tax_type_group = new Tax_Type_Group();
						List<Tax_Type_Group> list1 = new ArrayList<Tax_Type_Group>();
						list1 = ejb.getAllTax_Type_Groups();
						int f1 = 0;
						for (Tax_Type_Group t : list1) {
							if (t.getName().equals(
									req.getParameter("name").toUpperCase())
									&& t.isActive()) {
								f1 = 1;
								break;
							}
						}

						if (f1 == 0) {
							tax_type_group.setName(req.getParameter("name")
									.toUpperCase());

							String[] taxes = req.getParameterValues("tax");

							if (taxes != null) {

								List<Tax> taxlst = new ArrayList<Tax>();

								for (String taxName : taxes) {
									taxlst.add(ejb.getTaxById(Integer
											.parseInt(taxName)));
								}

								tax_type_group.setTaxes(taxlst);
								tax_type_group.setActive(true);
								tax_type_group.setUsers(ejb
										.getUserById((String) httpSession
												.getAttribute("user")));

								ejb.setTaxTYpeGroup(tax_type_group);
								msg = "Tax group added succesfully.";
							} else {
								msg = "please select tax.";
							}
						} else {
							msg = "Tax group already exist/active.";
						}
						break;

					case "editTax":
						page = "setupTaxManagement.jsp";
						tax = ejb.getTaxById(Integer.parseInt(req
								.getParameter("id")));

						// tax.setName(req.getParameter("name"));
						// tax.setValue(Float.parseFloat(req.getParameter("value")));

						tax.setActive(Boolean.parseBoolean(req
								.getParameter("isActive")));

						ejb.updateTax(tax);
						msg = "Tax updated successfully.";
						break;

					case "deleteTax":
						page = "setupTaxManagement.jsp";
						ejb.deleteTax(Integer.parseInt(req.getParameter("id")));
						msg = "Tax deleted successfully.";
						break;

					case "editTaxGroup":
						page = "setupTaxManagement.jsp";
						tax_type_group = ejb.getTax_Type_GroupById(Integer
								.parseInt(req.getParameter("id")));

						// tax_type_group.setName(req.getParameter("name"));
						//
						// String[] taxes1 = req.getParameterValues("tax");
						//
						// if (taxes1 != null) {
						//
						// List<Tax> taxlst = new ArrayList<Tax>();
						//
						// for (String taxName : taxes1) {
						// taxlst.add(ejb.getTaxById(Integer.parseInt(taxName)));
						// }
						//
						// tax_type_group.setTaxes(taxlst);
						//
						// ejb.updateTaxTypeGroup(tax_type_group);
						// msg = "Tax group updated succesfully.";
						// } else {
						// msg = "please select tax.";
						// }

						tax_type_group.setActive(Boolean.parseBoolean(req
								.getParameter("isActiveG")));
						ejb.updateTaxTypeGroup(tax_type_group);
						msg = "Tax group updated succesfully.";
						break;

					case "deleteTaxGroup":
						page = "setupTaxManagement.jsp";
						ejb.deleteTaxTYpeGroupById(Integer.parseInt(req
								.getParameter("id")));
						msg = "Tax Group deleted successfully.";
						break;

					case "createDept":
						page = "setupDepartment.jsp";
						List<Department> dept = ejb.getAllDepartments();
						int fc = 0;
						for (Department dep : dept) {
							if (dep.getName().equals(req.getParameter("name"))) {
								fc = 1;
								break;
							}
						}
						if (fc == 0) {
							department = new Department();
							department.setName(req.getParameter("name")
									.toUpperCase());
							ejb.setDepartment(department);
							msg = "Department added.";
						} else {
							msg = "Duplicate Entry";
						}
						break;

					case "deleteDept":
						page = "setupDepartment.jsp";
						ejb.deleteDepartmentById(Integer.parseInt(req
								.getParameter("id")));
						msg = "Department deleted.";
						break;
					case "createSubDept":
						page = "setupDepartment.jsp";
						List<SubDepartment> sdept = ejb
								.getAllSubDepartmentsByDepartmentId(Integer
										.parseInt(req.getParameter("deptId")));

						int counter = 0;

						for (SubDepartment sdep : sdept) {

							if (sdep.getName().equals(req.getParameter("name"))) {
								counter = 1;
								break;

							}
						}
						if (counter == 0) {
							subDepartment = new SubDepartment();
							subDepartment.setName(req.getParameter("name")
									.toUpperCase());
							subDepartment.setDepartment(ejb
									.getDepartmentById(Integer.parseInt(req
											.getParameter("deptId"))));
							ejb.setSubDepartment(subDepartment);
							msg = "SubDepartment added.";
						} else {
							msg = "Duplicate Entry";
						}

						break;
					case "deleteSubDept":
						page = "setupDepartment.jsp";
						ejb.deleteSubDepartmentById(Integer.parseInt(req
								.getParameter("id")));
						msg = "Department deleted.";
						break;
					case "createCategory":
						page = "setupDepartment.jsp";
						List<Category> cat = ejb
								.getAllCategoryBySubDepartmentId(Integer
										.parseInt(req.getParameter("subDeptId")));

						int counter1 = 0;
						for (Category cate : cat) {
							if (cate.getName().equals(req.getParameter("name"))) {

								counter1 = 1;
								break;
							}

						}
						if (counter1 == 0) {
							category = new Category();
							category.setName(req.getParameter("name")
									.toUpperCase());
							category.setAttrNmae1(req.getParameter("attr1")
									.toUpperCase());
							category.setAttrNmae2(req.getParameter("attr2")
									.toUpperCase());
							category.setAttrNmae3(req.getParameter("attr3")
									.toUpperCase());
							category.setAttrNmae4(req.getParameter("attr4")
									.toUpperCase());
							category.setAttrNmae5(req.getParameter("attr5")
									.toUpperCase());
							category.setAttrNmae6(req.getParameter("attr6")
									.toUpperCase());
							category.setSubDepartment(ejb
									.getSubDepartmentById(Integer.parseInt(req
											.getParameter("subDeptId"))));
							ejb.setCategory(category);
							msg = "Category added.";
						} else {
							msg = "Duplicate Entry";
						}

						break;
					case "deleteCategory":
						page = "setupDepartment.jsp";
						ejb.deleteCategoryById(Integer.parseInt(req
								.getParameter("id")));
						msg = "Category deleted.";
						break;
					case "addCountry":
						page = "setupCountryStateCity.jsp";

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
							country = new Country();
							country.setCountryName(req.getParameter("name")
									.toUpperCase());
							ejb.setCountry(country);
							msg = "country added successfully.";
						} else {
							msg = "Duplicate entry";

						}
						break;
					case "deleteCountry":
						page = "setupCountryStateCity.jsp";
						ejb.deleteCountryById(Integer.parseInt(req
								.getParameter("id")));
						msg = "country deleted successfully.";
						break;

					case "deleteState":
						page = "setupCountryStateCity.jsp";
						ejb.deleteStateById(Integer.parseInt(req
								.getParameter("id")));
						msg = "State deleted successfully.";
						break;

					case "addState":
						page = "setupCountryStateCity.jsp";
						List<State> sList = ejb.getAllStatesByCountryId(Integer
								.parseInt(req.getParameter("id")));
						int flag1 = 0;
						for (State st : sList) {
							if (st.getStateName().equals(
									req.getParameter("name").toUpperCase())) {
								flag1 = 1;
								break;
							}
						}
						if (flag1 == 0) {
							state = new State();
							state.setStateName(req.getParameter("name")
									.toUpperCase());
							state.setCountry(ejb.getCountryById(Integer
									.parseInt(req.getParameter("id"))));
							ejb.setState(state);
							msg = "State added successfully.";
						} else {
							msg = "Duplicate entry";
						}
						break;

					case "addCity":
						page = "setupCountryStateCity.jsp";
						List<City> cities = ejb.getCityByState(Integer
								.parseInt(req.getParameter("id")));
						int flag2 = 0;
						for (City c : cities) {
							if (c.getCityName().equals(
									req.getParameter("name").toUpperCase())) {
								flag2 = 1;
								break;
							}
						}
						if (flag2 == 0) {
							city = new City();
							city.setCityName(req.getParameter("name")
									.toUpperCase());
							city.setState(ejb.getStateById(Integer.parseInt(req
									.getParameter("id"))));

							ejb.setCity(city);
							msg = "City added susseccfully";
						} else {
							msg = "Duplicate entry.";
						}
						break;

					case "deleteCity":
						page = "setupCountryStateCity.jsp";
						ejb.deleteCityById(Integer.parseInt(req
								.getParameter("id")));
						msg = "City deleted successfully.";
						break;

					case "addVendor":
						page = "purchasingVendor.jsp";
						List<Vendor> vend = ejb.getAllVendors();
						int counter2 = 0;
						for (Vendor ven : vend) {

							if (ven.getPh1().equals(
									req.getParameter("vendorPh1"))) {
								counter2 = 1;
								break;
							}
						}
						if (counter2 == 0) {
							vendor = new Vendor();
							accountDetails = new AccountDetails();
							dt = new Date();

							vendor.setName(req.getParameter("vendorName")
									.toUpperCase());
							vendor.setLastModifiedDate(dt);
							if (!req.getParameter("vendorAddress").equals("")) {
								vendor.setAddress(req
										.getParameter("vendorAddress"));
							} else {
								vendor.setAddress("NA");
							}
							if (!req.getParameter("vendorAlias").equals("")) {
								vendor.setAliseName(req
										.getParameter("vendorAlias"));
							} else {
								vendor.setAliseName("NA");
							}
							vendor.setCity(ejb.getCityById(Integer.parseInt(req
									.getParameter("vendorCityId"))));

							if (!req.getParameter("vendorCompanyName").equals(
									"")) {
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
							vendor.setUsers(ejb
									.getUserById((String) httpSession
											.getAttribute("user")));

							accountDetails.setBankAccountNumber(req
									.getParameter("bankAccNo"));
							accountDetails.setBankChequeLable(req
									.getParameter("bankCheckLebel"));
							accountDetails.setBankIFSCnumber(req
									.getParameter("bankIFSC"));
							accountDetails.setBankMICRnumber(req
									.getParameter("bankMICR"));
							accountDetails.setBankName(req
									.getParameter("bankName"));
							accountDetails.setBankRTGCnumber(req
									.getParameter("bankRTGS"));
							accountDetails.setBranch(req
									.getParameter("bankBranch"));

							if (!req.getParameter("bankCity").equals("")) {
								accountDetails
										.setCity(ejb.getCityById(Integer.parseInt(req
												.getParameter("bankCity"))));
							}

							accountDetails.setCstNumber(req
									.getParameter("vendorCSTno"));
							if (!req.getParameter("vendorCSTregDate")
									.equals("")) {
								accountDetails
										.setCstRegistrationDate(DateConverter.getDate(req
												.getParameter("vendorCSTregDate")));
							}
							if (!req.getParameter("vendorExciseRegDate")
									.equals("")) {
								accountDetails
										.setCstRegistrationDate(DateConverter.getDate(req
												.getParameter("vendorExciseRegDate")));
							}
							if (!req.getParameter("vendorServiceTaxRegDate")
									.equals("")) {
								accountDetails
										.setCstRegistrationDate(DateConverter.getDate(req
												.getParameter("vendorServiceTaxRegDate")));
							}
							if (!req.getParameter("vendorVATregDate")
									.equals("")) {
								accountDetails
										.setCstRegistrationDate(DateConverter.getDate(req
												.getParameter("vendorVATregDate")));
							}

							accountDetails.setExciseRegistrationNumber(req
									.getParameter("vendorExciseRegNo"));
							accountDetails.setPanNumber(req
									.getParameter("vendorPANno"));

							accountDetails.setServiceTaxRegistrationNumber(req
									.getParameter("vendorServiceTaxRegNo"));
							accountDetails.setVatNumber(req
									.getParameter("vendorVATno"));

							if (!req.getParameter("taxTypeGroupId").equals("0")) {
								accountDetails
										.setTax_Type_Group(ejb.getTax_Type_GroupById(Integer.parseInt(req
												.getParameter("taxTypeGroupId"))));
							}

							accountDetails.setUsers(ejb
									.getUserById((String) httpSession
											.getAttribute("user")));
							accountDetails.setVendor(vendor);

							ejb.setVendor(vendor);
							ejb.setAccountDetails(accountDetails);

							msg = "Added successfully;";

						} else {
							msg = "Duplicate vendor Entry";
						}

						break;

					case "updateVendor":
						page = "purchasingVendor.jsp";
						vendor = ejb.getVendorById(Integer.parseInt(req
								.getParameter("vendoeId")));// vendorid

						if (!req.getParameter("vendorName").equals(
								"Production Vendor")) {
							vendor.setName(req.getParameter("vendorName")
									.toUpperCase());
						}
						vendor.setCompanyName(req
								.getParameter("vendorCompanyName"));
						vendor.setPh1(req.getParameter("vendorPh1"));
						vendor.setPh2(req.getParameter("vendorPh2"));
						vendor.setEmail(req.getParameter("vendorMail"));
						vendor.setAliseName(req.getParameter("vendorAlias"));
						vendor.setAddress(req.getParameter("vendorAddress"));
						vendor.setPinCode(req.getParameter("vendorPin"));
						if (!req.getParameter("vendorName").equals(
								"Production Vendor")) {
							vendor.setVendorType(ejb.getVendorTypeById(Integer
									.parseInt(req.getParameter("vendorType"))));
						}
						if (!req.getParameter("vendorCityId").equals("")) {
							vendor.setCity(ejb.getCityById(Integer.parseInt(req
									.getParameter("vendorCityId"))));
						}

						accountDetails = ejb
								.getAccountDetailsByVendorId(Integer
										.parseInt(req.getParameter("vendoeId")));// vender
																					// id

						accountDetails.setVatNumber(req
								.getParameter("vendorVATno"));

						if (!req.getParameter("vendorVATregDate").equals("")) {
							accountDetails.setCstRegistrationDate(DateConverter
									.getDate(req
											.getParameter("vendorVATregDate")));
						}

						accountDetails.setCstNumber(req
								.getParameter("vendorCSTno"));
						if (!req.getParameter("vendorCSTregDate").equals("")) {
							accountDetails.setCstRegistrationDate(DateConverter
									.getDate(req
											.getParameter("vendorCSTregDate")));
						}

						accountDetails.setPanNumber(req
								.getParameter("vendorPANno"));
						accountDetails.setExciseRegistrationNumber(req
								.getParameter("vendorExciseRegNo"));

						if (!req.getParameter("vendorExciseRegDate").equals("")) {
							accountDetails
									.setCstRegistrationDate(DateConverter.getDate(req
											.getParameter("vendorExciseRegDate")));
						}

						accountDetails.setServiceTaxRegistrationNumber(req
								.getParameter("vendorServiceTaxRegNo"));

						if (!req.getParameter("vendorServiceTaxRegDate")
								.equals("")) {
							accountDetails
									.setCstRegistrationDate(DateConverter.getDate(req
											.getParameter("vendorServiceTaxRegDate")));
						}

						accountDetails
								.setBankName(req.getParameter("bankName"));
						accountDetails.setBankAccountNumber(req
								.getParameter("bankAccNo"));
						accountDetails
								.setBranch(req.getParameter("bankBranch"));
						if (!req.getParameter("bankCity").equals("")) {
							accountDetails.setCity(ejb.getCityById(Integer
									.parseInt(req.getParameter("bankCity"))));
						}
						if (!req.getParameter("taxTypeGroupId").equals("0")) {
							accountDetails.setTax_Type_Group(ejb
									.getTax_Type_GroupById(Integer.parseInt(req
											.getParameter("taxTypeGroupId"))));
						}

						accountDetails.setBankIFSCnumber(req
								.getParameter("bankIFSC"));

						accountDetails.setBankMICRnumber(req
								.getParameter("bankMICR"));

						accountDetails.setBankRTGCnumber(req
								.getParameter("bankRTGS"));
						ejb.updateVendor(vendor);
						ejb.updateAccountDetails(accountDetails);
						msg = "Updated successfully.";
						break;

					case "purchaseEntry":
						page = "purchasingPurchaseEntry.jsp";

						// ////////Null Manage////////////////////////////
						if (verifyParams(req, resp, "pCodeIdH", "qtyH",
								"rateH", "lotH")) {
							req.setAttribute("msg", "Failed! Please try again!");
							req.getRequestDispatcher(page).forward(req, resp);
							return;
						}
						// ////////Null Manage////////////////////////////

						companyInfo = ejb.getUserById(
								(String) httpSession.getAttribute("user"))
								.getCompanyInfo();
						purchaseEntry = new Purchase_Entry();
						paymentDetails = new PaymentDetails();

						List<Purchase_Entry> purEntry1 = ejb
								.getAllPurchaseEntry();
						int chP1 = 0;
						for (Purchase_Entry pe : purEntry1) {
							if (pe.getChallanNumber().equals(
									req.getParameter("challanNumber"))) {
								chP1 = 1;
								break;
							}
						}
						if (chP1 == 0) {
							purchaseEntry.setVendor_bill_no(req.getParameter(
									"vendorBillNo").toUpperCase());

							dt = new Date();
							purchaseEntry.setChallan_no(Integer.parseInt(req
									.getParameter("challanNo")));
							purchaseEntry.setChallanSuffix(Integer.parseInt(req
									.getParameter("challanSuffix")));
							purchaseEntry.setChallanNumber(req
									.getParameter("challanNumber"));

							purchaseEntry.setPurchase_date(DateConverter
									.getDate(req.getParameter("purchaseDate")));
							purchaseEntry.setVendor(ejb.getVendorById(Integer
									.parseInt(req.getParameter("vId"))));
							purchaseEntry.setUsers(ejb.getUserById(httpSession
									.getAttribute("user").toString()));
							purchaseEntry.setEntry_date(dt);

							purchaseEntry.setSur_charge(Float.parseFloat(req
									.getParameter("surcharge")));
							purchaseEntry.setTransport_cost(Float
									.parseFloat(req
											.getParameter("transportCost")));
							purchaseEntry.setTotalCost(Float.parseFloat(req
									.getParameter("spAmount")));
							purchaseEntry.setTax_Type_Group(ejb
									.getTax_Type_GroupById(Integer.parseInt(req
											.getParameter("taxGroup"))));
							purchaseEntry.setSubTotal(Float.parseFloat(req
									.getParameter("subTotal")));
							purchaseEntry.setTaxAmount(Float.parseFloat(req
									.getParameter("taxAmount")));
							purchaseEntry.setCompanyInfo(ejb.getUserById(
									(String) httpSession.getAttribute("user"))
									.getCompanyInfo());
							purchaseEntry.setRoundOf(Float.parseFloat(req
									.getParameter("roundvalue")));
							if (req.getParameter("isAgent").equals("yes")) {
								purchaseEntry.setAgentId(Integer.parseInt(req
										.getParameter("agentName")));
							}

							// ////////////////////////////////////////////////
							if (req.getParameter("disType").equals("disFlat")) {
								purchaseEntry.setFlatDiscount(true);
							} else {
								purchaseEntry.setFlatDiscount(false);
							}
							purchaseEntry.setDiscountValue(Float.parseFloat(req
									.getParameter("disValue"))); // this
																	// is
																	// not
																	// total
																	// discount.
							purchaseEntry.setDiscountTotal(Float.parseFloat(req
									.getParameter("discountValue"))); // this
																		// is
																		// total
																		// discount.

							if (req.getParameter("isEffective").equals(
									"efectiveYes")) {
								purchaseEntry.setEfectiveProfit(true);
							} else {
								purchaseEntry.setEfectiveProfit(false);
							}
							if (req.getParameter("profitType").equals(
									"profitFlat")) {
								purchaseEntry.setFlatProfitAgent(true);
							} else {
								purchaseEntry.setFlatProfitAgent(false);
							}
							purchaseEntry.setAgentProfitValue(Float
									.parseFloat(req.getParameter("profitVal"))); // this
																					// is
																					// not
																					// total
																					// profit.
							purchaseEntry
									.setAgentProfitTotal(Float.parseFloat(req
											.getParameter("profitValue"))); // this
																			// is
																			// total
																			// profit.
							// //////////////////////////////////////////////////////////////
							ejb.setPurchaseEntry(purchaseEntry);

							if (ejb.getVoucherAssignByVendorId(
									Integer.parseInt(req.getParameter("vId")))
									.size() == 0) {
								voucherAssign = new VoucherAssign();
								vendor = ejb.getVendorById(Integer.parseInt(req
										.getParameter("vId")));
								voucherAssign.setVendor(vendor);
								voucherAssign.setVoucherDetailsNumber(vendor
										.getPh1());
								ejb.setVoucherAssign(voucherAssign);
							} else {
								voucherAssign = ejb.getVoucherAssignByVendorId(
										Integer.parseInt(req
												.getParameter("vId"))).get(0);
							}

							// if (!req.getParameter("pstatus")
							// .equals("Full Paid")) {
							voucherDetails = new VoucherDetails();
							voucherDetails.setVoucherAssign(voucherAssign);
							voucherDetails.setCredit(true);
							voucherDetails.setValue(Float.parseFloat(req
									.getParameter("spDueAmount")));
							// voucherDetails.setTotalCreditNote(Float.parseFloat(req.getParameter("finalDC")));
							// if (ejb.getVoucherDetailsByVendorId(
							// Integer.parseInt(req.getParameter("vId")))
							// .size() == 0) {
							// voucherDetails.setTotalCreditNote(Float
							// .parseFloat(req
							// .getParameter("spDueAmount")));
							// } else {
							// List<VoucherDetails> vDetails = ejb
							// .getVoucherDetailsByVendorId(Integer
							// .parseInt(req
							// .getParameter("vId")));
							// float totalCreditNote = vDetails.get(
							// vDetails.size() - 1)
							// .getTotalCreditNote();
							// voucherDetails.setTotalCreditNote(Float
							// .parseFloat(req
							// .getParameter("spDueAmount"))
							// + totalCreditNote);
							// }
							voucherDetails.setVoucherDate(DateConverter
									.getDate(req.getParameter("payDate")));
							voucherDetails.setUsers(ejb
									.getUserById((String) httpSession
											.getAttribute("user")));
							voucherDetails.setPurchase_Entry(purchaseEntry);
							ejb.setVoucherDetails(voucherDetails);
							// }

							paymentDetails.setPaymentDate(DateConverter
									.getDate(req.getParameter("payDate")));
							paymentDetails.setTotalAmount(Float.parseFloat(req
									.getParameter("spAmount")));
							paymentDetails.setPaidAmount(Float.parseFloat(req
									.getParameter("spPaymentAmount")));
							paymentDetails.setDescription(req
									.getParameter("desc"));
							paymentDetails.setPurchase_Entry(purchaseEntry);
							paymentDetails.setPaymentType(ejb
									.getPaymentTypeByType(req
											.getParameter("pType")));
							paymentDetails.setPaymentStatus(ejb
									.getPaymentStatusByStatus(req
											.getParameter("pstatus")));
							paymentDetails.setUniqueNo(Integer.parseInt(req
									.getParameter("uniqueNo")));
							ejb.setPaymentDetails(paymentDetails);

							String attr1[] = req.getParameterValues("attr1H");
							String attr2[] = req.getParameterValues("attr2H");
							String attr3[] = req.getParameterValues("attr3H");
							String attr4[] = req.getParameterValues("attr4H");
							String attr5[] = req.getParameterValues("attr5H");
							String attr6[] = req.getParameterValues("attr6H");

							String mrp[] = req.getParameterValues("mrpH");
							String wsp[] = req.getParameterValues("wspH");

							String qty[] = req.getParameterValues("qtyH");
							String cost[] = req.getParameterValues("rateH");
							String productId[] = req
									.getParameterValues("pCodeIdH");
							String lot[] = req.getParameterValues("lotH");

							for (int l = 0; l < qty.length; l++) {
								purchaseProductDetails = new Purchase_Product_Details();

								purchaseProductDetails.setAttrValue1(attr1[l]
										.toUpperCase());
								purchaseProductDetails.setAttrValue2(attr2[l]
										.toUpperCase());
								purchaseProductDetails.setAttrValue3(attr3[l]
										.toUpperCase());
								purchaseProductDetails.setAttrValue4(attr4[l]
										.toUpperCase());
								purchaseProductDetails.setAttrValue5(attr5[l]
										.toUpperCase());
								purchaseProductDetails.setAttrValue6(attr6[l]
										.toUpperCase());
								purchaseProductDetails.setProductDetail(ejb
										.getProductDetailsById(Integer
												.parseInt(productId[l])));

								if (purchaseProductDetails.getProductDetail()
										.isSaleble()) {
									purchaseProductDetails.setMrp(Float
											.parseFloat(mrp[l]));
									purchaseProductDetails.setWsp(Float
											.parseFloat(wsp[l]));
								}

								purchaseProductDetails.setQuantity(Float
										.parseFloat(qty[l]));

								purchaseProductDetails
										.setRemaining_quantity(Float
												.parseFloat(qty[l]));
								purchaseProductDetails.setCost(Float
										.parseFloat(cost[l]));
								purchaseProductDetails
										.setPurchase_Entry(purchaseEntry);
								// purchaseProductDetails.setLotNumber(lot[l]
								// .toUpperCase());

								int lotNo = Integer.parseInt(ejb
										.getLastLotNoByProductId(Integer
												.parseInt(productId[l]))) + 1;
								purchaseProductDetails.setLotNumber("" + lotNo);

								purchaseProductDetails
										.setCompanyInfo(companyInfo);
								ejb.setPurchaseProductDetails(purchaseProductDetails);

								if (purchaseProductDetails.getProductDetail()
										.isRaw()) {
									rawMaterialsStock = ejb
											.getRawMeterialStoctByProductAndCompanyId(
													purchaseProductDetails
															.getProductDetail()
															.getId(),
													companyInfo.getId());
									rawMaterialsStock.setProductDetail(ejb
											.getProductDetailsById(Integer
													.parseInt(productId[l])));
									rawMaterialsStock
											.setRemainingQty(rawMaterialsStock
													.getRemainingQty()
													+ Float.parseFloat(qty[l]));
									ejb.updateRawMaterialStockDetail(rawMaterialsStock);
									rawMaterialsStock = null;
								} else {
									readyGoodsStock = ejb
											.getReadyGoodStoctByProductAndCompanyId(
													purchaseProductDetails
															.getProductDetail()
															.getId(),
													companyInfo.getId());
									readyGoodsStock.setProductDetail(ejb
											.getProductDetailsById(Integer
													.parseInt(productId[l])));
									readyGoodsStock
											.setRemainingQty(readyGoodsStock
													.getRemainingQty()
													+ Float.parseFloat(qty[l]));
									ejb.updateReadyGoodsStockDetail(readyGoodsStock);
									readyGoodsStock = null;
								}
								purchaseProductDetails = null;
							}

							// new to check
							if (purchaseEntry.getAgentId() != 0) {
								uniqueNo = ejb
										.getLastUniqueNoOfPayDet4ViaAgent() + 1;
								if (ejb.getVoucherAssignByVendorId(
										purchaseEntry.getAgentId()).size() == 0) {
									voucherAssign = new VoucherAssign();
									vendor = ejb.getVendorById(purchaseEntry
											.getAgentId());
									voucherAssign.setVendor(vendor);
									voucherAssign
											.setVoucherDetailsNumber(vendor
													.getPh1());
									ejb.setVoucherAssign(voucherAssign);
								} else {
									voucherAssign = ejb
											.getVoucherAssignByVendorId(
													purchaseEntry.getAgentId())
											.get(0);
								}

								voucherDetForViaAgent = new VoucherDetailsForViaAgents();
								voucherDetForViaAgent
										.setVoucherAssignId(voucherAssign
												.getId());
								voucherDetForViaAgent.setAgentId(purchaseEntry
										.getAgentId());
								voucherDetForViaAgent
										.setPurchaseEntryId(purchaseEntry
												.getId());
								voucherDetForViaAgent.setCredit(true);
								voucherDetForViaAgent.setValue(purchaseEntry
										.getAgentProfitTotal());
								voucherDetForViaAgent
										.setVoucherDate(purchaseEntry
												.getPurchase_date());
								voucherDetForViaAgent.setEntryDate(new Date());
								voucherDetForViaAgent
										.setUserId((String) httpSession
												.getAttribute("user"));
								ejb.setVoucherDetails4ViaAgent(voucherDetForViaAgent);

								payDetForViaAgent = new PaymentDetailsForViaAgents();
								payDetForViaAgent.setPaymentDate(purchaseEntry
										.getPurchase_date());
								payDetForViaAgent.setEntryDate(new Date());
								payDetForViaAgent.setPaidAmount(0);
								payDetForViaAgent
										.setPurchaseEntryId(purchaseEntry
												.getId());
								payDetForViaAgent.setPaymentStatusId(ejb
										.getPaymentStatusByStatus("Not Paid")
										.getId());
								payDetForViaAgent.setUniqueNo(uniqueNo);
								payDetForViaAgent
										.setUserId((String) httpSession
												.getAttribute("user"));
								ejb.setPaymentDetails4ViaAgent(payDetForViaAgent);
							}
							// new to check

							if (req.getParameter("isBarPrint").equals("yes")) {
								req.setAttribute("print", 1);
								req.setAttribute("purDet",
										purchaseEntry.getId());
							} else {
								req.setAttribute("print", 0);
							}

							req.setAttribute("purDetIdforPC",
									purchaseEntry.getId());
							purchaseEntry = null;
							msg = "Purchase entry was successfull.";
						} else {
							msg = "Duplicate Entry! Not allowed!";
						}

						break;

					case "purchaseSearchForReturn":
						page = "purchaseReturn.jsp";

						List<Purchase_Entry> purEntryListR = ejb
								.getPurchaseEntryByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));

						if (purEntryListR.size() > 0
								&& !purEntryListR.get(0).getVendor().getName()
										.equals("Production Vendor")) {
							req.setAttribute("pId", purEntryListR.get(0)
									.getId());

							msg = "Your search for Purchase challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for Purchase challan number : "
									+ req.getParameter("companyInitial")
									+ "/"
									+ req.getParameter("fynYear")
									+ "/"
									+ req.getParameter("month")
									+ "/"
									+ req.getParameter("billType")
									+ "/"
									+ req.getParameter("autoNum")
									+ "/"
									+ req.getParameter("suffix");
						}
						break;

					case "purchaseReturn":
						page = "purchaseReturn.jsp";

						// ////////Null Manage////////////////////////////
						if (verifyParams(req, resp, "rQty",
								"purProductDetailsID")) {
							req.setAttribute("msg", "Failed! Please try again!");
							req.getRequestDispatcher(page).forward(req, resp);
							return;
						}
						// ////////Null Manage////////////////////////////

						companyInfo = ejb.getUserById(
								(String) httpSession.getAttribute("user"))
								.getCompanyInfo();
						purchaseEntry = ejb.getPurchaseEntryById(Integer
								.parseInt(req.getParameter("peId")));
						voucherAssign = ejb.getVoucherAssignByVendorId(
								Integer.parseInt(req.getParameter("vId"))).get(
								0);

						List<PurchaseReturn> purRet = ejb
								.getAllPurchaseReturn();
						int chPR = 0;
						for (PurchaseReturn pe : purRet) {
							if (pe.getChallanNumber().equals(
									req.getParameter("challanNumber"))) {
								chPR = 1;
								break;
							}
						}
						if (chPR == 0) {

							purchaseReturn = new PurchaseReturn();
							purchaseReturn.setChallanNumber(req
									.getParameter("challanNumber"));
							purchaseReturn.setRoundOff(Float.parseFloat(req
									.getParameter("roundvalue")));
							purchaseReturn.setReturnDate(DateConverter
									.getDate(req.getParameter("returnDate")));
							purchaseReturn.setChallanNo(Integer.parseInt(req
									.getParameter("challanNo")));
							purchaseReturn
									.setChallanSuffix(Integer.parseInt(req
											.getParameter("challanSuffix")));
							purchaseReturn.setTotalReCost(Float.parseFloat(req
									.getParameter("gTotal")));
							purchaseReturn.setReferencePurchaseChallan(req
									.getParameter("REFchallanNumber"));
							purchaseReturn.setPurchaseEntry(purchaseEntry);
							purchaseReturn
									.setRetAgentProfitTotal(Float.parseFloat(req
											.getParameter("profitValue")));
							ejb.setPurchaseReturn(purchaseReturn);

							if (req.getParameter("pType").equals("Credit Note")) {
								voucherDetails = new VoucherDetails();
								voucherDetails.setVoucherAssign(voucherAssign);
								voucherDetails.setCredit(false);
								voucherDetails.setValue(Float.parseFloat(req
										.getParameter("spAmount")));
								// voucherDetails.setTotalCreditNote(Float.parseFloat(req.getParameter("totalCredit"))
								// -
								// Float.parseFloat(req.getParameter("spAmount")));
								voucherDetails.setVoucherDate(DateConverter
										.getDate(req.getParameter("payDate")));
								voucherDetails.setUsers(ejb
										.getUserById((String) httpSession
												.getAttribute("user")));
								voucherDetails
										.setPurchaseReturn(purchaseReturn);
								voucherDetails.setPurchase_Entry(purchaseEntry);
								ejb.setVoucherDetails(voucherDetails);
							}

							paymentDetails = new PaymentDetails();
							paymentDetails.setPaymentDate(DateConverter
									.getDate(req.getParameter("payDate")));
							paymentDetails.setTotalAmount(ejb
									.getPaymentDetailsByPurchaseEntryId(
											purchaseEntry.getId()).get(0)
									.getTotalAmount()
									- ejb.getPaymentDetailsByPurchaseEntryId(
											purchaseEntry.getId()).get(0)
											.getPaidAmount());
							paymentDetails.setPaidAmount(Float.parseFloat(req
									.getParameter("spAmount")));
							paymentDetails.setDescription(req
									.getParameter("desc"));
							paymentDetails.setPurchaseReturn(purchaseReturn);
							paymentDetails.setPurchase_Entry(purchaseEntry);
							paymentDetails.setPaymentType(ejb
									.getPaymentTypeByType(req
											.getParameter("pType")));
							if (ejb.getPaymentDetailsByPurchaseEntryId(
									purchaseEntry.getId()).get(0)
									.getTotalAmount()
									- ejb.getPaymentDetailsByPurchaseEntryId(
											purchaseEntry.getId()).get(0)
											.getPaidAmount() != Float
										.parseFloat(req
												.getParameter("spAmount"))) {
								paymentDetails.setPaymentStatus(ejb
										.getPaymentStatusByStatus("Semi Paid"));
							} else {
								paymentDetails.setPaymentStatus(ejb
										.getPaymentStatusByStatus("Full Paid"));
							}
							paymentDetails.setUniqueNo(Integer.parseInt(req
									.getParameter("uniqueNo")));
							ejb.setPaymentDetails(paymentDetails);

							String db[] = req.getParameterValues("drawBack");
							String rQty[] = req.getParameterValues("rQty");
							String purProductDetailsID[] = req
									.getParameterValues("purProductDetailsID");

							for (int l = 0; l < db.length; l++) {
								if (!rQty[l].equals("0")) {
									if (!rQty[l].equals("")) {
										purchaseProductDetails = ejb
												.getPurchaseProductDetailsById(Integer
														.parseInt(purProductDetailsID[l]));
										purchaseProductDetails
												.setTotalReturningQty(purchaseProductDetails
														.getTotalReturningQty()
														+ Float.parseFloat(rQty[l]));
										purchaseProductDetails
												.setRemaining_quantity(purchaseProductDetails
														.getRemaining_quantity()
														- Float.parseFloat(rQty[l]));
										purchaseProductDetails
												.setPurchaseReturn(purchaseReturn);
										ejb.updatePurchaseProductDetails(purchaseProductDetails);

										purchaseReturnProductDetails = new PurchaseReturnProductDetails();
										purchaseReturnProductDetails
												.setFault(db[l]);
										purchaseReturnProductDetails
												.setQtyReturn(Float
														.parseFloat(rQty[l]));
										purchaseReturnProductDetails
												.setPurchaseProductDetails(purchaseProductDetails);
										purchaseReturnProductDetails
												.setPurchaseReturn(purchaseReturn);
										ejb.setPurchaseProdReturnDetails(purchaseReturnProductDetails);

										if (purchaseProductDetails
												.getProductDetail().isRaw()) {
											rawMaterialsStock = ejb
													.getRawMeterialStoctByProductAndCompanyId(
															purchaseProductDetails
																	.getProductDetail()
																	.getId(),
															companyInfo.getId());
											rawMaterialsStock
													.setRemainingQty(rawMaterialsStock
															.getRemainingQty()
															- Float.parseFloat(rQty[l]));
											ejb.updateRawMaterialStockDetail(rawMaterialsStock);
											rawMaterialsStock = null;
										} else {
											readyGoodsStock = ejb
													.getReadyGoodStoctByProductAndCompanyId(
															purchaseProductDetails
																	.getProductDetail()
																	.getId(),
															companyInfo.getId());
											readyGoodsStock
													.setRemainingQty(readyGoodsStock
															.getRemainingQty()
															- Float.parseFloat(rQty[l]));
											ejb.updateReadyGoodsStockDetail(readyGoodsStock);
											readyGoodsStock = null;
										}
									}
								}
							}

							// new to check
							if (purchaseEntry.getAgentId() != 0
									&& purchaseEntry.isEfectiveProfit()) {
								uniqueNo = ejb
										.getLastUniqueNoOfPayDet4ViaAgent() + 1;

								voucherDetForViaAgent = new VoucherDetailsForViaAgents();
								voucherDetForViaAgent.setVoucherAssignId(ejb
										.getVoucherAssignByVendorId(
												purchaseEntry.getAgentId())
										.get(0).getId());
								voucherDetForViaAgent.setAgentId(purchaseEntry
										.getAgentId());
								voucherDetForViaAgent
										.setPurchaseEntryId(purchaseEntry
												.getId());
								voucherDetForViaAgent
										.setPurchaseReturnId(purchaseReturn
												.getId());
								voucherDetForViaAgent.setCredit(false);
								voucherDetForViaAgent.setValue(purchaseReturn
										.getRetAgentProfitTotal());
								voucherDetForViaAgent
										.setVoucherDate(purchaseReturn
												.getReturnDate());
								voucherDetForViaAgent.setEntryDate(new Date());
								voucherDetForViaAgent
										.setUserId((String) httpSession
												.getAttribute("user"));
								ejb.setVoucherDetails4ViaAgent(voucherDetForViaAgent);

								payDetForViaAgent = new PaymentDetailsForViaAgents();
								payDetForViaAgent.setPaymentDate(purchaseReturn
										.getReturnDate());
								payDetForViaAgent.setEntryDate(new Date());
								payDetForViaAgent.setPaidAmount(purchaseReturn
										.getRetAgentProfitTotal());
								payDetForViaAgent
										.setPurchaseEntryId(purchaseEntry
												.getId());
								payDetForViaAgent
										.setPurchaseReturnId(purchaseReturn
												.getId());
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
							// new to check

							req.setAttribute("purRetIdforPC",
									purchaseReturn.getId());
							msg = "Purchase Return Succeessful";
						} else {
							msg = "Duplicate Entry! Not Allowed!";
						}

						break;

					case "salesEntry":
						page = "salesSalesEntry.jsp";

						// ////////Null Manage////////////////////////////
						if (verifyParams(req, resp, "productId", "qtyvalue",
								"mrpQty", "purchaseProductDetId")) {
							req.setAttribute("msg", "Failed! Please try again!");
							req.getRequestDispatcher(page).forward(req, resp);
							return;
						}
						// ////////Null Manage////////////////////////////

						companyInfo = ejb.getUserById(
								(String) httpSession.getAttribute("user"))
								.getCompanyInfo();

						List<SalesEntry> sEntry = ejb.getAllSalesEntries();
						int chS = 0;
						for (SalesEntry se : sEntry) {
							if (se.getChallanNumber().equals(
									req.getParameter("challanNumber"))) {
								chS = 1;
								break;
							}
						}
						if (chS == 0) {
							if (req.getParameter("isExistingCust").equals("0")) {
								customerEntry = new CustomerEntry();
								customerEntry.setName(req.getParameter(
										"custName").toUpperCase());
								customerEntry.setAddress(req.getParameter(
										"addr").toUpperCase());
								customerEntry.setCity(req.getParameter("city")
										.toUpperCase());
								customerEntry.setMobile(req
										.getParameter("phone"));
								customerEntry.setVat_cst_no(req.getParameter(
										"vatcst").toUpperCase());
								ejb.setCustomerEntry(customerEntry);

								voucherAssign = new VoucherAssign();
								voucherAssign.setCustomerEntry(customerEntry);
								voucherAssign
										.setVoucherDetailsNumber(customerEntry
												.getMobile());
								ejb.setVoucherAssign(voucherAssign);

							} else {
								voucherAssign = ejb
										.getVoucherAssignByCustomerId(Integer.parseInt(req
												.getParameter("existingCustId")));
							}

							salesEntry = new SalesEntry();
							dt = new Date();
							salesEntry.setChallanNumber(req
									.getParameter("challanNumber"));
							salesEntry.setChallanNo(Integer.parseInt(req
									.getParameter("challanNo")));
							salesEntry.setChallanSuffix(Integer.parseInt(req
									.getParameter("challanSuffix")));
							salesEntry.setEntry_Date(dt);
							salesEntry.setSales_date(DateConverter.getDate(req
									.getParameter("salesDate")));
							salesEntry.setTax_Type_Group(ejb
									.getTax_Type_GroupById(Integer.parseInt(req
											.getParameter("taxGroup"))));
							salesEntry.setSubTotal(Float.parseFloat(req
									.getParameter("subtotalvalue")));
							salesEntry.setTaxAmount(Float.parseFloat(req
									.getParameter("taxAmount")));
							salesEntry.setTransportcCharge(Float.parseFloat(req
									.getParameter("transcharge")));
							salesEntry.setSurcharge(Float.parseFloat(req
									.getParameter("surcharge")));
							salesEntry.setRoundOf(Float.parseFloat(req
									.getParameter("roundvalue")));
							salesEntry.setTotalCost(Float.parseFloat(req
									.getParameter("grandtotal")));
							salesEntry.setCompanyInfo(companyInfo);
							salesEntry.setDescription(req.getParameter(
									"salesDesc").toUpperCase());

							if (!req.getParameter("aId").equals("")) {
								salesEntry.setVendor(ejb.getVendorById(Integer
										.parseInt(req.getParameter("aId"))));
							}

							if (req.getParameter("wspORmrp").equals("mrpVal")) {
								salesEntry.setMRP(true);
							} else {
								salesEntry.setMRP(false);
							}
							if (req.getParameter("disType").equals("disFlat")) {
								salesEntry.setFlatDiscount(true);
							} else {
								salesEntry.setFlatDiscount(false);
							}

							if (req.getParameter("isExistingCust").equals("0")) {
								salesEntry.setCustomer(customerEntry);
							} else {
								salesEntry
										.setCustomer(ejb.getCustomerEntryById(Integer.parseInt(req
												.getParameter("existingCustId"))));
							}

							salesEntry.setDiscountValue(Float.parseFloat(req
									.getParameter("disValue"))); // this
																	// is
																	// not
																	// total
																	// discount.

							// ////////////////////////////////////////////////
							if (req.getParameter("isEffective").equals(
									"efectiveYes")) {
								salesEntry.setEfectiveProfit(true);
							} else {
								salesEntry.setEfectiveProfit(false);
							}
							if (req.getParameter("profitType").equals(
									"profitFlat")) {
								salesEntry.setFlatProfitAgent(true);
							} else {
								salesEntry.setFlatProfitAgent(false);
							}
							salesEntry.setAgentProfitValue(Float.parseFloat(req
									.getParameter("profitVal"))); // this
																	// is
																	// not
																	// total
																	// profit.
							salesEntry.setAgentProfitTotal(Float.parseFloat(req
									.getParameter("profitValue"))); // this
																	// is
																	// total
																	// profit.
							// //////////////////////////////////////////////////////////////
							ejb.setSalesEntry(salesEntry);
							// if (!req.getParameter("pstatus")
							// .equals("Full Paid")) {
							voucherDetails = new VoucherDetails();
							voucherDetails.setSalesEntry(salesEntry);
							voucherDetails.setCredit(false);
							voucherDetails.setValue(Float.parseFloat(req
									.getParameter("spDueAmount")));
							voucherDetails.setVoucherDate(DateConverter
									.getDate(req.getParameter("payDate")));
							voucherDetails.setUsers(ejb.getUserById(httpSession
									.getAttribute("user").toString()));

							// if
							// (!req.getParameter("existingCustId").equals(""))
							// {
							// List<VoucherDetails> vDetails =
							// ejb.getLastVoucherDetailsbyCustomerId(
							// Integer.parseInt(req.getParameter("existingCustId")));
							// voucherDetails.setTotalDebitNote(vDetails.size()
							// > 0
							// ? vDetails.get(vDetails.size() -
							// 1).getTotalDebitNote()
							// +
							// Float.parseFloat(req.getParameter("spDueAmount"))
							// : 0 +
							// Float.parseFloat(req.getParameter("spDueAmount")));
							// }
							//
							// else {
							// voucherDetails.setTotalDebitNote(Float.parseFloat(req.getParameter("spDueAmount")));
							// }

							voucherDetails.setVoucherAssign(voucherAssign);
							ejb.setVoucherDetails(voucherDetails);
							// }

							paymentDetails = new PaymentDetails();
							paymentDetails.setPaymentDate(DateConverter
									.getDate(req.getParameter("payDate")));
							paymentDetails.setTotalAmount(Float.parseFloat(req
									.getParameter("spAmount")));
							paymentDetails.setPaidAmount(Float.parseFloat(req
									.getParameter("spPaymentAmount")));
							paymentDetails.setDescription(req
									.getParameter("desc"));
							paymentDetails.setSalesEntry(salesEntry);
							paymentDetails.setPaymentType(ejb
									.getPaymentTypeByType(req
											.getParameter("pType")));
							paymentDetails.setPaymentStatus(ejb
									.getPaymentStatusByStatus(req
											.getParameter("pstatus")));
							paymentDetails.setUniqueNo(Integer.parseInt(req
									.getParameter("uniqueNo")));
							ejb.setPaymentDetails(paymentDetails);

							String productId[] = req
									.getParameterValues("productId");
							String qtyvalue[] = req
									.getParameterValues("qtyvalue");
							String mrpQty[] = req.getParameterValues("mrpQty");
							String purchaseProductDetId[] = req
									.getParameterValues("purchaseProductDetId");

							for (int l = 0; l < productId.length; l++) {
								salesProductDetails = new SalesProductDetails();
								salesProductDetails.setSalesEntry(salesEntry);
								salesProductDetails.setSalesPrice(Float
										.parseFloat(mrpQty[l]));
								salesProductDetails.setQuantity(Float
										.parseFloat(qtyvalue[l]));
								salesProductDetails
										.setPurchase_Product_Details(ejb
												.getPurchaseProductDetailsById(Integer
														.parseInt(purchaseProductDetId[l])));
								ejb.setSalesProductDetails(salesProductDetails);
								purchaseProductDetails = ejb
										.getPurchaseProductDetailsById(Integer
												.parseInt(purchaseProductDetId[l]));
								purchaseProductDetails
										.setRemaining_quantity(purchaseProductDetails
												.getRemaining_quantity()
												- Float.parseFloat(qtyvalue[l]));
								ejb.updatePurchaseProductDetails(purchaseProductDetails);

								if (purchaseProductDetails.getProductDetail()
										.isRaw()) {
									rawMaterialsStock = ejb
											.getRawMeterialStoctByProductAndCompanyId(
													purchaseProductDetails
															.getProductDetail()
															.getId(),
													companyInfo.getId());

									rawMaterialsStock
											.setRemainingQty(rawMaterialsStock
													.getRemainingQty()
													- Float.parseFloat(qtyvalue[l]));

									ejb.updateRawMaterialStockDetail(rawMaterialsStock);
								} else {
									readyGoodsStock = ejb
											.getReadyGoodStoctByProductAndCompanyId(
													purchaseProductDetails
															.getProductDetail()
															.getId(),
													companyInfo.getId());

									readyGoodsStock
											.setRemainingQty(readyGoodsStock
													.getRemainingQty()
													- Float.parseFloat(qtyvalue[l]));

									ejb.updateReadyGoodsStockDetail(readyGoodsStock);
								}

								rawMaterialsStock = null;
								readyGoodsStock = null;
								purchaseProductDetails = null;
								salesProductDetails = null;
							}

							// new to check
							if (salesEntry.getVendor() != null) {
								uniqueNo = ejb
										.getLastUniqueNoOfPayDet4ViaAgent() + 1;
								if (ejb.getVoucherAssignByVendorId(
										salesEntry.getVendor().getId()).size() == 0) {
									voucherAssign = new VoucherAssign();
									vendor = ejb.getVendorById(salesEntry
											.getVendor().getId());
									voucherAssign.setVendor(vendor);
									voucherAssign
											.setVoucherDetailsNumber(vendor
													.getPh1());
									ejb.setVoucherAssign(voucherAssign);
								} else {
									voucherAssign = ejb
											.getVoucherAssignByVendorId(
													salesEntry.getVendor()
															.getId()).get(0);
								}

								voucherDetForViaAgent = new VoucherDetailsForViaAgents();
								voucherDetForViaAgent
										.setVoucherAssignId(voucherAssign
												.getId());
								voucherDetForViaAgent.setAgentId(salesEntry
										.getVendor().getId());
								voucherDetForViaAgent
										.setSalesEntryId(salesEntry.getId());
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
								payDetForViaAgent
										.setUserId((String) httpSession
												.getAttribute("user"));
								ejb.setPaymentDetails4ViaAgent(payDetForViaAgent);
							}
							// new to check

							req.setAttribute("purDetIdforPC",
									salesEntry.getId());
							salesEntry = null;
							msg = "Sales entry is successfull...";
						} else {
							msg = "Duplicate entry! Not allowed!";
						}
						break;

					case "purchaseSearchByDate":
						page = "purchasingPurchaseSearch.jsp";
						List<Purchase_Entry> purEntryList = ejb
								.getPurchaseEntryByDateAndCompany(
										DateConverter.getDate(req
												.getParameter("fDate")),
										DateConverter.getDate(req
												.getParameter("lDate")),
										ejb.getUserById(
												(String) httpSession
														.getAttribute("user"))
												.getCompanyInfo().getId());
						req.setAttribute("purEntryList", purEntryList);
						if (purEntryList.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}
						break;

					case "purchaseSearchByDateForViaPurchaseAgent":
						page = "purchaseAgentProfitPayment.jsp";
						List<Purchase_Entry> purEntryListFVPA = ejb
								.getPurchaseEntryByDateAndCompany(
										DateConverter.getDate(req
												.getParameter("fDate")),
										DateConverter.getDate(req
												.getParameter("lDate")),
										ejb.getUserById(
												(String) httpSession
														.getAttribute("user"))
												.getCompanyInfo().getId());
						req.setAttribute("purEntryList", purEntryListFVPA);
						if (purEntryListFVPA.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}
						break;

					case "purchaseProductionSearchByDate":
						page = "purchasingProductionSearch.jsp";
						List<Purchase_Entry> purEntryListP = ejb
								.getPurchaseEntryByDateAndCompany(
										DateConverter.getDate(req
												.getParameter("fDate")),
										DateConverter.getDate(req
												.getParameter("lDate")),
										ejb.getUserById(
												(String) httpSession
														.getAttribute("user"))
												.getCompanyInfo().getId());
						req.setAttribute("purEntryList", purEntryListP);
						if (purEntryListP.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}
						break;

					case "purchaseReportByDate":
						page = "reportPurchaseReport.jsp";
						List<Purchase_Entry> purEntryListRp = ejb
								.getPurchaseEntryByDateAndCompany(
										DateConverter.getDate(req
												.getParameter("fDate")),
										DateConverter.getDate(req
												.getParameter("lDate")),
										ejb.getUserById(
												(String) httpSession
														.getAttribute("user"))
												.getCompanyInfo().getId());
						req.setAttribute("purEntryList", purEntryListRp);
						if (purEntryListRp.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}
						break;

					case "purchaseSearchByPurchaseChallanNo":
						page = "purchasingPurchaseSearch.jsp";
						List<Purchase_Entry> purEntryList1 = ejb
								.getPurchaseEntryByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));

						req.setAttribute("purEntryList", purEntryList1);

						if (purEntryList1.size() > 0) {
							msg = "Your search for Purchase challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for Purchase challan number : "
									+ req.getParameter("companyInitial")
									+ "/"
									+ req.getParameter("fynYear")
									+ "/"
									+ req.getParameter("month")
									+ "/"
									+ req.getParameter("billType")
									+ "/"
									+ req.getParameter("autoNum")
									+ "/"
									+ req.getParameter("suffix");
						}
						break;

					case "purchaseSearchByPurchaseChallanNoForViaPurchaseAgent":
						page = "purchaseAgentProfitPayment.jsp";
						List<Purchase_Entry> purEntryList1FVPA = ejb
								.getPurchaseEntryByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));

						req.setAttribute("purEntryList", purEntryList1FVPA);

						if (purEntryList1FVPA.size() > 0) {
							msg = "Your search for Purchase challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for Purchase challan number : "
									+ req.getParameter("companyInitial")
									+ "/"
									+ req.getParameter("fynYear")
									+ "/"
									+ req.getParameter("month")
									+ "/"
									+ req.getParameter("billType")
									+ "/"
									+ req.getParameter("autoNum")
									+ "/"
									+ req.getParameter("suffix");
						}
						break;

					case "purchaseProductionSearchByPurchaseChallanNo":
						page = "purchasingProductionSearch.jsp";
						List<Purchase_Entry> purEntryList1P = ejb
								.getPurchaseEntryByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));

						req.setAttribute("purEntryList", purEntryList1P);

						if (purEntryList1P.size() > 0) {
							msg = "Your search for Challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for Challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}
						break;

					case "purchaseSearchByVendorName":
						page = "purchasingPurchaseSearch.jsp";
						List<Purchase_Entry> purEntryList2 = ejb
								.getPurchaseEntryByVendorNameAndCompany(req
										.getParameter("vendorName"));
						req.setAttribute("purEntryList", purEntryList2);
						if (purEntryList2.size() > 0) {
							msg = "Your search for Vendor name : "
									+ req.getParameter("vendorName")
											.toUpperCase();
						} else {
							msg = "No result found for Vendor name : "
									+ req.getParameter("vendorName")
											.toUpperCase();
						}
						break;

					case "purchaseSearchByVendorNameForViaPurchaseAgent":
						page = "purchaseAgentProfitPayment.jsp";
						List<Purchase_Entry> purEntryList2FVA = ejb
								.getPurchaseEntryByVendorNameAndCompany(req
										.getParameter("vendorName"));
						req.setAttribute("purEntryList", purEntryList2FVA);
						if (purEntryList2FVA.size() > 0) {
							msg = "Your search for Vendor name : "
									+ req.getParameter("vendorName")
											.toUpperCase();
						} else {
							msg = "No result found for Vendor name : "
									+ req.getParameter("vendorName")
											.toUpperCase();
						}
						break;

					case "purchaseReportByVendorName":
						page = "reportPurchaseVendorView.jsp";
						List<Purchase_Entry> purEntryList2R = ejb
								.getAllPurchaseEntryByVendorIdTypeVendor(Integer
										.parseInt(req.getParameter("pId")));
						req.setAttribute("purEntryList", purEntryList2R);
						req.setAttribute("pId", req.getParameter("pId"));
						if (purEntryList2R.size() > 0) {
							msg = "Your search for Vendor name : "
									+ req.getParameter("vendorName")
											.toUpperCase();
						} else {
							msg = "No result found for Vendor name : "
									+ req.getParameter("vendorName")
											.toUpperCase();
						}
						break;

					case "purchaseSearchByAgentName":
						page = "purchasingPurchaseSearch.jsp";
						List<Purchase_Entry> purEntryList3 = ejb
								.getPurchaseEntryByAgentNameAndCompany(req
										.getParameter("agentName"));
						req.setAttribute("purEntryList", purEntryList3);
						if (purEntryList3.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						}
						break;

					case "purchaseSearchByAgentNameForViaPurchaseAgent":
						page = "purchaseAgentProfitPayment.jsp";
						List<Purchase_Entry> purEntryList3FVA = ejb
								.getPurchaseEntryByViaAgentId(Integer
										.parseInt(req.getParameter("VagentId")));
						req.setAttribute("purEntryList", purEntryList3FVA);
						if (purEntryList3FVA.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("VagentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("VagentName")
											.toUpperCase();
						}
						break;

					case "purchaseSearchByViaAgentName":
						page = "purchasingPurchaseSearch.jsp";
						List<Purchase_Entry> purEntryListVA = ejb
								.getPurchaseEntryByViaAgentId(Integer
										.parseInt(req.getParameter("VagentId")));
						req.setAttribute("purEntryList", purEntryListVA);
						if (purEntryListVA.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("VagentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("VagentName")
											.toUpperCase();
						}
						break;

					case "purchaseReportByAgentName":
						page = "reportPurchaseAgentView.jsp";
						List<Purchase_Entry> purEntryList3R = ejb
								.getAllPurchaseEntryByVendorIdTypePurchaseAgent(Integer
										.parseInt(req.getParameter("pId")));
						req.setAttribute("purEntryList", purEntryList3R);
						req.setAttribute("pId", req.getParameter("pId"));
						if (purEntryList3R.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						}
						break;

					case "purchaseSearchByProductCode":
						page = "purchasingPurchaseSearch.jsp";
						List<Purchase_Entry> purEntryList4 = ejb
								.getPurchaseEntryByProductCodeAndCompany(req
										.getParameter("prodCode"));
						req.setAttribute("purEntryList", purEntryList4);
						if (purEntryList4.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "purchaseSearchByProductCodeForViaPurchaseAgent":
						page = "purchaseAgentProfitPayment.jsp";
						List<Purchase_Entry> purEntryList4FVA = ejb
								.getPurchaseEntryByProductCodeAndCompany(req
										.getParameter("prodCode"));
						req.setAttribute("purEntryList", purEntryList4FVA);
						if (purEntryList4FVA.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "purchaseProductionSearchByProductCode":
						page = "purchasingProductionSearch.jsp";
						List<Purchase_Entry> purEntryList4P = ejb
								.getPurchaseEntryByProductCodeAndCompany(req
										.getParameter("prodCode"));
						req.setAttribute("purEntryList", purEntryList4P);
						if (purEntryList4P.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "purchaseReportByProductCode":
						page = "reportPurchaseReport.jsp";
						List<Purchase_Entry> purEntryList4R = ejb
								.getPurchaseEntryByProductId(Integer
										.parseInt(req.getParameter("pId")));
						req.setAttribute("purEntryList", purEntryList4R);
						if (purEntryList4R.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "purchaseSearchAll":
						page = "purchasingPurchaseSearch.jsp";
						List<Purchase_Entry> purEntryListA = ejb
								.getAllPurchaseEntryByCompany();
						if (purEntryListA.size() > 0) {
							msg = "All Purchase List";
							req.setAttribute("purEntryList", purEntryListA);
						} else {
							msg = "No result found...";
						}
						break;

					case "purchaseSearchAllForViaPurchaseAgent":
						page = "purchaseAgentProfitPayment.jsp";
						List<Purchase_Entry> purEntryList4VPA = ejb
								.getAllPurchaseEntry();
						if (purEntryList4VPA.size() > 0) {
							msg = "All Purchase List For Purchase Agent (Via) Profit Payment";
							req.setAttribute("purEntryList", purEntryList4VPA);
						} else {
							msg = "No result found...";
						}
						break;

					case "purchaseProductionSearchAll":
						page = "purchasingProductionSearch.jsp";
						List<Purchase_Entry> purEntryListAP = ejb
								.getAllPurchaseEntryByCompany();
						if (purEntryListAP.size() > 0) {
							msg = "All Ready Production List";
							req.setAttribute("purEntryList", purEntryListAP);
						} else {
							msg = "No result found...";
						}
						break;

					case "allPurchaseReport":
						page = "reportPurchaseReport.jsp";
						List<Purchase_Entry> purEntryListAR = ejb
								.getAllPurchaseEntryByCompany();
						req.setAttribute("purEntryList", purEntryListAR);
						msg = "";
						break;

					case "purchaseBarCode":
						page = "purchaseBarcode.jsp";
						String purProdDetIdLst[] = req
								.getParameterValues("prodCheck");
						String qtyLst[] = req.getParameterValues("qtyProd");
						List<Purchase_Product_Details> purProdDetLst = new ArrayList<Purchase_Product_Details>();
						for (int q = 0; q < qtyLst.length; q++) {
							if (qtyLst[q] != null || qtyLst[q] != "") {
								Purchase_Product_Details ppd = ejb
										.getPurchaseProductDetailsById(Integer
												.parseInt(purProdDetIdLst[q]));
								ppd.setNumberForBarcodePrint(Integer
										.parseInt(qtyLst[q]));
								purProdDetLst.add(ppd);
								ppd = null;
							}
						}
						req.setAttribute("purProdDetLst", purProdDetLst);
						break;

					case "purchaseView":
						page = "purchaseView.jsp";

						req.setAttribute("pId", req.getParameter("pId"));

						msg = "";

						break;

					case "purchaseReturnView":
						page = "purchaseReturnView.jsp";
						req.setAttribute("prId", req.getParameter("prId"));
						msg = "";
						break;

					case "purchaseProductionView":
						page = "purchaseProductionView.jsp";
						req.setAttribute("pId", req.getParameter("pId"));
						msg = "";
						break;

					case "purchaseReturnSearchAll":
						page = "purchaseReturnSearch.jsp";
						List<PurchaseReturn> purRetA = ejb
								.getAllPurchaseReturnDesc();
						if (purRetA.size() > 0) {
							msg = "All Purchase Return List";
							req.setAttribute("purRetList", purRetA);
						} else {
							msg = "No result found...";
						}
						break;

					case "purchaseReturnSearchByDate":
						page = "purchaseReturnSearch.jsp";
						List<PurchaseReturn> purRetD = ejb
								.getPurchaseReturnByDate(DateConverter
										.getDate(req.getParameter("fDate")),
										DateConverter.getDate(req
												.getParameter("lDate")));
						req.setAttribute("purRetList", purRetD);
						if (purRetD.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}
						break;

					case "purchaseRetSearchByChallanNo":
						page = "purchaseReturnSearch.jsp";
						List<PurchaseReturn> purRetC = ejb
								.getPurchaseReturnByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));

						req.setAttribute("purRetList", purRetC);

						if (purRetC.size() > 0) {
							msg = "Your search for challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}
						break;

					case "purchaseRetSearchByRefChallanNo":
						page = "purchaseReturnSearch.jsp";
						List<PurchaseReturn> purRetRC = ejb
								.getPurchaseReturnByReferenceChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));

						req.setAttribute("purRetList", purRetRC);

						if (purRetRC.size() > 0) {
							msg = "Your search for Reference challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for Reference challan number : "
									+ req.getParameter("companyInitial")
									+ "/"
									+ req.getParameter("fynYear")
									+ "/"
									+ req.getParameter("month")
									+ "/"
									+ req.getParameter("billType")
									+ "/"
									+ req.getParameter("autoNum")
									+ "/"
									+ req.getParameter("suffix");
						}
						break;

					case "purchaseRetSearchByProductCode":
						page = "purchaseReturnSearch.jsp";
						List<PurchaseReturn> purRetP = ejb
								.getPurchaseReturnByProductCode(req
										.getParameter("prodCode"));
						req.setAttribute("purRetList", purRetP);
						if (purRetP.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "purchaseRetSearchByVendorName":
						page = "purchaseReturnSearch.jsp";
						List<PurchaseReturn> purRetV = ejb
								.getPurchaseReturnByVendorName(req
										.getParameter("vendorName"));
						req.setAttribute("purRetList", purRetV);
						if (purRetV.size() > 0) {
							msg = "Your search for Vendor name : "
									+ req.getParameter("vendorName")
											.toUpperCase();
						} else {
							msg = "No result found for Vendor name : "
									+ req.getParameter("vendorName")
											.toUpperCase();
						}
						break;

					case "purchaseRetSearchByAgentName":
						page = "purchaseReturnSearch.jsp";
						List<PurchaseReturn> purRetAg = ejb
								.getPurchaseReturnByAgentName(req
										.getParameter("agentName"));
						req.setAttribute("purRetList", purRetAg);
						if (purRetAg.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						}
						break;

					case "purchaseRetSearchByViaAgentNamet":
						page = "purchaseReturnSearch.jsp";
						List<PurchaseReturn> purRetVAg = ejb
								.getPurchaseReturnByViaAgentId(Integer
										.parseInt(req.getParameter("VagentId")));
						req.setAttribute("purRetList", purRetVAg);
						if (purRetVAg.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("VagentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("VagentName")
											.toUpperCase();
						}
						break;

					case "purchaseEdit":
						page = "purchaseEdit.jsp";

						req.setAttribute("pId", req.getParameter("pId"));

						msg = "";

						break;

					case "purchaseReportView":
						page = "reportPurchaseView.jsp";

						req.setAttribute("pId", req.getParameter("pId"));

						msg = "";

						break;

					case "purchaseProductView":
						page = "reportPurchaseProductView.jsp";

						req.setAttribute("pId", req.getParameter("pId"));
						req.setAttribute("purEntryList", ejb
								.getPurchaseEntryByProductCodeAndCompany(req
										.getParameter("prodCode")));

						msg = "";

						break;

					case "purchasePayment":
						page = "purchaseView.jsp";
						req.setAttribute("pId", req.getParameter("peId"));

						boolean isDuplicateP = false;
						for (PaymentDetails pd : ejb.getAllPaymentDetails()) {
							if (pd.getUniqueNo() == Integer.parseInt(req
									.getParameter("uniqueNo"))) {
								isDuplicateP = true;
								break;
							}
						}

						if (isDuplicateP) {
							msg = "Duplicate Entry! Not Allowed!!!";
						} else {
							if (ejb.getVoucherAssignByVendorId(
									Integer.parseInt(req.getParameter("vId")))
									.size() == 0) {
								voucherAssign = new VoucherAssign();
								vendor = ejb.getVendorById(Integer.parseInt(req
										.getParameter("vId")));
								voucherAssign.setVendor(vendor);
								voucherAssign.setVoucherDetailsNumber(vendor
										.getPh1());
								ejb.setVoucherAssign(voucherAssign);
							} else {
								voucherAssign = ejb.getVoucherAssignByVendorId(
										Integer.parseInt(req
												.getParameter("vId"))).get(0);
							}

							// if (ejb.getAllVoucherDetailsByPurchaseEntryId(
							// Integer.parseInt(req.getParameter("peId")))
							// .size() == 0) {
							// if (!req.getParameter("pstatus").equals(
							// "Full Paid")) {
							// voucherDetails = new VoucherDetails();
							// voucherDetails
							// .setVoucherAssign(voucherAssign);
							// voucherDetails.setCredit(true);
							// voucherDetails
							// .setValue(Float.parseFloat(req
							// .getParameter("spDueAmount")));
							// //
							// voucherDetails.setTotalCreditNote(Float.parseFloat(req.getParameter("finalDC")));
							// if (ejb.getVoucherDetailsByVendorId(
							// Integer.parseInt(req
							// .getParameter("vId")))
							// .size() == 0) {
							// voucherDetails
							// .setTotalCreditNote(Float.parseFloat(req
							// .getParameter("spDueAmount")));
							// } else {
							// List<VoucherDetails> vDetails = ejb
							// .getVoucherDetailsByVendorId(Integer.parseInt(req
							// .getParameter("vId")));
							// float totalCreditNote = vDetails.get(
							// vDetails.size() - 1)
							// .getTotalCreditNote();
							// voucherDetails
							// .setTotalCreditNote(Float.parseFloat(req
							// .getParameter("spDueAmount"))
							// + totalCreditNote);
							// }
							// voucherDetails.setVoucherDate(DateConverter
							// .getDate(req
							// .getParameter("payDate")));
							// voucherDetails.setUsers(ejb
							// .getUserById((String) httpSession
							// .getAttribute("user")));
							// voucherDetails
							// .setPurchase_Entry(ejb
							// .getPurchaseEntryById(Integer.parseInt(req
							// .getParameter("peId"))));
							// ejb.setVoucherDetails(voucherDetails);
							// }
							// } else {
							voucherDetails = new VoucherDetails();
							voucherDetails.setVoucherAssign(voucherAssign);
							voucherDetails.setCredit(false);
							voucherDetails.setValue(Float.parseFloat(req
									.getParameter("spPaymentAmount")));
							// List<VoucherDetails> vDetails = ejb
							// .getVoucherDetailsByVendorId(Integer.parseInt(req.getParameter("vId")));
							// float totalCreditNote =
							// vDetails.get(vDetails.size() -
							// 1).getTotalCreditNote();
							// voucherDetails.setTotalCreditNote(
							// totalCreditNote -
							// Float.parseFloat(req.getParameter("spPaymentAmount")));
							voucherDetails.setVoucherDate(DateConverter
									.getDate(req.getParameter("payDate")));
							voucherDetails.setUsers(ejb
									.getUserById((String) httpSession
											.getAttribute("user")));
							voucherDetails.setPurchase_Entry(ejb
									.getPurchaseEntryById(Integer.parseInt(req
											.getParameter("peId"))));
							ejb.setVoucherDetails(voucherDetails);
							// }

							paymentDetails = new PaymentDetails();
							paymentDetails.setPaymentDate(DateConverter
									.getDate(req.getParameter("payDate")));
							// paymentDetails.setTotalAmount(Float.parseFloat(req
							// .getParameter("spAmount")));
							paymentDetails.setTotalAmount(ejb
									.getPaymentDetailsByPurchaseEntryId(
											Integer.parseInt(req
													.getParameter("peId")))
									.get(0).getTotalAmount()
									- ejb.getPaymentDetailsByPurchaseEntryId(
											Integer.parseInt(req
													.getParameter("peId")))
											.get(0).getPaidAmount());
							paymentDetails.setPaidAmount(Float.parseFloat(req
									.getParameter("spPaymentAmount")));
							paymentDetails.setDescription(req
									.getParameter("desc"));
							paymentDetails.setPurchase_Entry(ejb
									.getPurchaseEntryById(Integer.parseInt(req
											.getParameter("peId"))));
							paymentDetails.setPaymentType(ejb
									.getPaymentTypeByType(req
											.getParameter("pType")));
							paymentDetails.setPaymentStatus(ejb
									.getPaymentStatusByStatus(req
											.getParameter("pstatus")));
							paymentDetails.setUniqueNo(Integer.parseInt(req
									.getParameter("uniqueNo")));
							ejb.setPaymentDetails(paymentDetails);
							msg = "Successful!";
						}
						break;

					case "salesPayment":
						page = "salesView.jsp";
						req.setAttribute("sId", req.getParameter("seId"));

						boolean isDuplicateS = false;
						for (PaymentDetails pd : ejb.getAllPaymentDetails()) {
							if (pd.getUniqueNo() == Integer.parseInt(req
									.getParameter("uniqueNo"))) {
								isDuplicateS = true;
								break;
							}
						}

						if (isDuplicateS) {
							msg = "Duplicate Entry! Not Allowed!!!";
						} else {
							if (ejb.getVoucherAssignByCustomerId(Integer
									.parseInt(req.getParameter("cId"))) == null) {
								voucherAssign = new VoucherAssign();
								customerEntry = ejb
										.getCustomerEntryById(Integer
												.parseInt(req
														.getParameter("cId")));
								voucherAssign.setCustomerEntry(customerEntry);
								voucherAssign
										.setVoucherDetailsNumber(customerEntry
												.getMobile());
								ejb.setVoucherAssign(voucherAssign);
							} else {
								voucherAssign = ejb
										.getVoucherAssignByCustomerId(Integer
												.parseInt(req
														.getParameter("cId")));
							}

							// if (ejb.getAllVoucherDetailsBySalesEntryId(
							// Integer.parseInt(req.getParameter("seId")))
							// .size() == 0) {
							// if (!req.getParameter("pstatus").equals(
							// "Full Paid")) {
							// voucherDetails = new VoucherDetails();
							// voucherDetails
							// .setSalesEntry(ejb.getSalesEntryById(Integer.parseInt(req
							// .getParameter("seId"))));
							// voucherDetails.setCredit(false);
							// voucherDetails
							// .setValue(Float.parseFloat(req
							// .getParameter("spDueAmount")));
							// voucherDetails.setVoucherDate(DateConverter
							// .getDate(req
							// .getParameter("payDate")));
							// voucherDetails.setUsers(ejb
							// .getUserById(httpSession
							// .getAttribute("user")
							// .toString()));
							// List<VoucherDetails> vDetails = ejb
							// .getLastVoucherDetailsbyCustomerId(Integer.parseInt(req
							// .getParameter("cId")));
							// voucherDetails
							// .setTotalDebitNote(vDetails.size() > 0 ? vDetails
							// .get(vDetails.size() - 1)
							// .getTotalDebitNote()
							// + Float.parseFloat(req
							// .getParameter("spDueAmount"))
							// : 0 + Float.parseFloat(req
							// .getParameter("spDueAmount")));
							// voucherDetails
							// .setVoucherAssign(voucherAssign);
							// ejb.setVoucherDetails(voucherDetails);
							// }
							// } else {
							voucherDetails = new VoucherDetails();
							voucherDetails.setVoucherAssign(voucherAssign);
							voucherDetails.setCredit(true);
							voucherDetails.setValue(Float.parseFloat(req
									.getParameter("spPaymentAmount")));
							// List<VoucherDetails> vDetails = ejb
							// .getLastVoucherDetailsbyCustomerId(Integer.parseInt(req.getParameter("cId")));
							// voucherDetails.setTotalDebitNote(vDetails.get(vDetails.size()
							// - 1).getTotalDebitNote()
							// -
							// Float.parseFloat(req.getParameter("spPaymentAmount")));
							voucherDetails.setVoucherDate(DateConverter
									.getDate(req.getParameter("payDate")));
							voucherDetails.setUsers(ejb
									.getUserById((String) httpSession
											.getAttribute("user")));
							voucherDetails.setSalesEntry(ejb
									.getSalesEntryById(Integer.parseInt(req
											.getParameter("seId"))));
							ejb.setVoucherDetails(voucherDetails);
							// }

							paymentDetails = new PaymentDetails();
							paymentDetails.setPaymentDate(DateConverter
									.getDate(req.getParameter("payDate")));
							// paymentDetails.setTotalAmount(Float.parseFloat(req
							// .getParameter("spAmount")));
							paymentDetails.setTotalAmount(ejb
									.getPaymentDetailsBySalesEntryId(
											Integer.parseInt(req
													.getParameter("seId")))
									.get(0).getTotalAmount()
									- ejb.getPaymentDetailsBySalesEntryId(
											Integer.parseInt(req
													.getParameter("seId")))
											.get(0).getPaidAmount());
							paymentDetails.setPaidAmount(Float.parseFloat(req
									.getParameter("spPaymentAmount")));
							paymentDetails.setDescription(req
									.getParameter("desc"));
							paymentDetails.setSalesEntry(ejb
									.getSalesEntryById(Integer.parseInt(req
											.getParameter("seId"))));
							paymentDetails.setPaymentType(ejb
									.getPaymentTypeByType(req
											.getParameter("pType")));
							paymentDetails.setPaymentStatus(ejb
									.getPaymentStatusByStatus(req
											.getParameter("pstatus")));
							paymentDetails.setUniqueNo(Integer.parseInt(req
									.getParameter("uniqueNo")));
							ejb.setPaymentDetails(paymentDetails);
							msg = "Successful!";
						}
						break;

					case "salesAgentPayment":
						page = "salesAgentProfitPayment.jsp";
						List<SalesEntry> salesEntryLst4AP = ejb
								.getAllSalesEntriesByCompany();
						req.setAttribute("salesEntryLst", salesEntryLst4AP);

						boolean isDuplicateSAP = false;
						for (PaymentDetailsForViaAgents pd : ejb
								.getAllPaymentDetails4ViaAgent()) {
							if (pd.getUniqueNo() == Integer.parseInt(req
									.getParameter("uniqueNo"))) {
								isDuplicateSAP = true;
								break;
							}
						}

						if (isDuplicateSAP) {
							msg = "Duplicate Entry! Not Allowed!!!";
						} else {
							if (ejb.getVoucherAssignByVendorId(
									Integer.parseInt(req.getParameter("aId")))
									.size() == 0) {
								voucherAssign = new VoucherAssign();
								vendor = ejb.getVendorById(Integer.parseInt(req
										.getParameter("aId")));
								voucherAssign.setVendor(vendor);
								voucherAssign.setVoucherDetailsNumber(vendor
										.getPh1());
								ejb.setVoucherAssign(voucherAssign);
							} else {
								voucherAssign = ejb.getVoucherAssignByVendorId(
										Integer.parseInt(req
												.getParameter("aId"))).get(0);
							}

							voucherDetForViaAgent = new VoucherDetailsForViaAgents();
							voucherDetForViaAgent
									.setVoucherAssignId(voucherAssign.getId());
							voucherDetForViaAgent.setAgentId(Integer
									.parseInt(req.getParameter("aId")));
							voucherDetForViaAgent.setSalesEntryId(Integer
									.parseInt(req.getParameter("seId")));
							voucherDetForViaAgent.setCredit(false);
							voucherDetForViaAgent.setValue(Float.parseFloat(req
									.getParameter("spPaymentAmount")));
							voucherDetForViaAgent.setVoucherDate(DateConverter
									.getDate(req.getParameter("payDate")));
							voucherDetForViaAgent.setEntryDate(new Date());
							voucherDetForViaAgent
									.setUserId((String) httpSession
											.getAttribute("user"));
							ejb.setVoucherDetails4ViaAgent(voucherDetForViaAgent);

							payDetForViaAgent = new PaymentDetailsForViaAgents();
							payDetForViaAgent.setPaymentDate(DateConverter
									.getDate(req.getParameter("payDate")));
							payDetForViaAgent.setEntryDate(new Date());
							payDetForViaAgent.setPaidAmount(Float
									.parseFloat(req
											.getParameter("spPaymentAmount")));
							payDetForViaAgent.setDescription(req
									.getParameter("desc"));
							payDetForViaAgent.setSalesEntryId(Integer
									.parseInt(req.getParameter("seId")));
							payDetForViaAgent.setPaymentTypeId(ejb
									.getPaymentTypeByType(
											req.getParameter("pType")).getId());
							payDetForViaAgent.setPaymentStatusId(ejb
									.getPaymentStatusByStatus(
											req.getParameter("pstatus"))
									.getId());
							payDetForViaAgent.setUniqueNo(Integer.parseInt(req
									.getParameter("uniqueNo")));
							payDetForViaAgent.setUserId((String) httpSession
									.getAttribute("user"));
							ejb.setPaymentDetails4ViaAgent(payDetForViaAgent);
							msg = "Successful!";
						}
						break;

					case "purchaseAgentPayment":
						page = "purchaseAgentProfitPayment.jsp";
						List<Purchase_Entry> purEntryLst4PAP = ejb
								.getAllPurchaseEntry();
						req.setAttribute("purEntryList", purEntryLst4PAP);

						boolean isDuplicate4PAP = false;
						for (PaymentDetailsForViaAgents pd : ejb
								.getAllPaymentDetails4ViaAgent()) {
							if (pd.getUniqueNo() == Integer.parseInt(req
									.getParameter("uniqueNo"))) {
								isDuplicate4PAP = true;
								break;
							}
						}

						if (isDuplicate4PAP) {
							msg = "Duplicate Entry! Not Allowed!!!";
						} else {
							if (ejb.getVoucherAssignByVendorId(
									Integer.parseInt(req.getParameter("aId")))
									.size() == 0) {
								voucherAssign = new VoucherAssign();
								vendor = ejb.getVendorById(Integer.parseInt(req
										.getParameter("aId")));
								voucherAssign.setVendor(vendor);
								voucherAssign.setVoucherDetailsNumber(vendor
										.getPh1());
								ejb.setVoucherAssign(voucherAssign);
							} else {
								voucherAssign = ejb.getVoucherAssignByVendorId(
										Integer.parseInt(req
												.getParameter("aId"))).get(0);
							}

							voucherDetForViaAgent = new VoucherDetailsForViaAgents();
							voucherDetForViaAgent
									.setVoucherAssignId(voucherAssign.getId());
							voucherDetForViaAgent.setAgentId(Integer
									.parseInt(req.getParameter("aId")));
							voucherDetForViaAgent.setPurchaseEntryId(Integer
									.parseInt(req.getParameter("peId")));
							voucherDetForViaAgent.setCredit(false);
							voucherDetForViaAgent.setValue(Float.parseFloat(req
									.getParameter("spPaymentAmount")));
							voucherDetForViaAgent.setVoucherDate(DateConverter
									.getDate(req.getParameter("payDate")));
							voucherDetForViaAgent.setEntryDate(new Date());
							voucherDetForViaAgent
									.setUserId((String) httpSession
											.getAttribute("user"));
							ejb.setVoucherDetails4ViaAgent(voucherDetForViaAgent);

							payDetForViaAgent = new PaymentDetailsForViaAgents();
							payDetForViaAgent.setPaymentDate(DateConverter
									.getDate(req.getParameter("payDate")));
							payDetForViaAgent.setEntryDate(new Date());
							payDetForViaAgent.setPaidAmount(Float
									.parseFloat(req
											.getParameter("spPaymentAmount")));
							payDetForViaAgent.setDescription(req
									.getParameter("desc"));
							payDetForViaAgent.setPurchaseEntryId(Integer
									.parseInt(req.getParameter("peId")));
							payDetForViaAgent.setPaymentTypeId(ejb
									.getPaymentTypeByType(
											req.getParameter("pType")).getId());
							payDetForViaAgent.setPaymentStatusId(ejb
									.getPaymentStatusByStatus(
											req.getParameter("pstatus"))
									.getId());
							payDetForViaAgent.setUniqueNo(Integer.parseInt(req
									.getParameter("uniqueNo")));
							payDetForViaAgent.setUserId((String) httpSession
									.getAttribute("user"));
							ejb.setPaymentDetails4ViaAgent(payDetForViaAgent);
							msg = "Successful!";
						}
						break;

					case "jobPayment":
						page = "jobPayment.jsp";
						List<JobAssignmentDetails> jobAssignListAPP = ejb
								.getAllJobassignmentDetails();
						req.setAttribute("jobAssignList", jobAssignListAPP);

						boolean isDuplicateJ = false;
						for (PaymentDetails pd : ejb.getAllPaymentDetails()) {
							if (pd.getUniqueNo() == Integer.parseInt(req
									.getParameter("uniqueNo"))) {
								isDuplicateJ = true;
								break;
							}
						}

						if (isDuplicateJ) {
							msg = "Duplicate Entry! Not Allowed!!!";
						} else {
							if (ejb.getVoucherAssignByVendorId(
									Integer.parseInt(req.getParameter("vId")))
									.size() == 0) {
								voucherAssign = new VoucherAssign();
								vendor = ejb.getVendorById(Integer.parseInt(req
										.getParameter("vId")));
								voucherAssign.setVendor(vendor);
								voucherAssign.setVoucherDetailsNumber(vendor
										.getPh1());
								ejb.setVoucherAssign(voucherAssign);
							} else {
								voucherAssign = ejb.getVoucherAssignByVendorId(
										Integer.parseInt(req
												.getParameter("vId"))).get(0);
							}

							if (ejb.getAllVoucherDetailsByJobAssignId(
									Integer.parseInt(req.getParameter("jaId")))
									.size() == 0) {
								// if (!req.getParameter("pstatus").equals(
								// "Full Paid")) {
								voucherDetails = new VoucherDetails();
								voucherDetails.setVoucherAssign(voucherAssign);
								voucherDetails.setCredit(true);
								voucherDetails.setValue(Float.parseFloat(req
										.getParameter("spDueAmount")));
								// voucherDetails.setTotalCreditNote(Float.parseFloat(req.getParameter("finalDC")));
								// if
								// (ejb.getVoucherDetailsByVendorId(Integer.parseInt(req.getParameter("vId")))
								// .size() == 0) {
								// voucherDetails
								// .setTotalCreditNote(Float.parseFloat(req.getParameter("spDueAmount")));
								// } else {
								// List<VoucherDetails> vDetails = ejb
								// .getVoucherDetailsByVendorId(Integer.parseInt(req.getParameter("vId")));
								// float totalCreditNote =
								// vDetails.get(vDetails.size() -
								// 1).getTotalCreditNote();
								// voucherDetails.setTotalCreditNote(
								// Float.parseFloat(req.getParameter("spDueAmount"))
								// + totalCreditNote);
								// }
								voucherDetails.setVoucherDate(DateConverter
										.getDate(req.getParameter("payDate")));
								voucherDetails.setUsers(ejb
										.getUserById((String) httpSession
												.getAttribute("user")));
								voucherDetails.setJobAssignId(Integer
										.parseInt(req.getParameter("jaId")));
								ejb.setVoucherDetails(voucherDetails);
								// }
							} else {
								voucherDetails = new VoucherDetails();
								voucherDetails.setVoucherAssign(voucherAssign);
								voucherDetails.setCredit(false);
								voucherDetails.setValue(Float.parseFloat(req
										.getParameter("spPaymentAmount")));
								// List<VoucherDetails> vDetails = ejb
								// .getVoucherDetailsByVendorId(Integer.parseInt(req.getParameter("vId")));
								// float totalCreditNote =
								// vDetails.get(vDetails.size() -
								// 1).getTotalCreditNote();
								// voucherDetails.setTotalCreditNote(
								// totalCreditNote -
								// Float.parseFloat(req.getParameter("spPaymentAmount")));
								voucherDetails.setVoucherDate(DateConverter
										.getDate(req.getParameter("payDate")));
								voucherDetails.setUsers(ejb
										.getUserById((String) httpSession
												.getAttribute("user")));
								voucherDetails.setJobAssignId(Integer
										.parseInt(req.getParameter("jaId")));
								ejb.setVoucherDetails(voucherDetails);
							}

							paymentDetails = new PaymentDetails();
							paymentDetails.setPaymentDate(DateConverter
									.getDate(req.getParameter("payDate")));
							if (ejb.getPaymentDetailsByJobAsignId(
									Integer.parseInt(req.getParameter("jaId")))
									.size() > 0) {
								paymentDetails.setTotalAmount(ejb
										.getPaymentDetailsByJobAsignId(
												Integer.parseInt(req
														.getParameter("jaId")))
										.get(0).getTotalAmount()
										- ejb.getPaymentDetailsByJobAsignId(
												Integer.parseInt(req
														.getParameter("jaId")))
												.get(0).getPaidAmount());
							} else {
								paymentDetails.setTotalAmount(Float
										.parseFloat(req
												.getParameter("spAmount")));
							}
							paymentDetails.setPaidAmount(Float.parseFloat(req
									.getParameter("spPaymentAmount")));
							paymentDetails.setDescription(req
									.getParameter("desc"));
							paymentDetails.setJobAssignId(Integer.parseInt(req
									.getParameter("jaId")));
							paymentDetails.setPaymentType(ejb
									.getPaymentTypeByType(req
											.getParameter("pType")));
							paymentDetails.setPaymentStatus(ejb
									.getPaymentStatusByStatus(req
											.getParameter("pstatus")));
							paymentDetails.setUniqueNo(Integer.parseInt(req
									.getParameter("uniqueNo")));
							ejb.setPaymentDetails(paymentDetails);
							msg = "Successful!";
						}
						break;

					case "jobAssignment":
						page = "jobAssignForOnlyProduct.jsp";
						jobAssignmentDetails = new JobAssignmentDetails();
						dt = new Date();
						companyInfo = ejb.getUserById(
								(String) httpSession.getAttribute("user"))
								.getCompanyInfo();
						jobAssignmentDetails.setAssignDate(DateConverter
								.getDate(req.getParameter("assignedDate")));
						jobAssignmentDetails
								.setEstimatedCompletionDate(DateConverter.getDate(req
										.getParameter("estSubmissionDate")));
						jobAssignmentDetails.setChallanNumber(req
								.getParameter("jobChallanNo"));
						jobAssignmentDetails.setChallan_no(Integer.parseInt(req
								.getParameter("challanNo")));
						jobAssignmentDetails.setChallanSuffix(Integer
								.parseInt(req.getParameter("challanSuffix")));
						jobAssignmentDetails.setEntryDate(dt);
						jobAssignmentDetails.setVendor(ejb
								.getVendorById(Integer.parseInt(req
										.getParameter("jName"))));
						jobAssignmentDetails.setCompanyInfo(companyInfo);

						ejb.setJobAssignment(jobAssignmentDetails);

						String pProdDetIdH[] = req
								.getParameterValues("pProdDetIdH");
						String qtyH[] = req.getParameterValues("qtyH");
						String workH[] = req.getParameterValues("workH");

						for (int l = 0; l < pProdDetIdH.length; l++) {
							jobAssignmentProducts = new JobAssignmentProducts();

							// jobAssignmentProducts.setPurchase_Product_Details(
							// ejb.getPurchaseProductDetailsById(Integer.parseInt(pProdDetIdH[l])));
							jobAssignmentProducts.setQty(Float
									.parseFloat(qtyH[l]));
							jobAssignmentProducts.setRemaninQty(Float
									.parseFloat(qtyH[l]));
							jobAssignmentProducts.setWorkDescription(workH[l]);
							jobAssignmentProducts
									.setJobAssignmentDetails(jobAssignmentDetails);
							ejb.setJobAssignmentProducts(jobAssignmentProducts);

							jobStock = new JobStock();
							jobStock.setJobAssignmentProducts(jobAssignmentProducts);
							jobStock.setGivenQty(Float.parseFloat(qtyH[l]));
							jobStock.setRemainingQty(Float.parseFloat(qtyH[l]));

							ejb.setJobStock(jobStock);

							purchaseProductDetails = ejb
									.getPurchaseProductDetailsById(Integer
											.parseInt(pProdDetIdH[l]));
							purchaseProductDetails
									.setRemaining_quantity(purchaseProductDetails
											.getRemaining_quantity()
											- Float.parseFloat(qtyH[l]));
							ejb.updatePurchaseProductDetails(purchaseProductDetails);

							rawMaterialsStock = ejb
									.getRawMeterialStoctByProductAndCompanyId(
											purchaseProductDetails
													.getProductDetail().getId(),
											companyInfo.getId());
							rawMaterialsStock.setRemainingQty(rawMaterialsStock
									.getRemainingQty()
									- Integer.parseInt(qtyH[l]));
							ejb.updateRawMaterialStockDetail(rawMaterialsStock);

							rawMaterialsStock = null;
							jobStock = null;
							jobAssignmentProducts = null;
							purchaseProductDetails = null;
						}

						msg = "Job assigned succesfully.";
						break;

					case "jChallanSearch":
						page = "jobReceive.jsp";

						List<JobAssignmentDetails> jobAssignListr = ejb
								.getJobAssignmentDetailsbyChallanNumber(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));

						if (jobAssignListr.size() > 0) {
							req.setAttribute("amj", jobAssignListr.get(0));
							msg = "Your search for Job challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for Job challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}

						break;

					case "jobReceiveFromSearch":
						page = "jobReceive.jsp";
						List<JobAssignmentDetails> jobAssignListRS = ejb
								.getJobAssignmentDetailsbyChallanNumber(req
										.getParameter("joChallan"));

						if (jobAssignListRS.size() > 0) {
							req.setAttribute("amj", jobAssignListRS.get(0));
							msg = "Your search for Job challan number : "
									+ req.getParameter("joChallan");
						} else {
							msg = "No result found for Job challan number : "
									+ req.getParameter("joChallan");
						}

						break;

					case "jobAssignSearchByDate":
						page = "jobAssignSearch.jsp";
						List<JobAssignmentDetails> jobAssignList = ejb
								.getJobAsignmentByDate(DateConverter
										.getDate(req.getParameter("fDate")),
										DateConverter.getDate(req
												.getParameter("lDate")));
						req.setAttribute("jobAssignList", jobAssignList);
						if (jobAssignList.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}
						break;

					case "jobAssignSearchByDateForPayment":
						page = "jobPayment.jsp";
						List<JobAssignmentDetails> jobAssignListFP = ejb
								.getJobAsignmentByDate(DateConverter
										.getDate(req.getParameter("fDate")),
										DateConverter.getDate(req
												.getParameter("lDate")));
						req.setAttribute("jobAssignList", jobAssignListFP);
						if (jobAssignListFP.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}
						break;

					case "jobSearchByJobChallanNo":
						page = "jobAssignSearch.jsp";
						List<JobAssignmentDetails> jobAssignList1 = ejb
								.getJobAssignByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));
						req.setAttribute("jobAssignList", jobAssignList1);

						if (jobAssignList1.size() > 0) {
							msg = "Your search for Job challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for Job challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}
						break;

					case "jobSearchByJobChallanNoForPayment":
						page = "jobPayment.jsp";
						List<JobAssignmentDetails> jobAssignListCP = ejb
								.getJobAssignByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));
						req.setAttribute("jobAssignList", jobAssignListCP);

						if (jobAssignListCP.size() > 0) {
							msg = "Your search for Job challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for Job challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}
						break;

					case "jobSearchByJobberName":
						page = "jobAssignSearchByJobber.jsp";
						List<JobAssignmentDetails> jobAssignList2 = ejb
								.getJobAssignByJoberName(req
										.getParameter("jobberName"));
						req.setAttribute("jobAssignList", jobAssignList2);
						if (jobAssignList2.size() > 0) {
							msg = "Your search for Jobber name : "
									+ req.getParameter("jobberName")
											.toUpperCase();
						} else {
							msg = "No result found for jobber name : "
									+ req.getParameter("jobberName")
											.toUpperCase();
						}
						break;

					case "jobSearchByJobberNameForPayment":
						page = "jobPayment.jsp";
						List<JobAssignmentDetails> jobAssignListJP = ejb
								.getJobAssignByJoberName(req
										.getParameter("jobberName"));
						req.setAttribute("jobAssignList", jobAssignListJP);
						if (jobAssignListJP.size() > 0) {
							msg = "Your search for Jobber name : "
									+ req.getParameter("jobberName")
											.toUpperCase();
						} else {
							msg = "No result found for jobber name : "
									+ req.getParameter("jobberName")
											.toUpperCase();
						}
						break;

					case "jobSearchByPlanNo":
						page = "jobAssignSearch.jsp";
						List<JobAssignmentDetails> jobAssignListP = ejb
								.getJobAssignByPlanNumber(Integer.parseInt(req
										.getParameter("planNo")));
						req.setAttribute("jobAssignList", jobAssignListP);
						if (jobAssignListP.size() > 0) {
							msg = "Your search for Plan Number : "
									+ req.getParameter("planNo").toUpperCase();
						} else {
							msg = "No result found for Plan Number : "
									+ req.getParameter("planNo").toUpperCase();
						}
						break;

					case "jobSearchByPlanNoForPayment":
						page = "jobPayment.jsp";
						List<JobAssignmentDetails> jobAssignListPFP = ejb
								.getJobAssignByPlanNumber(Integer.parseInt(req
										.getParameter("planNo")));
						req.setAttribute("jobAssignList", jobAssignListPFP);
						if (jobAssignListPFP.size() > 0) {
							msg = "Your search for Plan Number : "
									+ req.getParameter("planNo").toUpperCase();
						} else {
							msg = "No result found for Plan Number : "
									+ req.getParameter("planNo").toUpperCase();
						}
						break;

					case "jobSearchByDesignNo":
						page = "jobAssignSearch.jsp";
						List<JobAssignmentDetails> jobAssignListByDN = ejb
								.getJobAssignByDesignNumber(req
										.getParameter("dNo"));
						req.setAttribute("jobAssignList", jobAssignListByDN);
						if (jobAssignListByDN.size() > 0) {
							msg = "Your search for Design No : "
									+ req.getParameter("dNo").toUpperCase();
						} else {
							msg = "No result found for Design No : "
									+ req.getParameter("dNo").toUpperCase();
						}
						break;

					case "jobSearchByProductCode":
						page = "jobAssignSearch.jsp";
						List<JobAssignmentDetails> jobAssignList3 = ejb
								.getJobAssignByProdCode(req
										.getParameter("prodCode"));
						req.setAttribute("jobAssignList", jobAssignList3);
						if (jobAssignList3.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "jobSearchByProductCodeForPayment":
						page = "jobPayment.jsp";
						List<JobAssignmentDetails> jobAssignListPP = ejb
								.getJobAssignByProdCode(req
										.getParameter("prodCode"));
						req.setAttribute("jobAssignList", jobAssignListPP);
						if (jobAssignListPP.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "jobSearchByDesignNoForPayment":
						page = "jobPayment.jsp";
						List<JobAssignmentDetails> jobAssignListByDNP = ejb
								.getJobAssignByDesignNumber(req
										.getParameter("dNo"));
						req.setAttribute("jobAssignList", jobAssignListByDNP);
						if (jobAssignListByDNP.size() > 0) {
							msg = "Your search for Design No : "
									+ req.getParameter("dNo").toUpperCase();
						} else {
							msg = "No result found for Design No : "
									+ req.getParameter("dNo").toUpperCase();
						}
						break;

					case "jobSearchAll":
						page = "jobAssignSearch.jsp";
						List<JobAssignmentDetails> jobAssignListA = ejb
								.getAllJobassignmentDetails();
						req.setAttribute("jobAssignList", jobAssignListA);
						if (jobAssignListA.size() > 0) {
							msg = "All Job Assign List";
						} else {
							msg = "No result found...";
						}
						break;

					case "jobSearchAllForPayment":
						page = "jobPayment.jsp";
						List<JobAssignmentDetails> jobAssignListAP = ejb
								.getAllJobassignmentDetails();
						req.setAttribute("jobAssignList", jobAssignListAP);
						if (jobAssignListAP.size() > 0) {
							msg = "All Job Assign List";
						} else {
							msg = "No result found...";
						}
						break;

					case "sampleJobSearchAll":
						page = "jobDesignCostSheetSearch.jsp";
						List<SampleDesignCostSheet> sampleDesignCostSheetListA = ejb
								.getAllSampleDesignCostSheet();
						req.setAttribute("sampleDesignCostSheetList",
								sampleDesignCostSheetListA);
						if (sampleDesignCostSheetListA.size() > 0) {
							msg = "All Sample Job Cost Sheet List";
						} else {
							msg = "No result found...";
						}
						break;

					case "sampleJobSearchByDesignNo":
						page = "jobDesignCostSheetSearch.jsp";
						List<SampleDesignCostSheet> sampleDesignCostSheetListD = ejb
								.getSampleCostSheetByDesignNumber(req
										.getParameter("designNo"));
						req.setAttribute("sampleDesignCostSheetList",
								sampleDesignCostSheetListD);
						if (sampleDesignCostSheetListD.size() > 0) {
							msg = "Your search for Design no. : "
									+ req.getParameter("designNo")
											.toUpperCase();
						} else {
							msg = "No result found for Design no. : "
									+ req.getParameter("designNo")
											.toUpperCase();
						}
						break;

					case "sampleJobSearchByDesignerName":
						page = "jobDesignCostSheetSearch.jsp";
						List<SampleDesignCostSheet> sampleDesignCostSheetListDR = ejb
								.getSampleDesignCostSheetByDesignerName(req
										.getParameter("designerName"));
						req.setAttribute("sampleDesignCostSheetList",
								sampleDesignCostSheetListDR);
						if (sampleDesignCostSheetListDR.size() > 0) {
							msg = "Your search for Designer name : "
									+ req.getParameter("designerName")
											.toUpperCase();
						} else {
							msg = "No result found for Designer name : "
									+ req.getParameter("designerName")
											.toUpperCase();
						}
						break;

					case "sampleJobCostSheetView":
						page = "jobDesignCostSheetSearchView.jsp";

						req.setAttribute("sampleDesignCostSheetId",
								req.getParameter("sampleDesignCostSheetId"));

						msg = "";

						break;

					case "salesSearchByDate":
						page = "salesSearch.jsp";

						List<SalesEntry> salesEntryLst = ejb
								.getSalesEntryByDate(DateConverter.getDate(req
										.getParameter("fDate")), DateConverter
										.getDate(req.getParameter("lDate")));
						req.setAttribute("salesEntryLst", salesEntryLst);

						if (salesEntryLst.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}

						break;

					case "salesSearchByDateForAgent":
						page = "salesAgentProfitPayment.jsp";

						List<SalesEntry> salesEntryLstDA = ejb
								.getSalesEntryByDate(DateConverter.getDate(req
										.getParameter("fDate")), DateConverter
										.getDate(req.getParameter("lDate")));
						req.setAttribute("salesEntryLst", salesEntryLstDA);

						if (salesEntryLstDA.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}

						break;

					case "salesSearchBySalesChallanNo":
						page = "salesSearch.jsp";

						List<SalesEntry> salesEntryLst1 = ejb
								.getSalesEntryByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));
						req.setAttribute("salesEntryLst", salesEntryLst1);

						if (salesEntryLst1.size() > 0) {
							msg = "Your search for challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}
						break;

					case "salesSearchBySalesChallanNoForAgent":
						page = "salesAgentProfitPayment.jsp";

						List<SalesEntry> salesEntryLstCA = ejb
								.getSalesEntryByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));
						req.setAttribute("salesEntryLst", salesEntryLstCA);

						if (salesEntryLstCA.size() > 0) {
							msg = "Your search for challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}
						break;

					case "salesSearchByAgentName":
						page = "salesSearch.jsp";
						List<SalesEntry> salesEntryLst2 = ejb
								.getSalesEntryByAgentName(req
										.getParameter("agentName"));
						req.setAttribute("salesEntryLst", salesEntryLst2);
						if (salesEntryLst2.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						}
						break;

					case "salesSearchByAgentNameForAgent":
						page = "salesAgentProfitPayment.jsp";
						List<SalesEntry> salesEntryLst2AA = ejb
								.getSalesEntryByAgentName(req
										.getParameter("agentName"));
						req.setAttribute("salesEntryLst", salesEntryLst2AA);
						if (salesEntryLst2AA.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						}
						break;

					case "salesReportByAgentName":
						page = "reportSalesAgentView.jsp";
						List<SalesEntry> salesEntryLst2R = ejb
								.getSalesEntryByAgentId(Integer.parseInt(req
										.getParameter("pId")));
						req.setAttribute("purEntryList", salesEntryLst2R);
						req.setAttribute("pId", req.getParameter("pId"));
						if (salesEntryLst2R.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						}
						break;

					case "salesSearchByCustomerName":
						page = "salesSearch.jsp";
						List<SalesEntry> salesEntryLst3 = ejb
								.getSalesEntryByCustomerName(req
										.getParameter("custoName"));
						req.setAttribute("salesEntryLst", salesEntryLst3);
						if (salesEntryLst3.size() > 0) {
							msg = "Your search for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						} else {
							msg = "No result found for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						}
						break;

					case "salesSearchByCustomerNameForAgent":
						page = "salesAgentProfitPayment.jsp";
						List<SalesEntry> salesEntryLst3CA = ejb
								.getSalesEntryByCustomerName(req
										.getParameter("custoName"));
						req.setAttribute("salesEntryLst", salesEntryLst3CA);
						if (salesEntryLst3CA.size() > 0) {
							msg = "Your search for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						} else {
							msg = "No result found for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						}
						break;

					case "salesReportByCustomerName":
						page = "reportSalesCustomerView.jsp";
						List<SalesEntry> salesEntryLst3R = ejb
								.getSalesEntryByCustomerId(Integer.parseInt(req
										.getParameter("pId")));
						req.setAttribute("purEntryList", salesEntryLst3R);
						req.setAttribute("pId", req.getParameter("pId"));
						if (salesEntryLst3R.size() > 0) {
							msg = "Your search for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						} else {
							msg = "No result found for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						}
						break;

					case "salesSearchByProductCode":
						page = "salesSearch.jsp";
						List<SalesEntry> salesEntryLst4 = ejb
								.getSalesEntriesByProductCode(req
										.getParameter("prodCode"));
						req.setAttribute("salesEntryLst", salesEntryLst4);
						if (salesEntryLst4.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "salesSearchByProductCodeForAgent":
						page = "salesAgentProfitPayment.jsp";
						List<SalesEntry> salesEntryLst4PA = ejb
								.getSalesEntriesByProductCode(req
										.getParameter("prodCode"));
						req.setAttribute("salesEntryLst", salesEntryLst4PA);
						if (salesEntryLst4PA.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "salesSearchAll":
						page = "salesSearch.jsp";
						List<SalesEntry> salesEntryLstA = ejb
								.getAllSalesEntriesByCompany();
						req.setAttribute("salesEntryLst", salesEntryLstA);
						if (salesEntryLstA.size() > 0) {
							msg = "All Sales List";
						} else {
							msg = "No result found...";
						}
						break;

					case "salesSearchAllForAgent":
						page = "salesAgentProfitPayment.jsp";
						List<SalesEntry> salesEntryLstAA = ejb
								.getAllSalesEntriesByCompany();
						req.setAttribute("salesEntryLst", salesEntryLstAA);
						if (salesEntryLstAA.size() > 0) {
							msg = "All Sales List for Agent Profit Payment";
						} else {
							msg = "No result found...";
						}
						break;

					case "salesReturnSearchAll":
						page = "salesSearchReturn.jsp";
						List<SalesReturn> salesRetLst = ejb.getAllSalesReturn();
						req.setAttribute("salesRetLst", salesRetLst);
						if (salesRetLst.size() > 0) {
							msg = "All Sales Return List";
						} else {
							msg = "No result found...";
						}
						break;

					case "salesRerturnSearchByDate":
						page = "salesSearchReturn.jsp";

						List<SalesReturn> salesRetLstByDt = ejb
								.getSalesReturnByDate(DateConverter.getDate(req
										.getParameter("fDate")), DateConverter
										.getDate(req.getParameter("lDate")));
						req.setAttribute("salesRetLst", salesRetLstByDt);

						if (salesRetLstByDt.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}

						break;

					case "salesReturnSearchByChallanNo":
						page = "salesSearchReturn.jsp";

						List<SalesReturn> salesRetLstByCh = ejb
								.getSalesReturnByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));
						req.setAttribute("salesRetLst", salesRetLstByCh);

						if (salesRetLstByCh.size() > 0) {
							msg = "Your search for challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}
						break;

					case "salesReturnSearchByRefChallanNo":
						page = "salesSearchReturn.jsp";

						List<SalesReturn> salesRetLstByRef = ejb
								.getSalesReturnByRefChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));
						req.setAttribute("salesRetLst", salesRetLstByRef);

						if (salesRetLstByRef.size() > 0) {
							msg = "Your search for reference challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for reference challan number : "
									+ req.getParameter("companyInitial")
									+ "/"
									+ req.getParameter("fynYear")
									+ "/"
									+ req.getParameter("month")
									+ "/"
									+ req.getParameter("billType")
									+ "/"
									+ req.getParameter("autoNum")
									+ "/"
									+ req.getParameter("suffix");
						}
						break;

					case "salesReturnSearchByCustomerName":
						page = "salesSearchReturn.jsp";
						List<SalesReturn> salesRetLstByc = ejb
								.getSalesReturnByCustomerName(req
										.getParameter("custoName"));
						req.setAttribute("salesRetLst", salesRetLstByc);
						if (salesRetLstByc.size() > 0) {
							msg = "Your search for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						} else {
							msg = "No result found for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						}
						break;

					case "salesReturnSearchByAgentName":
						page = "salesSearchReturn.jsp";
						List<SalesReturn> salesRetLstByA = ejb
								.getSalesReturnByAgentName(req
										.getParameter("agentName"));
						req.setAttribute("salesRetLst", salesRetLstByA);
						if (salesRetLstByA.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						}
						break;

					case "salesReturnSearchByProductCode":
						page = "salesSearchReturn.jsp";
						List<SalesReturn> salesRetLstByP = ejb
								.getSalesReturnByProductCode(req
										.getParameter("prodCode"));
						req.setAttribute("salesRetLst", salesRetLstByP);
						if (salesRetLstByP.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "salesView":
						page = "salesView.jsp";
						req.setAttribute("sId", req.getParameter("sId"));
						msg = "";
						break;

					case "salesEdit":
						page = "salesEdit.jsp";
						req.setAttribute("sId", req.getParameter("sId"));
						msg = "";
						break;

					case "salesReturnView":
						page = "salesViewReturn.jsp";
						req.setAttribute("sId", req.getParameter("sId"));
						msg = "";
						break;

					case "salesReportView":
						page = "reportSalesView.jsp";

						req.setAttribute("sId", req.getParameter("pId"));

						msg = "";

						break;

					case "salesProductView":
						page = "reportSalesProductView.jsp";

						req.setAttribute("pId", req.getParameter("pId"));
						req.setAttribute("purEntryList", ejb
								.getSalesEntriesByProductId(Integer
										.parseInt(req.getParameter("pId"))));

						msg = "";

						break;

					case "addUOM":
						page = "setupUnitOfMeasure.jsp";
						int flag = 0;
						for (QtyUnit qut : ejb.getAllQtyUnit()) {
							if ((qut.getName().equalsIgnoreCase(
									req.getParameter("name")) || (qut
									.getAbbreviation().equalsIgnoreCase(req
									.getParameter("abbreviation"))))) {
								flag = 1;
								break;
							}
						}
						if (flag == 0) {
							qtyUnit = new QtyUnit();
							qtyUnit.setName(req.getParameter("name")
									.toUpperCase());
							qtyUnit.setAbbreviation(req.getParameter(
									"abbreviation").toUpperCase());
							qtyUnit.setDescription(req.getParameter(
									"description").toUpperCase());
							qtyUnit.setQtyUnitType(ejb
									.getQtyUnitTypeById(Integer.parseInt(req
											.getParameter("qtyUnitTypeId"))));
							ejb.setQtyUnit(qtyUnit);
							msg = "new UOM added successfully";
						} else {
							msg = "UOM name already exists";
						}
						break;
					case "addNewConversion":
						page = "setupUnitOfMeasure.jsp";
						qtyUnitConversion = new QtyUnitConversion();
						qtyUnitConversionPK = new QtyUnitConversionPK();
						if (Float.parseFloat(req.getParameter("convValue")) > 0) {
							if (req.getParameter("name1").equals("2")) {
								qtyUnitConversionPK
										.setQtyUnitId1(Integer.parseInt(req
												.getParameter("firstUnit")));
								qtyUnitConversionPK.setQtyUnitId2(Integer
										.parseInt(req
												.getParameter("selectedUnit")));

								qtyUnitConversion
										.setConversionPK(qtyUnitConversionPK);
								qtyUnitConversion.setQtyUnitId1(ejb
										.getQtyUnitById(Integer.parseInt(req
												.getParameter("firstUnit"))));
								qtyUnitConversion
										.setQtyUnitId2(ejb.getQtyUnitById(Integer.parseInt(req
												.getParameter("selectedUnit"))));
								qtyUnitConversion.setConversion(Float
										.parseFloat(req
												.getParameter("convValue")));

								ejb.setQtyUnitConversion(qtyUnitConversion);

								qtyUnitConversion = new QtyUnitConversion();
								qtyUnitConversionPK = new QtyUnitConversionPK();

								qtyUnitConversionPK
										.setQtyUnitId2(Integer.parseInt(req
												.getParameter("firstUnit")));
								qtyUnitConversionPK.setQtyUnitId1(Integer
										.parseInt(req
												.getParameter("selectedUnit")));

								qtyUnitConversion
										.setConversionPK(qtyUnitConversionPK);
								qtyUnitConversion.setQtyUnitId2(ejb
										.getQtyUnitById(Integer.parseInt(req
												.getParameter("firstUnit"))));
								qtyUnitConversion
										.setQtyUnitId1(ejb.getQtyUnitById(Integer.parseInt(req
												.getParameter("selectedUnit"))));
								qtyUnitConversion.setConversion(1 / Float
										.parseFloat(req
												.getParameter("convValue")));

								ejb.setQtyUnitConversion(qtyUnitConversion);

								msg = "New conversion added successfully.";
							} else if (req.getParameter("name1").equals("1")) {
								qtyUnitConversionPK
										.setQtyUnitId2(Integer.parseInt(req
												.getParameter("firstUnit")));
								qtyUnitConversionPK.setQtyUnitId1(Integer
										.parseInt(req
												.getParameter("selectedUnit")));

								qtyUnitConversion
										.setConversionPK(qtyUnitConversionPK);
								qtyUnitConversion.setQtyUnitId2(ejb
										.getQtyUnitById(Integer.parseInt(req
												.getParameter("firstUnit"))));
								qtyUnitConversion
										.setQtyUnitId1(ejb.getQtyUnitById(Integer.parseInt(req
												.getParameter("selectedUnit"))));
								qtyUnitConversion.setConversion(Float
										.parseFloat(req
												.getParameter("convValue")));

								ejb.setQtyUnitConversion(qtyUnitConversion);

								qtyUnitConversion = new QtyUnitConversion();
								qtyUnitConversionPK = new QtyUnitConversionPK();

								qtyUnitConversionPK
										.setQtyUnitId1(Integer.parseInt(req
												.getParameter("firstUnit")));
								qtyUnitConversionPK.setQtyUnitId2(Integer
										.parseInt(req
												.getParameter("selectedUnit")));

								qtyUnitConversion
										.setConversionPK(qtyUnitConversionPK);
								qtyUnitConversion.setQtyUnitId1(ejb
										.getQtyUnitById(Integer.parseInt(req
												.getParameter("firstUnit"))));
								qtyUnitConversion
										.setQtyUnitId2(ejb.getQtyUnitById(Integer.parseInt(req
												.getParameter("selectedUnit"))));
								qtyUnitConversion.setConversion(1 / Float
										.parseFloat(req
												.getParameter("convValue")));

								ejb.setQtyUnitConversion(qtyUnitConversion);

								msg = "New conversion added successfully.";
							} else {
								msg = "Something is wrong.";
							}
						} else {
							msg = "please enter proper conversion value";
						}

						break;

					case "updateConversion":
						page = "setupUnitOfMeasure.jsp";

						if (Float.parseFloat(req.getParameter("editValue")) > 0) {

							qtyUnitConversionPK = new QtyUnitConversionPK();

							qtyUnitConversionPK.setQtyUnitId1(Integer
									.parseInt(req.getParameter("u1")));
							qtyUnitConversionPK.setQtyUnitId2(Integer
									.parseInt(req.getParameter("u2")));
							qtyUnitConversion = ejb
									.getQtyUnitConversionById(qtyUnitConversionPK);
							qtyUnitConversion.setConversion(Float
									.parseFloat(req.getParameter("editValue")));

							ejb.updateQtyUnitConversion(qtyUnitConversion);

							qtyUnitConversionPK = new QtyUnitConversionPK();

							qtyUnitConversionPK.setQtyUnitId1(Integer
									.parseInt(req.getParameter("u2")));
							qtyUnitConversionPK.setQtyUnitId2(Integer
									.parseInt(req.getParameter("u1")));
							qtyUnitConversion = ejb
									.getQtyUnitConversionById(qtyUnitConversionPK);
							qtyUnitConversion.setConversion(1 / Float
									.parseFloat(req.getParameter("editValue")));

							ejb.updateQtyUnitConversion(qtyUnitConversion);

							msg = "Conversion updated successfully.";

						} else {
							msg = "please enter proper conversion value";
						}
						break;
					/*************** stock*************show ***************/

					case "stockDetailShow":
						page = "stockShowdetails.jsp";

						req.setAttribute("proid1", req.getParameter("proId"));

						msg = "";

						break;
					/*************** job*************show ***************/

					case "goJobDetailShow":
						page = "jobAssignView.jsp";

						req.setAttribute("joId", req.getParameter("joId"));

						msg = "";

						break;

					/************************
					 * *Stock*MuyltiSearch*************Ami
					 ************/

					case "goStockView":
						page = "stockViewD.jsp";
						List<ProductDetail> amiProduct = ejb
								.getProductDetailsByCodeDescriptionCategory(req
										.getParameter("pCodeSearch")
										.toUpperCase(),
										req.getParameter("pDesSearch")
												.toUpperCase(), req
												.getParameter("pCatSearch")
												.toUpperCase());

						req.setAttribute("ami", amiProduct);

						if (!req.getParameter("pCodeSearch").equals("")) {
							req.setAttribute("searchBy", "Product code");
							req.setAttribute("searchVal",
									req.getParameter("pCodeSearch"));
						} else if (!req.getParameter("pDesSearch").equals("")) {
							req.setAttribute("searchBy", "Product description");
							req.setAttribute("searchVal",
									req.getParameter("pDesSearch"));
						} else if (!req.getParameter("pCatSearch").equals("")) {
							req.setAttribute("searchBy", "Category");
							req.setAttribute("searchVal",
									req.getParameter("pCatSearch"));
						}

						msg = "";

						break;

					case "goSearchVendor":
						page = "purchasingVendorDupli.jsp";
						// List<Vendor>
						// vendorsBig=ejb.getAllVendorsByNameCity(req.getParameter("nameVendor"),req.getParameter("cityVendor"));

						// req.setAttribute("vBig", vendorsBig);
						msg = "";
						break;

					/********************* ProductMultiSearch *****************************************/
					case "goProView":
						page = "materialSearch.jsp";
						List<ProductDetail> amiProduct1 = ejb
								.getProductDetailsByCodeDescriptionCategory(req
										.getParameter("pCodeSearch")
										.toUpperCase(),
										req.getParameter("pDesSearch")
												.toUpperCase(), req
												.getParameter("pCatSearch")
												.toUpperCase());

						req.setAttribute("amii", amiProduct1);

						msg = "";
						break;

					case "uploadProductImage":
						page = "addNewProductImage.jsp";
						String imgstr = req.getParameter("proImage1");
						if ((!imgstr.equals(""))) {
							productDetail = ejb.getProductDetailById(Integer
									.parseInt(req.getParameter("id")));
							ProductImage proimg = new ProductImage();
							proimg.setProductDetail(productDetail);
							proimg.setImage(Base64.decode(imgstr));
							ejb.setProductImage(proimg);
						}
						msg = "image added successfully";
						break;

					case "uploadSampleCostSheetImage":
						page = "addOrDeleteSampleCostSheetImg.jsp";
						String imgstr1 = req.getParameter("proImage1");
						if ((!imgstr1.equals(""))) {
							sampleDesignCostSheet = ejb
									.getSampleDesignCostSheetById(Integer
											.parseInt(req.getParameter("id")));
							DesignImage designImage = new DesignImage();
							designImage
									.setDesignCostSheet(sampleDesignCostSheet);
							designImage.setImage(Base64.decode(imgstr1));
							ejb.setDesignImage(designImage);
						}
						msg = "image added successfully";
						break;

					case "deleteProductImage":
						page = "addNewProductImage.jsp?id="
								+ req.getParameter("id");
						ejb.removeImageById(Integer.parseInt(req
								.getParameter("imageId")));
						msg = "Image deleted successfully";
						break;

					case "deleteSampleCostSheetImage":
						page = "addOrDeleteSampleCostSheetImg.jsp?id="
								+ req.getParameter("id");
						ejb.removeSampleCostSheetImageById(Integer.parseInt(req
								.getParameter("imageId")));
						msg = "Image deleted successfully";
						break;

					case "createUserGroup":
						int fl = 0;
						for (UserGroup ug : ejb.getAllUserGroup()) {
							if (ug.getGroupName().equals(
									req.getParameter("userGroupName")
											.toUpperCase())) {
								fl = 1;
								break;
							}
						}
						if (fl == 0) {
							page = "setupUserGroup.jsp";
							userGroup = new UserGroup();
							userGroup.setGroupName(req.getParameter(
									"userGroupName").toUpperCase());
							List<PageList> plist = new ArrayList<>();
							for (String str : req.getParameterValues("pageId")) {
								plist.add(ejb.getPageListById(Integer
										.parseInt(str)));
							}
							userGroup.setPageLists(plist);
							userGroup.setCompanyInfo(ejb.getUserById(
									(String) httpSession.getAttribute("user"))
									.getCompanyInfo());
							ejb.setUserGroup(userGroup);
							msg = "User group created successfully";
						} else {
							msg = "User group name already exist";
						}
						break;

					case "updateUserGroup":
						page = "setupUserGroup.jsp";
						userGroup = ejb.getUserGroupById(Integer.parseInt(req
								.getParameter("usrGpId")));
						userGroup.setGroupName(req
								.getParameter("userGroupName").toUpperCase());
						List<PageList> plist = new ArrayList<>();
						for (String str : req.getParameterValues("pageId")) {
							plist.add(ejb.getPageListById(Integer.parseInt(str)));
						}
						userGroup.setPageLists(plist);
						ejb.updateUserGroup(userGroup);
						msg = "User group update successfully";
						break;

					case "createNewUser":
						page = "setupUser.jsp";
						int uf = 0;
						for (Users u : ejb.getAllUsers()) {
							if (u.getPh().equals(req.getParameter("mobile"))
									|| u.getUserId().equals(
											req.getParameter("userId"))) {
								uf = 1;
							}
						}

						if (uf == 0) {
							usr = new Users();
							usr.setName(req.getParameter("name"));
							usr.setPassword(req.getParameter("pass"));
							usr.setPh(req.getParameter("mobile"));
							usr.setUserId(req.getParameter("userId"));
							usr.setUserGroup(ejb.getUserGroupById(Integer
									.parseInt(req.getParameter("ugid"))));
							usr.setCompanyInfo(ejb.getUserById(
									(String) httpSession.getAttribute("user"))
									.getCompanyInfo());
							ejb.setUser(usr);

							securityAnswers = new SecurityAnswers();
							securityAnswers.setUsers(usr);
							securityAnswers
									.setSequrityQuestions(ejb.getSecurityQuestionById(Integer
											.parseInt(req.getParameter("sqId1"))));
							securityAnswers.setAnswer(req.getParameter("ans1")
									.toUpperCase());
							ejb.setSecurityAns(securityAnswers);
							securityAnswers = null;

							securityAnswers = new SecurityAnswers();
							securityAnswers.setUsers(usr);
							securityAnswers
									.setSequrityQuestions(ejb.getSecurityQuestionById(Integer
											.parseInt(req.getParameter("sqId2"))));
							securityAnswers.setAnswer(req.getParameter("ans2")
									.toUpperCase());
							ejb.setSecurityAns(securityAnswers);
							securityAnswers = null;

							msg = "User Added Successfully";
						} else {
							msg = "User mobile/id already exists";
						}
						break;

					case "updateUser":
						page = "setupUser.jsp";
						usr = ejb.getUserById(req.getParameter("userId"));
						usr.setUserGroup(ejb.getUserGroupById(Integer
								.parseInt(req.getParameter("ugid"))));
						ejb.updateUser(usr);
						msg = "User updated Successfully";
						break;

					case "goSalesReturn":
						page = "salesReturn.jsp";

						List<SalesEntry> saleEntryListR = ejb
								.getSalesEntryDByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));

						if (saleEntryListR.size() > 0) {
							req.setAttribute("amS", saleEntryListR.get(0));

							msg = "Your search for Sales challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for Sales challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}
						break;

					case "salesReturnServlet":
						page = "salesReturn.jsp";

						// ////////Null Manage////////////////////////////
						if (verifyParams(req, resp, "rQtySa",
								"salesProductDetailsID")) {
							req.setAttribute("msg", "Failed! Please try again!");
							req.getRequestDispatcher(page).forward(req, resp);
							return;
						}
						// ////////Null Manage////////////////////////////

						salesEntry = ejb.getSalesEntryById(Integer.parseInt(req
								.getParameter("salesentryid")));

						List<SalesReturn> salesRet = ejb.getAllSalesReturn();
						int chSR = 0;
						for (SalesReturn pe : salesRet) {
							if (pe.getChallanNumber().equals(
									req.getParameter("challanNumber"))) {
								chSR = 1;
								break;
							}
						}
						if (chSR == 0) {
							salesReturn = new SalesReturn();
							salesReturn.setChallanNo(Integer.parseInt(req
									.getParameter("challanNo")));
							salesReturn.setChallanSuffix(Integer.parseInt(req
									.getParameter("challanSuffix")));

							salesReturn.setSalesEntry(salesEntry);
							salesReturn.setChallanNumber(req
									.getParameter("challanNumber"));
							salesReturn.setRoundOff(Float.parseFloat(req
									.getParameter("roundvalue")));
							salesReturn.setReturnDate(DateConverter.getDate(req
									.getParameter("salesReturnDate")));
							salesReturn.setTotalReCost(Float.parseFloat(req
									.getParameter("grandtotal")));
							salesReturn.setReferenceSalesChallan(req
									.getParameter("saslesRChallanRId"));
							salesReturn
									.setRetAgentProfitTotal(Float.parseFloat(req
											.getParameter("profitValue")));
							salesReturn.setUsers(ejb
									.getUserById((String) httpSession
											.getAttribute("user")));
							ejb.setSalesReturn(salesReturn);

							paymentDetails = new PaymentDetails();
							paymentDetails.setPaidAmount(Float.parseFloat(req
									.getParameter("tbv")));
							paymentDetails.setTotalAmount(ejb
									.getPaymentDetailsBySalesEntryId(
											salesEntry.getId()).get(0)
									.getTotalAmount()
									- ejb.getPaymentDetailsBySalesEntryId(
											salesEntry.getId()).get(0)
											.getPaidAmount());
							paymentDetails.setPaymentDate(DateConverter
									.getDate(req.getParameter("payDate")));
							paymentDetails.setDescription(req
									.getParameter("desc"));
							paymentDetails.setSalesReturn(salesReturn);
							paymentDetails.setSalesEntry(salesEntry);
							paymentDetails.setPaymentType(ejb
									.getPaymentTypeByType(req
											.getParameter("pType")));
							if (ejb.getPaymentDetailsBySalesEntryId(
									salesEntry.getId()).get(0).getTotalAmount()
									- ejb.getPaymentDetailsBySalesEntryId(
											salesEntry.getId()).get(0)
											.getPaidAmount() != Float
										.parseFloat(req.getParameter("tbv"))) {
								paymentDetails.setPaymentStatus(ejb
										.getPaymentStatusByStatus("Semi Paid"));
							} else {
								paymentDetails.setPaymentStatus(ejb
										.getPaymentStatusByStatus("Full Paid"));
							}
							paymentDetails.setUniqueNo(Integer.parseInt(req
									.getParameter("uniqueNo")));
							ejb.setPaymentDetails(paymentDetails);

							voucherDetails = new VoucherDetails();
							// voucherDetails.setTotalDebitNote(Float.parseFloat(req.getParameter("tcn"))
							// - Float.parseFloat(req.getParameter("tbv")));
							voucherDetails.setVoucherDate(DateConverter
									.getDate(req.getParameter("payDate")));
							voucherDetails.setUsers(ejb
									.getUserById((String) httpSession
											.getAttribute("user")));
							voucherDetails.setCredit(true);
							voucherDetails.setValue(Float.parseFloat(req
									.getParameter("tbv")));
							voucherDetails
									.setVoucherAssign(ejb
											.getVoucherAssignByCustomerId(Integer.parseInt(req
													.getParameter("customerId"))));
							voucherDetails.setSalesReturn(salesReturn);
							voucherDetails.setSalesEntry(salesEntry);
							ejb.setVoucherDetails(voucherDetails);

							String p3[] = req.getParameterValues("rQtyDe");
							String qty4[] = req.getParameterValues("rQtySa");
							String salesProductDetailId[] = req
									.getParameterValues("salesProductDetailsID");

							for (int l = 0; l < p3.length; l++) {
								if (!qty4[l].equals("0")) {
									if (!qty4[l].equals("")) {
										salesProductDetails = ejb
												.getSalesProductDetailsById(Integer
														.parseInt(salesProductDetailId[l]));
										salesProductDetails
												.setSalesReQty(salesProductDetails
														.getSalesReQty()
														+ Float.parseFloat(qty4[l]));
										ejb.updateSalesProductDetails(salesProductDetails);

										salesProductReturnDetail = new SalesProductReturnDetail();
										salesProductReturnDetail
												.setSalesReturn(salesReturn);

										salesProductReturnDetail
												.setFault(p3[l]);
										salesProductReturnDetail
												.setQtyReturn(Float
														.parseFloat(qty4[l]));
										salesProductReturnDetail
												.setSalesProductDetails(salesProductDetails);
										ejb.setSalesProductReturnDetails(salesProductReturnDetail);

										purchaseProductDetails = salesProductDetails
												.getPurchase_Product_Details();
										purchaseProductDetails
												.setRemaining_quantity(purchaseProductDetails
														.getRemaining_quantity()
														+ Float.parseFloat(qty4[l]));
										ejb.updatePurchaseProductDetails(purchaseProductDetails);

										companyInfo = ejb.getUserById(
												(String) httpSession
														.getAttribute("user"))
												.getCompanyInfo();
										if (purchaseProductDetails
												.getProductDetail().isRaw()) {
											rawMaterialsStock = ejb
													.getRawMeterialStoctByProductAndCompanyId(
															purchaseProductDetails
																	.getProductDetail()
																	.getId(),
															companyInfo.getId());

											rawMaterialsStock
													.setRemainingQty(rawMaterialsStock
															.getRemainingQty()
															+ Float.parseFloat(qty4[l]));

											ejb.updateRawMaterialStockDetail(rawMaterialsStock);
										} else {
											readyGoodsStock = ejb
													.getReadyGoodStoctByProductAndCompanyId(
															purchaseProductDetails
																	.getProductDetail()
																	.getId(),
															companyInfo.getId());

											readyGoodsStock
													.setRemainingQty(readyGoodsStock
															.getRemainingQty()
															+ Float.parseFloat(qty4[l]));

											ejb.updateReadyGoodsStockDetail(readyGoodsStock);
										}
										purchaseProductDetails = null;
									}
								}
							}

							// new to check
							if (salesEntry.getVendor() != null
									&& salesEntry.isEfectiveProfit()) {
								uniqueNo = ejb
										.getLastUniqueNoOfPayDet4ViaAgent() + 1;

								voucherDetForViaAgent = new VoucherDetailsForViaAgents();
								voucherDetForViaAgent.setVoucherAssignId(ejb
										.getVoucherAssignByVendorId(
												salesEntry.getVendor().getId())
										.get(0).getId());
								voucherDetForViaAgent.setAgentId(salesEntry
										.getVendor().getId());
								voucherDetForViaAgent
										.setSalesEntryId(salesEntry.getId());
								voucherDetForViaAgent
										.setSalesReturnId(salesReturn.getId());
								voucherDetForViaAgent.setCredit(false);
								voucherDetForViaAgent.setValue(salesReturn
										.getRetAgentProfitTotal());
								voucherDetForViaAgent
										.setVoucherDate(salesReturn
												.getReturnDate());
								voucherDetForViaAgent.setEntryDate(new Date());
								voucherDetForViaAgent
										.setUserId((String) httpSession
												.getAttribute("user"));
								ejb.setVoucherDetails4ViaAgent(voucherDetForViaAgent);

								payDetForViaAgent = new PaymentDetailsForViaAgents();
								payDetForViaAgent.setPaymentDate(salesReturn
										.getReturnDate());
								payDetForViaAgent.setEntryDate(new Date());
								payDetForViaAgent.setPaidAmount(salesReturn
										.getRetAgentProfitTotal());
								payDetForViaAgent.setSalesEntryId(salesEntry
										.getId());
								payDetForViaAgent.setSalesReturnId(salesReturn
										.getId());
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
							// new to check

							req.setAttribute("salRetDetIdforPC",
									salesReturn.getId());
							msg = "sales Return Succeessful";
						} else {
							msg = "Duplicate Entry! Not Allowed!";
						}

						break;

					case "setJobTypes":
						page = "jobSetup.jsp";
						flag = 0;
						for (JobTypes jt : ejb.getAllJobTypes()) {
							if (jt.getJobName().equalsIgnoreCase(
									req.getParameter("name"))) {
								flag = 1;
								break;
							}
						}
						if (flag == 0) {
							jobTypes = new JobTypes();
							jobTypes.setJobName(req.getParameter("name")
									.toUpperCase());
							jobTypes.setJobDescription(req
									.getParameter("jobDesc"));

							ejb.setJobTypes(jobTypes);
							msg = "Job Type Added successfully.";
						} else {
							msg = "You can not Add duplicate job name.";
						}

						break;

					case "updateJob":
						page = "jobSetup.jsp";
						jobTypes = ejb.getJobTypeById(Integer.parseInt(req
								.getParameter("id")));
						flag = 0;
						for (JobTypes jt : ejb.getAllJobTypes()) {
							if (jt.getJobName().equalsIgnoreCase(
									req.getParameter("name"))
									&& !jobTypes.getJobName().equalsIgnoreCase(
											req.getParameter("name"))) {
								flag = 1;
								break;
							}
						}
						if (flag == 0) {

							jobTypes.setJobName(req.getParameter("name")
									.toUpperCase());
							jobTypes.setJobDescription(req
									.getParameter("jobDesc"));

							ejb.updateJobTypes(jobTypes);
							msg = "Job Type updated successfully.";
						} else {
							msg = "You can not update duplicate job name.";
						}
						break;

					case "setItems":
						page = "setupItem.jsp";
						flag = 0;
						for (ItemDetails jt : ejb.getAllItemDetails()) {
							if (jt.getName().equalsIgnoreCase(
									req.getParameter("name"))) {
								flag = 1;
								break;
							}
						}
						if (flag == 0) {
							itemDetails = new ItemDetails();
							itemDetails.setName(req.getParameter("name")
									.toUpperCase());
							ejb.setItemDetails(itemDetails);
							msg = "Added successfully";
						} else {
							msg = "You can not Add duplicate name";
						}
						break;

					case "updateItems":
						page = "setupItem.jsp";
						itemDetails = ejb.getItemDetailsById(Integer
								.parseInt(req.getParameter("id")));
						flag = 0;
						for (ItemDetails jt : ejb.getAllItemDetails()) {
							if (jt.getName().equalsIgnoreCase(
									req.getParameter("name"))
									&& !itemDetails.getName().equalsIgnoreCase(
											req.getParameter("name"))) {
								flag = 1;
								break;
							}
						}
						if (flag == 0) {
							itemDetails.setName(req.getParameter("name")
									.toUpperCase());
							ejb.updateItemDetails(itemDetails);
							msg = "Updated successfully";
						} else {
							msg = "You can not update duplicate item name.";
						}
						break;

					case "sampleJobCost":
						page = "jobDesignCostSheet.jsp";

						// ////////Null Manage////////////////////////////
						if (verifyParams(req, resp, "productId", "proQty",
								"rate", "amount", "qtyUnitId", "itemId",
								"jobId" + req.getParameter("productId") + ""
										+ req.getParameter("itemId"), "jobqty"
										+ req.getParameter("productId") + ""
										+ req.getParameter("itemId"), "jobRate"
										+ req.getParameter("productId") + ""
										+ req.getParameter("itemId"),
								"totalAmount" + req.getParameter("productId")
										+ "" + req.getParameter("itemId"))) {
							req.setAttribute("msg", "Failed! Please try again!");
							req.getRequestDispatcher(page).forward(req, resp);
							return;
						}
						// ////////Null Manage////////////////////////////

						List<SampleDesignCostSheet> sampleDesignCostSheetLst = ejb
								.getAllSampleDesignCostSheet();
						int chD = 0;
						for (SampleDesignCostSheet pe : sampleDesignCostSheetLst) {
							if (pe.getDesignNumber().equals(
									req.getParameter("designNo").toUpperCase())) {
								chD = 1;
								break;
							}
						}
						if (chD == 0) {
							sampleDesignCostSheet = new SampleDesignCostSheet();

							sampleDesignCostSheet.setDesignDescription(req
									.getParameter("designDescription")
									.toUpperCase());
							sampleDesignCostSheet.setDesignNumber(req
									.getParameter("designNo").toUpperCase());
							sampleDesignCostSheet.setQty(Integer.parseInt(req
									.getParameter("qty")));
							sampleDesignCostSheet.setSurcharge(Float
									.parseFloat(req.getParameter("surcharge")));
							sampleDesignCostSheet.setVendor(ejb
									.getVendorById(Integer.parseInt(req
											.getParameter("designerId"))));

							sampleDesignCostSheet.setGrandTotal(Float
									.parseFloat(req.getParameter("grandtot")));
							sampleDesignCostSheet.setProfit(Float
									.parseFloat(req.getParameter("totProfit")));
							if (req.getParameter("profitType").equals(
									"profitFlat")) {
								sampleDesignCostSheet.setFlatProfit(true);
							} else {
								sampleDesignCostSheet.setFlatProfit(false);
							}

							ejb.setSampleDesignCostSheet(sampleDesignCostSheet);

							String[] designImageContent = req
									.getParameterValues("proImage1");
							for (int lc = 0; lc < designImageContent.length; lc++) {
								designImage = new DesignImage();
								designImage.setImage(Base64
										.decode(designImageContent[lc]));
								designImage
										.setDesignCostSheet(sampleDesignCostSheet);

								ejb.setDesignImage(designImage);
							}

							float jobtotal = 0.0F;
							float prototal = 0.0F;

							String[] productid = req
									.getParameterValues("productId");
							String[] proqty = req.getParameterValues("proQty");
							String[] prorate = req.getParameterValues("rate");
							String[] proamount = req
									.getParameterValues("amount");
							String[] proqtyUnitId = req
									.getParameterValues("qtyUnitId");
							String[] itemId = req.getParameterValues("itemId");

							for (int lc = 0; lc < productid.length; lc++) {
								productsForDesignCostSheet = new ProductsForDesignCostSheet();
								productsForDesignCostSheet.setProductDetail(ejb
										.getProductDetailById(Integer
												.parseInt(productid[lc])));
								productsForDesignCostSheet.setQty(Float
										.parseFloat(proqty[lc]));
								productsForDesignCostSheet.setRate(Float
										.parseFloat(prorate[lc]));
								productsForDesignCostSheet.setAmmount(Float
										.parseFloat(proamount[lc]));
								productsForDesignCostSheet.setQtyUnit(ejb
										.getQtyUnitById(Integer
												.parseInt(proqtyUnitId[lc])));
								productsForDesignCostSheet
										.setSampleDesignCostSheet(sampleDesignCostSheet);
								ejb.setProductsForDesignCostSheet(productsForDesignCostSheet);

								itmProductsForSample = new ItmProductsForSample();
								itmProductsForSample.setProductId(Integer
										.parseInt(productid[lc]));
								itmProductsForSample
										.setProductForDesignCostSheetId(productsForDesignCostSheet
												.getId());
								itmProductsForSample
										.setSampleId(sampleDesignCostSheet
												.getId());
								itmProductsForSample.setItemDetails(ejb
										.getItemDetailsById(Integer
												.parseInt(itemId[lc])));
								ejb.setItmProductsForSample(itmProductsForSample);

								prototal = prototal
										+ Float.parseFloat(prorate[lc]);
								String[] jobid = req.getParameterValues("jobId"
										+ productid[lc] + "" + itemId[lc]);
								String[] jobqty = req
										.getParameterValues("jobqty"
												+ productid[lc] + ""
												+ itemId[lc]);
								String[] jobrate = req
										.getParameterValues("jobRate"
												+ productid[lc] + ""
												+ itemId[lc]);
								String[] jobamount = req
										.getParameterValues("totalAmount"
												+ productid[lc] + ""
												+ itemId[lc]);

								for (int lc1 = 0; lc1 < jobid.length; lc1++) {
									jobsForDesignCostSheet = new JobsForDesignCostSheet();

									jobsForDesignCostSheet.setJobTypes(ejb
											.getJobTypeById(Integer
													.parseInt(jobid[lc1])));
									jobsForDesignCostSheet.setQty(Float
											.parseFloat(jobqty[lc1]));
									jobsForDesignCostSheet.setRate(Float
											.parseFloat(jobrate[lc1]));
									jobsForDesignCostSheet.setAmmount(Float
											.parseFloat(jobamount[lc1]));
									jobsForDesignCostSheet
											.setQtyUnit(ejb.getQtyUnitById(Integer
													.parseInt(proqtyUnitId[lc])));

									jobsForDesignCostSheet

											.setVendor(ejb.getVendorById(Integer.parseInt(req
													.getParameter("designerId"))));
									jobsForDesignCostSheet
											.setSampleDesignCostSheet(sampleDesignCostSheet);
									jobsForDesignCostSheet
											.setProductsForDesignCostSheet(productsForDesignCostSheet);

									ejb.setJobsForDesignCostSheet(jobsForDesignCostSheet);
									jobsForDesignCostSheet = null;

									jobtotal = jobtotal
											+ Float.parseFloat(jobamount[lc1]);
								}
								productsForDesignCostSheet = null;
							}

							sampleDesignCostSheet.setTotalJobcost(jobtotal);
							sampleDesignCostSheet.setTotalProductcost(prototal);
							ejb.updateSampleDesignCostSheet(sampleDesignCostSheet);

							msg = "your request hasbeen successfully processed";
							req.setAttribute("sampleId",
									sampleDesignCostSheet.getId());
						} else {
							msg = "Duplicate Entry! Not Allowed!";
						}
						break;

					case "jobAssignmentForParticularDesignNumber":
						page = "jobAssignForParticularDesignNumber.jsp";

						// ////////Null Manage////////////////////////////
						if (verifyParams(
								req,
								resp,
								"productForSampleId",
								"jobIdH"
										+ req.getParameter("productForSampleId"),
								"jobQtyH"
										+ req.getParameter("productForSampleId"),
								"purProDetId"
										+ req.getParameter("productForSampleId"),
								"qtySelected"
										+ req.getParameter("productForSampleId"),
								"productForSampleId1",
								"productId1",
								"qtyOfSampleProduct",
								"productEachTotal",
								"purProDetId"
										+ req.getParameter("productForSampleId1"),
								"jobId"
										+ req.getParameter("productForSampleId1"),
								"jobQty"
										+ req.getParameter("productForSampleId1"),
								"jobPresentRate"
										+ req.getParameter("productForSampleId1"),
								"jobAmount"
										+ req.getParameter("productForSampleId1"),
								"estSubmDate"
										+ req.getParameter("productForSampleId1"))) {
							req.setAttribute("msg", "Failed! Please try again!");
							req.getRequestDispatcher(page).forward(req, resp);
							return;
						}
						// ////////Null Manage////////////////////////////

						sampleDesignCostSheet = ejb
								.getSampleDesignCostSheetById(Integer
										.parseInt(req.getParameter("dId")));

						List<JobAssignmentDetails> jobAssgn = ejb
								.getAllJobassignmentDetails();
						int chJ = 0;
						for (JobAssignmentDetails pe : jobAssgn) {
							if (pe.getChallanNumber().equals(
									req.getParameter("jobChallanNo"))) {
								chJ = 1;
								break;
							}
						}
						if (chJ == 0) {
							jobPlan = new JobPlan();
							jobPlan.setPlanDate(DateConverter.getDate(req
									.getParameter("assignedDate")));
							jobPlan.setQty(Float.parseFloat(req
									.getParameter("qty")));
							jobPlan.setEstimatedCost(Float.parseFloat(req
									.getParameter("qty"))
									* sampleDesignCostSheet.getGrandTotal());
							jobPlan.setTotalJobExpanse(0);
							jobPlan.setComplete(false);
							jobPlan.setDesignCostSheet(sampleDesignCostSheet);
							ejb.setJobPlan(jobPlan);

							String[] productForSampleId = req
									.getParameterValues("productForSampleId");
							float totalProductCost = 0;
							for (int l = 0; l < productForSampleId.length; l++) {
								jobPlanProducts = new JobPlanProducts();
								jobPlanProducts.setJobPlan(jobPlan);
								jobPlanProducts
										.setProductsForDesignCostSheet(ejb
												.getProductsForDesignCostSheetById(Integer
														.parseInt(productForSampleId[l])));
								jobPlanProducts.setJobCycle(0);
								jobPlanProducts.setUndergoingProcess(false);
								jobPlanProducts.setComplete(false);
								ejb.setJobPlanProducts(jobPlanProducts);

								String[] jobForSampleIdH = req
										.getParameterValues("jobIdH"
												+ productForSampleId[l]);
								String[] jobQtyH = req
										.getParameterValues("jobQtyH"
												+ productForSampleId[l]);
								for (int l1 = 0; l1 < jobForSampleIdH.length; l1++) {
									jobPlanJobStock = new JobPlanJobStock();
									jobPlanJobStock.setQty(Float
											.parseFloat(jobQtyH[l1]));
									jobPlanJobStock.setComplete(false);
									jobPlanJobStock
											.setJobPlanProducts(jobPlanProducts);
									jobPlanJobStock
											.setJobsForDesignCostSheet(ejb
													.getJobsForDesignCostSheetById(Integer
															.parseInt(jobForSampleIdH[l1])));
									ejb.setJobPlanJobStock(jobPlanJobStock);
								}

								String[] purProDetId = req
										.getParameterValues("purProDetId"
												+ productForSampleId[l]);
								String[] qtySelected = req
										.getParameterValues("qtySelected"
												+ productForSampleId[l]);
								float planProductQty = 0;
								float planProductRemQty = 0;
								float planProductTotalCost = 0;

								for (int l1 = 0; l1 < purProDetId.length; l1++) {
									purchaseProductDetails = ejb
											.getPurchaseProductDetailsById(Integer
													.parseInt(purProDetId[l1]));

									jobPlanProductStock = new JobPlanProductStock();
									jobPlanProductStock.setJobPlan(jobPlan);
									jobPlanProductStock
											.setJobPlanProducts(jobPlanProducts);
									jobPlanProductStock
											.setProductsForDesignCostSheet(ejb
													.getProductsForDesignCostSheetById(Integer
															.parseInt(productForSampleId[l])));
									jobPlanProductStock
											.setPurchase_Product_Details(purchaseProductDetails);
									jobPlanProductStock.setQty(Float
											.parseFloat(qtySelected[l1]));
									jobPlanProductStock
											.setCost(purchaseProductDetails
													.getCost());
									ejb.setJobPlanProductStock(jobPlanProductStock);

									purchaseProductDetails
											.setRemaining_quantity(purchaseProductDetails
													.getRemaining_quantity()
													- Float.parseFloat(qtySelected[l1]));
									ejb.updatePurchaseProductDetails(purchaseProductDetails);

									if (purchaseProductDetails
											.getProductDetail().isRaw()) {
										rawMaterialsStock = ejb
												.getRawMeterialStoctByProductId(purchaseProductDetails
														.getProductDetail()
														.getId());
										rawMaterialsStock
												.setRemainingQty(rawMaterialsStock
														.getRemainingQty()
														- Float.parseFloat(qtySelected[l1]));
										ejb.updateRawMaterialStockDetail(rawMaterialsStock);
									} else {
										readyGoodsStock = ejb
												.getReadyGoodsStoctByProductId(purchaseProductDetails
														.getProductDetail()
														.getId());
										readyGoodsStock
												.setRemainingQty(readyGoodsStock
														.getRemainingQty()
														- Float.parseFloat(qtySelected[l1]));
										ejb.updateReadyGoodsStockDetail(readyGoodsStock);
									}

									totalProductCost = totalProductCost
											+ purchaseProductDetails.getCost()
											* Float.parseFloat(qtySelected[l1]);

									planProductQty = planProductQty
											+ Float.parseFloat(qtySelected[l1]);
									planProductRemQty = planProductRemQty
											+ Float.parseFloat(qtySelected[l1]);
									planProductTotalCost = planProductTotalCost
											+ purchaseProductDetails.getCost()
											* Float.parseFloat(qtySelected[l1]);
								}
								jobPlanProducts.setQty(planProductQty);
								jobPlanProducts
										.setRemainingQty(planProductRemQty);
								jobPlanProducts
										.setTotalProductCost(planProductTotalCost);
								ejb.updateJobPlanProducts(jobPlanProducts);
							}

							jobPlan.setTotalProductCost(totalProductCost);
							jobPlan.setTotalExpanse(0 + totalProductCost);
							ejb.updateJobPlan(jobPlan);

							// /////////////////////////////////////////////////////////////////////////////////////////////

							jobAssignmentDetails = new JobAssignmentDetails();
							dt = new Date();
							jobAssignmentDetails.setAssignDate(DateConverter
									.getDate(req.getParameter("assignedDate")));
							jobAssignmentDetails.setChallanNumber(req
									.getParameter("jobChallanNo"));
							jobAssignmentDetails.setChallan_no(Integer
									.parseInt(req.getParameter("challanNo")));
							jobAssignmentDetails
									.setChallanSuffix(Integer.parseInt(req
											.getParameter("challanSuffix")));
							jobAssignmentDetails.setEntryDate(dt);
							jobAssignmentDetails.setVendor(ejb
									.getVendorById(Integer.parseInt(req
											.getParameter("jName"))));

							jobAssignmentDetails.setSurcharge(Float
									.parseFloat(req.getParameter("surcharge")));
							jobAssignmentDetails.setGrandTotal(Float
									.parseFloat(req.getParameter("grandtot")));
							jobAssignmentDetails.setProfit(Float.parseFloat(req
									.getParameter("totProfit")));
							if (req.getParameter("profitType").equals(
									"profitFlat")) {
								jobAssignmentDetails.setFlatProfit(true);
							} else {
								jobAssignmentDetails.setFlatProfit(false);
							}
							jobAssignmentDetails.setJobPlan(jobPlan);
							ejb.setJobAssignment(jobAssignmentDetails);

							String[] productForSampleId1 = req
									.getParameterValues("productForSampleId1");
							String[] prodId = req
									.getParameterValues("productId1");
							String[] qtyOfSampleProduct = req
									.getParameterValues("qtyOfSampleProduct");
							String[] productEachTotal = req
									.getParameterValues("productEachTotal");
							float totalJobExpanse = 0;

							for (int l1 = 0; l1 < productForSampleId1.length; l1++) {
								jobPlanProducts = ejb
										.getJobPlanProductByPlanIdAndSampleProductId(
												jobPlan.getId(),
												Integer.parseInt(productForSampleId1[l1]));
								jobPlanProducts.setRemainingQty(0);
								jobPlanProducts.setUndergoingProcess(true);
								ejb.updateJobPlanProducts(jobPlanProducts);

								jobAssignmentProducts = new JobAssignmentProducts();
								jobAssignmentProducts
										.setJobAssignmentDetails(jobAssignmentDetails);
								jobAssignmentProducts.setQty(Float
										.parseFloat(qtyOfSampleProduct[l1]));
								jobAssignmentProducts.setRemaninQty(Float
										.parseFloat(qtyOfSampleProduct[l1]));
								jobAssignmentProducts.setEstimatedCost(Float
										.parseFloat(productEachTotal[l1]));
								jobAssignmentProducts.setJobPlan(jobPlan);
								jobAssignmentProducts
										.setJobPlanProducts(jobPlanProducts);
								jobAssignmentProducts
										.setProductsForDesignCostSheet(ejb
												.getProductsForDesignCostSheetById(Integer
														.parseInt(productForSampleId1[l1])));
								ejb.setJobAssignmentProducts(jobAssignmentProducts);

								String[] purProDetId1 = req
										.getParameterValues("purProDetId"
												+ productForSampleId1[l1]);
								for (int l2 = 0; l2 < purProDetId1.length; l2++) {
									jobPlanProductStock = ejb
											.getJobPlanProductStockByPurchaseProductDetailsIdAndJobPlanProductId(
													Integer.parseInt(purProDetId1[l2]),
													jobPlanProducts.getId());
									jobPlanProductStock
											.setJobAssignmentProducts(jobAssignmentProducts);
									ejb.updateJobPlanProductStock(jobPlanProductStock);
								}

								String[] jobid = req.getParameterValues("jobId"
										+ productForSampleId1[l1]);
								String[] jobqty = req
										.getParameterValues("jobQty"
												+ productForSampleId1[l1]);
								String[] jobrate = req
										.getParameterValues("jobPresentRate"
												+ productForSampleId1[l1]);
								String[] jobamount = req
										.getParameterValues("jobAmount"
												+ productForSampleId1[l1]);
								String[] estSubmDate = req
										.getParameterValues("estSubmDate"
												+ productForSampleId1[l1]);
								float totalJobCost = 0;

								for (int lc1 = 0; lc1 < jobid.length; lc1++) {
									jobPlanJobStock = ejb
											.getJobPlanJobStockByJobPlanProductIdAndJobForSampleId(
													jobPlanProducts.getId(),
													Integer.parseInt(jobid[lc1]));

									jobAssignmentJobDetails = new JobAssignmentJobDetails();
									jobAssignmentJobDetails.setQty(Float
											.parseFloat(jobqty[lc1]));
									jobAssignmentJobDetails.setRate(Float
											.parseFloat(jobrate[lc1]));
									jobAssignmentJobDetails.setAmmount(Float
											.parseFloat(jobamount[lc1]));
									jobAssignmentJobDetails
											.setEstimatedCompletionDate(DateConverter
													.getDate(estSubmDate[lc1]));
									jobAssignmentJobDetails
											.setQtyUnit(ejb
													.getProductDetailById(
															Integer.parseInt(prodId[l1]))
													.getQtyUnit());
									jobAssignmentJobDetails
											.setJobType(ejb
													.getJobsForDesignCostSheetById(
															Integer.parseInt(jobid[lc1]))
													.getJobTypes());
									jobAssignmentJobDetails
											.setJobAssignmentDetails(jobAssignmentDetails);
									jobAssignmentJobDetails
											.setAssignmentProducts(jobAssignmentProducts);
									jobAssignmentJobDetails.setJobPlan(jobPlan);
									jobAssignmentJobDetails
											.setJobPlanJobStock(jobPlanJobStock);
									jobAssignmentJobDetails
											.setProductsForDesignCostSheet(ejb
													.getProductsForDesignCostSheetById(Integer
															.parseInt(productForSampleId1[l1])));
									ejb.setJobAssignmentJobDetails(jobAssignmentJobDetails);

									totalJobCost = totalJobCost
											+ Float.parseFloat(jobamount[lc1]);
								}
								jobAssignmentProducts
										.setTotalJobCost(totalJobCost);
								ejb.updateJobAssignmentProductDetails(jobAssignmentProducts);

								totalJobExpanse = totalJobExpanse
										+ totalJobCost;
							}
							jobPlan.setTotalJobExpanse(totalJobExpanse);
							jobPlan.setTotalExpanse(jobPlan.getTotalExpanse()
									+ totalJobExpanse);
							ejb.updateJobPlan(jobPlan);
							req.setAttribute("jobAssignId",
									jobAssignmentDetails.getId());
							msg = "Job Assigned Successfully";
						} else {
							msg = "Duplicate Entry! Not Allowed!";
						}
						break;

					case "jobAssignmentForOngoingJobs":
						page = "jobAssignForOngoingJobs.jsp";

						// ////////Null Manage////////////////////////////
						if (verifyParams(
								req,
								resp,
								"productForSampleId1",
								"productId1",
								"qtyOfSampleProduct",
								"productEachTotal",
								"jobId"
										+ req.getParameter("productForSampleId1"),
								"jobQty"
										+ req.getParameter("productForSampleId1"),
								"jobPresentRate"
										+ req.getParameter("productForSampleId1"),
								"jobAmount"
										+ req.getParameter("productForSampleId1"),
								"estSubmDate"
										+ req.getParameter("productForSampleId1"))) {
							req.setAttribute("msg", "Failed! Please try again!");
							req.getRequestDispatcher(page).forward(req, resp);
							return;
						}
						// ////////Null Manage////////////////////////////

						jobPlan = ejb.getJobPlanById(Integer.parseInt(req
								.getParameter("planNo")));

						List<JobAssignmentDetails> jobAssgn1 = ejb
								.getAllJobassignmentDetails();
						int chJ1 = 0;
						for (JobAssignmentDetails pe : jobAssgn1) {
							if (pe.getChallanNumber().equals(
									req.getParameter("jobChallanNo"))) {
								chJ1 = 1;
								break;
							}
						}
						if (chJ1 == 0) {
							jobAssignmentDetails = new JobAssignmentDetails();
							dt = new Date();
							jobAssignmentDetails.setAssignDate(DateConverter
									.getDate(req.getParameter("assignedDate")));
							jobAssignmentDetails.setChallanNumber(req
									.getParameter("jobChallanNo"));
							jobAssignmentDetails.setChallan_no(Integer
									.parseInt(req.getParameter("challanNo")));
							jobAssignmentDetails
									.setChallanSuffix(Integer.parseInt(req
											.getParameter("challanSuffix")));
							jobAssignmentDetails.setEntryDate(dt);
							jobAssignmentDetails.setVendor(ejb
									.getVendorById(Integer.parseInt(req
											.getParameter("jName"))));
							jobAssignmentDetails.setSurcharge(Float
									.parseFloat(req.getParameter("surcharge")));
							jobAssignmentDetails.setGrandTotal(Float
									.parseFloat(req.getParameter("grandtot")));
							jobAssignmentDetails.setProfit(Float.parseFloat(req
									.getParameter("totProfit")));
							if (req.getParameter("profitType").equals(
									"profitFlat")) {
								jobAssignmentDetails.setFlatProfit(true);
							} else {
								jobAssignmentDetails.setFlatProfit(false);
							}
							jobAssignmentDetails.setJobPlan(jobPlan);
							ejb.setJobAssignment(jobAssignmentDetails);

							String[] productForSampleId2 = req
									.getParameterValues("productForSampleId1");
							String[] prodId2 = req
									.getParameterValues("productId1");
							String[] qtyOfSampleProduct2 = req
									.getParameterValues("qtyOfSampleProduct");
							String[] productEachTotal2 = req
									.getParameterValues("productEachTotal");
							float totalJobExpanse1 = 0;

							for (int l1 = 0; l1 < productForSampleId2.length; l1++) {
								jobPlanProducts = ejb
										.getJobPlanProductByPlanIdAndSampleProductId(
												jobPlan.getId(),
												Integer.parseInt(productForSampleId2[l1]));
								jobPlanProducts.setRemainingQty(0);
								jobPlanProducts.setUndergoingProcess(true);
								ejb.updateJobPlanProducts(jobPlanProducts);

								jobAssignmentProducts = new JobAssignmentProducts();
								jobAssignmentProducts
										.setJobAssignmentDetails(jobAssignmentDetails);
								jobAssignmentProducts.setQty(Float
										.parseFloat(qtyOfSampleProduct2[l1]));
								jobAssignmentProducts.setRemaninQty(Float
										.parseFloat(qtyOfSampleProduct2[l1]));
								jobAssignmentProducts.setEstimatedCost(Float
										.parseFloat(productEachTotal2[l1]));
								jobAssignmentProducts.setJobPlan(jobPlan);
								jobAssignmentProducts
										.setJobPlanProducts(jobPlanProducts);
								jobAssignmentProducts
										.setProductsForDesignCostSheet(ejb
												.getProductsForDesignCostSheetById(Integer
														.parseInt(productForSampleId2[l1])));
								ejb.setJobAssignmentProducts(jobAssignmentProducts);

								for (int l2 = 0; l2 < ejb
										.getJobPlanProductStockBySampleProductIdAndPlanId(
												Integer.parseInt(productForSampleId2[l1]),
												jobPlan.getId()).size(); l2++) {
									jobPlanProductStock = ejb
											.getJobPlanProductStockBySampleProductIdAndPlanId(
													Integer.parseInt(productForSampleId2[l1]),
													jobPlan.getId()).get(l2);
									jobPlanProductStock
											.setJobAssignmentProducts(jobAssignmentProducts);
									ejb.updateJobPlanProductStock(jobPlanProductStock);
								}

								String[] jobid = req.getParameterValues("jobId"
										+ productForSampleId2[l1]);
								String[] jobqty = req
										.getParameterValues("jobQty"
												+ productForSampleId2[l1]);
								String[] jobrate = req
										.getParameterValues("jobPresentRate"
												+ productForSampleId2[l1]);
								String[] jobamount = req
										.getParameterValues("jobAmount"
												+ productForSampleId2[l1]);
								String[] estSubmDate = req
										.getParameterValues("estSubmDate"
												+ productForSampleId2[l1]);
								float totalJobCost = 0;

								for (int lc1 = 0; lc1 < jobid.length; lc1++) {
									jobPlanJobStock = ejb
											.getJobPlanJobStockByJobPlanProductIdAndJobForSampleId(
													jobPlanProducts.getId(),
													Integer.parseInt(jobid[lc1]));

									jobAssignmentJobDetails = new JobAssignmentJobDetails();
									jobAssignmentJobDetails.setQty(Float
											.parseFloat(jobqty[lc1]));
									jobAssignmentJobDetails.setRate(Float
											.parseFloat(jobrate[lc1]));
									jobAssignmentJobDetails.setAmmount(Float
											.parseFloat(jobamount[lc1]));
									jobAssignmentJobDetails
											.setEstimatedCompletionDate(DateConverter
													.getDate(estSubmDate[lc1]));
									jobAssignmentJobDetails
											.setQtyUnit(ejb
													.getProductDetailById(
															Integer.parseInt(prodId2[l1]))
													.getQtyUnit());
									jobAssignmentJobDetails
											.setJobType(ejb
													.getJobsForDesignCostSheetById(
															Integer.parseInt(jobid[lc1]))
													.getJobTypes());
									jobAssignmentJobDetails
											.setJobAssignmentDetails(jobAssignmentDetails);
									jobAssignmentJobDetails
											.setAssignmentProducts(jobAssignmentProducts);
									jobAssignmentJobDetails.setJobPlan(jobPlan);
									jobAssignmentJobDetails
											.setJobPlanJobStock(jobPlanJobStock);
									jobAssignmentJobDetails
											.setProductsForDesignCostSheet(ejb
													.getProductsForDesignCostSheetById(Integer
															.parseInt(productForSampleId2[l1])));
									ejb.setJobAssignmentJobDetails(jobAssignmentJobDetails);

									totalJobCost = totalJobCost
											+ Float.parseFloat(jobamount[lc1]);
								}
								jobAssignmentProducts
										.setTotalJobCost(totalJobCost);
								ejb.updateJobAssignmentProductDetails(jobAssignmentProducts);

								totalJobExpanse1 = totalJobExpanse1
										+ totalJobCost;
							}
							jobPlan.setTotalJobExpanse(totalJobExpanse1
									+ jobPlan.getTotalJobExpanse());
							jobPlan.setTotalExpanse(jobPlan.getTotalExpanse()
									+ totalJobExpanse1);
							ejb.updateJobPlan(jobPlan);

							req.setAttribute("jobAssignId",
									jobAssignmentDetails.getId());
							msg = "Job Assigned Successfully";
						} else {
							msg = "Duplicate Entry! Not Allowed!";
						}
						break;

					case "jobRecieve":
						page = "jobReceive.jsp";

						// ////////Null Manage////////////////////////////
						if (verifyParams(req, resp, "jobPlanProductsId",
								"jobAssgnProductsId", "prodQtyRe")) {
							req.setAttribute("msg", "Failed! Please try again!");
							req.getRequestDispatcher(page).forward(req, resp);
							return;
						}
						// ////////Null Manage////////////////////////////

						jobAssignmentDetails = ejb
								.getJobAssignmentDetailsByID(Integer
										.parseInt(req
												.getParameter("jobAssignID")));
						dt = new Date();

						List<JobRecievedDetails> jobRec = ejb
								.getAllJobRecievedDetails();
						int chJR = 0;
						for (JobRecievedDetails pe : jobRec) {
							if (pe.getChallanNumber().equals(
									req.getParameter("jobReChallanNo"))) {
								chJR = 1;
								break;
							}
						}
						if (chJR == 0) {
							jobRecievedDetails = new JobRecievedDetails();
							jobRecievedDetails.setRecievingDate(dt);
							jobRecievedDetails.setReferenceJobAssignChallan(req
									.getParameter("jobChallanNo"));
							jobRecievedDetails
									.setJobAssignmentDetails(jobAssignmentDetails);
							jobRecievedDetails.setChallanNumber(req
									.getParameter("jobReChallanNo"));
							jobRecievedDetails.setChallanNo(Integer
									.parseInt(req.getParameter("challanNo")));
							jobRecievedDetails
									.setChallanSuffix(Integer.parseInt(req
											.getParameter("challanSuffix")));
							ejb.setJobRecieve(jobRecievedDetails);

							String jobPlanProductsId[] = req
									.getParameterValues("jobPlanProductsId");
							String jobAssgnProductsId[] = req
									.getParameterValues("jobAssgnProductsId");
							String prodQtyRe[] = req
									.getParameterValues("prodQtyRe");

							for (int l = 0; l < jobPlanProductsId.length; l++) {
								jobRecieveProductsDetails = new JobRecieveProductsDetails();
								jobRecieveProductsDetails.setQtyReturn(Float
										.parseFloat(prodQtyRe[l]));
								jobRecieveProductsDetails
										.setJobRecievedDetails(jobRecievedDetails);
								jobRecieveProductsDetails
										.setJobPlanProducts(ejb.getJobPlanProductsById(Integer
												.parseInt(jobPlanProductsId[l])));
								ejb.setJobRecieveProductsDetails(jobRecieveProductsDetails);

								jobPlanProducts = ejb
										.getJobPlanProductsById(Integer
												.parseInt(jobPlanProductsId[l]));
								jobPlanProducts.setRemainingQty(jobPlanProducts
										.getRemainingQty()
										+ Float.parseFloat(prodQtyRe[l]));
								if (jobPlanProducts.getQty() == jobPlanProducts
										.getRemainingQty()) {
									jobPlanProducts.setUndergoingProcess(false);
								}
								jobPlanProducts.setJobCycle(jobPlanProducts
										.getJobCycle() + 1);
								ejb.updateJobPlanProducts(jobPlanProducts);

								jobAssignmentProducts = ejb
										.getJobAssignmentProductsByJobPlanProductIdAndJobAssignmentId(
												Integer.parseInt(jobPlanProductsId[l]),
												jobAssignmentDetails.getId());
								jobAssignmentProducts
										.setRemaninQty(jobAssignmentProducts
												.getRemaninQty()
												- Float.parseFloat(prodQtyRe[l]));
								ejb.updateJobAssignmentProductDetails(jobAssignmentProducts);

								String[] jobAssgnJobId = req
										.getParameterValues("jobAssgnJobId"
												+ jobAssgnProductsId[l]);
								String qtyRe[] = req.getParameterValues("qtyRe"
										+ jobAssgnProductsId[l]);
								for (int lc1 = 0; lc1 < jobAssgnJobId.length; lc1++) {
									if (!qtyRe[lc1].equals("0")) {
										jobAssignmentJobDetails = ejb
												.getJobAssignmentJobDetailsById(Integer
														.parseInt(jobAssgnJobId[lc1]));

										jobPlanJobStock = jobAssignmentJobDetails
												.getJobPlanJobStock();

										jobAssignmentJobDetails = ejb
												.getJobAssignmentJobDetailsById(Integer
														.parseInt(jobAssgnJobId[lc1]));

										jobReceiveJobDetails = new JobReceiveJobDetails();
										jobReceiveJobDetails
												.setJobPlanJobStock(jobPlanJobStock);
										jobReceiveJobDetails
												.setJobRecieveProductsDetails(jobRecieveProductsDetails);
										jobReceiveJobDetails.setQtyDone(Float
												.parseFloat(qtyRe[lc1]));
										ejb.setJobReceiveJobDetails(jobReceiveJobDetails);
									}
								}

							}
							req.setAttribute("jobRcvId",
									jobRecievedDetails.getId());
							msg = "Job recieved successfully";
						} else {
							msg = "Duplicate Entry! Not Allowed!";
						}
						break;

					case "dayBookreport":
						page = "finalcialReport.jsp";

						List<Purchase_Entry> purchaseEty = ejb
								.getPurchaseEntryByDateForReport(DateConverter
										.getDate(req
												.getParameter("dayBookDate")));
						List<SalesEntry> salesEty = ejb
								.getSalesEntryByDateForReport(DateConverter
										.getDate(req
												.getParameter("dayBookDate")));
						List<PurchaseReturn> purchaseReturn = ejb
								.getPurchaseReturnByDateForReport(DateConverter
										.getDate(req
												.getParameter("dayBookDate")));
						List<SalesReturn> salesReturn = ejb
								.getSalesReturnByDateForReport(DateConverter
										.getDate(req
												.getParameter("dayBookDate")));
						req.setAttribute("purchaseEty", purchaseEty);
						req.setAttribute("salesEty", salesEty);
						req.setAttribute("purchaseReturn", purchaseReturn);
						req.setAttribute("salesReturn", salesReturn);

						break;

					case "creditNoteByVendorName":
						page = "noteCreditVendorView.jsp";
						List<VoucherDetails> voucherDetailsV = ejb
								.getDecendingVoucherDetailsByVendorId(Integer
										.parseInt(req.getParameter("vId")));
						req.setAttribute("vouDetList", voucherDetailsV);
						req.setAttribute("vId", req.getParameter("vId"));
						break;

					case "creditNoteByAgentName":
						page = "noteCreditAgentView.jsp";
						List<VoucherDetails> voucherDetailsPA = ejb
								.getDecendingVoucherDetailsByVendorId(Integer
										.parseInt(req.getParameter("paId")));
						req.setAttribute("vouDetList", voucherDetailsPA);
						req.setAttribute("paId", req.getParameter("paId"));
						break;

					case "creditNoteByViaPurchaseAgentName":
						page = "noteCreditViaPurchaseAgentView.jsp";
						List<VoucherDetailsForViaAgents> voucherDetailsVPA = ejb
								.getVoucherDetails4ViaAgentByAgentIdDesc(Integer
										.parseInt(req.getParameter("paId")));
						req.setAttribute("vouDetList", voucherDetailsVPA);
						req.setAttribute("paId", req.getParameter("paId"));
						break;

					case "creditNoteBySalesAgentName":
						page = "noteCreditSalesAgentView.jsp";
						List<VoucherDetailsForViaAgents> voucherDetailsForVA = ejb
								.getVoucherDetails4ViaAgentByAgentIdDesc(Integer
										.parseInt(req.getParameter("saId")));
						req.setAttribute("vouDetList", voucherDetailsForVA);
						req.setAttribute("saId", req.getParameter("saId"));
						break;

					case "creditNoteByJobber":
						page = "noteCreditJobberView.jsp";
						List<VoucherDetails> voucherDetailsJ = ejb
								.getDecendingVoucherDetailsByVendorId(Integer
										.parseInt(req.getParameter("jId")));
						req.setAttribute("vouDetList", voucherDetailsJ);
						req.setAttribute("jId", req.getParameter("jId"));
						break;

					case "debitNoteByCustomer":
						page = "noteDebitCustomerView.jsp";
						List<VoucherDetails> voucherDetailsC = ejb
								.getDescendingVoucherDetailsbyCustomerId(Integer
										.parseInt(req.getParameter("cId")));
						req.setAttribute("vouDetList", voucherDetailsC);
						req.setAttribute("cId", req.getParameter("cId"));
						break;

					case "approvalEntry":
						page = "approvalEntry.jsp";

						// ////////Null Manage////////////////////////////
						if (verifyParams(req, resp, "productId", "qtyvalue",
								"mrpQty", "purchaseProductDetId")) {
							req.setAttribute("msg", "Failed! Please try again!");
							req.getRequestDispatcher(page).forward(req, resp);
							return;
						}
						// ////////Null Manage////////////////////////////

						List<ApprovalEntry> entries = ejb.getAllApprovalEntry();
						int flagForApprovalBill = 0;
						for (ApprovalEntry entry : entries) {
							if (entry.getChallanNumber().equals(
									req.getParameter("challanNumber"))) {
								flagForApprovalBill = 1;
								break;
							}
						}
						if (flagForApprovalBill == 0) {
							if (req.getParameter("isExistingCust").equals("0")) {
								customerEntry = new CustomerEntry();
								customerEntry.setName(req.getParameter(
										"custName").toUpperCase());
								customerEntry.setAddress(req.getParameter(
										"addr").toUpperCase());
								customerEntry.setCity(req.getParameter("city")
										.toUpperCase());
								customerEntry.setMobile(req
										.getParameter("phone"));
								customerEntry.setVat_cst_no(req.getParameter(
										"vatcst").toUpperCase());
								ejb.setCustomerEntry(customerEntry);

								voucherAssign = new VoucherAssign();
								voucherAssign.setCustomerEntry(customerEntry);
								voucherAssign
										.setVoucherDetailsNumber(customerEntry
												.getMobile());
								ejb.setVoucherAssign(voucherAssign);

							} else {
								voucherAssign = ejb
										.getVoucherAssignByCustomerId(Integer.parseInt(req
												.getParameter("existingCustId")));
							}

							approvalEntry = new ApprovalEntry();
							dt = new Date();
							approvalEntry.setChallanNumber(req
									.getParameter("challanNumber"));
							approvalEntry.setChallanNo(Integer.parseInt(req
									.getParameter("challanNo")));
							approvalEntry.setChallanSuffix(Integer.parseInt(req
									.getParameter("challanSuffix")));
							approvalEntry.setEntry_Date(dt);
							approvalEntry.setApprovalDate(DateConverter
									.getDate(req.getParameter("salesDate")));
							approvalEntry.setSubTotal(Float.parseFloat(req
									.getParameter("subtotalvalue")));
							approvalEntry.setRoundOf(Float.parseFloat(req
									.getParameter("roundvalue")));
							approvalEntry.setTotalCost(Float.parseFloat(req
									.getParameter("grandtotal")));
							approvalEntry.setDescription(req.getParameter(
									"salesDesc").toUpperCase());

							if (!req.getParameter("aId").equals("")) {
								approvalEntry.setVendor(ejb
										.getVendorById(Integer.parseInt(req
												.getParameter("aId"))));
							}

							if (req.getParameter("wspORmrp").equals("mrpVal")) {
								approvalEntry.setMRP(true);
							} else {
								approvalEntry.setMRP(false);
							}

							if (req.getParameter("isExistingCust").equals("0")) {
								approvalEntry.setCustomer(customerEntry);
							} else {
								approvalEntry
										.setCustomer(ejb.getCustomerEntryById(Integer.parseInt(req
												.getParameter("existingCustId"))));
							}

							approvalEntry.setUser(ejb
									.getUserById((String) httpSession
											.getAttribute("user")));
							ejb.setApprovalEntry(approvalEntry);

							String productId[] = req
									.getParameterValues("productId");
							String qtyvalue[] = req
									.getParameterValues("qtyvalue");
							String mrpQty[] = req.getParameterValues("mrpQty");
							String purchaseProductDetId[] = req
									.getParameterValues("purchaseProductDetId");

							for (int l = 0; l < productId.length; l++) {
								approvalProductDetails = new ApprovalProductDetails();
								approvalProductDetails
										.setApprovalEntry(approvalEntry);
								approvalProductDetails.setPrice(Float
										.parseFloat(mrpQty[l]));
								approvalProductDetails.setQuantity(Float
										.parseFloat(qtyvalue[l]));
								approvalProductDetails
										.setPurchase_Product_Details(ejb
												.getPurchaseProductDetailsById(Integer
														.parseInt(purchaseProductDetId[l])));
								ejb.setApprovalProductDetails(approvalProductDetails);

								purchaseProductDetails = ejb
										.getPurchaseProductDetailsById(Integer
												.parseInt(purchaseProductDetId[l]));
								purchaseProductDetails
										.setRemaining_quantity(purchaseProductDetails
												.getRemaining_quantity()
												- Float.parseFloat(qtyvalue[l]));
								ejb.updatePurchaseProductDetails(purchaseProductDetails);

								if (purchaseProductDetails.getProductDetail()
										.isRaw()) {
									rawMaterialsStock = ejb
											.getRawMeterialStoctByProductId(purchaseProductDetails
													.getProductDetail().getId());

									rawMaterialsStock
											.setRemainingQty(rawMaterialsStock
													.getRemainingQty()
													- Float.parseFloat(qtyvalue[l]));

									ejb.updateRawMaterialStockDetail(rawMaterialsStock);
								} else {
									readyGoodsStock = ejb
											.getReadyGoodsStoctByProductId(purchaseProductDetails
													.getProductDetail().getId());

									readyGoodsStock
											.setRemainingQty(readyGoodsStock
													.getRemainingQty()
													- Float.parseFloat(qtyvalue[l]));

									ejb.updateReadyGoodsStockDetail(readyGoodsStock);
								}

								rawMaterialsStock = null;
								readyGoodsStock = null;
								purchaseProductDetails = null;
								approvalProductDetails = null;
							}

							req.setAttribute("idforPC", approvalEntry.getId());
							approvalEntry = null;
							msg = "Successfull...";
						} else {
							msg = "Duplicate entry! Not allowed!";
						}

						break;

					case "approvalSearchAll":
						page = "approvalSearch.jsp";
						List<ApprovalEntry> approvalEntryLstA = ejb
								.getAllApprovalEntry();
						req.setAttribute("approvalEntryLst", approvalEntryLstA);
						if (approvalEntryLstA.size() > 0) {
							msg = "All Aprroval Entry List";
						} else {
							msg = "No result found...";
						}
						break;

					case "approvalSearchByDate":
						page = "approvalSearch.jsp";

						List<ApprovalEntry> approvalEntryLstDt = ejb
								.getApprovalEntryByDate(DateConverter
										.getDate(req.getParameter("fDate")),
										DateConverter.getDate(req
												.getParameter("lDate")));
						req.setAttribute("approvalEntryLst", approvalEntryLstDt);

						if (approvalEntryLstDt.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}

						break;

					case "approvalSearchByChallanNumber":
						page = "approvalSearch.jsp";

						List<ApprovalEntry> approvalEntryLstChNo = ejb
								.getApprovalEntryByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));
						req.setAttribute("approvalEntryLst",
								approvalEntryLstChNo);

						if (approvalEntryLstChNo.size() > 0) {
							msg = "Your search for challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for challan number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}
						break;

					case "approvalSearchByAgentName":
						page = "approvalSearch.jsp";
						List<ApprovalEntry> approvalEntryLstAgNm = ejb
								.getApprovalEntryByAgentName(req
										.getParameter("agentName"));
						req.setAttribute("approvalEntryLst",
								approvalEntryLstAgNm);
						if (approvalEntryLstAgNm.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						}
						break;

					case "approvalSearchByCustomerName":
						page = "approvalSearch.jsp";
						List<ApprovalEntry> approvalEntryLstCsNm = ejb
								.getApprovalEntryByCustomerName(req
										.getParameter("custoName"));
						req.setAttribute("approvalEntryLst",
								approvalEntryLstCsNm);
						if (approvalEntryLstCsNm.size() > 0) {
							msg = "Your search for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						} else {
							msg = "No result found for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						}
						break;

					case "approvalSearchByProductCode":
						page = "approvalSearch.jsp";
						List<ApprovalEntry> approvalEntryLstPrCd = ejb
								.getApprovalEntriesByProductCode(req
										.getParameter("prodCode"));
						req.setAttribute("approvalEntryLst",
								approvalEntryLstPrCd);
						if (approvalEntryLstPrCd.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "approvalView":
						page = "approvalView.jsp";
						req.setAttribute("id", req.getParameter("id"));
						msg = "";
						break;

					case "approvalSearchForReturn":
						page = "approvalReturn.jsp";

						List<ApprovalEntry> approvalEntryListChNo = ejb
								.getApprovalEntryDByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));

						if (approvalEntryListChNo.size() > 0) {
							req.setAttribute("approvalEntry",
									approvalEntryListChNo.get(0));

							msg = "Your search for Approval bill number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for Approval bill number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}
						break;

					case "approvalReturn":
						page = "approvalReturn.jsp";

						// ////////Null Manage////////////////////////////
						if (verifyParams(req, resp, "returningQty",
								"approvalProductDetailsID")) {
							req.setAttribute("msg", "Failed! Please try again!");
							req.getRequestDispatcher(page).forward(req, resp);
							return;
						}
						// ////////Null Manage////////////////////////////

						approvalEntry = ejb.getApprovalEntryById(Integer
								.parseInt(req.getParameter("approvalEntryId")));

						List<ApprovalReturn> approvalReturnLst = ejb
								.getAllApprovalReturn();
						int flagApprovalReturn = 0;
						for (ApprovalReturn ar : approvalReturnLst) {
							if (ar.getChallanNumber().equals(
									req.getParameter("challanNumber"))) {
								flagApprovalReturn = 1;
								break;
							}
						}
						if (flagApprovalReturn == 0) {
							approvalReturn = new ApprovalReturn();
							approvalReturn.setChallanNo(Integer.parseInt(req
									.getParameter("challanNo")));
							approvalReturn
									.setChallanSuffix(Integer.parseInt(req
											.getParameter("challanSuffix")));

							approvalReturn.setApprovalEntry(approvalEntry);
							approvalReturn.setChallanNumber(req
									.getParameter("challanNumber"));
							approvalReturn.setRoundOff(Float.parseFloat(req
									.getParameter("roundvalue")));
							approvalReturn
									.setReturnDate(DateConverter.getDate(req
											.getParameter("approvalReturnDate")));
							approvalReturn.setTotalReCost(Float.parseFloat(req
									.getParameter("grandtotal")));
							approvalReturn.setReferenceApprovalChallan(req
									.getParameter("saslesRChallanRId"));
							approvalReturn.setUser(ejb
									.getUserById((String) httpSession
											.getAttribute("user")));
							ejb.setApprovalReturn(approvalReturn);

							String p3[] = req.getParameterValues("cmmnt");
							String qty4[] = req
									.getParameterValues("returningQty");
							String approvalProductDetailId[] = req
									.getParameterValues("approvalProductDetailsID");

							for (int l = 0; l < p3.length; l++) {
								if (!qty4[l].equals("0")) {
									if (!qty4[l].equals("")) {
										approvalProductDetails = ejb
												.getApprovalProductDetailsById(Integer
														.parseInt(approvalProductDetailId[l]));
										approvalProductDetails
												.setApprovalRetQty(approvalProductDetails
														.getApprovalRetQty()
														+ Float.parseFloat(qty4[l]));
										ejb.updateApprovalProductDetails(approvalProductDetails);

										approvalReturnProductDetails = new ApprovalReturnProductDetails();
										approvalReturnProductDetails
												.setApprovalReturn(approvalReturn);

										approvalReturnProductDetails
												.setComments(p3[l]);
										approvalReturnProductDetails
												.setQtyReturn(Float
														.parseFloat(qty4[l]));
										approvalReturnProductDetails
												.setApprovalProductDetails(approvalProductDetails);
										ejb.setApprovalReturnProductDetails(approvalReturnProductDetails);

										purchaseProductDetails = approvalProductDetails
												.getPurchase_Product_Details();
										purchaseProductDetails
												.setRemaining_quantity(purchaseProductDetails
														.getRemaining_quantity()
														+ Float.parseFloat(qty4[l]));
										ejb.updatePurchaseProductDetails(purchaseProductDetails);

										companyInfo = ejb.getUserById(
												(String) httpSession
														.getAttribute("user"))
												.getCompanyInfo();
										if (purchaseProductDetails
												.getProductDetail().isRaw()) {
											rawMaterialsStock = ejb
													.getRawMeterialStoctByProductAndCompanyId(
															purchaseProductDetails
																	.getProductDetail()
																	.getId(),
															companyInfo.getId());

											rawMaterialsStock
													.setRemainingQty(rawMaterialsStock
															.getRemainingQty()
															+ Float.parseFloat(qty4[l]));

											ejb.updateRawMaterialStockDetail(rawMaterialsStock);
										} else {
											readyGoodsStock = ejb
													.getReadyGoodStoctByProductAndCompanyId(
															purchaseProductDetails
																	.getProductDetail()
																	.getId(),
															companyInfo.getId());

											readyGoodsStock
													.setRemainingQty(readyGoodsStock
															.getRemainingQty()
															+ Float.parseFloat(qty4[l]));

											ejb.updateReadyGoodsStockDetail(readyGoodsStock);
										}
										purchaseProductDetails = null;
									}
								}
							}

							req.setAttribute("returnIdforPC",
									approvalReturn.getId());
							msg = "Succeessful...";
						} else {
							msg = "Duplicate Entry! Not Allowed!";
						}

						break;

					case "approvalReturnSearchAll":
						page = "approvalReturnSearch.jsp";
						List<ApprovalReturn> approvalRetLstA = ejb
								.getAllApprovalReturn();
						req.setAttribute("approvalRetLst", approvalRetLstA);
						if (approvalRetLstA.size() > 0) {
							msg = "All Return List";
						} else {
							msg = "No result found...";
						}
						break;

					case "approvalRerturnSearchByDate":
						page = "approvalReturnSearch.jsp";

						List<ApprovalReturn> approvalRetLstDt = ejb
								.getApprovalReturnByDate(DateConverter
										.getDate(req.getParameter("fDate")),
										DateConverter.getDate(req
												.getParameter("lDate")));
						req.setAttribute("approvalRetLst", approvalRetLstDt);

						if (approvalRetLstDt.size() > 0) {
							msg = "Your search for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate");
						} else {
							msg = "No result found for dated "
									+ req.getParameter("fDate") + " to "
									+ req.getParameter("lDate") + "...";
						}

						break;

					case "approvalReturnSearchByBillNo":
						page = "approvalReturnSearch.jsp";

						List<ApprovalReturn> approvalRetLstBlNo = ejb
								.getApprovalReturnByChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));
						req.setAttribute("approvalRetLst", approvalRetLstBlNo);

						if (approvalRetLstBlNo.size() > 0) {
							msg = "Your search for bill number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for bill number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						}
						break;

					case "approvalReturnSearchByRefBillNo":
						page = "approvalReturnSearch.jsp";

						List<ApprovalReturn> approvalRetLstRfBlNo = ejb
								.getApprovalReturnByRefChallanNo(req
										.getParameter("companyInitial")
										+ "/"
										+ req.getParameter("fynYear")
										+ "/"
										+ req.getParameter("month")
										+ "/"
										+ req.getParameter("billType")
										+ "/"
										+ req.getParameter("autoNum")
										+ "/"
										+ req.getParameter("suffix"));
						req.setAttribute("approvalRetLst", approvalRetLstRfBlNo);

						if (approvalRetLstRfBlNo.size() > 0) {
							msg = "Your search for reference bill number : "
									+ req.getParameter("companyInitial") + "/"
									+ req.getParameter("fynYear") + "/"
									+ req.getParameter("month") + "/"
									+ req.getParameter("billType") + "/"
									+ req.getParameter("autoNum") + "/"
									+ req.getParameter("suffix");
						} else {
							msg = "No result found for reference bill number : "
									+ req.getParameter("companyInitial")
									+ "/"
									+ req.getParameter("fynYear")
									+ "/"
									+ req.getParameter("month")
									+ "/"
									+ req.getParameter("billType")
									+ "/"
									+ req.getParameter("autoNum")
									+ "/"
									+ req.getParameter("suffix");
						}
						break;

					case "approvalReturnSearchByAgentName":
						page = "approvalReturnSearch.jsp";
						List<ApprovalReturn> approvalRetLstAg = ejb
								.getApprovalReturnByAgentName(req
										.getParameter("agentName"));
						req.setAttribute("approvalRetLst", approvalRetLstAg);
						if (approvalRetLstAg.size() > 0) {
							msg = "Your search for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						} else {
							msg = "No result found for Agent name : "
									+ req.getParameter("agentName")
											.toUpperCase();
						}
						break;

					case "approvalReturnSearchByCustomerName":
						page = "approvalReturnSearch.jsp";
						List<ApprovalReturn> approvalRetLstCsNm = ejb
								.getApprovalReturnByCustomerName(req
										.getParameter("custoName"));
						req.setAttribute("approvalRetLst", approvalRetLstCsNm);
						if (approvalRetLstCsNm.size() > 0) {
							msg = "Your search for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						} else {
							msg = "No result found for Customer name : "
									+ req.getParameter("custoName")
											.toUpperCase();
						}
						break;

					case "approvalReturnSearchByProductCode":
						page = "approvalReturnSearch.jsp";
						List<ApprovalReturn> approvalRetLstPrCd = ejb
								.getApprovalReturnByProductCode(req
										.getParameter("prodCode"));
						req.setAttribute("approvalRetLst", approvalRetLstPrCd);
						if (approvalRetLstPrCd.size() > 0) {
							msg = "Your search for Product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						} else {
							msg = "No result found for product code : "
									+ req.getParameter("prodCode")
											.toUpperCase();
						}
						break;

					case "approvalReturnView":
						page = "approvalReturnView.jsp";
						req.setAttribute("id", req.getParameter("id"));
						msg = "";
						break;

					default:
						break;
					}
				} catch (

				Exception e)

				{
					msg = "error: " + e.getMessage();
					e.printStackTrace();
				} finally

				{
					tax = null;
					tax_type_group = null;
					department = null;
					subDepartment = null;
					category = null;
					vendorType = null;
					country = null;
					state = null;
					city = null;
					productDetail = null;
					vendor = null;
					accountDetails = null;
					qtyUnit = null;
					qtyUnitConversion = null;
					qtyUnitConversionPK = null;
					billSetup = null;
					companyInfo = null;
					purchaseEntry = null;
					purchaseProductDetails = null;
					rawMaterialsStock = null;
					readyGoodsStock = null;
					serialNumber = null;
					paymentDetails = null;
					try {
						finalize();
					} catch (Throwable e) {
						System.out.println("Error in garbage collection: "
								+ e.getMessage());
						e.printStackTrace();
					}
				}
			}
		}

		req.setAttribute("msg", msg);
		req.getRequestDispatcher(page).forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}

	public boolean verifyParams(HttpServletRequest req,
			HttpServletResponse resp, String... params)
			throws ServletException, IOException {
		int flag = 1;
		for (String data : params) {
			if (req.getParameter(data) != null
					&& !req.getParameter(data).isEmpty()) {
			} else {
				flag = 0;
			}
		}
		return flag == 0;
	}
}
