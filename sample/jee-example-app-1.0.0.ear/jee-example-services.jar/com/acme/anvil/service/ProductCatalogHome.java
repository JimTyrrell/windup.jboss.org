// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: fullnames 
// Source File Name:   ProductCatalogHome.java

package com.acme.anvil.service;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.EJBHome;

// Referenced classes of package com.acme.anvil.service:
//            ProductCatalog

public interface ProductCatalogHome
    extends javax.ejb.EJBHome
{

    public abstract com.acme.anvil.service.ProductCatalog create()
        throws javax.ejb.CreateException, javax.ejb.EJBException, java.rmi.RemoteException;
}
