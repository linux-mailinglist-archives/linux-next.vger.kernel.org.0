Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E9E3F9E5B
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 19:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbhH0R4z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 13:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbhH0R4y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Aug 2021 13:56:54 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 464BBC061757
        for <linux-next@vger.kernel.org>; Fri, 27 Aug 2021 10:56:05 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id t42so6288312pfg.12
        for <linux-next@vger.kernel.org>; Fri, 27 Aug 2021 10:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LiR1WfZOTU6X3Adf5mWmArmaNjdK5gCHAIAj8ab6vn0=;
        b=t9BxXkEBvNquY8WNgmGc+QIPMs0lUYn5cVHvvMr//tNXo1nDK212zaVsbR8Vb1d9Pa
         WU7umrhxPrsi5IBWTD6rVmpgo1vTM8/AnKBZanHMb6SrFfzC6keT+TUKjgrDrWG6xO0k
         wykZeMF20FDVPVy6z6WYesD4/u/cFnvJo0PKWF0F/Bsa6QsSRE3FYbiJf/7/wyIe3TZ6
         neiprGIpJ7PiLrUbnThvji0YCXGPZoUSXwb2+TJ2RWnIomQaqSSfdcv2TYYD0zp8T0Go
         QYkxvA9xQxpIXf9zHn0v4lf7mloSOE4U4fxzNr7B+L8nz1S25TTGd0WdKXe5RcmIyFRi
         61PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LiR1WfZOTU6X3Adf5mWmArmaNjdK5gCHAIAj8ab6vn0=;
        b=C1gDAIa3KCPggxpqckr6XJfYUIfab/I+HPYEY2EQVvSSoAF4tO8Iq1P3lSBjyOW4w4
         wgPYSLWDgINUFfv7CGgp4xIZspoqUPtzrA3bulbC/ADSPjNL+YcGh8uTrxFVnl568/sW
         uqzfMIQx06ITWP3hpYu4fN9L1o24pRWy4Bkqsq0d6vKT2tBybOgaOeMZr0dZWwJqd/9j
         2pGpXfU2WT923RTXG2XzXeQGva/XYj/BNMXmKz1yVwUNkZJD8rL5XTJzIWmD5Xq+dhb7
         OgLnK4d7yhh0HXpdzWTUbdzHZYJqFAbSzso9yS3hgB9+A8OLEwPKJ2y1dhY8lWcGoXaX
         qs+w==
X-Gm-Message-State: AOAM531OaY6oMrxJokPWf1rTBNZ6qwr4d41KzNmg6bAuYBcJm96jisWj
        Q8LPgBKarKDrBzvl4Lc4jsMjFCswQl3N
X-Google-Smtp-Source: ABdhPJxhAu1OAvZYCOfupay+t8iefI88JBM37EZixcXx+3wsujO79OQwLTIxf4ykNNIhG0aKsIbC3g==
X-Received: by 2002:a62:778e:0:b0:3ea:e8fe:d0c7 with SMTP id s136-20020a62778e000000b003eae8fed0c7mr10148125pfc.21.1630086964458;
        Fri, 27 Aug 2021 10:56:04 -0700 (PDT)
Received: from thinkpad ([2409:4072:6487:8326:11b8:8647:a6e0:a859])
        by smtp.gmail.com with ESMTPSA id n185sm7417064pfn.171.2021.08.27.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 10:56:03 -0700 (PDT)
Date:   Fri, 27 Aug 2021 23:25:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kalle Valo <kvalo@codeaurora.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Jakub Kicinski <kuba@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the char-misc tree with Linus' tree
Message-ID: <20210827175556.GA15018@thinkpad>
References: <20210827164904.6b1d1f0e@canb.auug.org.au>
 <YSjkosA6yMrMmaNk@kroah.com>
 <87bl5i6ejy.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bl5i6ejy.fsf@codeaurora.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Kalle, Stephen,

