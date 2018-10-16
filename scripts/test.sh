#! /bin/bash

output=$(nc -z localhost 8545; echo $?)
[ $output -eq "0" ] && trpc_running=true
if [ ! $trpc_running ]; then
  echo "Starting our own ganache-cli node instance"
  ganache-cli --account="0xe8280389ca1303a2712a874707fdd5d8ae0437fab9918f845d26fd9919af5a92,1000000000000000000000000000000000000" \
    --account="0xed095a912033d26dc444d2675b33414f0561af170d58c33f394db8812c87a764,1000000000000000000000000000000000000" \
    --account="0xf5556ca108835f04cd7d29b4ac66f139dc12b61396b147674631ce25e6e80b9b,1000000000000000000000000000000000000" \
    --account="0xd1bea55dd05b35be047e409617bc6010b0363f22893b871ceef2adf8e97b9eb9,1000000000000000000000000000000000000" \
    --account="0xfc452929dc8ffd956ebab936ed0f56d71a8c537b0393ea9da4807836942045c5,1000000000000000000000000000000000000" \
    --account="0x12b8b2fe49596ab7f439d324797f4b5457b5bd34e9860b08828e4b01af228d93,1000000000000000000000000000000000000" \
    --account="0x2ed88e3846387d0ae4cca96637df48c201c86079be64d0a17bf492058db6c6eb,1000000000000000000000000000000000000" \
    --account="0x8c6690649d0b31790fceddd6a59decf2b03686bed940a9b85e8105c5e82f7a86,1000000000000000000000000000000000000" \
    --account="0xf809d1a2969bec37e7c14628717092befa82156fb2ebf935ac5420bc522f0d29,1000000000000000000000000000000000000" \
    --account="0x38062255973f02f1b320d8c7762dd286946b3e366f73076995dc859a6346c2ec,1000000000000000000000000000000000000" \
    --account="0x35b5042e809eab0db3252bad02b67436f64453072128ee91c1d4605de70b27c1,1000000000000000000000000000000000000" \
    --account="0x69b8055895f7059b86517079b429167444031cc39d71a3afce81835cd807beca,1000000000000000000000000000000000000" \
    --account="0xca60b17dbce9ffa0ebcb4fa72e41f64f3699c590d4ea4333bdec661ffea013b2,1000000000000000000000000000000000000" \
    --account="0x107be95a222ba79b68dc02f319caab6e20bca80c88529732463582db66638f96,1000000000000000000000000000000000000" \
    --account="0x30788582fa82810ea9ab7b30d6a497d2193634003a139748869d283ecce1272e,1000000000000000000000000000000000000" \
    --account="0xa4b9711b310f3dc1647ac6db3853fd601d24a422424229f56623dda3e2e6b32f,1000000000000000000000000000000000000" \
    --account="0xc65cd848b05e7f336288f1f50a108ea47f7197b72737c2c67609b52c233033a4,1000000000000000000000000000000000000" \
    --account="0xc40032de5f67a5562f2e7baec6d9fb4f21d9373c37ff5be7fafb48955909359b,1000000000000000000000000000000000000" \
    --account="0xc3456f541f4d52dda9a6aecd60572eb50c2d452c28f4122f9f238006e28ceebf,1000000000000000000000000000000000000" \
    --account="0x0259c4189c62d020cb9b783fb71c96575d339b7d9eeb461ab7f4d6e896f1ec3c,1000000000000000000000000000000000000" \
    --account="0x99bbcadf454ce57a55a6bbfcc02e10ba6b556e1487d9af1ff401c93170bfb666,1000000000000000000000000000000000000" \
    -l 6000000 \
    > /dev/null &
  trpc_pid=$!
fi

./node_modules/.bin/truffle compile
./node_modules/.bin/truffle test $1
test_result=$?

if [ ! $trpc_running ]; then
  kill -9 $trpc_pid
fi

# exit with the result from the tests
exit $test_result
