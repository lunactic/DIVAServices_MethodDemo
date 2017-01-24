inputImage=$1
resultFile=$2

kraken -i $inputImage binary.png binarize
content="$(base64 binary.png)"

#Save the correct JSON output into $resultFile according to the json that will be shown in the lecture
echo -e "{\"output\":[ { \"file\": { \"mime-type\": \"image/png\", \"name\":\"krakenBinaryImage\", \"options\":{ \"type\":\"bw\", \"visualization\":true }, \"content\": \""$content"\" } } ]}" > $resultFile
