function [FBC,GBC]=linboundaryconditions(W,Wfx,Wfy)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                            %
%       DEFINE FLUXES                                        %
%                                                            %
%       1. Supersonic outflow                                %
%       2. Supersonic inflow                                 %
%       3. Subsonic outflow                                  %
%       4. Subsonic inflow                                   %
%       5. Solid wall                                        %
%                                                            %
%       l=left                                               %
%       r=right                                              %
%       a=above                                              %
%       b=below                                              %
%                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global NX NY
global gamma1 gamma2

%      l r a b
%BC = [1,1,1,1]
BC_L = 0;     % Left boundary
BC_R = 0;     % right boundary
BC_A = 5;     % above boundary
BC_B = 5;     % below boundary

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      NO BOUNDARY                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Left Boundary
if BC_L==0
    FBC(:,1,1) = W(:,1,3).*W(:,1,4);
    FBC(:,1,2) = W(:,1,3).*W(:,1,4).^2+W(:,1,6);
    FBC(:,1,3) = W(:,1,3).*W(:,1,4).*W(:,1,5);
    FBC(:,1,4) = (W(:,1,8)/(gamma1-1)+(1-W(:,1,8))/(gamma2-1)+1).*W(:,1,4).*W(:,1,6)+0.5*W(:,1,3).*W(:,1,4).*(W(:,1,4).^2+W(:,1,5).^2);
    FBC(:,1,5) = W(:,1,7).*W(:,1,3).*W(:,1,4);
    FBC(:,1,6) = gamma1/(gamma1-1)*W(:,1,4).*W(:,1,6).*W(:,1,8)+1/2*W(:,1,3).*W(:,1,4).*(W(:,1,4).^2+W(:,1,5).^2).*W(:,1,8);
    
    
end

%Right Boundary
if BC_R==0
    FBC(:,NX+1,1) = W(:,NX,3).*W(:,NX,4);
    FBC(:,NX+1,2) = W(:,NX,3).*W(:,NX,4).^2+W(:,NX,6);
    FBC(:,NX+1,3) = W(:,NX,3).*W(:,NX,4).*W(:,NX,5);
    FBC(:,NX+1,4) = (W(:,NX,8)/(gamma1-1)+(1-W(:,NX,8))/(gamma2-1)+1).*W(:,NX,4).*W(:,NX,6)+0.5*W(:,NX,3).*W(:,NX,4).*(W(:,NX,4).^2+W(:,NX,5).^2);
    FBC(:,NX+1,5) = W(:,NX,7).*W(:,NX,3).*W(:,NX,4);
    FBC(:,NX+1,6) = gamma1/(gamma1-1).*W(:,NX,4).*W(:,NX,6).*W(:,NX,8)+1/2*W(:,NX,3).*W(:,NX,4).*(W(:,NX,4).^2+W(:,NX,5).^2).*W(:,NX,8);
end

%Upper Boundary
if BC_A==0 
    GBC(1,:,1) = W(1,:,3).*W(1,:,5);
    GBC(1,:,2) = W(1,:,3).*W(1,:,5).*W(1,:,4);
    GBC(1,:,3) = W(1,:,3).*W(1,:,5).^2+W(1,:,6);
    GBC(1,:,4) = (W(1,:,8)/(gamma1-1)+(1-W(1,:,8))/(gamma2-1)+1).*W(1,:,5).*W(1,:,6)+0.5*W(1,:,3).*W(1,:,5).*(W(1,:,4).^2+W(1,:,5).^2);
    GBC(1,:,5) = W(1,:,7).*W(1,:,3).*W(1,:,5);
    GBC(1,:,6) = gamma1/(gamma1-1)*W(1,:,5).*W(1,:,6).*W(1,:,8)+1/2*W(1,:,3).*W(1,:,5).*(W(1,:,4).^2+W(1,:,5).^2).*W(1,:,8);
end

