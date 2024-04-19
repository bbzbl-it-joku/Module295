# JWT Token with Keycloak

How to get a Token from Keycloak with Postman.

1. Open Postman
2. Change **HTTP METHOD to** ``POST``
3. Add URL ``http://localhost:8080/realms/Module295-REALM/protocol/openid-connect/token``
4. Change **Body Type** to ``x-www-form-urlencoded``
5. Add **Body** 
```
   client_id:ch.kunz.joshua.flugbuchungsapi
   grant_type:password
   scope:openid profile roles offline_access
   username:{user/staff/admin}
   password:{user/staff/admin}
```