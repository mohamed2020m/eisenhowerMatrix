let like_post = (e) => {
    let post_id = e.target.parentNode.previousElementSibling;

    if(post_id !== null){
        post_id = e.target.parentNode.previousElementSibling.value;
    }
    else{
        post_id = e.target.previousElementSibling.value;
    }

    const csrftoken = document.querySelector('[name=csrfmiddlewaretoken]').value;

    $(`#like_post_form_${post_id}`).submit((e) => {
        e.preventDefault();

        $.ajax({
            type: 'POST',
            url: `likePost/${post_id}`,
            data: {
                csrfmiddlewaretoken: csrftoken 
            },

            success: (response) => {
                let data = JSON.parse(response['num_of_likes'])
                $(`#span_like_${post_id}`).html(`${data}`)
            },

            error: () => {
                console.log("something bad happend!")
            }
        })
    })
}

let like_btn = document.querySelectorAll(".like_post_btn");

like_btn.forEach((btn) => {
    btn.addEventListener('click', like_post);
})