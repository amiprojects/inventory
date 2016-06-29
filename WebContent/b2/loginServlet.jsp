// job assignment job details jobPlanJobStockId
		for (JobAssignmentJobDetails jajd : ejb.getAllJobAssignmentJobDetails()) {
			JobPlanJobStock jobPlanJobStock = ejb.getJobPlanJobStockByJobPlanProductIdAndJobTypeId(
					jajd.getAssignmentProducts().getJobPlanProducts().getId(), jajd.getJobType().getId());
			jajd.setJobPlanJobStock(jobPlanJobStock);
			ejb.updateJobAssignmentJobDetails(jajd);
		}
		// job assignment job details jobPlanJobStockId

		// job plan product stock cost
		for (JobPlanProductStock pd : ejb.getAllJobPlanProductStock()) {
			pd.setCost(pd.getPurchase_Product_Details().getCost());
			ejb.updateJobPlanProductStock(pd);
		}
		// job plan product stock cost


// products for design cost sheet productId
		for (JobPlanProductStock jpps : ejb.getAllJobPlanProductStock()) {
			ProductsForDesignCostSheet productsForDesignCostSheet = jpps
					.getProductsForDesignCostSheet();
			productsForDesignCostSheet.setProductDetail(jpps
					.getPurchase_Product_Details().getProductDetail());
			ejb.updateProductsForDesignCostSheet(productsForDesignCostSheet);
		}
		// products for design cost sheet productId

// not received assigns delete
		// for (JobPlan jp : ejb.getAllJobPlan()) {
		// for (JobAssignmentDetails jad : jp.getJobAssignmentDetails()) {
		// float totREMqty = 0;
		// for (JobAssignmentProducts jap : jad.getJobAssignmentProducts()) {
		// totREMqty = totREMqty + jap.getRemaninQty();
		// }
		// if (totREMqty > 0) {
		// System.out.println("Plan No : " + jp.getId()
		// + ", JobAssignId : " + jad.getId());
		// for (JobAssignmentJobDetails jajd : jad
		// .getJobAssignmentJobDetails()) {
		// ejb.deleteJobAssignmentJobDetailsById(jajd.getId());
		// }
		// for (JobAssignmentProducts jap : jad
		// .getJobAssignmentProducts()) {
		// ejb.deleteJobAssignmentProductsById(jap.getId());
		// }
		// ejb.deleteJobAssignmentDetailsById(jad.getId());
		// System.out.println("Job " + jad.getChallanNumber()
		// + " deleted");
		// }
		// }
		// }
		// not received assigns delete


// Stiching on sample
		// for (ProductsForDesignCostSheet p : ejb
		// .getAllProductsForDesignCostSheet()) {
		// if (p.getSampleDesignCostSheet().getJobPlans().size() == 0) {
		// int flag = 0;
		// for (JobsForDesignCostSheet j : p.getJobsForDesignCostSheets()) {
		// if (j.getJobTypes().getJobName().equals("STITCHING")) {
		// flag = 1;
		// break;
		// }
		// }
		// if (flag == 0) {
		// JobsForDesignCostSheet jobsForDesignCostSheet = new
		// JobsForDesignCostSheet();
		// jobsForDesignCostSheet.setAmmount(0);
		// jobsForDesignCostSheet.setQty(0);
		// jobsForDesignCostSheet.setRate(0);
		// jobsForDesignCostSheet.setJobTypes(ejb
		// .getJobTypeByJobName("STITCHING"));
		// jobsForDesignCostSheet.setProductsForDesignCostSheet(p);
		// jobsForDesignCostSheet.setQtyUnit(p.getQtyUnit());
		// jobsForDesignCostSheet.setSampleDesignCostSheet(p
		// .getSampleDesignCostSheet());
		// jobsForDesignCostSheet.setVendor(p
		// .getSampleDesignCostSheet().getVendor());
		// ejb.setJobsForDesignCostSheet(jobsForDesignCostSheet);
		// }
		// }
		// }
		// Stiching on sample
		
		
		
		
		
		
		
		
		// deleting and editing bekars- module and pages
		// for (Module m : ejb.getAllModule()) {
		// if (m.getName().equals("JOB")) {
		// module = ejb.getModuleByName("JOB");
		// module.setName("Job");
		// ejb.updateModule(module);
		// break;
		// }
		// }
		// for (Module m : ejb.getAllModule()) {
		// if (m.getName().equals("Sales module")) {
		// module = ejb.getModuleByName("Sales module");
		// module.setName("Sales");
		// ejb.updateModule(module);
		// break;
		// }
		// }
		// for (Module m : ejb.getAllModule()) {
		// if (m.getName().equals("Purchase Module")) {
		// module = ejb.getModuleByName("Purchase Module");
		// module.setName("Purchase");
		// ejb.updateModule(module);
		// break;
		// }
		// }
		// for (PageList p : ejb.getAllPageList()) {
		// if (p.getName().equals("Discount")) {
		// pageList = ejb.getPageByName("Discount");
		// ejb.deletePageListById(pageList.getId());
		// break;
		// }
		// }
		// for (PageList p : ejb.getAllPageList()) {
		// if (p.getName().equals("dashboard")) {
		// pageList = ejb.getPageByName("dashboard");
		// pageList.setName("Dashboard");
		// ejb.updatePageList(pageList);
		// break;
		// }
		// }
		// for (PageList p : ejb.getAllPageList()) {
		// if (p.getName().equals("Vendor Management")) {
		// pageList = ejb.getPageByName("Vendor Management");
		// ejb.deletePageListById(pageList.getId());
		// break;
		// }
		// }
		// for (PageList p : ejb.getAllPageList()) {
		// if (p.getName().equals("MaterialPartDetailsGenerals")) {
		// pageList = ejb.getPageByName("MaterialPartDetailsGenerals");
		// pageList.setName("Product/Material");
		// ejb.updatePageList(pageList);
		// break;
		// }
		// }
		// deleting and editing bekars- module and pages
		
		
		
		//module and pages, debasish
		
		// if (ejb.getAllPageList().size() < 20) {
		// module = new Module();
		// module.setName("Dashboard");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("dashboard");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("Product/Material");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("MaterialPartDetailsGenerals");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("Purchase Module");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("Purchase Entry");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Purchase Search");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Vendor Management");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("Sales module");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("Sales Entry");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Sales Return");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Discount");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("Stock");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("Stock");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("JOB");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("Job Assignment");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Job Recieve");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Job Search");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("Setup");
		// ejb.setModule(module);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Company Info");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Unit Of Measure");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("User");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("User Group");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Department/Sub-Department/Category");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("TaxManagement");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Country/State/City");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Bill Setup");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		// }
		
		//module and pages, debasish