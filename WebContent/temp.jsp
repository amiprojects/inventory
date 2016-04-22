if (ejb.getAllPageList().size() < 20) {
			module = new Module();
			module.setName("Dashboard");
			ejb.setModule(module);
			
			pageList = new PageList();
			pageList.setName("dashboard");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			
			module = null;
			pageList = null;

			module = new Module();
			module.setName("Product/Material");
			ejb.setModule(module);

			pageList = new PageList();
			pageList.setName("MaterialPartDetailsGenerals");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			
			module = null;
			pageList = null;

			module = new Module();
			module.setName("Purchase Module");
			ejb.setModule(module);

			pageList = new PageList();
			pageList.setName("Purchase Entry");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("Purchase Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("Vendor Management");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			
			module = null;
			pageList = null;

			module = new Module();
			module.setName("Sales module");
			ejb.setModule(module);

			pageList = new PageList();
			pageList.setName("Sales Entry");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("Sales Return");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("Discount");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			
			module = null;
			pageList = null;

			module = new Module();
			module.setName("Stock");
			ejb.setModule(module);

			pageList = new PageList();
			pageList.setName("Stock");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			
			module = null;
			pageList = null;

			module = new Module();
			module.setName("JOB");
			ejb.setModule(module);

			pageList = new PageList();
			pageList.setName("Job Assignment");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("Job Recieve");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("Job Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			module = null;
			pageList = null;

			module = new Module();
			module.setName("Setup");
			ejb.setModule(module);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("Company Info");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("Unit Of Measure");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("User");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("User Group");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("Department/Sub-Department/Category");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("TaxManagement");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("Country/State/City");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			
			pageList = new PageList();
			pageList.setName("Bill Setup");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			module = null;
			pageList = null;
		}