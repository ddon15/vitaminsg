<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op"><?php echo $content_top; ?>
<div class="row">
  <h2>Referral Report </h2>
  <?php
    var_dump($refers);
  ?>
  <table>
      <thead>
          <tr>
              <th>Referrer</th>
              <th>Referred</th>
              <th>Shipping Address</th>
          </tr>
      </thead>
      <tbody>
        <?php foreach ($refers as $ref) {
            # code...
        ?>
        <tr>
            <td><?php echo $ref['referrer']?></td>
            <td><?php echo $ref['ref_email']?></td>
            <td><?php echo $ref['street'].' '.$ref['city'].' Singapore '.$ref['zip']?></td>
        </tr>
        <?php }?>
      </tbody>
  </table>
</div>

<?php echo $content_bottom; ?></section>
<?php echo $footer; ?>