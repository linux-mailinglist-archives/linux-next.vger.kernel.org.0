Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1767D8567E
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 01:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730117AbfHGXcn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 19:32:43 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36802 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729624AbfHGXcn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 19:32:43 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so93087349wrs.3;
        Wed, 07 Aug 2019 16:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9pVbIpLJvYHpW51yLVzRoQLiv107x9ELi8HQ3TSd7g=;
        b=nIrYsSA3nPN1wHjF5rjTY4bWCaUPRftz1QKySm1Ov2giKzvoKNJ+OY8RqOEGX6m1y3
         M8gnhSm+hO/g5l6KBBvUzCENROH09mk8YDGCcuFDViTP8FSysKLVdj7EymmHbmUAkCIH
         fk4Qm1eM33fFaHywCfXlYO7RhA4McjuVM8wOZFD1pFY8mEzGtIiLW97KjvgSz1iE4cqb
         EQYEtQjbch2N8MvmRrlWVI3KDbcOqEYoPQLHEjEGFWj7YfMrYd27F+KBvn01KzpElFNc
         e+w62LitUTP8quCKbnlUzWRN9iGhPZs4Qz7Kw/R7ZIjNLE7NCOA2fc8eDWJyoytPiB4W
         cI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9pVbIpLJvYHpW51yLVzRoQLiv107x9ELi8HQ3TSd7g=;
        b=KmJqdWGigPwncPnDX+eulGOt1YhItJsqtZntryOCheQO8fVEBg/7svdCPLN+8+wJBf
         9mnsRG/HMZkzsRdHa3n0V1ipo+PZEa9bAW8x5eQ3ZvyWLGNknJX8tUjICtoUwlCZhW1u
         pIIDhoxY4uvmWFLEsOhBle7LrvpBQ4xpTcHtItCsekpkJktq2MXP9u8IporrAchV9ixw
         G0yEPylOe6eRqfK9xAfcTjJPG4hmRcWKazvfLyx0ac8u04cfHPnrRYjv/+CTfO8GMuLR
         5BlrxMET9Uu2MzH13J5la/oE9dBVzG1eU0uDRHEz/zep4a8s3+uy8/tnt8ZESfz0CbFA
         Jvsw==
X-Gm-Message-State: APjAAAUxgojWWRFM/5KOZO51LR+U9lz7yNHd0FgbbW1SA4KNFzOUJyRz
        7y31rUAQeJ9IhCn/EP4we/XbkSg7eK+lHoNONeEDrJQ7GjfrPA==
X-Google-Smtp-Source: APXvYqxtF8Xvm+tm4IZuVjVZGBCJtz7+06a5/1hAvnnEAxC6bsAXdJ7lSoaNNZISpWZcktt+oPMXhYhpd+tpojMOPr8=
X-Received: by 2002:adf:f088:: with SMTP id n8mr13044701wro.58.1565220760576;
 Wed, 07 Aug 2019 16:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190807144948.28265-1-maier@linux.ibm.com> <20190807144948.28265-2-maier@linux.ibm.com>
In-Reply-To: <20190807144948.28265-2-maier@linux.ibm.com>
From:   Ming Lei <tom.leiming@gmail.com>
Date:   Thu, 8 Aug 2019 07:32:29 +0800
Message-ID: <CACVXFVM0tFj8CmcHON04_KjxR=QErCbUx0abJgG2W9OBb7akZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scsi: core: fix missing .cleanup_rq for SCSI hosts
 without request batching
To:     Steffen Maier <maier@linux.ibm.com>
Cc:     "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Ming Lei <ming.lei@redhat.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux SCSI List <linux-scsi@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        "open list:DEVICE-MAPPER (LVM)" <dm-devel@redhat.com>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Benjamin Block <bblock@linux.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Hannes Reinecke <hare@suse.com>, Jens Axboe <axboe@kernel.dk>,
        "Ewan D . Milne" <emilne@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Mike Snitzer <snitzer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 7, 2019 at 10:55 PM Steffen Maier <maier@linux.ibm.com> wrote:
>
> This was missing from scsi_mq_ops_no_commit of linux-next commit
> 8930a6c20791 ("scsi: core: add support for request batching")
> from Martin's scsi/5.4/scsi-queue or James' scsi/misc.
>
> See also linux-next commit b7e9e1fb7a92 ("scsi: implement .cleanup_rq
> callback") from block/for-next.
>
> Signed-off-by: Steffen Maier <maier@linux.ibm.com>
> Fixes: 8930a6c20791 ("scsi: core: add support for request batching")
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Ming Lei <ming.lei@redhat.com>
> ---
>  drivers/scsi/scsi_lib.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> index ae03d3e2600f..90c257622bb0 100644
> --- a/drivers/scsi/scsi_lib.c
> +++ b/drivers/scsi/scsi_lib.c
> @@ -1834,6 +1834,7 @@ static const struct blk_mq_ops scsi_mq_ops_no_commit = {
>         .init_request   = scsi_mq_init_request,
>         .exit_request   = scsi_mq_exit_request,
>         .initialize_rq_fn = scsi_initialize_rq,
> +       .cleanup_rq     = scsi_cleanup_rq,
>         .busy           = scsi_mq_lld_busy,
>         .map_queues     = scsi_map_queues,
>  };

This one is a cross-tree thing, either scsi/5.4/scsi-queue needs to
pull for-5.4/block, or
do it after both land linus tree.

Thanks,
Ming Lei
