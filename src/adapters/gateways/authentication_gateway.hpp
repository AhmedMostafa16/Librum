#pragma once
#include "i_authentication_access.hpp"
#include "i_authentication_gateway.hpp"

namespace adapters::gateways
{

class AuthenticationGateway : public application::IAuthenticationGateway
{
    Q_OBJECT

public:
    AuthenticationGateway(IAuthenticationAccess* authenticationAccess);

    void authenticateUser(
        const domain::models::LoginModel& loginModel) override;
    void registerUser(
        const domain::models::RegisterModel& registerModel) override;

private:
    IAuthenticationAccess* m_authenticationAccess;
};

}  // namespace adapters::gateways