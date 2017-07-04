var myapp1 = angular.module('myApp', [])
var myCtrl = myapp1.controller('myCtrl', function ($scope, $http)
{
    $scope.Register = function (register) {

        var Register = {
            flag: 'I',
            UserName: register.Username,
            Email: register.Email,
            MobileNumber: register.Mobilenumber,            
            Password: register.Password
           
         
        };

        var req = {
            method: 'POST',
            url: '/api/Appusers/SavePostRegister',
         
            
            //headers: {
            //    'Content-Type': undefined

            data: Register
    
        }
        $http(req).then(function (response) {
            alert("save successfully!!");
           
        },
        function (errres) {
            alert(errres.data);
        });

    
        $http(req).then(function (response) {

            if (response.data.length == 0) {
                $scope.registeredUseId = 0;
                alert('User name or email address or mobile already exists or could not be registered. Please contact INTERBUS administrator.')
            }
            else {
                //if the user has role, then get the details and save in session
                $localStorage.uname = response.data[0].name;
                $localStorage.userdetails = response.data;

                $scope.registeredUseId = 1;
                
                alert("Saved successfully!!. Please enter the Email verification code sent to email address to complete registration.");
                $scope.type = null;
            }

            //$scope.registeredUseId = response.data;

            //if ($scope.registeredUseId > 0) {
            //    // $scope.showDialog("Saved successfully!!<br/>. Please enter the Email verification code sent to email address to complete registration.");
            //    alert("Saved successfully!!. Please enter the Email verification code sent to email address to complete registration.");
            //    $scope.type = null;
            //    // $scope.GetWebsiteUserInfo();
            //}
            //else {
               
            //}

        }, function (errres) {
            var errdata = errres.data;
            var errmssg = "";
            $scope.registeredUseId = 0;
            errmssg = (errdata && errdata.ExceptionMessage) ? errdata.ExceptionMessage : errdata.Message;
            $scope.showDialog(errmssg);            
        });

    }

    $scope.VerifyEmailAddress = function () {

        if ($scope.emailAddrCode == null) {
            $scope.showDialog('Please enter valid verification code.');
            return;
        }

        if ($scope.userEmailAddress == null) {
            $scope.showDialog('Email Address could not be verified currently. Please re-try from user profile details. Click "OK" to navigate to user profile section.');
            return;
        }

        $http.get('/api/UserInfo/VerifyEmailAddress?emailAddress=' + $scope.userEmailAddress + '&code=' + $scope.emailAddrCode).then(function (response, req) {
            $scope.emailVerificationStatus = response.data;
            if ($scope.emailVerificationStatus == 1) {
                //$scope.showDialog('Email Address verified successfully. Click "OK" to proceed to User Profile');
                alert('Email Address verified successfully. Click "OK" to proceed to User Profile');
                window.location.href = "UserProfile.html";
                return;
            }
            else
            {
                $scope.showDialog('Email Address could not be verified.');
                return;
            }
        });
    }

$scope.showDialog = function (message) {

    var modalInstance = $uibModal.open({
        animation: $scope.animationsEnabled,
        backdrop: false,
        templateUrl: 'statusPopup.html',
        controller: 'ModalInstanceCtrl',            
        resolve: {
            mssg: function () {
                return message;
            }
        }
    });
}
});


myapp1.controller('ModalInstanceCtrl', function ($scope, $uibModalInstance, mssg) {

    $scope.mssg = mssg;
    $scope.ok = function () {
        $uibModalInstance.close('test');
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});


