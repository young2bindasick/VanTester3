<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main class="l-main">
         

            <!--===== FEATURED PRODUCTS =====-->
            <section class="featured section" id="featured">
                <h2 class="section-title">FEATURED PRODUCT</h2>
                <a href="#" class="section-all">View All</a>
                <div class="featured__container bd-grid">
                	<c:forEach var="product" items="${products.content}">
                	<input type="hidden" id="${product.id}"/>
                		<span>
                			<div class="featured__product">
                				<div class="featured__box">
                					<div class="featured__new">NEW</div>
                					<a href="/home/product-detail?id=${product.id}">
                						<img src="../images/product/${product.image1}" alt="product.png" class="featured__img"/>
                					</a>
                				</div>
                				
                				<div class="featured__data">
                					<h3 class="featured__name">${product.name}</h3>
                					<span class="featured__preci">
                						<fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VND"/>
                					</span>
                					<div class="purchase-info">
                	<form action="/home/cart/add/${product.id}" method="post">
                		<input type="number" min="1" max="${product.quantity}" name="quantity" value="1">
                		<c:if test="${product.quantity > 0}">
                			<button class="btn">
                        		Add to Cart <i class="fas fa-shopping-cart"></i>
                    		</button>
                		</c:if>
                		
                    	
                	</form>                                                          
                </div>
                				</div>
                			</div>
                		</span>
                	</c:forEach>
                	
                	<!--  
                    <a href="/home/product-detail">
                        <span>
                            <div class="featured__product">
                                <div class="featured__box">
                                    <div class="featured__new">NEW</div>
                                    <img src="..//img/feature1.png" alt="" class="featured__img">
                                </div>
        
                                <div class="featured__data">
                                    <h3 class="featured__name">Headphone One Black</h3>
                                    <span class="featured__preci">$29</span>
                                </div>
                            </div>
                        </span>
                    </a>
                    -->
				<!--  
                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature3.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Apple Air Pods</h3>
                            <span class="featured__preci">$122</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature2.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Speaker Beats Pill</h3>
                            <span class="featured__preci">$129</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature4.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Smartwatch F9 Negro</h3>
                            <span class="featured__preci">$99</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature4.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Smartwatch F9 Negro</h3>
                            <span class="featured__preci">$99</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature4.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Smartwatch F9 Negro</h3>
                            <span class="featured__preci">$99</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature4.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Smartwatch F9 Negro</h3>
                            <span class="featured__preci">$99</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature4.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Smartwatch F9 Negro</h3>
                            <span class="featured__preci">$99</span>
                        </div>
                    </div>
                    -->
                </div>
                
            </section>
            <div class="btn-changepage">
            <a class="btn btn-primary offset-3" href="/home/index?p=0&category=${category}#featured">First</a>
            		<c:if test="${products.number == 0 }">
            			<a class="btn btn-primary" href="#">Previous</a>
            		</c:if>
            		<c:if test="${products.number != 0 }">
            			<a class="btn btn-primary" href="/home/index?p=${products.number-1}&category=${category}#featured">Previous</a>
            		</c:if>
            		<c:if test="${products.number >= (products.totalPages - 1)}">
            			<a class="btn btn-primary" href="#">Next</a>
            		</c:if>
            		<c:if test="${products.number < (products.totalPages - 1)}">
						<a class="btn btn-primary" href="/home/index?p=${products.number+1}&category=${category}#featured">Next</a>         		
            		</c:if>
					<a class="btn btn-primary" href="/home/index?p=${products.totalPages-1}&category=${category}#featured">Last</a>
            </div>
					<h5 align="center">${products.number+1}/${products.totalPages}</h5>
            <!--===== OFFER =====-->
            

            <!--===== NEW ARRIVALS =====-->
           
        </main>
</body>
</html>