%Lower Boundary
if BC_B==0
    GBC(NY+1,:,1) = W(NY,:,3).*W(NY,:,5);
    GBC(NY+1,:,2) = W(NY,:,3).*W(NY,:,5).*W(NY,:,4);
    GBC(NY+1,:,3) = W(NY,:,3).*W(NY,:,5).^2+W(NY,:,6);
    GBC(NY+1,:,4) = (W(NY,:,8)/(gamma1-1)+(1-W(NY,:,8))/(gamma2-1)+1).*W(NY,:,5).*W(NY,:,6)+0.5*W(NY,:,3).*W(NY,:,5).*(W(NY,:,4).^2+W(NY,:,5).^2);
    GBC(NY+1,:,5) = W(NY,:,7).*W(NY,:,3).*W(NY,:,5);
    GBC(NY+1,:,6) = gamma1/(gamma1-1)*W(NY,:,5).*W(NY,:,6).*W(NY,:,8)+1/2*W(NY,:,3).*W(NY,:,5).*(W(NY,:,4).^2+W(NY,:,5).^2).*W(NY,:,8);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      Supersonic outflow                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Left Boundary
if (BC_L==1) 
    FBC(:,1,1) = Wfx(:,1,3).*Wfx(:,1,4);
    FBC(:,1,2) = Wfx(:,1,3).*Wfx(:,1,4).^2+Wfx(:,1,6);
    FBC(:,1,3) = Wfx(:,1,3).*Wfx(:,1,4).*Wfx(:,1,5);
    FBC(:,1,4) = (Wfx(:,1,8)/(gamma1-1)+(1-Wfx(:,1,8))/(gamma2-1)+1).*Wfx(:,1,4).*Wfx(:,1,6)+0.5*Wfx(:,1,3).*Wfx(:,1,4).*(Wfx(:,1,4).^2+Wfx(:,1,5).^2);
    FBC(:,1,5) = Wfx(:,1,7).*Wfx(:,1,3).*Wfx(:,1,4);
    FBC(:,1,6) = gamma1/(gamma1-1)*Wfx(:,1,4).*Wfx(:,1,6).*Wfx(:,1,8)+1/2*Wfx(:,1,3).*Wfx(:,1,4).*(Wfx(:,1,4).^2+Wfx(:,1,5).^2).*Wfx(:,1,8);
end

%Right Boundary
if (BC_R==1) 
    FBC(:,NX+1,1) = Wfx(:,2*NX,3).*Wfx(:,2*NX,4);
    FBC(:,NX+1,2) = Wfx(:,2*NX,3).*Wfx(:,2*NX,4).^2+Wfx(:,2*NX,6);
    FBC(:,NX+1,3) = Wfx(:,2*NX,3).*Wfx(:,2*NX,4).*Wfx(:,2*NX,5);
    FBC(:,NX+1,4) = (Wfx(:,2*NX,8)/(gamma1-1)+(1-Wfx(:,2*NX,8))/(gamma2-1)+1)*Wfx(:,2*NX,4).*Wfx(:,2*NX,6)+0.5*Wfx(:,2*NX,3).*Wfx(:,2*NX,4).*(Wfx(:,2*NX,4).^2+Wfx(:,2*NX,5).^2);
    FBC(:,NX+1,5) = Wfx(:,2*NX,7).*Wfx(:,2*NX,3).*Wfx(:,2*NX,4);
    FBC(:,NX+1,6) = gamma1/(gamma1-1)*Wfx(:,2*NX,4).*Wfx(:,2*NX,6).*Wfx(:,2*NX,8)+1/2*Wfx(:,2*NX,3).*Wfx(:,2*NX,4).*(Wfx(:,2*NX,4).^2+Wfx(:,2*NX,5).^2).*Wfx(:,2*NX,8);
end

%Upper Boundary
if (BC_A==1) 
    GBC(1,:,1) = Wfy(1,:,3).*Wfy(1,:,5);
    GBC(1,:,2) = Wfy(1,:,3).*Wfy(1,:,5).*Wfy(1,:,4);
    GBC(1,:,3) = Wfy(1,:,3).*Wfy(1,:,5).^2+Wfy(1,:,6);
    GBC(1,:,4) = (Wfy(1,:,8)/(gamma1-1)+(1-Wfy(1,:,8))/(gamma2-1)+1).*Wfy(1,:,5).*Wfy(1,:,6)+0.5*Wfy(1,:,3).*Wfy(1,:,5).*(Wfy(1,:,4).^2+Wfy(1,:,5).^2);
    GBC(1,:,5) = Wfy(1,:,7)*Wfy(1,:,3)*Wfy(1,:,5);
    GBC(1,:,6) = gamma1/(gamma1-1)*Wfy(1,:,5).*Wfy(1,:,6).*Wfy(1,:,8)+1/2*Wfy(1,:,3).*Wfy(1,:,5).*(Wfy(1,:,4).^2+Wfy(1,:,5).^2).*Wfy(1,:,8);
end

