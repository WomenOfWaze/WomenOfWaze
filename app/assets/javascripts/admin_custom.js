/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//Admin action message
function displayAction(message)
{
  $('.admin-banner').after('<div class="admin-page-header">'+message+'</div>');
}

//Form validations
$(function(){
   $("#submit_form").bind("invalid-form.validate",function()
    {
    }).validate({
      submitHandler: function(form) {
        form.submit();
      },
      rules: {
       "category[name]" : {
            required: true,
            maxlength: 64
        },
        "category[description]" : {
            required: true,
            maxlength: 64
        },
         "sub_category[name]" : {
            required: true,
            maxlength: 64
        },
        "sub_category[description]" : {
            required: true,
            maxlength: 64
        },
         "product[name]" : {
            required: true,
            maxlength: 64
        },
        "product[description]" : {
            required: true,
            maxlength: 256
        },
        "product[price]" : {
            required: true,
            maxlength: 10
        },
        "product[size]" : {
            required: true,
            maxlength: 15
        }
    },
    messages: {
        "category[name]": {
            required: "&nbsp;&nbsp;Category name is required",
            maxlength: "&nbsp;&nbsp;Category name should not be more than 64 characters"
        },
        "category[description]": {
            required: "&nbsp;&nbsp;Category description is required",
            maxlength: "&nbsp;&nbsp;Category description should not be more than 64 characters"
        },
        "sub_category[name]": {
            required: "&nbsp;&nbsp;SubCategory name is required",
            maxlength: "&nbsp;&nbsp;SubCategory name should not be more than 64 characters"
        },
        "sub_category[description]": {
            required: "&nbsp;&nbsp;SubCategory description is required",
            maxlength: "&nbsp;&nbsp;SubCategory description should not be more than 64 characters"
        },
         "product[name]": {
            required: "&nbsp;&nbsp;Product name is required",
            maxlength: "&nbsp;&nbsp;Product Name should not be more than 64 characters"
        },
        "product[description]": {
            required: "&nbsp;&nbsp;Product description is required",
            maxlength: "&nbsp;&nbsp;Product description should not be more than 256 characters"
        },
        "product[price]": {
            required: "&nbsp;&nbsp;Product price is required",
            maxlength: "&nbsp;&nbsp;Product price should not be more than 10 characters"
        },
        "product[size]": {
            required: "&nbsp;&nbsp;Product size is required",
            maxlength: "&nbsp;&nbsp;Product size should not be more than 15 characters"
        }
    }
 });
});











