Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36A668CD1B
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 09:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfHNHnE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Aug 2019 03:43:04 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:50459 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726365AbfHNHnE (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Aug 2019 03:43:04 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D73A221B2A;
        Wed, 14 Aug 2019 03:43:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 14 Aug 2019 03:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=yogH4/hVyl6iDCyO+eqkZ4m14+M
        nUmKS6c0kluBeFkI=; b=c5WQb60FqOuuuYS0FtSkZndmeJV19/KgCq2gfBPagT5
        xcdqHM9bjZGgTz9UFNvRbevA0dTrLmusRptXG7Kzz/6QiRXbABvlRUqD/r0QfXR7
        dt4bbfaFsHiMacs38cei9EZ9UNj89sX0K2n/wBgFJEunkhhZGJeqZuG9P9XFzz2d
        ETv+VzKn30QWDLwHyEokNvC8GhAFs6mOOdUF4JuxJTTuO+GwYEbEr4lcdYs1qIrM
        q64YRBFdmNg/MHihmGxVZKLr+bAYU2Y3F14hZUk+JRrwJfr10ZnT2P4fpHvXjVFZ
        58vX11pHn6E4GpsKVDhTV/qNbv9MxZ2oXFlvaZx1FjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yogH4/
        hVyl6iDCyO+eqkZ4m14+MnUmKS6c0kluBeFkI=; b=HTnL4xcIUngEP3+D+jIAr5
        GsqQtGxUpfalaZLIS9Vd3B5OhKBNxDa9ZqJZwfD4YfybOOar5XtjB2PQKYmd5WXD
        Lpov0W6qkbN8bIAyw6bLyTYDmoARjwq5BCiM4qM4H/5zMC2ypBTL+ZwxZ6ccWXU5
        U/KgiGFZaG+e1Fhj3TfPq6W6cp8R9B2F7380q/D5R+2/iRqcQXor7App2IrK0YTs
        4khZfv9OOtIvdGVfP2CPx9ZZI3KIDfHDGyZLWgXMPZbIqJiwu03owEVtmrr5SFwR
        4NTFZGmcMwnVcrvqloBC9E5hQSEwIphibRQRwGgLDrLK9dYEllEsozfxj/Zo3grg
        ==
X-ME-Sender: <xms:hbtTXbA9rjQpI12rNLEHMMa3cJO0HIN3bssyWkCeUgSFYO_wp68Zww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddvjedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrd
    dutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:hbtTXSzltRNzgRoIBLRTQlYHBOEBMN5auEVMTZjk3atZe6MFNs8vOg>
    <xmx:hbtTXb7Wh4rPeuGTUBbj79Yxfw889oB1I4ErTvBtz1_Us1ygBAdrUg>
    <xmx:hbtTXbu0JZEB-hwXgWZ78rq-43vW_sCSof4NJDnKqHYAgvfvowU7gA>
    <xmx:hrtTXfRZMnv8zSwgj2XNmypKvZDAh4-EcCfq0bNN4fZqHsbVuSdrqw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7A38980059;
        Wed, 14 Aug 2019 03:43:01 -0400 (EDT)
Date:   Wed, 14 Aug 2019 09:42:59 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Martyn Welch <martyn.welch@collabora.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: linux-next: build warning after merge of the staging tree
Message-ID: <20190814074259.GA3495@kroah.com>
References: <20190814160835.4aabb60a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814160835.4aabb60a@canb.auug.org.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 14, 2019 at 04:08:35PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/iio/light/noa1305.c: In function 'noa1305_scale':
> drivers/iio/light/noa1305.c:87:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    *val2 = 77 * 4;
>    ~~~~~~^~~~~~~~
> drivers/iio/light/noa1305.c:88:2: note: here
>   case NOA1305_INTEGR_TIME_200MS:
>   ^~~~
> 
> Introduced by commit
> 
>   741172d18e8a ("iio: light: noa1305: Add support for NOA1305")

Fix for this is already in my testing tree, forgot to push it to my
-next branch, but have done so now, thanks!

greg k-h