%Lower Boundary
if (BC_B==1) 
    GBC(NY+1,:,1) = Wfy(2*NY,:,3).*Wfy(2*NY,:,5);
    GBC(NY+1,:,2) = Wfy(2*NY,:,3).*Wfy(2*NY,:,5).*Wfy(2*NY,:,4);
    GBC(NY+1,:,3) = Wfy(2*NY,:,3).*Wfy(2*NY,:,5).^2+Wfy(2*NY,:,6);
    GBC(NY+1,:,4) = (Wfy(2*NY,:,8)/(gamma1-1)+(1-Wfy(2*NY,:,8))/(gamma2-1)+1).*Wfy(2*NY,:,5).*Wfy(2*NY,:,6)+0.5*Wfy(2*NY,:,3).*Wfy(2*NY,:,5).*(Wfy(2*NY,:,4).^2+Wfy(2*NY,:,5).^2);
    GBC(NY+1,:,5) = Wfy(2*NY,:,7).*Wfy(2*NY,:,3).*Wfy(2*NY,:,5);
    GBC(NY+1,:,6) = gamma1/(gamma1-1)*Wfy(2*NY,:,5).*Wfy(2*NY,:,6).*Wfy(2*NY,:,8)+1/2*Wfy(2*NY,:,3).*Wfy(2*NY,:,5).*(Wfy(2*NY,:,4).^2+Wfy(2*NY,:,5).^2).*Wfy(2*NY,:,8);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      Supersonic inflow                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rho   = 1.92691;
u     = -0.33361;
v     = 0;
p     = 1.56980;
beta  = 1;
alpha = 1;

%Left Boundary
if BC_L==2
    FBC(:,1,1) = rho*u;
    FBC(:,1,2) = rho*u^2+p;
    FBC(:,1,3) = rho*u*v;
    FBC(:,1,4) = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*u*p+0.5*rho*u*(u^2+v^2);
    FBC(:,1,5) = beta*rho*u;
    FBC(:,1,6) = gamma1/(gamma1-1)*u*p*alpha+1/2*rho*u*(u^2+v^2)*beta;
end

%Right Boundary
if BC_R==2
    FBC(:,NX+1,1) = rho*u;
    FBC(:,NX+1,2) = rho*u^2+p;
    FBC(:,NX+1,3) = rho*u*v;
    FBC(:,NX+1,4) = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*u*p+0.5*rho*u*(u^2+v^2);
    FBC(:,NX+1,5) = beta*rho*u;
    FBC(:,NX+1,6) = gamma1/(gamma1-1)*u*p*alpha+1/2*rho*u*(u^2+v^2)*beta;
end

%Upper Boundary
if (BC_A==2) 
    GBC(1,:,1)  = rho*v;
    GBC(1,:,2)  = rho*v*u;
    GBC(1,:,3)  = rho*v^2+p;
    GBC(1,:,4)  = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*v*p+0.5*rho*v*(u^2+v^2);
    GBC(1,:,5)  = beta*rho*v;
    GBC(1,:,6)  = gamma1/(gamma1-1)*v*p*alpha+1/2*rho*v*(u^2+v^2)*beta;
end

%Lower Boundary
if (BC_B==2) 
    GBC(NY+1,:,1)  = rho*v;
    GBC(NY+1,:,2)  = rho*v*u;
    GBC(NY+1,:,3)  = rho*v^2+p;
    GBC(NY+1,:,4)  = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*v*p+0.5*rho*v*(u^2+v^2);
    GBC(NY+1,:,5)  = beta*rho*v;
    GBC(NY+1,:,6)  = gamma1/(gamma1-1)*v*p*alpha+1/2*rho*v*(u^2+v^2)*beta;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      Subsonic outflow                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pflux = 1;

%Left Boundary
if BC_L==3
    for i=1:NY
        rho   = Wfx(i,1,3);
        u     = Wfx(i,1,4);
        v     = Wfx(i,1,5);
        p     = Wfx(i,1,6);
        beta  = Wfx(i,1,7);
        alpha = Wfx(i,1,8);

        NRK4 = 500;

        dpr   = (pflux - p)/NRK4;

        for k=1:NRK4
