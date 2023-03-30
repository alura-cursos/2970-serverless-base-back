#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform
    terraform -chdir=env/prod init 
    terraform -chdir=env/prod apply -auto-approve       
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt-get install terraform
    terraform -chdir=env/prod init 
    terraform -chdir=env/prod apply -auto-approve
else
    echo "Se você estiver no Windows o WSL é necessário para a execução, então por favor instale o WSL como citado no curso"
    echo "Se você estiver no MacOS e o scrip não foi executado com sucesso, basta colocar os próximos comandos em um script e executar:"
    echo "brew tap hashicorp/tap"
    echo "brew install hashicorp/tap/terraform"
    echo "terraform -chdir=env/prod init"
    echo "terraform -chdir=env/prod apply -auto-approve"
    echo "Se você estiver no Windows o WSL é necessário para a execução, então por favor instale o WSL como citado no curso"
fi
