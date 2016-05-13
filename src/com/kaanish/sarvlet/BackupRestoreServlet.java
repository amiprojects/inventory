package com.kaanish.sarvlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.AccountDetails;
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
import com.kaanish.model.JobClass;
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
import com.kaanish.model.Module;
import com.kaanish.model.NotificationDetails;
import com.kaanish.model.NotificationView;
import com.kaanish.model.PageList;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.PaymentStatus;
import com.kaanish.model.PaymentType;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.ProductImage;
import com.kaanish.model.ProductsForDesignCostSheet;
import com.kaanish.model.PurchaseOrderEntry;
import com.kaanish.model.PurchaseOrderProductdetails;
import com.kaanish.model.PurchaseReturn;
import com.kaanish.model.PurchaseReturnProductDetails;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.Purchase_Product_Details;
import com.kaanish.model.QtyUnit;
import com.kaanish.model.QtyUnitConversion;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.RawMaterialsStock;
import com.kaanish.model.ReadyGoodsStock;
import com.kaanish.model.SalesEntry;
import com.kaanish.model.SalesProductDetails;
import com.kaanish.model.SalesProductReturnDetail;
import com.kaanish.model.SalesReturn;
import com.kaanish.model.SampleDesignCostSheet;
import com.kaanish.model.SecurityAnswers;
import com.kaanish.model.SecurityQuestionGroup;
import com.kaanish.model.SequrityQuestions;
import com.kaanish.model.SerialNumber;
import com.kaanish.model.State;
import com.kaanish.model.Stoct;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.UserGroup;
import com.kaanish.model.Users;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;
import com.kaanish.model.VoucherAssign;
import com.kaanish.model.VoucherDetails;
import com.kaanish.util.GetMacId;