%             CALL RK4_k1_R_ux(rho,p,alpha,gamma1,gamma2,dpr,u_k1,rho_k1,alpha_k1)
%             CALL RK4_k2_R_ux(rho,p,alpha,rho_k1,p_k1,alpha_k1,gamma1,gamma2,dpr,u_k2,rho_k2,alpha_k2)
%             CALL RK4_k3_R_ux(rho,p,alpha,rho_k2,p_k2,alpha_k2,gamma1,gamma2,dpr,u_k3,rho_k3,alpha_k3)
%             CALL RK4_k4_R_ux(rho,p,alpha,rho_k3,p_k3,alpha_k3,gamma1,gamma2,dpr,u_k4,rho_k4,alpha_k4)
            u = u + (u_k1 + 2*u_k2 + 2*u_k3 + u_k4)/6;
            rho = rho + (rho_k1 + 2*rho_k2 + 2*rho_k3 + rho_k4)/6;
            alpha = alpha + (alpha_k1 + 2*alpha_k2 + 2*alpha_k3 + alpha_k4)/6;
        end

        p = pflux;

        FBC(i,1,1) = rho*u;
        FBC(i,1,2) = rho*u^2+p;
        FBC(i,1,3) = rho*u*v;
        FBC(i,1,4) = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*u*p+0.5*rho*u*(u^2+v^2);
        FBC(i,1,5) = beta*rho*u;
        FBC(i,1,6) = gamma1/(gamma1-1)*u*p*alpha+1/2*rho*u*(u^2+v^2)*beta;
    end
end
   
%Right Boundary
if BC_R==3
    for i=1:NY
        rho   = Wfx(i,2*NX,3);
        u     = Wfx(i,2*NX,4);
        v     = Wfx(i,2*NX,5);
        p     = Wfx(i,2*NX,6);
        beta  = Wfx(i,2*NX,7);
        alpha = Wfx(i,2*NX,8);

        NRK4 = 500;

        dpl   = (pflux - p)/NRK4;

        for k=1:NRK4
        %     CALL RK4_k1_L_ux(rho,p,alpha,gamma1,gamma2,dpl,u_k1,rho_k1,alpha_k1)
        %     CALL RK4_k2_L_ux(rho,p,alpha,rho_k1,p_k1,alpha_k1,gamma1,gamma2,dpl,u_k2,rho_k2,alpha_k2)
        %     CALL RK4_k3_L_ux(rho,p,alpha,rho_k2,p_k2,alpha_k2,gamma1,gamma2,dpl,u_k3,rho_k3,alpha_k3)
        %     CALL RK4_k4_L_ux(rho,p,alpha,rho_k3,p_k3,alpha_k3,gamma1,gamma2,dpl,u_k4,rho_k4,alpha_k4)
            u = u + (u_k1 + 2*u_k2 + 2*u_k3 + u_k4)/6;
            rho = rho + (rho_k1 + 2*rho_k2 + 2*rho_k3 + rho_k4)/6;
            alpha = alpha + (alpha_k1 + 2*alpha_k2 + 2*alpha_k3 + alpha_k4)/6;
        end

        p = pflux;

        FBC(i,NX+1,1) = rho*u;
        FBC(i,NX+1,2) = rho*u^2+p;
        FBC(i,NX+1,3) = rho*u*v;
        FBC(i,NX+1,4) = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*u*p+0.5*rho*u*(u^2+v^2);
        FBC(i,NX+1,5) = beta*rho*u;
        FBC(i,NX+1,6) = gamma1/(gamma1-1)*u*p*alpha+1/2*rho*u*(u^2+v^2)*beta;
    end
end
          
%Upper Boundary
if (BC_A==3) 
    for j=1:NX
    rho   = Wfy(1,j,3);
    u     = Wfy(1,j,4);
    v     = Wfy(1,j,5);
    p     = Wfy(1,j,6);
    beta  = Wfy(1,j,7);
    alpha = Wfy(1,j,8);

    NRK4 = 500;

    dpr   = (pflux - p)/NRK4;

    for k=1:NRK4
