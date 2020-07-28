@echo on

set DATA_COLLECTOR_HOME=c:\ambientflix\dataCollection
set REC_ENGINE_HOME=c:\ambientflix\recEngine
set WEB_CODE_HOME=c:\ambientflix\websiteCode

echo "Gathering ambient data..."
pushd %DATA_COLLECTOR_HOME%
python dataCollection.py
popd

echo "Reving the REC ENGINE..."
pushd %REC_ENGINE_HOME%
gradlew bootRun -P%DATA_COLLECTOR_HOME%\outputFile.txt > recs.txt
popd

echo "Todo....do we need to format the recs.txt file????"

echo "Stunning web display is next..."
pushd %WEB_CODE_HOME%
start gradlew run -P%REC_ENGINE_HOME%\recs.txt
popd

echo "Launching page..."
start http://localhost:8080/recs/