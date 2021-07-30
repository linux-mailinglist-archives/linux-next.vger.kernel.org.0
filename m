Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A773DB718
	for <lists+linux-next@lfdr.de>; Fri, 30 Jul 2021 12:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238409AbhG3KZl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Jul 2021 06:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238368AbhG3KZk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Jul 2021 06:25:40 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF30C0613CF
        for <linux-next@vger.kernel.org>; Fri, 30 Jul 2021 03:25:35 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id h9so466391ejs.4
        for <linux-next@vger.kernel.org>; Fri, 30 Jul 2021 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cUxmyUEQCUGd6fl2HOhPsZWA6Segjuha7/QSbl/0sNI=;
        b=WULT6qwA/xGWrUYjN1LKok1hJXDFqgiM1wUEEbli5G1FAZs+sAfQum3lFrxQ+JqFmZ
         ONRws9s6x2ANORx6DNOtry8iEi1K0cG5s/I7Dks05goThD9DAKRG0100ig6q6RGISotZ
         7RnHmIDSeOx7tt0LFBi/5SnHxj7YKdniHqbJsVuZ+J5Qppvfbpute207ZaBGOYEDPCgw
         6vyLV/VuP7ELD/hwn2LzKcgCqqKx+C5GBZpH9nuvenG+41CFz43UkKoRDW98HEMPeJRU
         72hZ3aTSPexn0f+j+BgHUmrkOOMtOSIOMMxoE15QOllBTLecoQrBN4b0fcK7e1MlahK7
         H/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cUxmyUEQCUGd6fl2HOhPsZWA6Segjuha7/QSbl/0sNI=;
        b=ZOkzCmf78FFMf8uxELhJstj23AOaZbzP9Mfu7MKRgcK8EMN77CL4INgF6HO0F+VPSj
         mvqHyemNIidMKD9AJA7uvuJHKJfUALrzx9FnnKPTxtq1JF8w5NPKWDmiUDPXmEYKzDPd
         8dr3DE4dAWy3Ic8BZcS5OumGEcNfRD7m0pAwXiFwe22fo0KADmWvIR9o4GLe+BMga84Z
         wJmC/xmHduah3/ToR126mDlqYEQzZAWznjyglpdFMSVwe5Qxt/aRReg+NFvRIhpvNe5V
         xDxzTcMYEQZdODUBSphG8tBOIbb4OrJ+Wyt/GykXIWsRaa1d+x2yrsVpkbWF3ILgFCM2
         1lSg==
X-Gm-Message-State: AOAM532NEOb/4rM3jjaitt1Qd02HgTJxq/lekolfyr8ahdnmA9J+Corv
        hk2mIp05RZ4FV2hIfK6vwKRY4NweqgcFo0dLaddyCw==
X-Google-Smtp-Source: ABdhPJxfedIWJe34lB3cG/wg8aJ2MvWqnqvXmtx3kIQ5GBA8/9f2CD+2IDOZaoCjO0TvOe7STew1Rce6lQDCAUtNAW0=
X-Received: by 2002:a17:907:62a1:: with SMTP id nd33mr1873225ejc.303.1627640734280;
 Fri, 30 Jul 2021 03:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210724072033.1284840-1-hch@lst.de> <20210724072033.1284840-15-hch@lst.de>
 <20210730072752.GB23847@lst.de>
In-Reply-To: <20210730072752.GB23847@lst.de>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Fri, 30 Jul 2021 12:25:23 +0200
Message-ID: <CADYN=9LSzjJBUgD_wbfctKghQdn0VL0BudX_=0Vb_vNgq+60fg@mail.gmail.com>
Subject: Re: [PATCH 14/24] bsg: move bsg_scsi_ops to drivers/scsi/
To:     Christoph Hellwig <hch@lst.de>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jens Axboe <axboe@kernel.dk>,
        FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>,
        Kai.Makisara@kolumbus.fi, dgilbert@interlog.com,
        linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 30 Jul 2021 at 09:27, Christoph Hellwig <hch@lst.de> wrote:
>

Hi Christoph,

> On Thu, Jul 29, 2021 at 10:47:45AM +0200, Anders Roxell wrote:
> > From: Christoph Hellwig <hch@lst.de>
> >
> > > Move the SCSI-specific bsg code in the SCSI midlayer instead of in the
> > > common bsg code.  This just keeps the common bsg code block/ and also
> > > allows building it as a module.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > [ Please ignore if its already been reported ]
> >
> > When building arm's defconfig 'footbridge_defconfig' on linux-next tag next-20210728 I see the following error.
>
> Can you try this patch on top?

When I applied that patch ontop of tag next-20210728 and built arm's
defconfig 'footbridge_defconfig'
I it builds fine.

Thank you for the fix.