%         CALL RK4_k1_R_vy(rho,p,alpha,gamma1,gamma2,dpr,v_k1,rho_k1,alpha_k1)
%         CALL RK4_k2_R_vy(rho,p,alpha,rho_k1,p_k1,alpha_k1,gamma1,gamma2,dpr,v_k2,rho_k2,alpha_k2)
%         CALL RK4_k3_R_vy(rho,p,alpha,rho_k2,p_k2,alpha_k2,gamma1,gamma2,dpr,v_k3,rho_k3,alpha_k3)
%         CALL RK4_k4_R_vy(rho,p,alpha,rho_k3,p_k3,alpha_k3,gamma1,gamma2,dpr,v_k4,rho_k4,alpha_k4)
        v = v + (v_k1 + 2*v_k2 + 2*v_k3 + v_k4)/6;
        rho = rho + (rho_k1 + 2*rho_k2 + 2*rho_k3 + rho_k4)/6;
        alpha = alpha + (alpha_k1 + 2*alpha_k2 + 2*alpha_k3 + alpha_k4)/6;
    end

    p = pflux;

    GBC(1,j,1) = rho*v;
    GBC(1,j,2) = rho*v*u;
    GBC(1,j,3) = rho*v^2+p;
    GBC(1,j,4) = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*v*p+0.5*rho*v*(u^2+v^2);
    GBC(1,j,5) = beta*rho*v;
    GBC(1,j,6) = gamma1/(gamma1-1)*v*p*alpha+1/2*rho*v*(u^2+v^2)*beta;
    end
end

%Lower Boundary
if (BC_B==3) 
    for j=1:NX
    rho   = Wfy(2*NY,j,3);
    u     = Wfy(2*NY,j,4);
    v     = Wfy(2*NY,j,5);
    p     = Wfy(2*NY,j,6);
    beta  = Wfy(2*NY,j,7);
    alpha = Wfy(2*NY,j,8);

    NRK4 = 500;

    dpl   = (pflux - p)/NRK4;

    for k=1:NRK4
%         CALL RK4_k1_L_vy(rho,p,alpha,gamma1,gamma2,dpl,v_k1,rho_k1,alpha_k1)
%         CALL RK4_k2_L_vy(rho,p,alpha,rho_k1,p_k1,alpha_k1,gamma1,gamma2,dpl,v_k2,rho_k2,alpha_k2)
%         CALL RK4_k3_L_vy(rho,p,alpha,rho_k2,p_k2,alpha_k2,gamma1,gamma2,dpl,v_k3,rho_k3,alpha_k3)
%         CALL RK4_k4_L_vy(rho,p,alpha,rho_k3,p_k3,alpha_k3,gamma1,gamma2,dpl,v_k4,rho_k4,alpha_k4)
        v = v + (v_k1 + 2*v_k2 + 2*v_k3 + v_k4)/6;
        rho = rho + (rho_k1 + 2*rho_k2 + 2*rho_k3 + rho_k4)/6;
        alpha = alpha + (alpha_k1 + 2*alpha_k2 + 2*alpha_k3 + alpha_k4)/6;
    end

    p = pflux;

    GBC(NY+1,j,1) = rho*v;
    GBC(NY+1,j,2) = rho*v*u;
    GBC(NY+1,j,3) = rho*v^2+p;
    GBC(NY+1,j,4) = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*v*p+0.5*rho*v*(u^2+v^2);
    GBC(NY+1,j,5) = beta*rho*v;
    GBC(NY+1,j,6) = gamma1/(gamma1-1)*v*p*alpha+1/2*rho*v*(u^2+v^2)*beta;
    end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      Subsonic inflow                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rhoflux   = 1.92691;
uflux     = -0.33361;
vflux     = 0;
betaflux  = 1;
alphaflux = 1;

%Left Boundary
if BC_L==4
    for i=1:NY
        rho   = Wfx(i,1,3);
        u     = Wfx(i,1,4);
        p     = Wfx(i,1,6);
        alpha = Wfx(i,1,8);

        NRK4 = 500;

        dur   = (uflux - u)/NRK4;

        for k=1:NRK4
        %     CALL RK4_k1_R_x(rho,p,alpha,gamma1,gamma2,dur,p_k1,rho_k1,alpha_k1)
        %     CALL RK4_k2_R_x(rho,p,alpha,rho_k1,p_k1,alpha_k1,gamma1,gamma2,dur,p_k2,rho_k2,alpha_k2)
        %     CALL RK4_k3_R_x(rho,p,alpha,rho_k2,p_k2,alpha_k2,gamma1,gamma2,dur,p_k3,rho_k3,alpha_k3)
        %     CALL RK4_k4_R_x(rho,p,alpha,rho_k3,p_k3,alpha_k3,gamma1,gamma2,dur,p_k4,rho_k4,alpha_k4)
            p = p + (p_k1 + 2*p_k2 + 2*p_k3 + p_k4)/6;
            rho = rho + (rho_k1 + 2*rho_k2 + 2*rho_k3 + rho_k4)/6;
            alpha = alpha + (alpha_k1 + 2*alpha_k2 + 2*alpha_k3 + alpha_k4)/6;
        end

        rho   = rhoflux;
        u     = uflux;
        v     = vflux;
        beta  = betaflux;
        alpha = alphaflux;

        FBC(i,1,1) = rho*u;
        FBC(i,1,2) = rho*u^2+p;
        FBC(i,1,3) = rho*u*v;
        FBC(i,1,4) = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*u*p+0.5*rho*u*(u^2+v^2);
        FBC(i,1,5) = beta*rho*u;
        FBC(i,1,6) = gamma1/(gamma1-1)*u*p*alpha+1/2*rho*u*(u^2+v^2)*beta;
    end
