<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>

<ui:layout title="Shopping Bag">

<section class="min-h-screen bg-[#f7f7f5] px-8 py-6 text-black">

    <div class="mx-auto grid max-w-7xl grid-cols-1 gap-10 lg:grid-cols-[1fr_430px]">

        <!-- LEFT: SHOPPING BAG -->
        <div>
            <h1 class="mb-8 font-serif text-3xl font-bold">
                Shopping Bag
            </h1>

            <!-- Item 1 -->
            <div class="flex border-b border-neutral-300 pb-10">
                <div class="h-28 w-20 flex-shrink-0 bg-neutral-200">
                    <img
                        src="${pageContext.request.contextPath}/assets/images/products/blazer.jpg"
                        alt="Architectural Wool Blazer"
                        class="h-full w-full object-cover grayscale"
                    />
                </div>

                <div class="ml-7 flex-1">
                    <div class="flex justify-between">
                        <div>
                            <h2 class="font-serif text-2xl font-bold">
                                Architectural Wool Blazer
                            </h2>

                            <p class="mt-1 text-[11px] uppercase tracking-widest">
                                Noir / Size 48
                            </p>

                            <p class="mt-1 text-[11px]">
                                Designer: Studio M
                            </p>

                            <div class="mt-2 flex h-7 w-24 border border-black text-xs">
                                <button class="w-8 border-r border-black">−</button>
                                <div class="flex w-8 items-center justify-center">01</div>
                                <button class="w-8 border-l border-black">+</button>
                            </div>
                        </div>

                        <div class="text-right">
                            <p class="text-sm">€850.00</p>

                            <button class="mt-20 text-[9px] uppercase tracking-widest">
                                Remove
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Item 2 -->
            <div class="flex border-b border-neutral-300 py-10">
                <div class="h-28 w-20 flex-shrink-0 bg-neutral-200">
                    <img
                        src="${pageContext.request.contextPath}/assets/images/products/tote.jpg"
                        alt="Oblique Leather Tote"
                        class="h-full w-full object-cover grayscale"
                    />
                </div>

                <div class="ml-7 flex-1">
                    <div class="flex justify-between">
                        <div>
                            <h2 class="font-serif text-2xl font-bold">
                                Oblique Leather Tote
                            </h2>

                            <p class="mt-1 text-[11px] uppercase tracking-widest">
                                Grained Black / One Size
                            </p>

                            <p class="mt-1 text-[11px]">
                                Designer: Monochrome Atelier
                            </p>

                            <div class="mt-2 flex h-7 w-24 border border-black text-xs">
                                <button class="w-8 border-r border-black">−</button>
                                <div class="flex w-8 items-center justify-center">01</div>
                                <button class="w-8 border-l border-black">+</button>
                            </div>
                        </div>

                        <div class="text-right">
                            <p class="text-sm">€1,200.00</p>

                            <button class="mt-20 text-[9px] uppercase tracking-widest">
                                Remove
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Guarantee -->
            <div class="mt-10 flex items-center gap-3 text-xs">
                <span class="flex h-5 w-5 items-center justify-center rounded-full border border-black text-[10px]">
                    ✓
                </span>
                <p>
                    Authenticity Guaranteed. Every piece is curated and inspected by our experts.
                </p>
            </div>
        </div>

        <!-- RIGHT: CHECKOUT -->
        <aside class="border border-neutral-300 bg-white px-12 py-12">
            <h2 class="mb-8 font-serif text-2xl font-bold">
                Secure Checkout
            </h2>

            <!-- Steps -->
            <div class="mb-10 grid grid-cols-3 gap-4 text-[8px] uppercase tracking-widest">
                <div>
                    <p>01 Details</p>
                    <div class="mt-2 h-[1px] bg-black"></div>
                </div>

                <div>
                    <p class="text-neutral-400">02 Shipping</p>
                    <div class="mt-2 h-[1px] bg-neutral-300"></div>
                </div>

                <div>
                    <p class="text-neutral-400">03 Payment</p>
                    <div class="mt-2 h-[1px] bg-neutral-300"></div>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/checkout" method="post">

                <!-- Email -->
                <div class="mb-8">
                    <label class="mb-5 block text-[11px] font-bold uppercase tracking-widest">
                        Email Address
                    </label>

                    <input
                        type="email"
                        name="email"
                        placeholder="customer@monochrome.com"
                        class="w-full border-b border-black bg-transparent py-3 text-sm outline-none placeholder:text-neutral-400"
                    />
                </div>

                <!-- Delivery -->
                <div class="mb-8">
                    <label class="mb-5 block text-[11px] font-bold uppercase tracking-widest">
                        Delivery Details
                    </label>

                    <input
                        type="text"
                        name="shippingAddress"
                        placeholder="Shipping Address"
                        class="mb-6 w-full border-b border-black bg-transparent py-3 text-sm outline-none placeholder:text-neutral-400"
                    />

                    <div class="grid grid-cols-2 gap-7">
                        <input
                            type="text"
                            name="city"
                            placeholder="City"
                            class="border-b border-black bg-transparent py-3 text-sm outline-none placeholder:text-neutral-400"
                        />

                        <input
                            type="text"
                            name="postalCode"
                            placeholder="Postal Code"
                            class="border-b border-black bg-transparent py-3 text-sm outline-none placeholder:text-neutral-400"
                        />
                    </div>
                </div>

                <!-- Payment -->
                <div class="mb-10">
                    <label class="mb-5 block text-[11px] font-bold uppercase tracking-widest">
                        Payment Method
                    </label>

                    <div class="relative">
                        <input
                            type="text"
                            name="cardNumber"
                            placeholder="Card Number"
                            class="w-full border-b border-black bg-transparent py-3 pr-8 text-sm outline-none placeholder:text-neutral-400"
                        />

                        <span class="absolute right-0 top-3 text-sm">
                            ▭
                        </span>
                    </div>

                    <div class="mt-6 grid grid-cols-2 gap-7">
                        <input
                            type="text"
                            name="expiry"
                            placeholder="MM/YY"
                            class="border-b border-black bg-transparent py-3 text-sm outline-none placeholder:text-neutral-400"
                        />

                        <input
                            type="text"
                            name="cvc"
                            placeholder="CVC"
                            class="border-b border-black bg-transparent py-3 text-sm outline-none placeholder:text-neutral-400"
                        />
                    </div>
                </div>

                <!-- Summary -->
                <div class="space-y-4 border-b border-neutral-200 pb-6 text-sm">
                    <div class="flex justify-between">
                        <span>Subtotal</span>
                        <span>€2,050.00</span>
                    </div>

                    <div class="flex justify-between">
                        <span>Tax</span>
                        <span>€10.00</span>
                    </div>

                    <div class="flex justify-between">
                        <span>Shipping</span>
                        <span class="text-[10px] uppercase tracking-widest text-green-700">
                            Complimentary
                        </span>
                    </div>
                </div>

                <!-- Total -->
                <div class="mt-6 flex justify-between font-serif text-2xl font-bold">
                    <span>Total</span>
                    <span>€2,460.00</span>
                </div>

                <button
                    type="submit"
                    class="mt-8 w-full bg-black py-5 text-[10px] font-bold uppercase tracking-[0.3em] text-white"
                >
                    Complete Purchase
                </button>

                <div class="mt-8 flex justify-center gap-4 text-[8px] uppercase tracking-widest text-neutral-500">
                    <span>🔒 Secured by Monochrome</span>
                    <span>•</span>
                    <span>Encrypted Checkout</span>
                </div>

            </form>
        </aside>

    </div>

</section>

</ui:layout>