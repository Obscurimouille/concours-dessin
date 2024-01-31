scp -r -i "C:\Users\obscu\Downloads\VM-ALE_key.pem" public azureuser@40.66.54.11:/tmp
ssh -i "C:\Users\obscu\Downloads\VM-ALE_key.pem" azureuser@40.66.54.11 sudo cp /tmp/public/connect_azure.php /tmp/public/connect.php
ssh -i "C:\Users\obscu\Downloads\VM-ALE_key.pem" azureuser@40.66.54.11 sudo rm /tmp/public/connect_azure.php

ssh -i "C:\Users\obscu\Downloads\VM-ALE_key.pem" azureuser@40.66.54.11 sudo rm -rf /srv/concours-dessins/*
ssh -i "C:\Users\obscu\Downloads\VM-ALE_key.pem" azureuser@40.66.54.11 sudo mv /tmp/public/* /srv/concours-dessins
ssh -i "C:\Users\obscu\Downloads\VM-ALE_key.pem" azureuser@40.66.54.11 sudo ls -la /srv/concours-dessins