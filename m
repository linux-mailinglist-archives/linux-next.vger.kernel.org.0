Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EF01BF26B
	for <lists+linux-next@lfdr.de>; Thu, 30 Apr 2020 10:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgD3IPc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Apr 2020 04:15:32 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60547 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726596AbgD3IPb (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Apr 2020 04:15:31 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 6E8195C00E7;
        Thu, 30 Apr 2020 04:15:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 30 Apr 2020 04:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=vftGE7rXgB48AHwPWrZZjNjKTNb
        wd8gbxpiL8fgB6Sk=; b=okXjo4Utd/ya/jwoNazuWTUk441cI0/uExpwq+7dDKs
        Ne+yu43+r9bWUMy344IdIB1ZXSpDhUjyiLOZEXEq0WeSY3nxPy/EpWeJT4BLV42h
        8S5BZQVgJy0x3oDmIQys1hX/dW8GBRxgriXQGTPkvsdvfA4ZYBes1PYINrIogeuG
        uWprbjPbbTxrXa3miCXICj/zIL5MvxRqNjFfcMPgtLcGrQhxwRtWseDB+mdxnYrN
        IWd9sYpZDv6a3Xtk9jlHhm9DJOIeZEXxPsd/Za4BIQiOd2UPAZ2ukh9TBXhX8BER
        I6ho4/e1O1c3PjtWf5RdaWOA+/XjVmTWySKAjJM+0zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vftGE7
        rXgB48AHwPWrZZjNjKTNbwd8gbxpiL8fgB6Sk=; b=gDNDrbyIQapEpFTwd77d4L
        BQJYwtam6D2W+vv7eQEhPmiy6lml5Ntigi3sQaqkmPLMlH8DbJWETM+wDn8PnQH8
        o8Lu7BNMThWjle/A40pz/2pixJfh82IEeiUWBKYSB8qN2oEo5eE42+SCfOQkInqU
        XlP4fQjLlmoo4eQp6uQz0NGtT9qUOtLZN8UKpgtSa/ZWWg/oLVQVWa20/lotLmTa
        /kkXkATX8dXu/sY0EoZrdWhm4J5JjQl/boBBCyE74TcyzSaFWY03CwM883SylOJb
        0diHLnq6RCsOAUoUzr9mww4vZak3t2kaPdn49/9AHm/ljNuUK0d9Uyd2bccXQi0A
        ==
X-ME-Sender: <xms:H4mqXk6FXSigqZZ63A-zRewYbt93EmZmJ6GeoPbwUPBGgMzbWf6Lcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieehgddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:H4mqXqehf9Wfgrx20CqZwlGMyGgdQhC9IN_htwcadyA9U80oqKM_Iw>
    <xmx:H4mqXo5hOIpcaFGIiIyTj7e2ZBigPL71TXtk72lG9fQ7DZ3nHk6hXw>
    <xmx:H4mqXryFffcLO8MNyshLSx_DcEZnVfhkz-bF7kk5PWNtxJ2Lil8XsQ>
    <xmx:IImqXkw5sly5qifI2Gi8C1kMNsu3Y-QzheVJ4HP7Z8lucoLF37Fmjg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 89F4E3065F07;
        Thu, 30 Apr 2020 04:15:27 -0400 (EDT)
Date:   Thu, 30 Apr 2020 10:15:25 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 driver-core.current tree
Message-ID: <20200430081525.GA2496246@kroah.com>
References: <20200430142506.0626f8c4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430142506.0626f8c4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 30, 2020 at 02:25:06PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/base/dd.c
> 
> between commits:
> 
>   ce68929f07de ("driver core: Revert default driver_deferred_probe_timeout value to 0")
>   4ccc03e28ec3 ("driver core: Use dev_warn() instead of dev_WARN() for deferred_probe_timeout warnings")
>   35a672363ab3 ("driver core: Ensure wait_for_device_probe() waits until the deferred_probe_timeout fires")
> 
> from the driver-core.current tree and commit:
> 
>   eb7fbc9fb118 ("driver core: Add missing '\n' in log messages")
> 
> from the driver-core tree.
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
> 
> diff --cc drivers/base/dd.c
> index 94037be7f5d7,efe6df5bff26..000000000000
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@@ -258,8 -266,8 +258,8 @@@ int driver_deferred_probe_check_state(s
>   		return -ENODEV;
>   	}
>   
>  -	if (!driver_deferred_probe_timeout) {
>  -		dev_WARN(dev, "deferred probe timeout, ignoring dependency\n");
>  +	if (!driver_deferred_probe_timeout && initcalls_done) {
> - 		dev_warn(dev, "deferred probe timeout, ignoring dependency");
> ++		dev_warn(dev, "deferred probe timeout, ignoring dependency\n");
>   		return -ETIMEDOUT;
>   	}
>   
> @@@ -275,8 -283,7 +275,8 @@@ static void deferred_probe_timeout_work
>   	flush_work(&deferred_probe_work);
>   
>   	list_for_each_entry_safe(private, p, &deferred_probe_pending_list, deferred_probe)
> - 		dev_info(private->device, "deferred probe pending");
> + 		dev_info(private->device, "deferred probe pending\n");
>  +	wake_up(&probe_timeout_waitqueue);
>   }
>   static DECLARE_DELAYED_WORK(deferred_probe_timeout_work, deferred_probe_timeout_work_func);
>   

Looks good, I'll handle this when the .linus branch gets merged into
Linus's tree.

thanks,

greg k-h
