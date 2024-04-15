# My Keycloak Setup

Here I'm describing my Keycloak setup for this Project.

I have installed Keycloak v24.0.2 locally on the LAB-Machine.
I Installed it with these Instructions: ``\\172.17.0.10\öffentlich\22E\M295\DemoApp\4. Setup Keycloak.pdf``

But I configured following Values:

|||
|------------------------|---|
| REALM Name             | ``Module295-REALM`` |
| Client ID              | ``ch.kunz.joshua.flugbuchungsapi`` |
| Role 1                 | ``ROLE_user`` |
| Role 2                 | ``ROLE_staff`` |
| Role 3                 | ``ROLE_admin`` |
| User 1 Name            | ``user`` |
| User 1 Permissions     | ``ROLE_user`` |
| User 1 Password        | ``user`` |
| User 2 Name            | ``staff`` |
| User 2 Permissions     | ``ROLE_staff`` |
| User 2 Password        | ``staff`` |
| User 3 Name            | ``admin`` |
| User 3 Permissions     | ``ROLE_admin`` |
| User 3 Password        | ``admin`` |
| REALM Token lifespan   | ``5 Days`` |

