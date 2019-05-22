$scope.downLoadJson = function () {
          //ファイルを作ってダウンロードします。
          var resultJson = JSON.stringify($scope.jsonObj);
          var downLoadLink = document.createElement("a");
          downLoadLink.download = $scope.fileName;
          downLoadLink.href = URL.createObjectURL(new Blob([resultJson], {type: "text.plain"}));
          downLoadLink.dataset.downloadurl = ["text/plain", downLoadLink.download, downLoadLink.href].join(":");
          downLoadLink.click();
      }
