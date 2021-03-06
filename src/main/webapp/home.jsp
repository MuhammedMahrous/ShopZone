<%-- 
    Document   : home
    Created on : Mar 1, 2018, 4:24:16 AM
    Author     : Hanaa
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page import="jtech.shopzone.view.controller.ShowProductServlet" %>
<%@page import="jtech.shopzone.view.controller.CartProducts" %>
<%@page import="jtech.shopzone.view.controller.AddProductToCart" %>
<%@page import="jtech.shopzone.view.controller.MaxPrice" %>
<html lang="en">
    <head>
        <title>Shop Zone</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="signincludes/images/icons/favicon.ico"/>
        <link rel="stylesheet" href="styles/kendo.common.min.css" />
        <link rel="stylesheet" href="styles/kendo.default.min.css" />
        <link rel="stylesheet" href="styles/kendo.default.mobile.min.css" />



        <link rel="stylesheet" type="text/css" href="css/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="css/main_styles.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <link rel="stylesheet" href="css/pagination_styles.css">



        <link rel="stylesheet" href="css/pagination.css"/>
        <style>
            li.currency{
                background: #fff;
                padding: 0px;
                border: none;

            }
            input[type=number]{
                width: 80px;
                margin: 0% 5%;
            } 
        </style>

    </head>

    <body onload="getCart();
            getProducts(1, 0);
            getProductsCount(categoryId);
            getCategories();">

        <div class="super_container">

            <!-- Header -->
            <header class="header trans_300">
                <div class="top_nav">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="top_nav_left">Welcome In Our Online Shopping website ShopZone :) </div>
                            </div>
                            <>
                            <div class="top_nav_left" style="padding-left:35em;">
                                <form method="post" action="LogOutServlet">
                                    <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main Navigation -->

                <div class="main_nav_container">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-right">
                                <div class="logo_container">
                                    <a>Shop<span>Zone</span></a>
                                </div>
                                <nav class="navbar">
                                    <ul class="navbar_menu">
                                        <li><a href="home.jsp">Home</a></li>
                                        <li><a href="UserProfile.jsp">My Profile</a></li>
                                        <li><a href="cart.jsp">My Cart</a></li>

                                        <li class="currency">
                                            <a href="#">
                                                Search
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="currency_selection">
                                                <li onclick="searchByCategory()"><a >Category</a></li>
                                                <li onclick="searchByPriceAction()"><a >Price</a></li>

                                            </ul>
                                        </li>
                                    </ul>
                                    <ul class="navbar_user">
                                        <li><a href="UserProfile.jsp"><i class="fa fa-user" aria-hidden="true"></i></a></li>
                                        <li class="checkout">
                                            <a href="cart.jsp">
                                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                                <span id="checkout_items" class="checkout_items"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="hamburger_container">
                                        <i class="fa fa-bars" aria-hidden="true"></i>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>

            </header>
            <div class="fs_menu_overlay"></div>
            <div class="hamburger_menu">
                <div class="hamburger_close"><i class="fa fa-times" aria-hidden="true"></i></div>
                <div class="hamburger_menu_content text-right"></div>
            </div>

            <!-- Slider -->

            <div class="main_slider" style="background-image:url(img/slider_1.jpg)">
                <div class="container fill_height">
                    <div class="row align-items-center fill_height">
                        <div class="col">
                            <div class="main_slider_content">
                                <h6>Spring / Summer Collection 2018</h6>
                                <h1>Get up to 30% Off New Arrivals</h1>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- New Arrivals -->

            <div class="new_arrivals">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <div class="section_title new_arrivals_title">
                                <h2>New Arrivals</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col text-center">
                            <div class="new_arrivals_sorting">
                                <div id="example">
                                    <div id="category" class="demo-section k-content" style="width:300px;height: 100px;">


                                        <h4 style="margin-top: 2em;"><label for="size">Category</label></h4>
                                        <select id="size" style="width: 100%;float: left" onchange="changeCategory()" >

                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <div id="products" class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>


                                </div>
                                <div class="wrapper">
                                    <div class="container">
                                        <div id="pagination-here"></div></div></div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Footer -->
                <footer class="footer">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
                                    <ul class="footer_nav">
                                        <li><a href="https://github.com/MuhammedMahrous/ShopZone">Blog</a></li>
                                        <li><a href="https://github.com/MuhammedMahrous/ShopZone">FAQs</a></li>
                                        <li><a href="https://github.com/MuhammedMahrous/ShopZone">Contact us</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
                                    <ul>
                                        <li><a href="https://github.com/MuhammedMahrous/ShopZone"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="https://github.com/MuhammedMahrous/ShopZone"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                        <li><a href="https://github.com/MuhammedMahrous/ShopZone"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                        <li><a href="https://github.com/MuhammedMahrous/ShopZone"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                                        <li><a href="https://github.com/MuhammedMahrous/ShopZone"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="footer_nav_container">
                                    <div class="cr">?2018 All Rights Reserverd. This template is made with <i class="fa fa-heart-o"
                                                                                                              aria-hidden="true"></i>
                                        by <a>ShopZone</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>


            <script src="js/jquery-3.2.1.min.js"></script>
            <script src="js/jquery.min.js"></script>
            <script src="js/kendo.all.min.js"></script>
            <script src="css/bootstrap4/popper.js"></script>
            <script src="css/bootstrap4/bootstrap.min.js"></script>

            <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
            <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
            <script src="plugins/easing/easing.js"></script>
            <script type="text/javascript" src="js/bootpag.js"></script>
            <script src="js/custom.js"></script>
            <script src="js/show_product.js"></script>
            <script src="cartincludes/js/cartNotificationUpdater.js"></script>
        </div>
    </body>

</html>
