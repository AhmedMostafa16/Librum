#pragma once
#include <QObject>
#include "i_authentication_service.hpp"
#include "i_user_gateway.hpp"


namespace application::services
{

class AuthenticationService : public IAuthenticationService
{
    Q_OBJECT
    
public:
    AuthenticationService(IUserGateway* userGateway);
    
    bool authenticateUser(domain::models::LoginModel loginModel) override;
    
private slots:
    void processResult(QString token);
    
private:
    IUserGateway* m_userGateway;
};

} // namespace application::services