$('#request').replaceWith('<div id="request" class="right"><%= escape_javascript(render 'parts/part_request') %></div>');

alert("Your request has been added");