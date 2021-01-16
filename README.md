FORMAT: 1A

# 電子決済API

# Group Users

## ログイン [/login]

### トークン取得 [POST]

+ Request (application/json)
  + Body
    ```json
    {
      "email": "example@example.com",
      "password": "P4ssw0rd"
    }
    ```

+ Responce 200 (application/json)
  + Body
    ```json
    {
      "token": "Base64"
    }
    ```

+ Responce 400 (application/json)
  + Body
    ```json
    {
      "error": "Invalid format"
    }
    ```

+ Responce 401 (application/json)
  + Body
    ```json
    {
      "error": "Email or password is wrong."
    }
    ```

## ログアウト [/logout]

### トークン破棄 [DELETE]

+ Request
  + Headers
    ```text
    Authorization: Token xxxx
    ```

+ Responce 204

+ Responce 401 (application/json)
  + Body
    ```json
    {
      "error": "Invalid token"
    }
    ```

## 口座オブジェクト [/wallet]

### データ取得 [GET]

+ Request
  + Headers
    ```text
    Authorization: Token xxxx
    ```

+ Responce 200 (application/json)
  + Body
    ```json
    {
      "balance": 0
    }
    ```

+ Responce 401 (application/json)
  + Body
    ```json
    {
      "error": "Invalid token"
    }
    ```

## 支払いトークン [/payment_token]

### トークン取得 [GET]

+ Request
  + Headers
    ```text
    Authorization: Token xxxx
    ```

+ Responce 200 (application/json)
  + Body
    ```json
    {
      "token": "Base64"
    }
    ```

+ Responce 401 (application/json)
  + Body
    ```json
    {
      "error": "Invalid token"
    }
    ```

# Group Process

## チャージ [/refills]

### チャージ [POST]

+ Request (application/json)
  + Headers
    ```text
    Authorization: Token xxxx
    ```
  + Body
     ```json
    {
      "amount": 0
    }
    ```

+ Responce 204

+ Responce 400 (application/json)
  + Body
    ```json
    {
      "error": "Invalid format"
    }
    ```

+ Responce 400 (application/json)
  + Body
    ```json
    {
      "error": "Error Message"
    }
    ```

+ Responce 401 (application/json)
  + Body
    ```json
    {
      "error": "Invalid token"
    }
    ```

## 支払い [/payments]

### 支払データ作成 [POST]

+ Request (application/json)
  + Body
     ```json
    {
      "amount": 0
    }
    ```

+ Responce 204

+ Responce 400 (application/json)
  + Body
    ```json
    {
      "error": "Invalid format"
    }
    ```

+ Responce 400 (application/json)
  + Body
    ```json
    {
      "error": "Error Message"
    }
    ```
