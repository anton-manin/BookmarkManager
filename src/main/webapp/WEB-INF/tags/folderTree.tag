<%@ attribute name="list" required="true" type="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<c:forEach var="f" items="${list}">
	<li>
		<input class="folder_id" type="hidden" value="${f.folderId}"/>
 		<a class="folder_name" href="<c:url value="/bookmarks?id=${f.folderId}" />">${f.name}</a>
		<button class="editButton">Edit</button>				
		<form action="${deleteFolderUrl}" method="post">
			<input type="hidden" name="id" value="${f.folderId}"/>
			<input type="submit" value="Delete"/>
		</form>
		<button class="addFolderButton">Add Folder</button>

		<c:if test="${not empty f.children}">			
	 		<ul>
				<custom:folderTree list="${f.children}"/>
			</ul>
		</c:if>
	</li>
</c:forEach>
 