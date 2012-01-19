component extends="mxunit.framework.TestCase"{

	function beforeTests(){
		//will run before any tests run
	}
	
	function afterTests(){
		//will run after all tests run
	}
	
	function setUp(){
		//will run before each test
	}
	
	function tearDown(){
		//will run after each test
	}
	
	function check_out_coldfusion_koans_to_learn_about_coldfusion_and_testing(){
		debug("https://github.com/bittersweetryan/ColdFusion-Koans");
	}
	
	function how_to_configure_the_mxunit_eclipse_plugin(){
		debug("
			In Eclipse, highlight the 'cloudy...' project
			
			right click, select 'properties'
			
			select 'mxunit'
			
			in the 'RemoteFacade URL' field, add 'http://localhost/cloudy-with-a-chance-of-tests/tests/RemoteFacade.cfc'
			
			   -- or whatever your server and path is
			   
			hit 'ok'
			
			Then, right click the 'tests' folder, or any individual test (or select multiple tests)
			
			Select 'Run MXUnit Tests'
			
			Or hit 'Ctrl+Enter' on the keyboard
		");
	}
	
	function this_thing_should_work(){
		assertTrue( true , "should have been true but was not" );
		assertEquals( 1, 1, "should have been equal but was not" );
	}
	
	function this_will_fail_uh_oh(){
		var fish = ["tuna", "salmon", "trout", "magpied huckleberry"];
		var littlerFish = ["toona", "goldie", "squid", "whos-roe-daddy"];
		
		/*you can compare complex data; 
			if you're running this in Eclipse, select the test in the test tree and hit the "b" key for a visual representation of diffs
			
			then, hit the "compare" icon in the middle right of the plugin for a "diff" tool 
		
		*/
		assertEquals( fish, littlerFish );
	}
	

}