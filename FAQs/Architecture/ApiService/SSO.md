# Users Authentication

## # Single Sign-on (SSO)
SSO is an authentication scheme. It enables a user to securely access multiple applications and services using a single ID. When SSO is integrated into apps like GMail, Github or Slack, it provides a pop-up widget or login page for the same set of credentials. With SSO users can access many apps without having to log in each time. \
SSO is built on a concept called federated identity and it enables sharing of identity information across trusted but independent systems. There are two common protocools for this authentication process **SAML** & **OpenID**. The implementation details are little bit different, but overall concept is similar.

**SAML** \
SAML stands for Security assertion markup language and is an XML-based open standard for exchanging identity information between services. It's commonly found in the work enviroment.

**OpenID Connect** \
OpenID Connect is a protocol that dispite the connect flow is similar to SAML, it uses JWT to share identity information between services.

### · Advantages:
Provides the end user a more flexible register or login access to the application and brings more reliability in the exchange of information trust.

### · Disadvanteges:
If the user forget its credentials in the SSO application or for other reason cannot access to the SSO services, it wont be able to do so in the application. The security check to recover its account will be unsecure by remote unless user credentials can be provided personally.

### · Security:
If the SSO has a leak on its users it will have in the application too. The reliability depends on the SSO security provider.

#### What Is Single Sign-on (SSO)? How It Works
https://www.youtube.com/watch?v=O1cRJWYF-g4