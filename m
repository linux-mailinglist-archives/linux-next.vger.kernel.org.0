Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8DA3C20E4
	for <lists+linux-next@lfdr.de>; Fri,  9 Jul 2021 10:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhGIIhc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Jul 2021 04:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbhGIIhc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Jul 2021 04:37:32 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10371C0613E5
        for <linux-next@vger.kernel.org>; Fri,  9 Jul 2021 01:34:49 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id x125so2029495vkf.0
        for <linux-next@vger.kernel.org>; Fri, 09 Jul 2021 01:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=egPmQST1yautWNSkUehH6XhRlwz1CmKbfNdRKaFhzi0=;
        b=Fql88CYlK3C4DwWaVzv8oo9Ts65nrcapW3OTGLHfp9eyYIPrkZJHY9PSGBFo2LO3CI
         genMuYRfTxpIrytRcuEWUwCIch+1CdoUZcAT+QRSklbLw59W1H12sfAK1+4YHPR+/yhH
         SBfIv2+QftMaor4lP2RmKHfgBF/QQZ1oi6BSijkwZwpzORPyCL2wl+LA485AbRtKlcWK
         T60ewssA+orSW3EDKnKZdumWbrVx/fzVKZgpvFxxX9WbgQanJzsechyK5LqnFZZj2q1d
         syRET9UyFFL+1eUfG9V9tdYktrgXEhNzRzy4dWOaJ9CJyg3MDecFx4ze77u0hGYsRaen
         BRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=egPmQST1yautWNSkUehH6XhRlwz1CmKbfNdRKaFhzi0=;
        b=Ybu555n9SEBcrHjdi4wMgUTw71NVELe9I5Vc8zjAoNf/ez1i88B9CRCGlXpG5CH5ff
         m3tko5N5he3YIJ5dvMnF5UqcvvoHkCKwOQNH7UsMiCjWDaUS+GEFvZyWjs8Lg2ywuadN
         0Rxzo7AgJ9vBoTxdOaUT5jjQEg7LQvMmHnDHQGZ8W3cRPJVcVqe3OVyHCAQ/ufrSEkQ4
         4vS7hojydzS+lughMJTfs+PzaBOSB+PJ+T6d2OJZGGmQ+mEMGY+6dOHAW9DIoCfDyCun
         fHyQ9IkdlospOAkmT5Fh0SlJSq26cjDHGx7g9maqwi932g+45ISVnutjsMzTxo/lxfPn
         6GIQ==
X-Gm-Message-State: AOAM530Qbrmet6GNj/p9+jmHyLqVk/ihv5tr5QxcaGPMffs94pKC5GsM
        FWNRXcb5Rsmi+DVu31B50KSQ6BKMAhVPuAxglVEr4Q==
X-Google-Smtp-Source: ABdhPJwfDszzIkyinLHi8JzXVAgznfjvjbA0+4stGfqnbSiM50mpFZA2K8iJbRyhn7L0GafTO2T0hchpV6JyHgnwEGE=
X-Received: by 2002:a1f:9d13:: with SMTP id g19mr4473518vke.15.1625819688126;
 Fri, 09 Jul 2021 01:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210709103244.64b2f1de@canb.auug.org.au>
In-Reply-To: <20210709103244.64b2f1de@canb.auug.org.au>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 9 Jul 2021 10:34:11 +0200
Message-ID: <CAPDyKFrO-KcrPWBLGvS9hO+rLJjr=yx1766Np2M8HHApgkwNKg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the block tree with the mmc-fixes tree
To:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 9 Jul 2021 at 02:32, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the block tree got a conflict in:
>
>   drivers/mmc/core/block.c
>
> between commit:
>
>   5c0777665b3e ("mmc: core: Use kref in place of struct mmc_blk_data::usage")
>
> from the mmc-fixes tree and commits:
>
>   249cda3325e0 ("mmc: remove an extra blk_{get,put}_queue pair")
>   607d968a5769 ("mmc: switch to blk_mq_alloc_disk")
>
> from the block tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell

Stephen, thanks for the heads up!

Jens, I noticed that you sent the PR with the mmc commits as of
yesterday. Assuming Linus will pull it before rc1, I will rebase and
fix up the conflict from my fixes branch on top. No action needed from
your side.

Kind regards
Uffe

>
> diff --cc drivers/mmc/core/block.c
> index d7b5c5ab75fa,9890a1532cb0..000000000000
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@@ -195,26 -196,18 +195,25 @@@ static inline int mmc_get_devidx(struc
>         return devidx;
>   }
>
>  -static void mmc_blk_put(struct mmc_blk_data *md)
>  +static void mmc_blk_kref_release(struct kref *ref)
>   {
>  -      mutex_lock(&open_lock);
>  -      md->usage--;
>  -      if (md->usage == 0) {
>  -              int devidx = mmc_get_devidx(md->disk);
>  +      struct mmc_blk_data *md = container_of(ref, struct mmc_blk_data, kref);
>  +      int devidx;
>
>  -              ida_simple_remove(&mmc_blk_ida, devidx);
>  -              put_disk(md->disk);
>  -              kfree(md);
>  -      }
>  +      devidx = mmc_get_devidx(md->disk);
> -       blk_put_queue(md->queue.queue);
>  +      ida_simple_remove(&mmc_blk_ida, devidx);
>  +
>  +      mutex_lock(&open_lock);
>  +      md->disk->private_data = NULL;
>         mutex_unlock(&open_lock);
>  +
>  +      put_disk(md->disk);
>  +      kfree(md);
>  +}
>  +
>  +static void mmc_blk_put(struct mmc_blk_data *md)
>  +{
>  +      kref_put(&md->kref, mmc_blk_kref_release);
>   }
>
>   static ssize_t power_ro_lock_show(struct device *dev,
> @@@ -2334,27 -2327,11 +2333,11 @@@ static struct mmc_blk_data *mmc_blk_all
>
>         INIT_LIST_HEAD(&md->part);
>         INIT_LIST_HEAD(&md->rpmbs);
>  -      md->usage = 1;
>  +      kref_init(&md->kref);
> -
> -       ret = mmc_init_queue(&md->queue, card);
> -       if (ret)
> -               goto err_putdisk;
> -
>         md->queue.blkdata = md;
>
> -       /*
> -        * Keep an extra reference to the queue so that we can shutdown the
> -        * queue (i.e. call blk_cleanup_queue()) while there are still
> -        * references to the 'md'. The corresponding blk_put_queue() is in
> -        * mmc_blk_put().
> -        */
> -       if (!blk_get_queue(md->queue.queue)) {
> -               mmc_cleanup_queue(&md->queue);
> -               ret = -ENODEV;
> -               goto err_putdisk;
> -       }
> -
>         md->disk->major = MMC_BLOCK_MAJOR;
> +       md->disk->minors = perdev_minors;
>         md->disk->first_minor = devidx * perdev_minors;
>         md->disk->fops = &mmc_bdops;
>         md->disk->private_data = md;