end

%Right Boundary
if (BC_R==4) 
    for i=1:NY
        rho   = Wfx(i,2*NX,3);
        u     = Wfx(i,2*NX,4);
        p     = Wfx(i,2*NX,6);
        alpha = Wfx(i,2*NX,8);

        NRK4 = 500;

        dul   = (uflux - u)/NRK4;

        for k=1:NRK4
        %     CALL RK4_k1_L_x(rho,p,alpha,gamma1,gamma2,dul,p_k1,rho_k1,alpha_k1)
        %     CALL RK4_k2_L_x(rho,p,alpha,rho_k1,p_k1,alpha_k1,gamma1,gamma2,dul,p_k2,rho_k2,alpha_k2)
        %     CALL RK4_k3_L_x(rho,p,alpha,rho_k2,p_k2,alpha_k2,gamma1,gamma2,dul,p_k3,rho_k3,alpha_k3)
        %     CALL RK4_k4_L_x(rho,p,alpha,rho_k3,p_k3,alpha_k3,gamma1,gamma2,dul,p_k4,rho_k4,alpha_k4)
            p = p + (p_k1 + 2*p_k2 + 2*p_k3 + p_k4)/6;
            rho = rho + (rho_k1 + 2*rho_k2 + 2*rho_k3 + rho_k4)/6;
            alpha = alpha + (alpha_k1 + 2*alpha_k2 + 2*alpha_k3 + alpha_k4)/6;
        end

        rho   = rhoflux;
        u     = uflux;
        v     = vflux;
        beta  = betaflux;
        alpha = alphaflux;

        FBC(i,NX+1,1) = rho*u;
        FBC(i,NX+1,2) = rho*u^2+p;
        FBC(i,NX+1,3) = rho*u*v;
        FBC(i,NX+1,4) = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*u*p+0.5*rho*u*(u^2+v^2);
        FBC(i,NX+1,5) = beta*rho*u;
        FBC(i,NX+1,6) = gamma1/(gamma1-1)*u*p*alpha+1/2*rho*u*(u^2+v^2)*beta;
    end
end

%Upper Boundary
if (BC_A==4) 
    for j=1:NX
        rho   = Wfy(1,j,3);
        v     = Wfy(1,j,5);
        p     = Wfy(1,j,6);
        alpha = Wfy(1,j,8);

        NRK4 = 500;

        dvr   = (vflux - v)/NRK4;

        for k=1:NRK4
        %     CALL RK4_k1_R_y(rho,p,alpha,gamma1,gamma2,dvr,p_k1,rho_k1,alpha_k1)
        %     CALL RK4_k2_R_y(rho,p,alpha,rho_k1,p_k1,alpha_k1,gamma1,gamma2,dvr,p_k2,rho_k2,alpha_k2)
        %     CALL RK4_k3_R_y(rho,p,alpha,rho_k2,p_k2,alpha_k2,gamma1,gamma2,dvr,p_k3,rho_k3,alpha_k3)
        %     CALL RK4_k4_R_y(rho,p,alpha,rho_k3,p_k3,alpha_k3,gamma1,gamma2,dvr,p_k4,rho_k4,alpha_k4)
            p = p + (p_k1 + 2*p_k2 + 2*p_k3 + p_k4)/6;
            rho = rho + (rho_k1 + 2*rho_k2 + 2*rho_k3 + rho_k4)/6;
            alpha = alpha + (alpha_k1 + 2*alpha_k2 + 2*alpha_k3 + alpha_k4)/6;
        end

        rho   = rhoflux;
        u     = uflux;
        v     = vflux;
        beta  = betaflux;
        alpha = alphaflux;

        GBC(1,j,1) = rho*v;
        GBC(1,j,2) = rho*v*u;
        GBC(1,j,3) = rho*v^2+p;
        GBC(1,j,4) = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*v*p+0.5*rho*v*(u^2+v^2);
        GBC(1,j,5) = beta*rho*v;
        GBC(1,j,6) = gamma1/(gamma1-1)*v*p*alpha+1/2*rho*v*(u^2+v^2)*beta;
    end
