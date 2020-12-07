Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35DD02D0CF7
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 10:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgLGJ0D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 04:26:03 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:49865 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725550AbgLGJ0D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 04:26:03 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id A97585C0150;
        Mon,  7 Dec 2020 04:24:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 07 Dec 2020 04:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=xkFt76GgdtIFBUIRtXzL4IaaI3/
        4+8w1HVdQa080CMk=; b=SU0QH7Z8YQz8cyzjnOAkhj6+T3PUwDZIp7jxqrnBbjv
        f3kQDCFMGfaFiZ1GhQMMZyM2bU8zjLzuY7TONBN3Ov7cWrmKEvnXyFGpbj2rcjw2
        HBS87E3J1szIrxGseu9zHezRoJvlOrgPNHNzjBSqTK7a+2/VlGd3xW+vS8iDsjC9
        o+GCepAgadGbMtEoHKFIl2FupvSMCM9v38pdNTY19QglrI6FmjF0vuxJIq7AP9FU
        F969bIpbfWBS4iaKma6bByxtyQLg3GwzOErh7xgRGmTOs1ZIhTdoWYa3D+WA0ZIw
        heic9OA70TBYIklDm67EYbXSFrZXopFex8DA6AbN2qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xkFt76
        GgdtIFBUIRtXzL4IaaI3/4+8w1HVdQa080CMk=; b=Jfe/0X5CkCKL1rlicFeC9X
        6l0slqkuTKLKyRuDcDWnibQC9C97Uneq1anR31s3BzNB4PBuYPSk3o9NpAR/cPX2
        ymXdY8H1RLHwcRCK9vKWiQxVAdJ/RpeH7ZvYaMMG4ZtBnhDVXlHBaaAHGgjq5aWC
        HVAiaiVpFuig2WAopA6bBb4bpEUxp+5IzYkmdxEh5Tzwqy0+sc2iBixaNg9U7VM5
        VU6KR5onnyePZeSJYyytbmOtZq4JwfDDXflJ1XjpQprD2uJ9MvA/L+8K69fKPImh
        GgRyLltG57M9o+5hNUQrZp2jE0CNQo3/nKHWfe5/6WBFx6vW6EZl9ZiE88fvGNpA
        ==
X-ME-Sender: <xms:5_TNX-kaK0SAe27oVGvj6WHHCnPa1y2_f9Cu5MMpXcrMb1Vt66ng4g>
    <xme:5_TNX13nSeXjFFYVs3X-kuxHT9IHzjZNmYM-j4EekXlhHCNd6yLzh4U5tTzL9tA51
    9VzPuj4Iiawug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:5_TNX8poce1BS71FYvjAFusdlThAZh-DlhrUUUS6oB21SD64F8qU3w>
    <xmx:5_TNXymGigibhQqLtChW5nQktAFxB_OtWSuUHtlLUT6G9tOA5PzYfA>
    <xmx:5_TNX825k4-DSH-87pCooKW_DAT5w426ITXnlNP7SDVxGPtc4jy8kA>
    <xmx:6PTNX2oMKeJO3RyKg_q_RjwnPRz-5PJG4dePxapE0iTYzMN-0xd_kA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id F3596108005C;
        Mon,  7 Dec 2020 04:24:54 -0500 (EST)
Date:   Mon, 7 Dec 2020 10:26:06 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <X831Lg9D6Rg2rkwJ@kroah.com>
References: <20201207164601.2b9cefc8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207164601.2b9cefc8@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 07, 2020 at 04:46:01PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/iio/trigger/iio-trig-sysfs.c: In function 'iio_sysfs_trigger_probe':
> drivers/iio/trigger/iio-trig-sysfs.c:164:21: error: 'struct irq_work' has no member named 'flags'
>   164 |  atomic_set(&t->work.flags, IRQ_WORK_HARD_IRQ);
>       |                     ^
> 
> Caused by commit
> 
>   0449fc4eead7 ("iio: sysfs-trigger: Mark irq_work to expire in hardirq context")
> 
> interacting with commit
> 
>   7a9f50a05843 ("irq_work: Cleanup")
> 
> from the tip tree.
> 
> I applied the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 7 Dec 2020 16:42:18 +1100
> Subject: [PATCH] fixup for "irq_work: Cleanup"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/iio/trigger/iio-trig-sysfs.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/trigger/iio-trig-sysfs.c b/drivers/iio/trigger/iio-trig-sysfs.c
> index 10a3fd29362b..0f6b512a5c37 100644
> --- a/drivers/iio/trigger/iio-trig-sysfs.c
> +++ b/drivers/iio/trigger/iio-trig-sysfs.c
> @@ -160,8 +160,7 @@ static int iio_sysfs_trigger_probe(int id)
>  	t->trig->dev.parent = &iio_sysfs_trig_dev;
>  	iio_trigger_set_drvdata(t->trig, t);
>  
> -	init_irq_work(&t->work, iio_sysfs_trigger_work);
> -	atomic_set(&t->work.flags, IRQ_WORK_HARD_IRQ);
> +	t->work = IRQ_WORK_INIT_HARD(iio_sysfs_trigger_work);
>  
>  	ret = iio_trigger_register(t->trig);
>  	if (ret)
> -- 
> 2.29.2

Is this patch "safe" to take now, if the tip tree isn't part of my tree?

thanks,

greg k-h
