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
  * **slackurl:** URL para envío de notificaciones a slack
  * **slackch:** Canal al que enviamos la notificación.

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
                    --slackurl https://slacl.url/hash \
                    --slackch micanal \
                    --dominio example.com \
                    --dominio example.org \
                    --dominio example.es
```
## Crear el contenedor

Para poder crear la imagen es necesario descargar el scirpt de envío de mensajes a slack de [Kirby Rs](https://github.com/andkirby) que se puede encontrar en [este gist](https://gist.github.com/andkirby/67a774513215d7ba06384186dd441d9e) y guardarlo en la raíz del proyecto con el nombre slack.

Una vez hecho esto, podemos crear la imagen de docker con docker build como haríamos habitualmente.