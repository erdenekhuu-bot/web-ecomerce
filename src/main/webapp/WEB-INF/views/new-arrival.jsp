<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>

<ui:layout title="New arrival">

<section class="min-h-screen bg-[#f7f7f5] px-6 py-10 text-black">
    <div class="mx-auto max-w-7xl border-t border-neutral-300 pt-10">

        <div class="grid grid-cols-1 gap-8 lg:grid-cols-[240px_1fr]">

            <!-- LEFT FILTER -->
            <aside class="space-y-8 text-[11px] uppercase tracking-widest">

                <!-- Category -->
                <div>
                    <div class="mb-5 flex items-center justify-between">
                        <h3 class="font-bold">Category</h3>
                        <span>-</span>
                    </div>

                    <ul class="space-y-3 normal-case tracking-normal text-[13px]">
                        <li>All Apparel</li>
                        <li class="font-bold">Outerwear (14)</li>
                        <li>Dresses & Silks (22)</li>
                        <li>Leather Goods (08)</li>
                        <li>Accessories (31)</li>
                        <li>Footwear (12)</li>
                    </ul>
                </div>

                <!-- Size -->
                <div>
                    <div class="mb-5 flex items-center justify-between">
                        <h3 class="font-bold">Size</h3>
                        <span>+</span>
                    </div>

                    <div class="flex flex-wrap gap-2 normal-case tracking-normal">
                        <button class="h-9 w-12 border border-neutral-400 bg-white text-[11px]">XS</button>
                        <button class="h-9 w-12 bg-black text-white text-[11px]">S</button>
                        <button class="h-9 w-12 border border-neutral-400 bg-white text-[11px]">M</button>
                        <button class="h-9 w-12 border border-neutral-400 bg-white text-[11px]">L</button>
                        <button class="h-9 w-12 border border-neutral-400 bg-white text-[11px]">XL</button>
                    </div>
                </div>

                <!-- Color -->
                <div>
                    <div class="mb-5 flex items-center justify-between">
                        <h3 class="font-bold">Color</h3>
                        <span>-</span>
                    </div>

                    <div class="flex gap-3">
                        <span class="h-7 w-7 rounded-full border border-black bg-white"></span>
                        <span class="h-7 w-7 rounded-full bg-black"></span>
                        <span class="h-7 w-7 rounded-full border border-neutral-300 bg-neutral-200"></span>
                        <span class="h-7 w-7 rounded-full bg-neutral-700"></span>
                        <span class="h-7 w-7 rounded-full border border-neutral-300 bg-[#eee8dc]"></span>
                    </div>
                </div>

                <!-- Price -->
                <div>
                    <div class="mb-5 flex items-center justify-between">
                        <h3 class="font-bold">Price Range</h3>
                        <span>-</span>
                    </div>

                    <div>
                        <div class="relative mb-4 h-[2px] bg-neutral-300">
                            <div class="absolute left-0 top-0 h-[2px] w-[75%] bg-black"></div>
                            <span class="absolute -top-[5px] left-0 h-3 w-3 rounded-full bg-black"></span>
                            <span class="absolute -top-[5px] left-[75%] h-3 w-3 rounded-full bg-black"></span>
                        </div>

                        <div class="flex justify-between normal-case tracking-normal text-[12px]">
                            <span>$150</span>
                            <span>$1,200</span>
                        </div>
                    </div>
                </div>

                <button class="w-full bg-black py-4 text-[11px] font-bold uppercase tracking-widest text-white">
                    Clear Filters
                </button>
            </aside>

            <!-- PRODUCT AREA -->
            <main>
                <div class="grid grid-cols-1 gap-x-6 gap-y-12 md:grid-cols-2 xl:grid-cols-3">

                    <!-- Product 1 -->
                    <div>
                        <div class="relative aspect-[4/5] overflow-hidden bg-neutral-300">
                            <span class="absolute left-4 top-4 bg-white px-3 py-1 text-[10px] uppercase tracking-widest">
                                Limited
                            </span>
                            <img
                                src="${pageContext.request.contextPath}/assets/images/products/coat.jpg"
                                alt="Structured Coat"
                                class="h-full w-full object-cover grayscale"
                            />
                        </div>

                        <div class="mt-4">
                            <h4 class="text-[11px] font-bold uppercase tracking-widest">Structured Coat</h4>
                            <p class="mt-2 text-[13px]">Midnight Black Wool</p>
                            <p class="mt-2 text-[12px] font-bold">$840.00</p>
                        </div>
                    </div>

                    <!-- Product 2 -->
                    <div>
                        <div class="aspect-[4/5] overflow-hidden bg-neutral-300">
                            <img
                                src="${pageContext.request.contextPath}/assets/images/products/dress.jpg"
                                alt="Bias Silk Slip"
                                class="h-full w-full object-cover grayscale"
                            />
                        </div>

                        <div class="mt-4">
                            <h4 class="text-[11px] font-bold uppercase tracking-widest">Bias Silk Slip</h4>
                            <p class="mt-2 text-[13px]">Ivory Heavy Crepe</p>
                            <p class="mt-2 text-[12px] font-bold text-green-700">$320.00</p>
                        </div>
                    </div>

                    <!-- Product 3 -->
                    <div>
                        <div class="relative aspect-[4/5] overflow-hidden bg-neutral-300">
                            <span class="absolute left-4 top-4 bg-black px-3 py-1 text-[10px] uppercase tracking-widest text-white">
                                New
                            </span>
                            <img
                                src="${pageContext.request.contextPath}/assets/images/products/bag.jpg"
                                alt="Arch Tote"
                                class="h-full w-full object-cover grayscale"
                            />
                        </div>

                        <div class="mt-4">
                            <h4 class="text-[11px] font-bold uppercase tracking-widest">Arch Tote</h4>
                            <p class="mt-2 text-[13px]">Calfskin Leather</p>
                            <p class="mt-2 text-[12px] font-bold">$1,150.00</p>
                        </div>
                    </div>

                    <!-- Product 4 -->
                    <div>
                        <div class="aspect-[4/5] overflow-hidden bg-neutral-300">
                            <img
                                src="${pageContext.request.contextPath}/assets/images/products/watch.jpg"
                                alt="Linear Watch"
                                class="h-full w-full object-cover grayscale"
                            />
                        </div>

                        <div class="mt-4">
                            <h4 class="text-[11px] font-bold uppercase tracking-widest">Linear Watch</h4>
                            <p class="mt-2 text-[13px]">Brushed Steel / Black Silk</p>
                            <p class="mt-2 text-[12px] font-bold">$480.00</p>
                        </div>
                    </div>

                    <!-- Product 5 -->
                    <div>
                        <div class="aspect-[4/5] overflow-hidden bg-neutral-300">
                            <img
                                src="${pageContext.request.contextPath}/assets/images/products/shirt.jpg"
                                alt="Poplin Shirt"
                                class="h-full w-full object-cover grayscale"
                            />
                        </div>

                        <div class="mt-4">
                            <h4 class="text-[11px] font-bold uppercase tracking-widest">Poplin Shirt</h4>
                            <p class="mt-2 text-[13px]">Optic White Cotton</p>
                            <p class="mt-2 text-[12px] font-bold">$185.00</p>
                        </div>
                    </div>

                    <!-- Product 6 -->
                    <div>
                        <div class="aspect-[4/5] overflow-hidden bg-neutral-300">
                            <img
                                src="${pageContext.request.contextPath}/assets/images/products/trouser.jpg"
                                alt="Pleated Trouser"
                                class="h-full w-full object-cover grayscale"
                            />
                        </div>

                        <div class="mt-4">
                            <h4 class="text-[11px] font-bold uppercase tracking-widest">Pleated Trouser</h4>
                            <p class="mt-2 text-[13px]">Charcoal Wool Blend</p>
                            <p class="mt-2 text-[12px] font-bold">$345.00</p>
                        </div>
                    </div>

                </div>

                <!-- Pagination -->
                <div class="mt-16 border-t border-neutral-300 pt-8">
                    <div class="flex items-center justify-center gap-5 text-[11px] font-bold tracking-widest">
                        <a href="#" class="text-xl">←</a>
                        <a href="#" class="border-b border-black pb-1">01</a>
                        <a href="#">02</a>
                        <a href="#">03</a>
                        <a href="#">04</a>
                        <span>...</span>
                        <a href="#">12</a>
                        <a href="#" class="text-xl">→</a>
                    </div>
                </div>
            </main>

        </div>
    </div>
</section>

</ui:layout>