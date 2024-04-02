<!DOCTYPE html>
<html>
<head>
  <title>Filter Options</title>
  <style>
    /* Add left margin for better spacing */
    body {
      margin-left: 20px;
    }
    .checkbox-label {
      margin-left: 10px;
      display: inline-block;
      width: calc(100% - 25px); /* Adjust width to accommodate checkbox */
    }
    .column {
      float: left;
      width: 33.33%; /* Set width for each column */
      padding: 5px; /* Add padding for spacing */
    }
    /* Clear floats after each column */
    .row:after {
      content: "";
      display: table;
      clear: both;
    }
    /* Indent property types and their options */
    .property-type-options {
      margin-left: 10px;
    }
    /* Reduce width of property size options */
    .pet-size-options .checkbox-label {
      width: calc(90% - 25px); /* Adjust width to accommodate checkbox */
    }
    /* Add margin between rows */
    .row {
      margin-bottom: 10px;
    }
    /* Adjust margins for special characteristics options */
    .special-characteristics-options {
      margin-left: 10px;
    }
  </style>
  <!-- Include Font Awesome CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
  <h1>Filter Options</h1>
  <label for="property_type">Property Type:</label><br>
  <form action="/search" method="GET">
    <div class="row">
      <div class="column">
        <!-- Generate checkboxes based on property types from Place model -->
        <% Place::PROPERTY_TYPES.each_with_index do |property_type, index| %>
          <% if index % 3 == 0 %>
            <input type="checkbox" id="<%= property_type.downcase %>" name="property_type[]" value="<%= property_type %>">
            <label for="<%= property_type.downcase %>" class="checkbox-label"><%= property_type %></label><br>
          <% end %>
        <% end %>
      </div>
      <div class="column">
        <!-- Second column -->
        <% Place::PROPERTY_TYPES.each_with_index do |property_type, index| %>
          <% if index % 3 == 1 %>
            <input type="checkbox" id="<%= property_type.downcase %>" name="property_type[]" value="<%= property_type %>">
            <label for="<%= property_type.downcase %>" class="checkbox-label"><%= property_type %></label><br>
          <% end %>
        <% end %>
      </div>
      <div class="column">
        <!-- Third column -->
        <% Place::PROPERTY_TYPES.each_with_index do |property_type, index| %>
          <% if index % 3 == 2 %>
            <input type="checkbox" id="<%= property_type.downcase %>" name="property_type[]" value="<%= property_type %>">
            <label for="<%= property_type.downcase %>" class="checkbox-label"><%= property_type %></label><br>
          <% end %>
        <% end %>
      </div>
    </div>

    <!-- Pet Size options -->
    <div class="row pet-size-options">
      <div class="column">
        <label for="pet_size">Pet Size:</label><br>
        <% Pet::PET_SIZES.each do |pet_size| %>
          <input type="checkbox" id="<%= pet_size.downcase %>" name="pet_size[]" value="<%= pet_size %>">
          <label for="<%= pet_size.downcase %>" class="checkbox-label"><%= pet_size %></label><br>
        <% end %>
      </div>
    </div>

    <!-- Special characteristics options-->
    <div class="row special-characteristics-options">
      <div class="column">
        <label for="special_characteristics">Special Characteristics:</label><br>
        <input type="checkbox" id="offleash" name="offleash" value="true">
        <label for="offleash" class="checkbox-label">Offleash</label><br>
        <input type="checkbox" id="indoor" name="indoor" value="true">
        <label for="indoor" class="checkbox-label">Indoor</label><br>
        <input type="checkbox" id="outdoor" name="outdoor" value="true">
        <label for="outdoor" class="checkbox-label">Outdoor</label><br>
        <input type="checkbox" id="disposal_station" name="disposal_station" value="true">
        <label for="disposal_station" class="checkbox-label">Disposal Station</label><br>
        <input type="checkbox" id="water_access" name="water_access" value="true">
        <label for="water_access" class="checkbox-label">Water Access</label><br>
      </div>
    </div>

    <br>

    <input type="submit" value="Apply Filters">
  </form>
</body>
</html>