>
> ---
> From d92a8160ce3fbe64a250482522ca0456277781f9 Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Mon, 5 Jul 2021 15:02:43 +0200
> Subject: cdrom: move the guts of cdrom_read_cdda_bpc into the sr driver
>
> cdrom_read_cdda_bpc relies on sending SCSI command to the low level
> driver using a REQ_OP_SCSI_IN request.  This isn't generic block
> layer functionality, so some the actual low-level code into the sr
> driver and call it through a new read_cdda_bpc method in the
> cdrom_device_ops structure.
>
> With this the CDROM code does not have to pull in
> scsi_normalize_sense and this depend on CONFIG_SCSI_COMMON.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

Cheers,
Anders

> ---
>  drivers/cdrom/cdrom.c | 71 +++++--------------------------------------
>  drivers/scsi/sr.c     | 56 +++++++++++++++++++++++++++++++++-
>  include/linux/cdrom.h |  6 ++--
>  3 files changed, 67 insertions(+), 66 deletions(-)
>
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index 8882b311bafd..bd2e5b1560f5 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -629,7 +629,7 @@ int register_cdrom(struct gendisk *disk, struct cdrom_device_info *cdi)
>         if (CDROM_CAN(CDC_MRW_W))
>                 cdi->exit = cdrom_mrw_exit;
>
> -       if (cdi->disk)
> +       if (cdi->ops->read_cdda_bpc)
>                 cdi->cdda_method = CDDA_BPC_FULL;
>         else
>                 cdi->cdda_method = CDDA_OLD;
> @@ -2159,81 +2159,26 @@ static int cdrom_read_cdda_old(struct cdrom_device_info *cdi, __u8 __user *ubuf,
>  static int cdrom_read_cdda_bpc(struct cdrom_device_info *cdi, __u8 __user *ubuf,
>                                int lba, int nframes)
>  {
> -       struct request_queue *q = cdi->disk->queue;
> -       struct request *rq;
> -       struct scsi_request *req;
> -       struct bio *bio;
> -       unsigned int len;
> +       int max_frames = (queue_max_sectors(cdi->disk->queue) << 9) /
> +                         CD_FRAMESIZE_RAW;
>         int nr, ret = 0;
>
> -       if (!q)
> -               return -ENXIO;
> -
> -       if (!blk_queue_scsi_passthrough(q)) {
> -               WARN_ONCE(true,
> -                         "Attempt read CDDA info through a non-SCSI queue\n");
> -               return -EINVAL;
> -       }
> -
>         cdi->last_sense = 0;
>
>         while (nframes) {
> -               nr = nframes;
>                 if (cdi->cdda_method == CDDA_BPC_SINGLE)
>                         nr = 1;
> -               if (nr * CD_FRAMESIZE_RAW > (queue_max_sectors(q) << 9))
> -                       nr = (queue_max_sectors(q) << 9) / CD_FRAMESIZE_RAW;
> -
> -               len = nr * CD_FRAMESIZE_RAW;
> -
> -               rq = blk_get_request(q, REQ_OP_DRV_IN, 0);
> -               if (IS_ERR(rq)) {
> -                       ret = PTR_ERR(rq);
> -                       break;
> -               }
> -               req = scsi_req(rq);
> -
> -               ret = blk_rq_map_user(q, rq, NULL, ubuf, len, GFP_KERNEL);
> -               if (ret) {
> -                       blk_put_request(rq);
> -                       break;
> -               }
> -
> -               req->cmd[0] = GPCMD_READ_CD;
> -               req->cmd[1] = 1 << 2;
> -               req->cmd[2] = (lba >> 24) & 0xff;
> -               req->cmd[3] = (lba >> 16) & 0xff;
> -               req->cmd[4] = (lba >>  8) & 0xff;
> -               req->cmd[5] = lba & 0xff;
> -               req->cmd[6] = (nr >> 16) & 0xff;
> -               req->cmd[7] = (nr >>  8) & 0xff;
> -               req->cmd[8] = nr & 0xff;
> -               req->cmd[9] = 0xf8;
> -
> -               req->cmd_len = 12;
> -               rq->timeout = 60 * HZ;
> -               bio = rq->bio;
> -
> -               blk_execute_rq(cdi->disk, rq, 0);
> -               if (scsi_req(rq)->result) {
> -                       struct scsi_sense_hdr sshdr;
> -
> -                       ret = -EIO;
> -                       scsi_normalize_sense(req->sense, req->sense_len,
> -                                            &sshdr);
> -                       cdi->last_sense = sshdr.sense_key;
> -               }
> -
> -               if (blk_rq_unmap_user(bio))
> -                       ret = -EFAULT;
> -               blk_put_request(rq);
> +               else
> +                       nr = min(nframes, max_frames);
>
> +               ret = cdi->ops->read_cdda_bpc(cdi, ubuf, lba, nr,
> +                                             &cdi->last_sense);
>                 if (ret)
>                         break;
>
>                 nframes -= nr;
>                 lba += nr;
> -               ubuf += len;
> +               ubuf += (nr * CD_FRAMESIZE_RAW);
>         }
>
>         return ret;
> diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
> index b98e77fe700b..6203a8b58d40 100644
> --- a/drivers/scsi/sr.c
> +++ b/drivers/scsi/sr.c
> @@ -120,6 +120,8 @@ static void get_capabilities(struct scsi_cd *);
>  static unsigned int sr_check_events(struct cdrom_device_info *cdi,
>                                     unsigned int clearing, int slot);
>  static int sr_packet(struct cdrom_device_info *, struct packet_command *);
> +static int sr_read_cdda_bpc(struct cdrom_device_info *cdi, void __user *ubuf,
> +               u32 lba, u32 nr, u8 *last_sense);
>
>  static const struct cdrom_device_ops sr_dops = {
>         .open                   = sr_open,
> @@ -133,8 +135,9 @@ static const struct cdrom_device_ops sr_dops = {
>         .get_mcn                = sr_get_mcn,
>         .reset                  = sr_reset,
>         .audio_ioctl            = sr_audio_ioctl,
> -       .capability             = SR_CAPABILITIES,
>         .generic_packet         = sr_packet,
> +       .read_cdda_bpc          = sr_read_cdda_bpc,
> +       .capability             = SR_CAPABILITIES,
>  };
>
>  static void sr_kref_release(struct kref *kref);
> @@ -951,6 +954,57 @@ static int sr_packet(struct cdrom_device_info *cdi,
>         return cgc->stat;
>  }
>
> +static int sr_read_cdda_bpc(struct cdrom_device_info *cdi, void __user *ubuf,
> +               u32 lba, u32 nr, u8 *last_sense)
> +{
> +       struct gendisk *disk = cdi->disk;
> +       u32 len = nr * CD_FRAMESIZE_RAW;
> +       struct scsi_request *req;
> +       struct request *rq;
> +       struct bio *bio;
> +       int ret;
> +
> +       rq = blk_get_request(disk->queue, REQ_OP_DRV_IN, 0);
> +       if (IS_ERR(rq))
> +               return PTR_ERR(rq);
> +       req = scsi_req(rq);
> +
> +       ret = blk_rq_map_user(disk->queue, rq, NULL, ubuf, len, GFP_KERNEL);
> +       if (ret)
> +               goto out_put_request;
> +
> +       req->cmd[0] = GPCMD_READ_CD;
> +       req->cmd[1] = 1 << 2;
> +       req->cmd[2] = (lba >> 24) & 0xff;
> +       req->cmd[3] = (lba >> 16) & 0xff;
> +       req->cmd[4] = (lba >>  8) & 0xff;
> +       req->cmd[5] = lba & 0xff;
> +       req->cmd[6] = (nr >> 16) & 0xff;
> +       req->cmd[7] = (nr >>  8) & 0xff;
> +       req->cmd[8] = nr & 0xff;
> +       req->cmd[9] = 0xf8;
> +       req->cmd_len = 12;
> +       rq->timeout = 60 * HZ;
> +       bio = rq->bio;
> +
> +       blk_execute_rq(disk, rq, 0);
> +       if (scsi_req(rq)->result) {
> +               struct scsi_sense_hdr sshdr;
> +
> +               scsi_normalize_sense(req->sense, req->sense_len,
> +                                    &sshdr);
> +               *last_sense = sshdr.sense_key;
> +               ret = -EIO;
> +       }
> +
> +       if (blk_rq_unmap_user(bio))
> +               ret = -EFAULT;
> +out_put_request:
> +       blk_put_request(rq);
> +       return ret;
> +}
> +
> +
>  /**
>   *     sr_kref_release - Called to free the scsi_cd structure
>   *     @kref: pointer to embedded kref
> diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
> index f48d0a31deae..c4fef00abdf3 100644
> --- a/include/linux/cdrom.h
> +++ b/include/linux/cdrom.h
> @@ -86,11 +86,13 @@ struct cdrom_device_ops {
>         /* play stuff */
>         int (*audio_ioctl) (struct cdrom_device_info *,unsigned int, void *);
>
> -/* driver specifications */
> -       const int capability;   /* capability flags */
>         /* handle uniform packets for scsi type devices (scsi,atapi) */
>         int (*generic_packet) (struct cdrom_device_info *,
>                                struct packet_command *);
> +       int (*read_cdda_bpc)(struct cdrom_device_info *cdi, void __user *ubuf,
> +                              u32 lba, u32 nframes, u8 *last_sense);
> +/* driver specifications */
> +       const int capability;   /* capability flags */
>  };
>
>  int cdrom_multisession(struct cdrom_device_info *cdi,
> --
> 2.30.2
>