end

%Lower Boundary
if (BC_B==4) 
    for j=1:NX
        rho   = Wfy(2*NY,j,3);
        v     = Wfy(2*NY,j,5);
        p     = Wfy(2*NY,j,6);
        alpha = Wfy(2*NY,j,8);

        NRK4 = 500;

        dvl   = (vflux - v)/NRK4;

        for k=1:NRK4
        %     CALL RK4_k1_L_y(rho,p,alpha,gamma1,gamma2,dvl,p_k1,rho_k1,alpha_k1)
        %     CALL RK4_k2_L_y(rho,p,alpha,rho_k1,p_k1,alpha_k1,gamma1,gamma2,dvl,p_k2,rho_k2,alpha_k2)
        %     CALL RK4_k3_L_y(rho,p,alpha,rho_k2,p_k2,alpha_k2,gamma1,gamma2,dvl,p_k3,rho_k3,alpha_k3)
        %     CALL RK4_k4_L_y(rho,p,alpha,rho_k3,p_k3,alpha_k3,gamma1,gamma2,dvl,p_k4,rho_k4,alpha_k4)
            p = p + (p_k1 + 2*p_k2 + 2*p_k3 + p_k4)/6;
            rho = rho + (rho_k1 + 2*rho_k2 + 2*rho_k3 + rho_k4)/6;
            alpha = alpha + (alpha_k1 + 2*alpha_k2 + 2*alpha_k3 + alpha_k4)/6;
        end

        rho   = rhoflux;
        u     = uflux;
        v     = vflux;
        beta  = betaflux;
        alpha = alphaflux;

        GBC(NY+1,j,:) = rho*v;
        GBC(NY+1,j,:) = rho*v*u;
        GBC(NY+1,j,:) = rho*v^2+p;
        GBC(NY+1,j,:) = (alpha/(gamma1-1)+(1-alpha)/(gamma2-1)+1)*v*p+0.5*rho*v*(u^2+v^2);
        GBC(NY+1,j,:) = beta*rho*v;
        GBC(NY+1,j,:) = gamma1/(gamma1-1)*v*p*alpha+1/2*rho*v*(u^2+v^2)*beta;
    end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Solid wall                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

uflux = 0;
vflux = 0;

%Left Boundary
if (BC_L==5) 
    for i=1:NY
        rho4   = Wfx(i,1,3);
        u4     = Wfx(i,1,4);
        v4     = Wfx(i,1,5);
        p4     = Wfx(i,1,6);
        beta4  = Wfx(i,1,7);
        alpha4 = Wfx(i,1,8);
        a4     = sqrt(1.0/(alpha4/gamma1+(1.0-alpha4)/gamma2)*p4/rho4);

        rhoflux   = rho4+rho4/a4*(uflux-u4);
        vflux     = v4;
        pflux     = p4+rho4*a4*(uflux-u4);
        betaflux  = beta4;
        b4        = alpha4*(1-alpha4)*(gamma1-gamma2)/((1-alpha4)*gamma1+alpha4*gamma2);
        alphaflux = alpha4+b4/a4*(usl-u4);

        FBC(i,1,1) = rhoflux*uflux;
        FBC(i,1,2) = rhoflux*uflux^2+pflux;
        FBC(i,1,3) = rhoflux*uflux*vflux;
        FBC(i,1,4) = (alphaflux/(gamma1-1)+(1-alphaflux)/(gamma2-1)+1)*uflux*pflux+0.5*rhoflux*uflux*(uflux^2+vflux^2);
        FBC(i,1,5) = betaflux*rhoflux*uflux;
        FBC(i,1,6) = gamma1/(gamma1-1)*uflux*pflux*alphaflux+1/2*rhoflux*uflux*(uflux^2+vflux^2)*betaflux;
    end
end

