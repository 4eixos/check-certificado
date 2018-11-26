# Validador de caducidad de certificados

Comprobación de caducidad de certificados y notificación de caducidad vía e-mail Amazon SES


## Parámetros

  * **dias:** Numero de días para avisar de caducidad de dominio. Parámetro opcional, por defecto 20 dias.
  * **usuario:** Usuario de Amazon SES (obligatorio).
  * **clave:** Password para Amazon SES (obligatorio).
  * **region:** Región de Amazon SES a utilizar. Por defecto _eu-west-1_.
  * **remitente:** Quien envía el correo (obligatorio). Debe ser de un dominio valido para la cuenta de Amazon SES.
  * **destino:** A quien se envía el correo (obligatorio). Puede repetirse para usar múltiples destinatarios.
  * **dominio:** Dominio al que se le comprueba el certificado (obligatorio). Puede repetirse para especificar múltiples dominios.

## Uso

Los parámetros se pasaran al Docker como si se estuviera ejecutando el comando de comprobación de certificados
```
docker run --rm -ti 4eixos/check-certificado \
                    --dias 20 \
                    --usuario usuarioSES \
                    --clave claveSES \
                    --region eu-west-1 \
                    --remitente mail@example.com \
                    --destino mail2@example.com \
                    --dominio example.com \
                    --dominio example.org \
                    --dominio example.es
```
