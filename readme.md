## What is Cloudy With A Chance Of Tests?

Cloudy With A Chance Of Tests is a pared down ant build.xml. This build.xml can be used for Continuous Integration with ColdFusion (with or without unit tests). A syntax and other specific CFML inspections will occur setting the stage for testing and other progressions in the build.xml and your code base.

Some targets in the build.xml are purposely left blank for place holders. 

The build.xml should be able to be used without any CFML code changes to your code base and only a few changes to build.properties that match your environment. 

Have fun, this is a journey not a sprint. Introduce this easy step, sit back and wait till your opportunity to do more Continuous Integration.

## Recorded Presentation, Slides, and Outline

Recorded Presentation - ???

Slides - http://prezi.com/ebyrqdkbnhie/cloudy-with-a-chance-of-tests/

Outline - https://docs.google.com/document/d/1biLTSfLfZxdwLI78Jo2lID_w-pKAqnR63csfu8mT9EA/edit

## Installation

This build script is decoupled from the environment you can execute it in. You can use the command prompt, Eclipse IDE, or Jenkins with just a few changes to build.properties. 

1) Please add the build.xml to your source control system in your top level folder and build.properties but ignore it from your scs. 

2) You will have to change some build.properties settings to match the environment it will run on.

3) Add the lib folder with the jars at the top level of the project. 

4) To run the VarScope and QueryParam, you will need to download and place them in the top level of the web server (not just the project top level). I would recommend excluding them from your source control system.

* http://varscoper.riaforge.org/

* http://qpscanner.riaforge.org/


##Properties
With Ant files you can define properties in the build.xml file itself. Of course, you can then define them in your build.properties file, but this means you have to check in things like passwords and what have you into your repository which is far from ideal. 
In the article http://www.javaranch.com/build_properties.jsp you can see that there is yet another way. This is by adding a file in your home directory called [projectname].properties that will overwrite the settings, thus allowing you to have per user properties. 

We have included this as part of this build template for you. Look in the init target for a bit more details. 

You should also add entries for new properties you are defining so that the build will fail if it is not defined properly now iwht a good message. 

##MXUnit
You can also add MXUnit tests and define where they are run from in the testing.mxunit target. 

##Database deployments
	TODO:Write Description of the sql/create and sql/update folders (hint: add sequentially named files to be run in order, like 0001.sql and 0002.sql)


## License

This is licensed under [Creative CommonsAttribution-Noncommercial-Share Alike 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/us/) except for third party software which retains their licenses. 

## Contributors / Originators

Please add yourself if you help:

* @denstar

* @vitrix

* @lmajano

* @markdrew

## Git Workflow for Contributors

This project uses the excellent [Git Workflow series](http://www.silverwareconsulting.com/index.cfm/Git-Workflow) by [Bob Silverburg](https://github.com/bobsilverberg/) for contributions.