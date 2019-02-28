<table class="table table-bordered" id="total">
    <?php foreach ($totals as $total) { ?>
    <tr>
        <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
        <td class="text-right"><?php echo $total['text']; ?></td>
    </tr>
    <?php } ?>
</table>