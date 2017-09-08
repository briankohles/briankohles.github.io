## Create a simple bar graph in CSS
```
<style type="text/css" media="screen">
	div.progress-container {
	     border: 1px solid #ccc;
	     margin: 2px 5px 2px 0;
	     padding: 1px;
	     float: left;
	     background: white;
	}
	
	   div.progress-container > div {
	     background-color: #ACE97C;
	     height: 12px
	   }
	fieldset { margin-bottom: 10px; }
</style>

<fieldset>
  <legend>100px 85%</legend>
  <div class="progress-container" style="width: 100px;">
    <div style="width: 85%;"></div>
  </div>
</fieldset>
```