@WebServlet({ "/backup", "/restore", "/macid" })
public class BackupRestoreServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;
	private String filePath = "backup/";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		switch (url) {

		case "backup":
			writeDataIntoFile(AccountDetails.class);
			writeDataIntoFile(Bill_setup.class);
			writeDataIntoFile(Category.class);
			writeDataIntoFile(City.class);
			writeDataIntoFile(CompanyInfo.class);
			writeDataIntoFile(Country.class);
			writeDataIntoFile(CustomerEntry.class);
			writeDataIntoFile(Department.class);
			writeDataIntoFile(DesignImage.class);
			writeDataIntoFile(ItemDetails.class);
			writeDataIntoFile(ItmProductsForSample.class);
			writeDataIntoFile(JobAssignmentDetails.class);
			writeDataIntoFile(JobAssignmentJobDetails.class);
			writeDataIntoFile(JobAssignmentProducts.class);
			writeDataIntoFile(JobClass.class);
			writeDataIntoFile(JobPlan.class);
			writeDataIntoFile(JobPlanJobStock.class);
			writeDataIntoFile(JobPlanProducts.class);
			writeDataIntoFile(JobPlanProductStock.class);
			writeDataIntoFile(JobReceiveJobDetails.class);
			writeDataIntoFile(JobRecievedDetails.class);
			writeDataIntoFile(JobRecieveProductsDetails.class);
			writeDataIntoFile(JobsForDesignCostSheet.class);
			writeDataIntoFile(JobStock.class);
			writeDataIntoFile(JobTypes.class);
			writeDataIntoFile(Module.class);
			writeDataIntoFile(NotificationDetails.class);
			writeDataIntoFile(NotificationView.class);
			writeDataIntoFile(PageList.class);
			writeDataIntoFile(PaymentDetails.class);
			writeDataIntoFile(PaymentStatus.class);
			writeDataIntoFile(PaymentType.class);
			writeDataIntoFile(ProductDetail.class);
			writeDataIntoFile(ProductImage.class);
			writeDataIntoFile(ProductsForDesignCostSheet.class);
			writeDataIntoFile(Purchase_Entry.class);
			writeDataIntoFile(Purchase_Product_Details.class);
			writeDataIntoFile(PurchaseOrderEntry.class);
			writeDataIntoFile(PurchaseOrderProductdetails.class);
			writeDataIntoFile(PurchaseReturn.class);
			writeDataIntoFile(PurchaseReturnProductDetails.class);
			writeDataIntoFile(QtyUnit.class);
			writeDataIntoFile(QtyUnitConversion.class);
			// writeDataIntoFile(QtyUnitConversionPK.class);
			writeDataIntoFile(QtyUnitType.class);
			writeDataIntoFile(RawMaterialsStock.class);
			writeDataIntoFile(ReadyGoodsStock.class);
			writeDataIntoFile(SalesEntry.class);
			writeDataIntoFile(SalesProductDetails.class);
			writeDataIntoFile(SalesProductReturnDetail.class);
			writeDataIntoFile(SalesReturn.class);
			writeDataIntoFile(SampleDesignCostSheet.class);
			writeDataIntoFile(SecurityAnswers.class);
			writeDataIntoFile(SecurityQuestionGroup.class);
			writeDataIntoFile(SequrityQuestions.class);
			writeDataIntoFile(SerialNumber.class);
			writeDataIntoFile(State.class);
			writeDataIntoFile(Stoct.class);
			writeDataIntoFile(SubDepartment.class);
			writeDataIntoFile(Tax.class);
			writeDataIntoFile(Tax_Type_Group.class);
			writeDataIntoFile(UserGroup.class);
			writeDataIntoFile(Users.class);
			writeDataIntoFile(Vendor.class);
			writeDataIntoFile(VendorType.class);
			writeDataIntoFile(VoucherAssign.class);
			writeDataIntoFile(VoucherDetails.class);
			break;

		case "restore":			
			restoreDataFromFile(Country.class);
			restoreDataFromFile(State.class);
			restoreDataFromFile(City.class);
			restoreDataFromFile(Tax.class);
			restoreDataFromFile(Tax_Type_Group.class);
			restoreDataFromFile(PageList.class);
			restoreDataFromFile(UserGroup.class);
			restoreDataFromFile(CompanyInfo.class);
			restoreDataFromFile(Users.class);
			restoreDataFromFile(VendorType.class);
			restoreDataFromFile(Stoct.class);
			restoreDataFromFile(Department.class);
			restoreDataFromFile(SubDepartment.class);
			restoreDataFromFile(Category.class);
			restoreDataFromFile(ProductDetail.class);
			restoreDataFromFile(ProductImage.class);
			restoreDataFromFile(JobStock.class);
			restoreDataFromFile(JobTypes.class);
			restoreDataFromFile(Module.class);
			restoreDataFromFile(NotificationDetails.class);
			restoreDataFromFile(NotificationView.class);
			restoreDataFromFile(QtyUnitType.class);
			restoreDataFromFile(QtyUnit.class);
			restoreDataFromFile(QtyUnitConversion.class);
			restoreDataFromFile(JobClass.class);
			restoreDataFromFile(SecurityAnswers.class);
			restoreDataFromFile(SecurityQuestionGroup.class);
			restoreDataFromFile(SequrityQuestions.class);
			restoreDataFromFile(SerialNumber.class);
			restoreDataFromFile(Purchase_Entry.class);
			restoreDataFromFile(Purchase_Product_Details.class);
			restoreDataFromFile(PaymentType.class);
			restoreDataFromFile(PaymentStatus.class);
			restoreDataFromFile(PaymentDetails.class);
			restoreDataFromFile(RawMaterialsStock.class);
			restoreDataFromFile(ReadyGoodsStock.class);
			restoreDataFromFile(Bill_setup.class);
			restoreDataFromFile(VoucherAssign.class);
			restoreDataFromFile(VoucherDetails.class);
			restoreDataFromFile(ItmProductsForSample.class);
			restoreDataFromFile(SampleDesignCostSheet.class);
			restoreDataFromFile(ProductsForDesignCostSheet.class);
			restoreDataFromFile(JobsForDesignCostSheet.class);
			restoreDataFromFile(DesignImage.class);
			restoreDataFromFile(JobPlan.class);
			restoreDataFromFile(JobPlanJobStock.class);
			restoreDataFromFile(JobAssignmentProducts.class);
			restoreDataFromFile(JobAssignmentJobDetails.class);	
			restoreDataFromFile(JobAssignmentDetails.class);
			restoreDataFromFile(JobPlanProducts.class);
			restoreDataFromFile(JobPlanProductStock.class);
			restoreDataFromFile(JobReceiveJobDetails.class);
			restoreDataFromFile(JobRecievedDetails.class);
			restoreDataFromFile(JobRecieveProductsDetails.class);
			restoreDataFromFile(PurchaseOrderEntry.class);
			restoreDataFromFile(PurchaseOrderProductdetails.class);
			restoreDataFromFile(PurchaseReturn.class);
			restoreDataFromFile(PurchaseReturnProductDetails.class);
			restoreDataFromFile(CustomerEntry.class);
			restoreDataFromFile(ItemDetails.class);
			restoreDataFromFile(SalesEntry.class);
			restoreDataFromFile(SalesProductDetails.class);
			restoreDataFromFile(SalesReturn.class);
			restoreDataFromFile(SalesProductReturnDetail.class);
			restoreDataFromFile(AccountDetails.class);
			restoreDataFromFile(Vendor.class);
			
			
			/*		
			// restoreDataFromFile(QtyUnitConversionPK.class);	
			*/
			break;
		case "macid":
			resp.getWriter().println(GetMacId.getMacId());
			break;

		default:
			break;
		}
	}

	public <T> void writeDataIntoFile(Class<T> className) throws IOException {
		FileOutputStream fos = new FileOutputStream(filePath + className.getSimpleName() + ".txt");
		ObjectOutputStream oos = new ObjectOutputStream(fos);
		oos.writeObject(ejb.getAllData(className));
		fos.close();
		oos.close();
	}

	public <T> void restoreDataFromFile(Class<T> className) throws IOException {
		
		System.out.print("Restroring "+ className.getSimpleName()+"....");
		
		ejb.restoreData(className, filePath);
	}

}
