CFT :-- Cloud formation templates.
----
Defination :
------------
These are templates are used to create resources on aws cloud.

AWS CLI : 
------
1)With the help of this we can also create and manage cloud resource and implements the principles of IAC (Infrastructure as code)
2) when want to do quick actons we make use of aws cli --->aws s3 ls

IAC (Infrastructure as code) :-- It helps us to create infrastrucure.
----

Principles of IAC :--
------------------
1) It acts as middle man between user and cloud .
2)User needs to write templates in yaml/json . ( we use yaml because it supports commenting where json don't and yaml is eaisy to read as well )
3)It should be delcarative and versioned.
4)It converts templates to API calls on cloud to create resources on aws.

versioned means we can track the changes
Declarative means we need to understand what is going to create and what are the resources going to create so that we can unders it for future changes.

Example of tools supports multiple clouds :--
------------------------------------------
1)Terraform
2)Crossplane

CFT not only create resource and it supports drift detection as well where see any other changes in created infrastrucure.

Stacks :-
-------
1) we can run it by using jenkins ,CLI or stacks i.e.. CLI

Template structure :
-------------------
---
AWSTemplateFormatVersion: version date
Description:
  String
Metadata:
  template metadata
Parameters:
  set of parameters
Rules:
  set of rules
Mappings:
  set of mappings
Conditions:
  set of conditions
Transform:
  set of transforms
Resources:
  set of resources
Outputs:
  set of outputs


--------------------------------------------------------------------

AWS OFFICIAL DOCUMENT FOR CFT :-- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html
                                  https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/introduction.html

--------------------------------------------------------------------------





