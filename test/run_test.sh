docker build -t tb_crypto_test_image -f ./Dockerfile ..
docker run --rm --name tb_crypto_test tb_crypto_test_image
#docker image rm tb_crypto_test_image
