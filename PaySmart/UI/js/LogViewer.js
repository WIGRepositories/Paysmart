var myapp1 = angular.module('myApp', [])


var myCtrl = myapp1.controller('myCtrl', function ($scope, $filter, $interval,$http) {

    $scope.GetFileContent = function () {
        $scope.currTime = $filter('date')(new Date(), 'MMddyyyy hh:mm:ss');
        var dt = $filter('date')(new Date(), 'MMddyyyy');
        $scope.test = '../AppLog'+dt+'.txt';       
    }    
         //var stop;
         //$scope.GetFileContent = function () {
         //    // Don't start a new fight if we are already fighting
         //    if (angular.isDefined(stop)) return;

         //    stop = $interval(function () {
         //        $scope.currTime = $filter('date')(new Date(), 'MMddyyyy hh:mm:ss');
         //        $scope.dt = $filter('date')(new Date(), 'MMddyyyy');
         //        $scope.test = '../AppLog' + $scope.dt + '.txt';
                 
         //        //$http.get($scope.test).then(function (data) {
         //        //    //use the file data here
         //        //    $scope.result = data;
         //        //}, function (err) {
         //        //    alert(err);
         //        //});

         //        //var reader = new FileReader();
         //        //reader.readAsText($scope.test);

         //    }, 2000);
         //};

         //$scope.stopRefresh = function () {
         //    if (angular.isDefined(stop)) {
         //        $interval.cancel(stop);
         //        stop = undefined;
         //    }
         //};

         ////$scope.resetFight = function () {
         ////    $scope.blood_1 = 100;
         ////    $scope.blood_2 = 120;
         ////};

         //$scope.$on('$destroy', function () {
         //    // Make sure that the interval is destroyed too
         //    $scope.stopRefresh();
         //});
    
});




