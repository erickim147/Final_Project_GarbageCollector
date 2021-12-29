<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="main-panel">
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="mx-auto modifyUser">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<h2 class="embTitle">SOLO RUN</h2>
							<div class="run">
								<div id="run">
									<c:choose>
										<c:when
											test="${evo.soloemb == 'B' || evo.soloemb == 'S' || evo.soloemb == 'G' }">
											<img src="resources/emblem/BRONZE.png">
										</c:when>
										<c:when test="${evo.soloemb == 'N' }">
											<img src="resources/emblem/DEFAULT.png">
										</c:when>
									</c:choose>
								</div>
								<div id="run">
									<c:choose>
										<c:when test="${evo.soloemb == 'S' || evo.soloemb == 'G' }">
											<img src="resources/emblem/SILVER.png">
										</c:when>
										<c:when test="${evo.soloemb == 'N' || evo.soloemb == 'B' }">
											<img src="resources/emblem/DEFAULT.png">
										</c:when>
									</c:choose>
								</div>
								<div id="run">
									<c:choose>
										<c:when test="${evo.soloemb == 'G' }">
											<img src="resources/emblem/GOLD.png">
										</c:when>
										<c:when
											test="${evo.soloemb == 'N' || evo.soloemb == 'B' || evo.soloemb == 'S'}">
											<img src="resources/emblem/DEFAULT.png">
										</c:when>
									</c:choose>
								</div>
							</div>

							<h2 class="embTitle">PLOGGING</h2>
							<div class="plogging">
								<div id="plogging">
									<c:choose>
										<c:when
											test="${evo.ploggingemb == 'B' || evo.ploggingemb == 'S' || evo.ploggingemb == 'G' }">
											<img src="resources/emblem/PLOGGING1.png">
										</c:when>
										<c:when test="${evo.ploggingemb == 'N' }">
											<img src="resources/emblem/PLOGGING1_N.png">
										</c:when>
									</c:choose>
								</div>
								<div id="plogging">
									<c:choose>
										<c:when
											test="${evo.ploggingemb == 'S' || evo.ploggingemb == 'G' }">
											<img src="resources/emblem/PLOGGING2.png">
										</c:when>
										<c:when
											test="${evo.ploggingemb == 'N' || evo.ploggingemb == 'B' }">
											<img src="resources/emblem/PLOGGING2_N.png">
										</c:when>
									</c:choose>
								</div>
								<div id="plogging">
									<c:choose>
										<c:when test="${evo.ploggingemb == 'G' }">
											<img src="resources/emblem/PLOGGING3.png">
										</c:when>
										<c:when
											test="${evo.ploggingemb == 'N' || evo.ploggingemb == 'B' || evo.ploggingemb == 'S'}">
											<img src="resources/emblem/PLOGGING3_N.png">
										</c:when>
									</c:choose>
								</div>
							</div>

							<h2 class="embTitle">TEAM RUN</h2>
							<div class="team">
								<div id="team">
									<c:choose>
										<c:when test="${evo.teamemb == 'y' }">
											<img src="resources/emblem/TEAM.png">
										</c:when>
										<c:when test="${evo.teamemb == 'n' }">
											<img src="resources/emblem/TEAM_N.png">
										</c:when>
									</c:choose>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>