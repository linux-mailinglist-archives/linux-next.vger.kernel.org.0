Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33CC3FE277
	for <lists+linux-next@lfdr.de>; Wed,  1 Sep 2021 20:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232922AbhIASlH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Sep 2021 14:41:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232127AbhIASlH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Sep 2021 14:41:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5998461054;
        Wed,  1 Sep 2021 18:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630521609;
        bh=8afMMciDK3FgvWZZofxFhdPG1VUj8cy2ss3izUea/cI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cHJcBnTuMoq3mFPrmbdzbCZNUQvvpmahoc1uVyv1dELx9uUbMleGbmD+0HDRp7Od2
         W3bRavTxn2Xk5THzTpzsGPnR5WfEurHnMB1Hs+pOqq3K4HviuA0ubeKJcfTRCgwAZO
         LiWB8gNEunmxd6LLJQT7VEzs4VSzoQZNAeRmf8sI=
Date:   Wed, 1 Sep 2021 20:40:03 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: manual merge of the vhost tree with the driver-core
 tree
Message-ID: <YS/JA6tFEHRCHiJ7@kroah.com>
References: <20210901141826.0c21c43e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901141826.0c21c43e@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 01, 2021 at 02:18:26PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vhost tree got a conflict in:
> 
>   drivers/virtio/virtio.c
> 
> between commit:
> 
>   fc7a6209d571 ("bus: Make remove callback return void")
> 
> from the driver-core tree and commit:
> 
>   fd704f203ca1 ("virtio: Bind virtio device to device-tree node")
> 
> from the vhost tree.
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
> diff --cc drivers/virtio/virtio.c
> index 1ea0c1f6a1fd,c46cc1fbc7ae..000000000000
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@@ -292,6 -293,10 +293,8 @@@ static void virtio_dev_remove(struct de
>   
>   	/* Acknowledge the device's existence again. */
>   	virtio_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
> + 
> + 	of_node_put(dev->dev.of_node);
>  -
>  -	return 0;
>   }
>   
>   static struct bus_type virtio_bus = {

Fix looks correct to me, thanks!

greg k-h
