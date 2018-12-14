#!/bin/bash
echo ""
chmod +x cleanPackgeRepository.sh
./cleanPackgeRepository.sh
echo ""

cd base
chmod +x buildAllBase.sh
./buildAllBase.sh
cd ..


cd core
chmod +x ./buildAllCore.sh
./buildAllCore.sh
cd ..

cd libraries
chmod +x ./buildAllLib.sh
./buildAllLib.sh
cd ..


cd services
chmod +x ./buildAllService.sh
./buildAllService.sh
cd ..


cd integration-tests
chmod +x ./buildAllTest.sh
./buildAllTest.sh
cd ..
