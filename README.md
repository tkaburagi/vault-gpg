## setup
```shell
git clone https://github.com/LeSuisse/vault-gpg-plugin
vault server -dev -dev-root-token-id=root -dev-plugin-dir=./plugin
vault secrets enable -path=gpg gpg-plugin
vault write -force gpg/keys/gpg-key-tf real_name=se_tkabu
vault read -format json gpg/keys/gpg-key-tf | jq -r '.data.public_key' > pubkey
gpg --dearmor pubkey
export TF_VAR_demo_user_gpg_key=$(cat pubkey.gpg | openssl base64)
```


## Apply
```shell
t apply -auto-approve
```

## Decrypt
```shell
CTEXT=(Encrypted Secret Key from OUTPUT)
vault write gpg/decrypt/gpg-key-tf ciphertext=${CTEXT}
```