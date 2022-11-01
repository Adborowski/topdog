<div class="frameHeadline">
    Add dog
</div>

<div id="comp-add-dog">

    <!-- The data encoding type, enctype, MUST be specified as below -->
    <form id="form-add-new-dog" enctype="multipart/form-data" method="POST">

        <label class="labelNewDogInfo" for="newDogName">New dog name</label>
        <input id="newDogName" class="txtInput" name="newDogName" type="text" />
        <label class="labelNewDogInfo" for="newDogDescription">New dog description</label>
        <textarea id="newDogDescription" class="txtInput large" name="newDogDescription" type="text" /></textarea>
        <!-- MAX_FILE_SIZE must precede the file input field -->
        <input type="hidden" name="MAX_FILE_SIZE" value="3000000" />
        <!-- Name of input element determines name in $_FILES array -->
        <label class="labelNewDogInfo" for="newDogImage">New dog photo</label>
        <input id="newDogImage" class="btn btn-neutral" name="newDogImage" type="file" />
        <!-- <label for="userfile">Choose a file</label> -->

        <div id="imagePreviewFrame">
            <img id="previewImg">   
        </div>

        <input class="btn btn-general" id="btn-submit-new-dog" type="submit" value="Submit" />
        
    </form>
    
</div>

<script src="components/comp-add-dog/comp-add-dog.js"></script>