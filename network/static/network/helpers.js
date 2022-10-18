let getCookie = (cname) =>  {
    let name = cname + "=";
    let decodedCookie = decodeURIComponent(document.cookie);
    let ca = decodedCookie.split(';');
    for(let i = 0; i <ca.length; i++) {
      let c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
}

let like_post = (e) => {
    let post_id = e.target.parentNode.previousElementSibling;

    if(post_id !== null){
        post_id = e.target.parentNode.previousElementSibling.value;
    }
    else{
        post_id = e.target.previousElementSibling.value;
    }

    $(`#like_post_form_${post_id}`).submit((e) => {
        e.preventDefault();

        $.ajax({
            type: 'POST',
            url: `/likePost/${post_id}`,
            data: {
                csrfmiddlewaretoken: getCookie("csrftoken")
            },

            success: (response) => {
                let data = JSON.parse(response['num_of_likes'])
                $(`#span_like_${post_id}`).html(`${data}`)
                console.log(data)
                if(data){
                    $(`#fa-heart-${post_id}`).removeClass('text-black')
                    $(`#fa-heart-${post_id}`).addClass('text-danger')
                }
                else{
                    $(`#fa-heart-${post_id}`).removeClass('text-danger')
                    $(`#fa-heart-${post_id}`).addClass('text-black')
                }
            },

            error: () => {
                console.log("something bad happend!")
            }
        })
    })
}

// editing a post
let clicked = (e) => {
    let post_content_id = `post_content-${e.target.parentNode.parentNode.id.split('-')[1]}`;
    // getting the previous content that will be edited
    let post_content = document.getElementById(post_content_id).textContent.trim();
    
    // get the post container
    let id = `${e.target.parentNode.parentNode.id}`;
    let olny_id = id.split('-')[1];
    let container_textArea = document.getElementById(id);
    // copying the container above in case there is a cancle operation
    let tmp_container_textArea = Array.from(container_textArea.childNodes);
    
    // creating a textarea and two buttons for save and cancle operation respectively
    let form = document.createElement('form');
    let textArea = document.createElement('textarea');
    let save_btn = document.createElement('button');
    let cancle_btn = document.createElement('button');

    form.classList.add('form');
    form.setAttribute('id', 'edit_form')
    textArea.classList.add('form-control');
    textArea.setAttribute('rows', '5');
    textArea.innerHTML = post_content;
    
    save_btn.classList.add('btn','btn-primary', 'mt-2');
    save_btn.textContent = "save";
    save_btn.setAttribute('type', 'submit');

    cancle_btn.classList.add('btn','btn-secondary', 'mt-2', "mx-1");
    cancle_btn.textContent = "cancle";

    // clearing the container
    container_textArea.innerHTML = "";

    // appending to the dom
    form.appendChild(textArea);
    form.appendChild(save_btn);
    form.appendChild(cancle_btn);
    container_textArea.appendChild(form);
    
    // keep listening to the user modifications
    textArea.addEventListener('input', (e) => {
        textArea.textContent = e.target.value
    })
    
    // saving changes
    
    $("#edit_form").submit(function (e) {
        // preventing from page reload and default actions
        e.preventDefault();

        // make POST ajax call
        $.ajax({
            type: 'POST',
            url: `/editPost/${olny_id}`,
            data: {
                content: textArea.textContent,
                csrfmiddlewaretoken: getCookie("csrftoken") 
            },

            success: function (response) {
                $("#edit_form").trigger('reset');
                let data = JSON.parse(response["content"]);
                let content = data[0]['fields'];
                let post_pk = data[0]['pk'];

                let time_content_editedAt = new Date(content.editedAt).toLocaleTimeString([], {hour:"2-digit", minute: "2-digit"});
                let date_content_editedAt = new Date(content.editedAt).toLocaleString([], {year: 'numeric', month: 'short', day: 'numeric'});
                let content_editedAt = `${date_content_editedAt}, ${time_content_editedAt}`

                let text_danger = "";
                if(content.likes.length){
                    text_danger = "text-danger"
                }
                $('#nopost').remove();
                
                $('#new_posts').prepend(`
                    <div class="border p-3 my-3" id="post-${post_pk}">
                        <div>
                            <h3>
                                <a href="{%url 'me'%}">
                                    You
                                </a>    
                            </h3>
                        </div>
                        <div>
                            <button type="button" class="btn btn-warning edit_btn">Edit</button>
                        </div>
                        <div>
                            <small>${content_editedAt}-Edited</small>
                        </div>
                        <div class="m-1" id="post_content-${post_pk}">
                            ${content.content}
                        </div>
                        <div>
                            <form id="like_post_form_${post_pk}">
                                <input type="text" value="${post_pk}" hidden>
                                <button class="btn btn-none border-0 p-0 like_post_btn" type="submit">
                                    <i class="mx-1 fa fa-heart ${text_danger}"></i>
                                    <span id="span_like_${post_pk}">${content.likes.length}</span>
                                </button>
                            </form>
                        </div>
                    </div>
                `)
                
                container_textArea.remove()
                
            },
            error: function (response) {
                // alert the error if any error occured
                console.log("something bad happend!")
            }
        })
    });     
    
    // discard editing
    cancle_btn.addEventListener('click', () => {
        container_textArea.innerHTML = "";
        tmp_container_textArea.forEach((child) => {
            container_textArea.appendChild(child);
        })
    })
}
