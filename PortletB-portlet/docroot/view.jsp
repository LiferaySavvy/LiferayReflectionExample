<%@page import="com.liferay.portal.kernel.util.PortalClassInvoker"%>
<%@page import="com.liferay.portal.kernel.util.PortletClassInvoker"%>
<%@page import="com.liferay.portal.kernel.util.ClassResolverUtil"%>
<%@page import="com.liferay.portal.kernel.util.MethodKey"%>
<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %>
<%@taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>
<portlet:defineObjects />
<liferay-theme:defineObjects />

<h4>1:PortletB invoking method which is in Portlet A class Loader Using Reflection</h4>
<%
long userId=themeDisplay.getUserId();
String className="com.meera.portleta.util.PortletAUtil";
String portletContext="PortletA-portlet";
String requiredMthodName="getUser";
Class[] parameterTypeArray={Long.TYPE};
Object[] valuesArray={userId};
String portletId="PortletA_WAR_PortletAportlet";
MethodKey getUser = new MethodKey(ClassResolverUtil.resolveByPortletClassLoader(className,portletContext),requiredMthodName,parameterTypeArray);
Object userObject=PortletClassInvoker.invoke(true,portletId,getUser,valuesArray);
out.println("userObject:<br/>"+userObject);
%>
<h4>2:PortletB invoking method which is in Portal class Loader Using Reflection</h4>
<%
long companyId=themeDisplay.getCompanyId();
String portalLevelClassName="com.liferay.portal.liveusers.LiveUsers";
String requiredPortalLevelMthodName="getSessionUsers";
Class[] parameterTypePortalArray={Long.TYPE};
Object[] valuesPortalArray={companyId};
 MethodKey getSessionUsers = new MethodKey(ClassResolverUtil.resolveByPortalClassLoader(portalLevelClassName),requiredPortalLevelMthodName,parameterTypePortalArray);
Object sessionUsersObject=PortalClassInvoker.invoke(true,getSessionUsers,valuesPortalArray);
out.println("sessionUsersObject:<br/>"+userObject);
%>

