SURNAME="ermolinskayaaa"

echo "Сборка Docker образа..."
docker build -t practice104-$SURNAME .

echo -e "\nЗапуск контейнера..."
docker run --name container-$SURNAME practice104-$SURNAME

echo -e "\nКопирование результатов..."
docker cp container-$SURNAME:/root/${SURNAME}.txt ./${SURNAME}.txt 2>/dev/null
docker cp container-$SURNAME:/home/test.txt ./test.txt 2>/dev/null

echo -e "\nУдаление контейнера..."
docker rm container-$SURNAME

echo -e "\nРезультаты сохранены в текущей папке."
ls -la ${SURNAME}.txt test.txt