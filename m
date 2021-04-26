Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA1036B6B3
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 18:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbhDZQYZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 12:24:25 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:45037 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234576AbhDZQYR (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 12:24:17 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 5C93816DB;
        Mon, 26 Apr 2021 12:23:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 26 Apr 2021 12:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=EvOAlD0iL4vjO0y6QWhCJtzm8Xr
        ZK1+TAwkPX9KfI9I=; b=OgO7lTFt89LqoCVwnefmWir5fRczYx/C3EVpMpnolp4
        wRvVBjw/3uoBv5/L6QhSxkxviV63P/OYSaFcxMvqvCVXa4RpYf5TDUllKxXeejqa
        z328BA51k5CwoRkbem67d/d2X9aRNf3LQ8dgmFyBU9cDRF/S2i8hToXfz+nlkmHm
        w1TMimRz2ThHJDow6vSM7nG3LYUHabAlvPESXAUVrDtv6Q8j8AnP/5beHQjLNaaj
        UJ8+iBJ/w+8vDQI9y2HApfwy4z0SXfOQZmMxFSoVCprIok03rsgE2mVopTjvxvds
        G00DrDpUWzT3N8AWmo9vulVgz0895y7yyqp8giudvkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EvOAlD
        0iL4vjO0y6QWhCJtzm8XrZK1+TAwkPX9KfI9I=; b=HqSmKcSJZrbM0DoABdF2SI
        agh7dqkvvRMQDC7US8WnxYzzNmWCPT2HmN0eQRWGjTdBaN5QH/PdQQELo+kxx4g3
        FyD1Vo7JDVGOXxGrVUYQUpDz6skqNiz+/b6o9Z6ECxZ5C5ls8Y6Xjt6086zfE6u1
        jFgY4FteAHa/Zp/dK4VDYdGgQI8YwfRnWbTKGFeSeeaiByy11lB9oMHdClj0mtqI
        Ko/IIeQeY0CvN71bFqFXxkw0ulQjg4XoEmSP2qoeqZl1DK73ioKITTH643CCRvAY
        DTl9uaCxHL7cUYHsqYOna0nDMfPS81TZUBd0Swt4CTYvA29fz9jrhCWdqV2hwCsg
        ==
X-ME-Sender: <xms:A-mGYNDum74CZj-1Ay7Ci6lFAHdyEvAWrNEctq8WYFQdyWl4_mXUnw>
    <xme:A-mGYLiqqRA0F3iIDdVdJ9YYsESkp7SPFmzxalHDW0drbO04rf0XIkDaE3Pzc-sO5
    sE0H3XZwzJIiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddukedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepueelle
    dtheekleethfeludduvdfhffeuvdffudevgeehkeegieffveehgeeftefgnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrjeegrdeigeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgr
    hhdrtghomh
X-ME-Proxy: <xmx:A-mGYIlYn3DsVhRQ6DE2I7bNnagvHeF7MF08bsE-Igd2yU0HNf6bVg>
    <xmx:A-mGYHw0k87bpTJp9ErhxVriN-4hj4kkVsToZzUtFrGj7LB7bB4Jng>
    <xmx:A-mGYCSFaFxZsfcigrEg5XhwiMbnYHmBpXTNAaM5YGyx2q8WIq4tuQ>
    <xmx:BemGYIOxaTSqy-rPdi5HxzRQ_NuKOw7av45x0VpxG1L4k9CO_3odsg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6BBA0108005F;
        Mon, 26 Apr 2021 12:23:31 -0400 (EDT)
Date:   Mon, 26 Apr 2021 18:23:29 +0200
From:   Greg KH <greg@kroah.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <YIbpAaCV4rXe4YZ4@kroah.com>
References: <20210329165525.32d51a3a@canb.auug.org.au>
 <YGFwWq//sh6onrUH@kroah.com>
 <20210426144121.GE4590@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210426144121.GE4590@sirena.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 26, 2021 at 03:41:21PM +0100, Mark Brown wrote:
> On Mon, Mar 29, 2021 at 08:14:50AM +0200, Greg KH wrote:
> 
> > Thanks for the fix, looks correct to me.
> 
> Here's the SPI pull request if you want to pull it in:
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-v5.13
> 
> for you to fetch changes up to 86527bcbc88922ea40df05d28189ee15489d2cf1:
> 
>   spi: Rename enable1 to activate in spi_set_cs() (2021-04-23 15:36:18 +0100)

I don't think I want to pull the full SPI merge into my staging tree at
this point in time, is that wise?

I already submitted a pull request to Linus for the staging tree as-is,
if there are problems we can work to address them then.

thanks,

greg k-h
