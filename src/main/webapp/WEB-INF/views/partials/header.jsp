<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
<ul class="nav">
  <li class="nav-item">
  <c:choose>
		<c:when test="${ not empty user }">
			<a class="nav-link" href="/logout">Logout</a>
		</c:when>
		<c:otherwise>
			<a class="nav-link" href="/login">Login</a>
		</c:otherwise>
	</c:choose>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/tasks">Tasks</a>
  </li>
  <!-- <li class="nav-item">
    <a class="nav-link" href="/employers">Employers</a>
  </li> -->
</ul>
</header>