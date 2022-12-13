#!/usr/bin/env bash

#restore
dotnet restore src/Hello.Lambda.DotNet/Hello.Lambda.DotNet.csproj  
dotnet restore test/Hello.Lambda.DotNet.Tests/Hello.Lambda.DotNet.Tests.csproj  
  
#build
pushd src/Hello.Lambda.DotNet && dotnet build && popd || exit
  
#test
pushd test/Hello.Lambda.DotNet.Tests && dotnet test && popd || exit
  
#publish
pushd src/Hello.Lambda.DotNet && \
    dotnet publish -c Release -o publish -r linux-x64 -f net6.0 && \
    popd || exit

zip -r lambda.zip src/Hello.Lambda.DotNet/publish