%Right Boundary
if (BC_R==5)
    for i=1:NY
        rho1   = Wfx(i,2*NX,3);
        u1     = Wfx(i,2*NX,4);
        v1     = Wfx(i,2*NX,5);
        p1     = Wfx(i,2*NX,6);
        beta1  = Wfx(i,2*NX,7);
        alpha1 = Wfx(i,2*NX,8);
        a1     = sqrt(1.0/(alpha1/gamma1+(1.0-alpha1)/gamma2)*p1/rho1);

        rhoflux   = rho1-rho1/a1*(uflux-u1);
        vflux     = v1;
        pflux     = p1-rho1*a1*(uflux-u1);
        betaflux  =  beta1;
        b1        = alpha1*(1-alpha1)*(gamma1-gamma2)/((1-alpha1)*gamma1+alpha1*gamma2);
        alphaflux = alpha1-b1/a1*(uflux-u1);

        FBC(i,NX+1,1) = rhoflux*uflux;
        FBC(i,NX+1,2) = rhoflux*uflux^2+pflux;
        FBC(i,NX+1,3) = rhoflux*uflux*vflux;
        FBC(i,NX+1,4) = (alphaflux/(gamma1-1)+(1-alphaflux)/(gamma2-1)+1)*uflux*pflux+0.5*rhoflux*uflux*(uflux^2+vflux^2);
        FBC(i,NX+1,5) = betaflux*rhoflux*uflux;
        FBC(i,NX+1,6) = gamma1/(gamma1-1)*uflux*pflux*alphaflux+1/2*rhoflux*uflux*(uflux^2+vflux^2)*betaflux;
    end
end


%Upper Boundary
if (BC_A==5) 
    for j=1:NX
        rho4   = Wfy(1,j,3);
        u4     = Wfy(1,j,4);
        v4     = Wfy(1,j,5);
        p4     = Wfy(1,j,6);
        beta4  = Wfy(1,j,7);
        alpha4 = Wfy(1,j,8);
        a4     = sqrt(1.0/(alpha4/gamma1+(1.0-alpha4)/gamma2)*p4/rho4);
        
        rhoflux   = rho4+rho4/a4*(vflux-v4);
        uflux     = u4;
        pflux     = p4+rho4*a4*(vflux-v4);
        betaflux  = beta4;
        b4        = alpha4*(1-alpha4)*(gamma1-gamma2)/((1-alpha4)*gamma1+alpha4*gamma2);
        alphaflux = alpha4+b4/a4*(vflux-v4);

        GBC(1,j,1) = rhoflux*vflux;
        GBC(1,j,2) = rhoflux*vflux*uflux;
        GBC(1,j,3) = rhoflux*vflux^2+pflux;
        GBC(1,j,4) = (alphaflux/(gamma1-1)+(1-alphaflux)/(gamma2-1)+1)*vflux*pflux+0.5*rhoflux*vflux*(uflux^2+vflux^2);
        GBC(1,j,5) = betaflux*rhoflux*vflux;
        GBC(1,j,6) = gamma1/(gamma1-1)*vflux*pflux*alphaflux+1/2*rhoflux*vflux*(uflux^2+vflux^2)*betaflux;
    end
end

%Lower Boundary
if (BC_B==5) 
    for j=1:NX
        rho1   = Wfy(2*NY,j,3);
        u1     = Wfy(2*NY,j,4);
        v1     = Wfy(2*NY,j,5);
        p1     = Wfy(2*NY,j,6);
        beta1  = Wfy(2*NY,j,7);
        alpha1 = Wfy(2*NY,j,8);
        a1     = sqrt(1.0/(alpha1/gamma1+(1.0-alpha1)/gamma2)*p1/rho1);
        
        rhoflux   = rho1-rho1/a1*(vflux-v1);
        uflux     = u1;
        pflux     = p1-rho1*a1*(vflux-v1);
        betaflux  = beta1;
        b1        = alpha1*(1-alpha1)*(gamma1-gamma2)/((1-alpha1)*gamma1+alpha1*gamma2);
        alphaflux = alpha1-b1/a1*(vflux-v1);

        GBC(NY+1,j,1) = rhoflux*vflux;
        GBC(NY+1,j,2) = rhoflux*vflux*uflux;
        GBC(NY+1,j,3) = rhoflux*vflux^2+pflux;
        GBC(NY+1,j,4) = (alphaflux/(gamma1-1)+(1-alphaflux)/(gamma2-1)+1)*vflux*pflux+0.5*rhoflux*vflux*(uflux^2+vflux^2);
        GBC(NY+1,j,5) = betaflux*rhoflux*vflux;
        GBC(NY+1,j,6) = gamma1/(gamma1-1)*vflux*pflux*alphaflux+1/2*rhoflux*vflux*(uflux^2+vflux^2)*betaflux;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%