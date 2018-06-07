./gradlew dotnetCloudNativeDeveloperDistributedSystemWithCircuitBreaker \
    -PregistrationServerUrl=http://registration-pal-ec.apps.pikes.pal.pivotal.io/   \
    -PbacklogServerUrl=http://backlog-pal-ec.apps.pikes.pal.pivotal.io/   \
    -PallocationsServerUrl=http://allocations-pal-ec.apps.pikes.pal.pivotal.io/   \
    -PtimesheetsServerUrl=http://timesheets-pal-ec.apps.pikes.pal.pivotal.io/

curl -i -XPOST -H"Content-Type: application/json" localhost:8883/projects -d'{"name": "Project A", "accountId": 1}'
curl -i -XPOST -H"Content-Type: application/json" localhost:8883/projects -d'{"name": "Project B", "accountId": 1}'

curl -i -XPOST -H"Content-Type: application/json" localhost:8881/allocations/ -d'{"projectId": 3, "userId": 1, "firstDay": "2015-05-17", "lastDay": "2015-05-18"}'


dotnet add ~/workspace/pal-tracker-distributed/Applications/BacklogServer/BacklogServer.csproj reference \
    ~/workspace/pal-tracker-distributed/Components/AuthDisabler/AuthDisabler.csproj

dotnet add ~/workspace/pal-tracker-distributed/Applications/AllocationsServer/AllocationsServer.csproj reference \
    ~/workspace/pal-tracker-distributed/Components/AuthDisabler/AuthDisabler.csproj

dotnet add ~/workspace/pal-tracker-distributed/Applications/TimesheetsServer/TimesheetsServer.csproj reference \
    ~/workspace/pal-tracker-distributed/Components/AuthDisabler/AuthDisabler.csproj

dotnet add ~/workspace/pal-tracker-distributed/Applications/RegistrationServer/RegistrationServer.csproj reference \
    ~/workspace/pal-tracker-distributed/Components/AuthDisabler/AuthDisabler.csproj
