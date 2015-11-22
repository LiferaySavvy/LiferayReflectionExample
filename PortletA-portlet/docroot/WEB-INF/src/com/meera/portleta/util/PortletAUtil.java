package com.meera.portleta.util;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
public class PortletAUtil {
public static User getUser(long userId) throws PortalException, SystemException {
	return UserLocalServiceUtil.getUser(userId);
	}
public static String  getMessage(String message){
	return "Hi Meera syas" +message;
	}
}
