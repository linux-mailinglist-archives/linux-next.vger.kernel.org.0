Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464EAA157D
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 12:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfH2KK4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 06:10:56 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53709 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727331AbfH2KKx (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 06:10:53 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id C581C21B82;
        Thu, 29 Aug 2019 06:10:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 29 Aug 2019 06:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=b6E6CNZ8A8mKlvqI8DmAwiqr1n9
        DnFeQpRtmULbEMsg=; b=CTJ0CTO0eW5wJpArSwK0+ub6N8FYzSf0zxYdFuzH0wm
        bb+kqiIJc9WhjuDQZxGIbcuYfGxNZX2R1EqMkczq57GdS3+VWCYt8f7xFYwrHbZM
        fgfzPOvPGmcaHa+mRVxdl2zgld+NmobCnv40LRRTOGzjDKvaJv1ilLmIIPA/qEbK
        4dh+86bdffwRrrBITAth2Fq9m5mpu/lFWehFkjKR1T4ZLpptJQY7n3oUbjlqhOuT
        /sIcuK0tz2FhiDt+ZZoOETtFr2i0AmkT1G23snKzeqxiX8GGx7uB+MucxW4q2jdR
        6m4a3O4UAXU5+J37CeaDpwL39Mlm0H2BKta3dqj7j+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=b6E6CN
        Z8A8mKlvqI8DmAwiqr1n9DnFeQpRtmULbEMsg=; b=rb79fzOa0LuuyRbh/EDSJ1
        pijoyRS4C3hXjwzYHHfORfswiBpy9x4FJHOYls4EiCpxNTtjrAlCvNHbjAsvykPo
        XRWeaiZgApB3nnbMfo1kiVxRuNYUxXnVDy4+eWz+lK7dkO0RtKGdvAU88kEkR30n
        9K4tgsGfwV0Fu+fghi5EMMROJaOmx5RfpV5q0V2Naidtx7Os4QV+vIQUneP/vtVQ
        0DjgQIizPywOkbtFh/PKDxgm31UzZ4NWzV5JsegigTVqIl6woQeo9uwOcQQ1tIpM
        FlkhQUvutfkLYph6aqK+umRhzMbot+r9QwVJk0XxqDIzyP6W8YrkiXkFQEJrr0zg
        ==
X-ME-Sender: <xms:q6RnXf4sJCJXkzhnsFuOYYiWQd7ZqD0Kyq0-P8-nDpzLc8Gpm0xcmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeivddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
    dtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecu
    vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:rKRnXTRcoRCuie0QT2HXfv3qVVupWs8p6R5mUbuxvp9prBBYksUVFQ>
    <xmx:rKRnXY4gHfgaz3VvRO8-eN-b7jigp5BVR7jVt_HmjRydrjT9DLh7yg>
    <xmx:rKRnXdXObysXISJGCAXn7jt9aNf8JZV3coAe-k9_XqSiYBrhfBCB5g>
    <xmx:rKRnXROJH0OCn1kykutso13YbuAbccAl_BxsOcM3wOjbEZ0B5Ctnlg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 91A098005A;
        Thu, 29 Aug 2019 06:10:51 -0400 (EDT)
Date:   Thu, 29 Aug 2019 12:10:50 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <20190829101050.GB20197@kroah.com>
References: <20190829173515.764a12c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829173515.764a12c5@canb.auug.org.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 29, 2019 at 05:35:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> ERROR: "platform_get_irq_optional" [drivers/hwmon/pwm-fan.ko] undefined!
> 
> Caused by commit
> 
>   6e7e5c7fbc1c ("hwmon: pwm-fan: Use platform_get_irq_optional()")
> 
> [ or maybe commit
> 
>   8973ea47901c ("driver core: platform: Introduce platform_get_irq_optional()")
> ]
> 
> I have added the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 29 Aug 2019 17:26:34 +1000
> Subject: [PATCH] driver core: platform: export platform_get_irq_optional
> 
> Fixes: 6e7e5c7fbc1c ("hwmon: pwm-fan: Use platform_get_irq_optional()")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/base/platform.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 0dda6ade50fd..11c6e56ccc22 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -213,6 +213,7 @@ int platform_get_irq_optional(struct platform_device *dev, unsigned int num)
>  {
>  	return __platform_get_irq(dev, num);
>  }
> +EXPORT_SYMBOL_GPL(platform_get_irq_optional);

I just got this same patch right before you sent this, so I've queued it
up, thanks.

greg k-h
