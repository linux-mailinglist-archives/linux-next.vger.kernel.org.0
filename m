Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D806262924
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 09:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgIIHlX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 03:41:23 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:41481 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725826AbgIIHlX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 03:41:23 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 15081B74;
        Wed,  9 Sep 2020 03:41:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 09 Sep 2020 03:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=1tV13oC0fodhKOALG38pDwdh+/R
        xYhlUNv7eaIp+89g=; b=KJPslDDx4IUjzyWBuk9keciWOtjd9hXyAEqsPycDMm0
        S7lVithmCi6RcDjl96nKL9jBRFV7lVq5geveLCmJwLbF0BgDVn1VOZ9Lj7M4L3Vu
        kUlwOR956bXGLb9rf0loLDLLXEwCwP/ioCZV7XNWvZSs6rqkJbjOrPE2CFGRpJ9G
        LPLU+qLJVrvCa2XXGKFXkakre8nFltz37u9H1rVwtPHb9cCZUYYPgnedfmSRsfmn
        82Xm3aQ90mzw+Rw6slXa4v2a8UVwEXxZnoVex55lzdF26ua5S83Y9sOtghS99+GZ
        G3tc3DgA983WIFoTVxGxB8wrtY4ZISUk4EOlYRLXdFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1tV13o
        C0fodhKOALG38pDwdh+/RxYhlUNv7eaIp+89g=; b=T/JUNCAy9E/bWvslMbIH7H
        CT2iTCIHu096bH9Gk+pvrI8DclKrOMIp8a5XtqbOKeHS1gNGRuX0/pLOHj0+rseN
        j0kfhTZbiX5+HkYVbmWVo9KIbTEJFLBhbAeJP7BsqeTWjV15vy612J50n+A8067e
        TioQzwY/ffHxo00Z6Kjv/l53Wjm9Lu9kidGn5pnNFYGUnPWFPohNblWRPCEg1tbs
        wBA0uHToD6u2hX1u44Gh2NFg6RY2bXKZKThvR79+s0U3CMv1WLku/ftnmg5kZeOh
        fGfh/sBLxOX0FPKMMEQKZzlDUJWVIi6iFjnvOEScLy2iy2IFJ1PzxcfWP1/SNhsA
        ==
X-ME-Sender: <xms:IIdYX6vtmvE_wUGg0Rn-B4BWzi6hosg73rKS4V3_cpRRGVsuJCdMMQ>
    <xme:IIdYX_fvGLwPeaBERWUzcGz6WLrtdfiuV1yhMqGCTw1dcRTgOFBJC2X7LfCdN9q-_
    jSYzPRRgXvXcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:IIdYX1xuSt-mDj84uDGF5P4sN9WjNTi4jIN4ZeybwXyRyZLKFoy42A>
    <xmx:IIdYX1MRi7twCT9S-cYde8bVfi4nNSHy4yjSHlB7icziXikk2p7F7A>
    <xmx:IIdYX6-2jvqm-rlvF08pWy0SE7bd2WOF2PpBRKI1nrxN5Il4FFwuMQ>
    <xmx:IYdYX8JK8sQJHwDxcUTiT8idiCkffb3m51a7sEogjuBkB1WH3_lkFw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id EE2963280063;
        Wed,  9 Sep 2020 03:41:19 -0400 (EDT)
Date:   Wed, 9 Sep 2020 09:41:30 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the staging tree
Message-ID: <20200909074130.GB561485@kroah.com>
References: <20200909171621.28de7d12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909171621.28de7d12@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 09, 2020 at 05:16:21PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the staging tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/iio/adc/stm32-adc-core.c: In function 'stm32_adc_core_switches_probe':
> drivers/iio/adc/stm32-adc-core.c:598:5: warning: ignoring return value of 'dev_err_probe' declared with attribute 'warn_unused_result' [-Wunused-result]
>   598 |     dev_err_probe(dev, ret, "can't get booster\n");
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   ce30eeb613cb ("iio: adc: stm32: Simplify with dev_err_probe()")

Offending patch now dropped from the driver-core tree, thanks.

greg k-h
