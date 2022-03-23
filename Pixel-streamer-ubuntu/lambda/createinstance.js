var userData= `#!/bin/bash 
    echo "Hello World"
    touch /tmp/hello.txt
    `

var userDataEncoded = new Buffer(userData).toString('base64');

var paramsEC2 = {
    ImageId: 'ami-28c90151',
    InstanceType: 't1.micro',
    KeyName: 'AWSKey3',
    MinCount: 1,
    MaxCount: 1,
    SecurityGroups: [groupname],
    UserData: userDataEncoded
};

ec2.runInstances(paramsEC2, function(err, data) {
   if (err) {
      console.log("Could not create instance", err);
      return;
   }
   var instanceId = data.Instances[0].InstanceId;
   console.log("Created instance", instanceId);
   // Add tags to the instance
   params = {Resources: [instanceId], Tags: [
      {
         Key: 'Name',
         Value: 'taggggg'
      }
   ]};
   ec2.createTags(params, function(err) {
      console.log("Tagging instance", err ? "failure" : "success");
   });
});