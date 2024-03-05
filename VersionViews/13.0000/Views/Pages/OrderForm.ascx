<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
%>

<% using (Html.BeginForm()) { %>        
    <div class="form">
        <div class="form__span-item vse">
            <script>_AdaErrors = true;</script>
            <div role="alert" class="vse" data-vse-scroll>
                <%= Html.ValidationSummary("The following errors have occurred:") %>
            </div>
        </div>
        <div class="form__group">
            <div class="form__span-item form__message">
                <span class="form__error">*</span>Indicates required field
            </div>
            <div class="form__span-item form form--frame">
                <fieldset class="form__fieldset" id="SelectOffer">
                    <h2 class="form__title">STEP 1: Select Your Quantity</h2> 
                    <div class="form__frame form__copy">
                        <p>How many <%= productName %> Offers would you like? (32 oz. bottle of <%= productName %> Pet Stain and Odor Eliminator + <%= productName %> Laundry Additive absolutely FREE)</p>
                        <div class="form form--inline-combobox-label message">
                            <div class="form__field-label">
                                <label for="ActionQuantity0">
                                    <span class="message__label">
                                        <span class="form__error">* </span>Qty
                                    </span>
                                </label>
                                <div class="form form--select">
                                    <div class="form__contain">
                                        <input id="ActionCode0" name="ActionCode0" type="hidden" value="MAINA">
                                        <select name="ActionQuantity0" id="ActionQuantity0" class="form__field dtm__restyle" data-required="true">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                        <span class="form__field form__button">
                                            <svg class="icon" focusable="false" role="presentation">
                                                <use href="#icon-chevron"/>
                                            </svg>
                                        </span>
                                    </div>
                                </div>
                                <div class="message__group" role="alert">
                                    <span class="message__invalid">
                                        Please choose a quantity
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="form__span-item form form--frame">
                <div class="form__fieldset">
                    <h2 class="form__title">STEP 2: Review Your Order</h2>
                    <div class="form__frame c-brand--form order-table reviewTable">
                        <% Html.RenderPartial("OrderFormReviewTable"); %>
                    </div>
                </div>
            </div>
            <div class="form__item">
                <div class="form__group-section">
                    <div class="form__item form__section" data-viewport>
                        <div class="view__scroll form form--frame">
                            <fieldset class="form__fieldset">
                                <h2 class="form__title">STEP 3: Select Payment Type</h2>
                                <div class="form__frame">
                                <!-- Card Type -->
                                <div class="form__span-item form message">
                                    <div class="form__group">
                                        <div id="cc" class="form__group form__payment-icons"></div>
                                    </div>
                                    <%
                                        var cardTypeMessage = Html.ValidationMessageFor(m => m.CardType);
                                        var cardTypeIsInvalid = cardTypeMessage != null;
                                    %>
                                    <div id="CardTypeCt" class="form__field-label">
                                        <div class="form form--select">
                                            <div class="form__contain">
                                                <%= Html.DropDownList("CardType", new[]
                                                    {
                                                        new SelectListItem { Text = "Visa", Value = "V"},
                                                        new SelectListItem { Text = "Mastercard", Value = "M"},
                                                        new SelectListItem { Text = "Discover", Value = "D"},
                                                        new SelectListItem { Text = "American Express", Value= "AX"}
                                                    }, new { @class = "form__field dtm__restyle", @autocomplete = "cc-type" })
                                                %>
                                                <span class="form__field form__button">
                                                    <svg class="icon">
                                                        <use href="#icon-chevron"></use>
                                                    </svg>
                                                </span>
                                            </div>
                                        </div>
                                        <label class="message__group" for="CardType" role="alert">
                                            <span class="message__label">
                                                <span class="form__error">* </span>Card Type
                                            </span>
                                            <span class="message__invalid">
                                                <% if (cardTypeIsInvalid) { %>
                                                    <%= cardTypeMessage %>
                                                <% } else { %>
                                                    Please choose a card type.
                                                <% } %>
                                            </span>
                                        </label>
                                    </div>
                                </div>

                                <div id="paymentInformation" data-express-checkout-order-type="CARD" class="form__span-item">
                                    <div class="form__group">
                                        <div role="alert" id="vse-payment" data-vse-scroll></div>
                                        <!-- Card Number -->
                                        <div class="form__span-item form message">
                                            <%
                                                var cardNumberMessage = Html.ValidationMessageFor(m => m.CardNumber);
                                                var cardNumberIsInvalid = cardNumberMessage != null;
                                            %>
                                            <div class="form__field-label">
                                                <input type="tel" name="CardNumber" id="CardNumber" placeholder="Card Number" data-required="true" autocomplete="cc-number" class="dtm__restyle form__field <%= cardNumberIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["CardNumber"] %>">
                                                <label for="CardNumber" class="message__label">
                                                    <span class="form__error">* </span>Card Number
                                                </label>
                                                <span class="message__group" role="alert">
                                                    <span class="message__invalid">
                                                        <% if (cardNumberIsInvalid) { %>
                                                            <%= cardNumberMessage %>
                                                        <% } else { %>
                                                            Please enter a valid card number.
                                                        <% } %>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>

                                        <!-- Card Expiration Month -->
                                        <div id="CardExpirationCt" class="form message">
                                            <%
                                                var cardExpirationMonthMessage = Html.ValidationMessageFor(m => m.CardExpirationMonth);
                                                var cardExpirationMonthIsInvalid = cardExpirationMonthMessage != null;
                                            %>
                                            <div class="form__field-label">
                                                <div class="form form--select message__select">
                                                    <div class="form__contain">
                                                        <%= Html.CardExpirationMonth("CardExpirationMonth", new { @id="CardExpirationMonth", @class = "form__field dtm__restyle", @data_required="true", @autcomplete="cc-exp-month"}) %>
                                                        <span class="form__field form__button">
                                                            <svg class="icon">
                                                                <use href="#icon-chevron"></use>
                                                            </svg>
                                                        </span>
                                                    </div>
                                                </div>
                                                <label for="CardExpirationMonth" class="message__label">
                                                    <span class="form__error">* </span>Card Expiration Month
                                                </label>
                                                <span class="message__group" role="alert">
                                                    <span class="message__invalid">
                                                        <% if (cardExpirationMonthIsInvalid) { %>
                                                            <%= cardExpirationMonthMessage %>
                                                        <% } else { %>
                                                            Please choose an expiration month.
                                                        <% } %>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>

                                        <!-- Card Expiration Year -->
                                        <div id="CardExpirationYearCt" class="form message">
                                            <%
                                                var cardExpirationYearMessage = Html.ValidationMessageFor(m => m.CardExpirationYear);
                                                var cardExpirationYearIsInvalid = cardExpirationYearMessage != null;
                                            %>
                                            <div class="form__field-label">
                                                <div class="form form--select message__select">
                                                    <div class="form__contain">
                                                        <%= Html.NumericDropDown("CardExpirationYear", DateTime.Now.Year, DateTime.Now.Year + 10, ViewData["CardExpirationYear"], new { @id="CardExpirationYear", @class = "form__field dtm__restyle", @autocomplete = "cc-exp-year" }) %>
                                                        <span class="form__field form__button">
                                                            <svg class="icon">
                                                                <use href="#icon-chevron"></use>
                                                            </svg>
                                                        </span>
                                                    </div>
                                                </div>
                                                <label for="CardExpirationYear" class="message__label">
                                                    <span class="form__error">* </span>Card Expiration Year
                                                </label>
                                                <span class="message__group" role="alert">
                                                    <span class="message__invalid">
                                                        <% if (cardExpirationYearIsInvalid) { %>
                                                            <%= cardExpirationYearMessage %>
                                                        <% } else { %>
                                                            Please enter an expiration year.
                                                        <% } %>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>

                                        <!-- Card CVV2 -->
                                        <div id="CardCVV2Ct" class="form__span-item form message">
                                            <%
                                                var cardCVV2Message = Html.ValidationMessageFor(m => m.CardCvv2);
                                                var cardCVV2IsInvalid = cardCVV2Message != null;
                                            %>
                                            <div class="form__field-label form__cvv">
                                                <input type="text" name="CardCvv2" id="CardCvv2" autocomplete="cc-csc" placeholder="CVV2" data-required="true" class="dtm__restyle form__field <%= cardCVV2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["CardCvv2"] %>">
                                                <label for="CardCvv2" class="message__label">
                                                    <span class="form__error">* </span>CVV2
                                                </label>
                                                <span class="message__group" role="alert">
                                                    <span class="message__invalid">
                                                        <% if (cardCVV2IsInvalid) { %>
                                                            <%= cardCVV2Message %>
                                                        <% } else { %>
                                                            Please enter a CVV number.
                                                        <% } %>
                                                    </span>
                                                </span>
                                                <a data-modal-dialog-id="cvv2-modal-dialog" data-modal-dialog-actor="open" data-modal-dialog-iframe data-modal-dialog-title="About CVV2" href="/shared/cvv.html" title="Learn What is CVV2" id="cvv2" class="account__link form__link">What is CVV2?</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div id="billingInformation" class="form__item form__section" data-express-checkout-order-type="CARD">
                        <div class="form__copy view__scroll">
                            <div class="form form--frame">
                                <fieldset class="form__fieldset">
                                    <h2 class="form__title">STEP 4: Billing Address</h2>
                                    <div class="form__span-item form__frame">
                                        <div class="form__group">
                                            <!-- First Name -->
                                            <div class="form message">
                                                <%
                                                    var billingFirstNameMessage = Html.ValidationMessageFor(m => m.BillingFirstName);
                                                    var billingFirstNameIsInvalid = billingFirstNameMessage != null;
                                                %>
                                                <div class="form__field-label">
                                                    <input type="text" title="First name can only contain letter characters" data-required="true" autocomplete="billing given-name" name="BillingFirstName" id="BillingFirstName" placeholder="First Name" class="dtm__restyle form__field <%= billingFirstNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingFirstName"] %>">
                                                    <label for="BillingFirstName" class="message__label">
                                                        <span class="form__error">* </span>First Name
                                                    </label>
                                                    <span class="message__group" role="alert">
                                                        <span class="message__invalid">
                                                            <% if (billingFirstNameIsInvalid)
                                                                { %>
                                                            <%= billingFirstNameMessage %>
                                                            <% }
                                                            else
                                                            { %>
                                                            Please enter a first name.
                                                        <% } %>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                        
                                            <!-- Last Name -->
                                            <div class="form message">
                                                <%
                                                    var billingLastNameMessage = Html.ValidationMessageFor(m => m.BillingLastName);
                                                    var billingLastNameIsInvalid = billingLastNameMessage != null;
                                                %>
                                                <div class="form__field-label">
                                                    <input type="text" name="BillingLastName" id="BillingLastName" placeholder="Last Name" data-required="true" autocomplete="billing family-name" class="dtm__restyle form__field <%= billingLastNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingLastName"] %>">
                                                    <label for="BillingLastName" class="message__label">
                                                        <span class="form__error">* </span>Last Name
                                                    </label>
                                                    <span class="message__group" role="alert">
                                                        <span class="message__invalid">
                                                            <% if (billingLastNameIsInvalid)
                                                                { %>
                                                            <%= billingLastNameMessage %>
                                                            <% }
                                                            else
                                                            { %>
                                                            Please enter a last name.
                                                        <% } %>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                        
                                            <!-- Street -->
                                            <div class="form__span-item form message">
                                                <%
                                                    var billingStreetMessage = Html.ValidationMessageFor(m => m.BillingStreet);
                                                    var billingStreetIsInvalid = billingStreetMessage != null;
                                                %>
                                                <div class="form__field-label">
                                                    <input type="text" name="BillingStreet" id="BillingStreet" placeholder="Address" data-required="true" autocomplete="billing address-line1" class="dtm__restyle form__field <%= billingStreetIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingStreet"] %>">
                                                    <label for="BillingStreet" class="message__label">
                                                        <span class="form__error">* </span>Address
                                                    </label>
                                                    <span class="message__group" role="alert">
                                                        <span class="message__invalid">
                                                            <% if (billingStreetIsInvalid)
                                                                { %>
                                                            <%= billingStreetMessage %>
                                                            <% }
                                                            else
                                                            { %>
                                                            Please enter an address.
                                                        <% } %>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                        
                                            <!-- Street 2 -->
                                            <div class="form__span-item form message">
                                                <%
                                                    var billingStreet2Message = Html.ValidationMessageFor(m => m.BillingStreet2);
                                                    var billingStreet2IsInvalid = billingStreet2Message != null;
                                                %>
                                                <div class="form__field-label">
                                                    <input type="text" name="BillingStreet2" id="BillingStreet2" placeholder="Address 2" aria-describedby="BillingStreet2Description" autocomplete="billing address-line2" class="dtm__restyle form__field <%= billingStreet2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingStreet2"] %>">
                                                    <label for="BillingStreet2" class="message__label">
                                                        Address 2
                                                    </label>
                                                    <span class="message__group" role="alert">
                                                        <small id="BillingStreet2Description" class="message__label">
                                                            Example: Suite / Apt., etc.
                                                        </small>
                                                        <span class="message__invalid">
                                                            <% if (billingStreet2IsInvalid)
                                                                { %>
                                                            <%= billingStreet2Message %>
                                                            <% }
                                                            else
                                                            { %>
                                                            Please enter an address.
                                                        <% } %>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                        
                                            <!-- City -->
                                            <div class="form__take-some form message">
                                                <%
                                                    var billingCityMessage = Html.ValidationMessageFor(m => m.BillingCity);
                                                    var billingCityIsInvalid = billingCityMessage != null;
                                                %>
                                                <div class="form__field-label">
                                                    <input type="text" name="BillingCity" id="BillingCity" placeholder="City" data-required="true" autocomplete="billing address-level2" class="dtm__restyle form__field <%= billingCityIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingCity"] %>">
                                                    <label for="BillingCity" class="message__label">
                                                        <span class="form__error">* </span>City
                                                    </label>
                                                    <span class="message__group" role="alert">
                                                        <span class="message__invalid">
                                                            <% if (billingCityIsInvalid)
                                                            { %>
                                                            <%= billingCityMessage %>
                                                            <% }
                                                            else
                                                            { %>
                                                            Please enter a city.
                                                        <% } %>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                        
                                            <!-- State -->
                                            <div class="form__take-some form message">
                                                <%
                                                    var billingStateMessage = Html.ValidationMessageFor(m => m.BillingState);
                                                    var billingStateIsInvalid = billingStateMessage != null;
                                                %>
                                                <div class="form__field-label" id="billStateParent">
                                                    <div class="form form--select message__select">
                                                        <div class="form__contain">
                                                            <%= Html.DropDownListFor(m => m.BillingState, new SelectList(Model.States, "StateCode", "StateName", ViewData["BillingState"]), new { @class="dtm__restyle form__field", @data_required="true", @autocomplete="billing address-level1" }) %>
                                                            <span class="form__field form__button">
                                                                <svg class="icon">
                                                                    <use href="#icon-chevron"></use>
                                                                </svg>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <label for="BillingState" class="message__label">
                                                        <span class="form__error">* </span>State
                                                    </label>
                                                    <span class="message__group" role="alert">
                                                        <span class="message__invalid">
                                                            <% if (billingStateIsInvalid)
                                                                { %>
                                                            <%= billingStateMessage %>
                                                            <% }
                                                            else
                                                            { %>
                                                            Please choose a state.
                                                        <% } %>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                        
                                            <!-- Zip Code -->
                                            <div class="form__take-some form message">
                                                <%
                                                    var billingZipMessage = Html.ValidationMessageFor(m => m.BillingZip);
                                                    var billingZipIsInvalid = billingZipMessage != null;
                                                %>
                                                <div class="form__field-label">
                                                    <input type="text" name="BillingZip" id="BillingZip" placeholder="Zip Code" data-required="true" autocomplete="billing postal-code" class="dtm__restyle form__field <%= billingZipIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingZip"] %>">
                                                    <label for="BillingZip" class="message__label">
                                                        <span class="form__error">* </span>Zip Code
                                                    </label>
                                                    <span class="message__group" role="alert">
                                                        <span class="message__invalid">
                                                            <% if (billingZipIsInvalid)
                                                            { %>
                                                            <%= billingZipMessage %>
                                                            <% }
                                                            else
                                                            { %>
                                                            Please enter a zip code.
                                                        <% } %>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                        
                                            <!-- Country -->
                                            <div class="form message" <%=Model.Countries.Count() > 1 ? string.Empty :"style='display:none'" %>>
                                                <%
                                                    var billingCountryMessage = Html.ValidationMessageFor(m => m.BillingCountry);
                                                    var billingCountryIsInvalid = billingCountryMessage != null;
                                                %>
                                                <div class="form__field-label">
                                                    <div class="form form--select message__select">
                                                        <div class="form__contain">
                                                            <%= Html.DropDownListFor(m => m.BillingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName", ViewData["BillingCountry"]), new { @class="dtm__restyle form__field", @autocomplete = "billing country" }) %>
                                                            <span class="form__field form__button">
                                                                <svg class="icon">
                                                                    <use href="#icon-chevron"></use>
                                                                </svg>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <label for="BillingCountry" class="message__label">
                                                        <span class="form__error">* </span>Country
                                                    </label>
                                                    <span class="message__group" role="alert">
                                                        <span class="message__invalid">
                                                            <% if (billingCountryIsInvalid)
                                                                { %>
                                                            <%= billingCountryMessage %>
                                                            <% }
                                                            else
                                                            { %>
                                                            Please choose a country.
                                                        <% } %>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                        
                                            <!-- Phone -->
                                            <div class="form__span-item form message">
                                                <%
                                                    var phoneMessage = Html.ValidationMessageFor(m => m.Phone);
                                                    var phoneIsInvalid = phoneMessage != null;
                                                %>
                                                <div class="form__field-label">
                                                    <input type="tel" name="Phone" id="Phone" placeholder="Phone" data-required="true" autocomplete="billing tel" class="dtm__restyle form__field <%= phoneIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["Phone"] %>">
                                                    <label for="Phone" class="message__label">
                                                        <span class="form__error">* </span>Phone
                                                    </label>
                                                    <span class="message__group" role="alert">
                                                        <span class="message__invalid">
                                                            <% if (phoneIsInvalid)
                                                            { %>
                                                            <%= phoneMessage %>
                                                            <% }
                                                            else
                                                            { %>
                                                            Please enter a phone number.
                                                        <% } %>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                        
                                            <!-- Email -->
                                            <div class="form__span-item form message">
                                                <%
                                                    var emailMessage = Html.ValidationMessageFor(m => m.Email);
                                                    var emailIsInvalid = emailMessage != null;
                                                %>
                                                <div class="form__field-label">
                                                    <input type="email" name="Email" id="Email" title="Format example: someone@someplace.com" data-required="true" autocomplete="billing email" placeholder="Email" class="dtm__restyle form__field <%= emailIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["Email"] %>">
                                                    <label for="Email" class="message__label">
                                                        <span class="form__error">* </span>Email
                                                    </label>
                                                    <span class="message__group" role="alert">
                                                        <span class="message__invalid">
                                                            <% if (emailIsInvalid)
                                                            { %>
                                                            <%= emailMessage %>
                                                            <% }
                                                            else
                                                            { %>
                                                            Please enter an email address.
                                                        <% } %>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>

                            <div class="form message" id="ShippingIsSameDiv">
                                <div class="form__checkbox-label form__copy">
                                    <input
                                        type="checkbox"
                                        id="ShippingIsDifferentThanBilling"
                                        name="ShippingIsDifferentThanBilling"
                                        value="true"
                                        aria-labelledby="ShippingIsDifferentThanBillingLabel" 
                                        />
                                    <input name="ShippingIsDifferentThanBilling" type="hidden" value="false">
                                    <label for="ShippingIsDifferentThanBilling" class="form__label">
                                        <span class="form__checkbox"></span>
                                        <span id="ShippingIsDifferentThanBillingLabel">Check if your shipping address is different than your billing address.</span>
                                    </label>
                    
                                    <div id="shippingInformation" class="form__span-item form form--frame">
                                        <fieldset class="form__fieldset">
                                            <h2 class="form__title">STEP 5: Shipping Address</h2>
                                            <div class="form__span-item form__frame">
                                                <div class="form__group">
                                                    <!-- First Name -->
                                                    <div class="form message">
                                                        <%
                                                            var shippingFirstNameMessage = Html.ValidationMessageFor(m => m.ShippingFirstName);
                                                            var shippingFirstNameIsInvalid = shippingFirstNameMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" title="Name can only contain letters" data-required="true" autocomplete="shipping given-name" name="ShippingFirstName" id="ShippingFirstName" placeholder="First Name" class="dtm__restyle form__field  shipping__field <%= shippingFirstNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingFirstName"] %>">
                                                            <label for="ShippingFirstName" class="message__label">
                                                                <span class="form__error">* </span>First Name
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingFirstNameIsInvalid) { %>
                                                                        <%= shippingFirstNameMessage %>
                                                                    <% } else { %>
                                                                        Please enter a first name.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                            
                                                    <!-- Last Name -->
                                                    <div class="form message">
                                                        <%
                                                            var shippingLastNameMessage = Html.ValidationMessageFor(m => m.ShippingLastName);
                                                            var shippingLastNameIsInvalid = shippingLastNameMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="ShippingLastName" id="ShippingLastName" placeholder="Last Name"  data-required="true" autocomplete="shipping family-name" class="dtm__restyle form__field  shipping__field <%= shippingLastNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingLastName"] %>">
                                                            <label for="ShippingLastName" class="message__label">
                                                                <span class="form__error">* </span>Last Name
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingLastNameIsInvalid) { %>
                                                                        <%= shippingLastNameMessage %>
                                                                    <% } else { %>
                                                                        Please enter a last name.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                            
                                                    <!-- Street -->
                                                    <div class="form__span-item form message">
                                                        <%
                                                            var shippingStreetMessage = Html.ValidationMessageFor(m => m.ShippingStreet);
                                                            var shippingStreetIsInvalid = shippingStreetMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="ShippingStreet" id="ShippingStreet" placeholder="Address" data-required="true" autocomplete="shipping address-line1" class="dtm__restyle form__field  shipping__field <%= shippingStreetIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingStreet"] %>">
                                                            <label for="ShippingStreet" class="message__label">
                                                                <span class="form__error">* </span>Address
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingStreetIsInvalid) { %>
                                                                        <%= shippingStreetMessage %>
                                                                    <% } else { %>
                                                                        Please enter an address.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                            
                                                    <!-- Street 2 -->
                                                    <div class="form__span-item form message">
                                                        <%
                                                            var shippingStreet2Message = Html.ValidationMessageFor(m => m.ShippingStreet2);
                                                            var shippingStreet2IsInvalid = shippingStreet2Message != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="ShippingStreet2" id="ShippingStreet2" autocomplete="shipping address-line2" placeholder="Address 2" aria-describedby="ShippingStreet2Description" class="dtm__restyle form__field shipping__field <%= shippingStreet2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingStreet2"] %>">
                                                            <label for="ShippingStreet2" class="message__label">
                                                                Address 2
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <small id="ShippingStreet2Description" class="message__label">Example: Street / Apt., etc.</small>
                                                                <span class="message__invalid">
                                                                    <% if (shippingStreet2IsInvalid) { %>
                                                                        <%= shippingStreet2Message %>
                                                                    <% } else { %>
                                                                        Please enter an address.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                            
                                                    <!-- City -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var shippingCityMessage = Html.ValidationMessageFor(m => m.ShippingCity);
                                                            var shippingCityIsInvalid = shippingCityMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="ShippingCity" id="ShippingCity" placeholder="City" autocomplete="shipping address-level2" data-required="true" class="dtm__restyle form__field  shipping__field <%= shippingCityIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingCity"] %>">
                                                            <label for="ShippingCity" class="message__label">
                                                                <span class="form__error">* </span>City
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingCityIsInvalid) { %>
                                                                        <%= shippingCityMessage %>
                                                                    <% } else { %>
                                                                        Please enter a city.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                            
                                                    <!-- State -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var shippingStateMessage = Html.ValidationMessageFor(m => m.ShippingState);
                                                            var shippingStateIsInvalid = shippingStateMessage != null;
                                                        %>
                                                        <div class="form__field-label" id="shipStateParent">
                                                            <div class="form form--select message__select">
                                                                <div class="form__contain">
                                                                    <%= Html.DropDownListFor(m => m.ShippingState, new SelectList(Model.States, "StateCode", "StateName", ViewData["ShippingState"]), new { @class="dtm__restyle form__field shipping__field", @autocomplete = "shipping address-level1" }) %>
                                                                    <span class="form__field form__button">
                                                                        <svg class="icon">
                                                                            <use href="#icon-chevron"></use>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <label for="ShippingState" class="message__label">
                                                                <span class="form__error">* </span>State
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingStateIsInvalid) { %>
                                                                        <%= shippingStateMessage %>
                                                                    <% } else { %>
                                                                        Please choose a state.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                            
                                                    <!-- Zip Code -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var shippingZipMessage = Html.ValidationMessageFor(m => m.ShippingZip);
                                                            var shippingZipIsInvalid = shippingZipMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="ShippingZip" id="ShippingZip" placeholder="Zip Code" autocomplete="shipping postal-code" data-required="true" class="dtm__restyle form__field <%= shippingZipIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingZip"] %>">
                                                            <label for="ShippingZip" class="message__label">
                                                                <span class="form__error">* </span>Zip Code
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingZipIsInvalid) { %>
                                                                        <%= shippingZipMessage %>
                                                                    <% } else { %>
                                                                        Please enter a zip code.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                            
                                                    <!-- Country -->
                                                    <div class="form message" <%=Model.Countries.Count() > 1 ? string.Empty :"style='display:none'" %>>
                                                        <%
                                                            var shippingCountryMessage = Html.ValidationMessageFor(m => m.ShippingCountry);
                                                            var shippingCountryIsInvalid = shippingCountryMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <div class="form form--select message__select">
                                                                <div class="form__contain">
                                                                    <%= Html.DropDownListFor(m => m.ShippingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName", ViewData["ShippingCountry"]), new { @class="dtm__restyle form__field", @autocomplete = "shipping country" }) %>
                                                                    <span class="form__field form__button">
                                                                        <svg class="icon">
                                                                            <use href="#icon-chevron"></use>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <label for="ShippingCountry" class="message__label">
                                                                <span class="form__error">* </span>Country
                                                            </label>
                                                            <label class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingCountryIsInvalid) { %>
                                                                        <%= shippingCountryMessage %>
                                                                    <% } else { %>
                                                                        Please choose a country.
                                                                    <% } %>
                                                                </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form__copy form__action-text">
            <div class="form__action">
                <button type="submit" id="AcceptOfferButton" name="acceptOffer" class="button" data-express-checkout-order-type="card">
                    <span class="order-btn">
                        <span>Process Order</span>
                    </span>
                </button>
            </div>
            <p id="ProcessOrderDisclaimer" data-express-checkout-order-type="card">By clicking Process Order, your credit card will be charged the amount above. Click only once.</p>
            <div class="form__ssl">
                <img src="/shared/images/PositiveSSL_tl_trans.png" alt="Secure Site SSL Encryption" width="100" height="100" loading="lazy">
            </div>
        </div>
    </div>
    <span class="svg-symbols">
        <svg>
            <symbol id="icon-chevron" x="0px" y="0px" viewBox="0 0 25.228 14.029">
                <g transform="translate(1.414 1.414)">
                      <path d="M0,11.2,11.2,0m0,22.4L0,11.2" transform="translate(0 11.2) rotate(-90)" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
                </g>
              </symbol>
        </svg>
    </span>
<% } %> 