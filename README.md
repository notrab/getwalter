# Walter

### Easy as 123

1. Create an account or login to Walter.
2. Create a new form or obtain your token from an existing form.
3. Enter your token into the form `action` attribute. E.g.

``` html
<form action="//getwalter.herokuapp.com/f/<TOKEN HERE>" method="POST" accept-charset="utf-8">
  <div class="form-group">
    <label for="name">Name</label>
    <input type="text" name="name" placeholder="Your Name" class="form-control" autofocus="true">
  </div>

  <div class="form-group">
    <label for="email">Email</label>
    <input type="email" name="email" placeholder="Your Email" required="true" class="form-control">
  </div>

  <div class="form-group">
    <label for="message">Message</label>
    <textarea name="message" placeholder="Write a message..." class="form-control"></textarea>
  </div>

  <button type="submit" class="btn btn-primary">
    Send Message
  </button>
</form>
```
