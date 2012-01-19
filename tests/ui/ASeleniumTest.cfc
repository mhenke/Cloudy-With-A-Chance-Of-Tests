component extends="cfselenium.CFSeleniumTestCase"
{
	
	function beforeTests(){
		browserUrl = "http://www.google.com/";
		browserCommand = "*googlechrome";
		super.beforeTests();// If you *need* your own beforeTests(), you *must* call super to start selenium
	}
	
	function afterTests(){
		super.afterTests();//same with afterTests
	}
	
	function sanity(){}
	
	function search_google_for_cfselenium_should_have_cfselenium_in_results(){
		selenium.open("http://www.google.com");
		debug(selenium.getHtmlSource());
		
		selenium.type("q", "cfselenium");
		sleep(1000);//because when you do this, google will automatically submit the form! No need to click
		
		assertTrue( selenium.isTextPresent("CFSelenium") );
	}
	
	function search_google_for_selenium_page_object_pattern_when_you_get_serious_about_selenium(){
		selenium.open("http://www.google.com");
		debug(selenium.getHtmlSource());
		
		selenium.type("q", "selenium page object design pattern");
		sleep(1000);//because when you do this, google will automatically submit the form! No need to click
		
		assertTrue( selenium.isTextPresent("PageObjects") );
	}
}