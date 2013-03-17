## What is Cloudy With A Chance Of Tests?

Cloudy With A Chance Of Tests is a pared down ant build.xml. This build.xml can be used for Continuous Integration with ColdFusion (with or without unit tests). A syntax and other specific CFML inspections will occur setting the stage for testing and other progressions in the build.xml and your code base.

Some targets in the build.xml are purposely left blank for place holders. 

The build.xml should be able to be used without any CFML code changes to your code base and only a few changes to build.properties that match your environment. 

Have fun, this is a journey not a sprint. Introduce this easy step, sit back and wait till your opportunity to do more Continuous Integration.

## Recorded Presentation, Slides, and Outline
Recorded Presentation - ???

[Recorded Presentation (15 mins)](http://cfmumbojumbo.com/cf/index.cfm/bolttalks/bolt-talk-mike-henke-cloudy-with-a-chance-of-tests/)

[Slides](http://prezi.com/ebyrqdkbnhie/cloudy-with-a-chance-of-tests/)

[Outline](https://docs.google.com/document/d/1biLTSfLfZxdwLI78Jo2lID_w-pKAqnR63csfu8mT9EA/edit)

## Installation
This build script is decoupled from the environment you can execute it in. You can use the command prompt, Eclipse IDE, or Jenkins with just a few changes to build.properties. 

1. Please unzip and add the build.xml to your source control system in your top level folder and build.properties but ignore it from your scs. 
1. Unzip and add the lib-cloudy folder with the jars at the top level of the project and to source control.
1. You will have to change some build.properties settings to match the environment it will run on.
1. To run the VarScope, QueryParam, and/or Unit/Acceptance tests, you will need to download and place them in the top level of the web server (not just the project top level). I would recommend excluding them from your source control system.

* Folder name: varscoper4 - http://varscoper.riaforge.org/
* foldername: qpscanner - http://qpscanner.riaforge.org/
* foldername: mxunit - http://mxunit.org/

##Unit and Acceptance tests
You can also add more MXUnit tests. They are define where they are run from in the testing.mxunit target. "Dummy" tests already are setup for unit testing and acceptance testing.

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