{if $data.queue}
{foreach from=$data.queue item=item name=queue}
{if $smarty.foreach.queue.first}<div>The following items are pending approval. Please keep in mind the <a href="{$config.paths.baseURL}tos.php">Terms Of Service</a> when approving images.</div>
<table border="1">
  <tr><th>Thumbnail</th><th>Author Information</th><th>Uploader Information</th><th>Accept/Reject</th></tr>
{/if}

  <tr>
    <td><a href="{$config.paths.baseURL}getimage.php?filename={$item.bzid}_{$item.filename|escape:"url"}"><img src="{$config.paths.baseURL}getthumb.php?filename={$item.bzid}_{$item.filename|escape:"url"}" alt="{$item.filename|escape:"html"} by {$item.authorname|escape:"html"}"></a></td>
    <td>
      <strong>Author Name:</strong> {$item.authorname}<br>
      <strong>License:</i></strong> {$item.licensename}<br>
      {if $item.licenseurl}<strong>License URL:</strong> <a href="{$item.licenseurl}" onclick="javascript:return doPopup(this.href, 'license');">View License</a><br>{/if}
      {if $item.licensetext}<strong>License Text:</strong>{$item.licensetext|nl2br}{/if}
    </td>
    <td>
      <strong>Uploader Real Name:</strong> {$item.uploaderfirstname} {$item.uploaderlastname}<br>
      <strong>Uploader Username:</strong> {$item.username}<br>
      <strong>Uploader Email:</strong> <a href="mailto:{$item.uploaderemail}">{$item.uploaderemail}</a>
    </td>
    <td>
      <form action="{$config.paths.baseURL}queue.php" method="post" onsubmit="javascript:return validateForm({$smarty.foreach.queue.index});"><div>
      <input type="hidden" name="queueid" value="{$item.queueid}">
      <strong>Message to user:</strong><br>
      <textarea name="message" id="message{$smarty.foreach.queue.index}" cols="20" rows="4"></textarea><br>
      <span style="background-color: green;"><input type="radio" name="action" id="accept{$smarty.foreach.queue.index}" value="accept"><label for="accept{$smarty.foreach.queue.index}">Accept</label></span>
      <span style="background-color: red;"><input type="radio" name="action" id="reject{$smarty.foreach.queue.index}" value="reject"><label for="reject{$smarty.foreach.queue.index}">Reject</label></span>
      <input type="submit" value="Go">
      </div></form>
    </td>
  </tr>

{if $smarty.foreach.queue.last}</table>{/if}
{/foreach}
{else}
<div>There are currently no images pending approval.</div>
{/if}