On Fri, Aug 27, 2021 at 07:24:49PM +0300, Kalle Valo wrote:
> Greg KH <greg@kroah.com> writes:
> 

[...]

> I'll explain that in detail below. But do note that I'm not familiar
> with the MHI subsystem and the MHI folks really should look at this in
> detail to make sure no new bugs are introduced! I did the conflict
> resolution myself and at least ath11k works after this resolution.
> 

I wanted to fix this thing before breaking for vacation but ended up responding
to it in the middle.

> In my test merge I first used Linus' tree as of today as the baseline.
> I first merged net-next and it went without conflicts. After that I
> merged char-misc-next and got conflicts in two files:
> 

[...]

> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 88dba230f406..b15c5bc37dd4 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1455,9 +1455,6 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>         if (ret)
>                 goto error_pm_state;
>  
> -       if (mhi_chan->dir == DMA_FROM_DEVICE)
> -               mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
> -
>         /* Pre-allocate buffer for xfer ring */
>         if (mhi_chan->pre_alloc) {
>                 int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
> 
> Greg, does this help? Stephen, do you have any advice how to handle
> this?
> 

Sorry, this fix won't work. I've done the conflict resolution in
mhi-conflict-fix [1] branch for reference.

The MHI diffs are below:

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index fc9196f11cb7d..c01ec2fef02ce 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -193,7 +193,7 @@ int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
 int mhi_map_single_use_bb(struct mhi_controller *mhi_cntrl,
 			  struct mhi_buf_info *buf_info)
 {
-	void *buf = mhi_alloc_coherent(mhi_cntrl, buf_info->len,
+	void *buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, buf_info->len,
 				       &buf_info->p_addr, GFP_ATOMIC);
 
 	if (!buf)
@@ -220,8 +220,8 @@ void mhi_unmap_single_use_bb(struct mhi_controller *mhi_cntrl,
 	if (buf_info->dir == DMA_FROM_DEVICE)
 		memcpy(buf_info->v_addr, buf_info->bb_addr, buf_info->len);
 
-	mhi_free_coherent(mhi_cntrl, buf_info->len, buf_info->bb_addr,
-			  buf_info->p_addr);
+	dma_free_coherent(mhi_cntrl->cntrl_dev, buf_info->len,
+			  buf_info->bb_addr, buf_info->p_addr);
 }
 
 static int get_nr_avail_ring_elements(struct mhi_controller *mhi_cntrl,
@@ -1430,7 +1430,7 @@ exit_unprepare_channel:
 }
 
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan)
+			struct mhi_chan *mhi_chan, unsigned int flags)
 {
 	int ret = 0;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
@@ -1455,6 +1455,9 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 	if (ret)
 		goto error_pm_state;
 
+	if (mhi_chan->dir == DMA_FROM_DEVICE)
+		mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
+
 	/* Pre-allocate buffer for xfer ring */
 	if (mhi_chan->pre_alloc) {
 		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
@@ -1610,7 +1613,7 @@ void mhi_reset_chan(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan)
 }
 
 /* Move channel to start state */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev, unsigned int flags)
 {
 	int ret, dir;
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -1621,7 +1624,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
 		if (!mhi_chan)
 			continue;
 
-		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
+		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
 		if (ret)
 			goto error_open_chan;
 	}


diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index fa611678af052..29b4fa3b72abf 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -79,7 +79,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	int rc;
 
 	/* start channels */
-	rc = mhi_prepare_for_transfer(mhi_dev);
+	rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
 	if (rc)
 		return rc;

But this can be avoided if the below commit is reverted in char-misc-next:

0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")

I won't have any objection to that (the original patch can land in v5.16) and
if Greg prefers that, I can send a quick revert patch.

Please let me know!

NOTE: I haven't tested these two solutions as I'm still on vacation. Kalle,
could you please test them to make sure I haven't missed anything?

Thanks,
Mani

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-conflict-fix

> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
