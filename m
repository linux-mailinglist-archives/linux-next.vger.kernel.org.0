Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2EC0262922
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 09:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgIIHkS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 03:40:18 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:37937 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728207AbgIIHkQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 03:40:16 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 49361B5F;
        Wed,  9 Sep 2020 03:40:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 09 Sep 2020 03:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=X/RsFQ5HlelnnKT+1vSUuFaLunI
        ADUqucIeToVv5e7U=; b=nmZLQ6+M7wipsv5xIEOQ5/ZVBzhSox7qiTSL9wBDZK7
        +/n363NMSEqVLasoF5rZ2n34zy7xunUyoUzCvZvROY92j9MVuF3RodLciV1FKRGi
        8RK0+QGR6r/4bOm9v6d2spS6qowWr6o707aTXTAlvSDkJUQ34PmKkqA+PxoP+Zmg
        kmg+Nj0e9ckV0ZwZdLyKQtKfamKV2zaTlYV+DJsHQJD1UMTnPOebKvE2wSC3v9QL
        vRdFv1PcvNac5d16vmZfaAhqCfnwYIoIY2tU5AsvIpyZOTEct87al9nrLIYXQY56
        yW5h+KvWLUk+krvSVp54mao2EGcxCnUjFbH3STUoksw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=X/RsFQ
        5HlelnnKT+1vSUuFaLunIADUqucIeToVv5e7U=; b=tuLo8PDK/HhNWEbx450ilQ
        5R6rAxNgmFsScEQd9IGdJOujrLWvXbe/K7Q7W5n6rPEkNW9ZK3LGkDHR9dbG0/Vj
        GuibySXwpQjP9glpiC3qAaAveKJezbjQYl+sZ13kd/UVhVkMDg/Co0+xVSanZADW
        3U7Mw+K9Iwh+ZftqzHfXtwas3zCjXF0y0/FnDRnSfgAJ9mmf5Dumu5Pkb5YuyVYe
        qp4A/vJ17YvGDTrFHMDaMzDWvbd0HvJ+wO79xi2OZt9iiPY696+UHErvM28uNGgJ
        4sajZdOorhVV1bDZou3Bs78PU8GXNbQcylqkk0zhOTHwnt5YodU8m4Mu4EqH51Aw
        ==
X-ME-Sender: <xms:3YZYX_QaD9j_FJvcg8ACp2Y6-3w6PeBPr5czz8jgIvSsNiHerUNXaw>
    <xme:3YZYXwzOi0nOhh3dAiRanorIsKfY5xQsyxCSwt7MnKViHyDdA3_4o-MreRCEREKSw
    d5ofZ6VBmDHRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:3YZYX03bFT5K7Riu6r_DgR_3peNJsOuGL-rzB4zbtGl69j41uUoe5A>
    <xmx:3YZYX_D5NEgB_9JxWMtx_Lx6N0LoNDHbKK98NFAa36AcSvDy9KuSHQ>
    <xmx:3YZYX4jPnxzgnzitydXHFvZs9RpdTOyIrNhl7jxnMICu4-Vkukpbog>
    <xmx:3oZYXxu8MFSsl1JHIGTNKG4gz2AQcGw0oSiZIpUqBJz5mmLhrXDM9g>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 798143064AC8;
        Wed,  9 Sep 2020 03:40:13 -0400 (EDT)
Date:   Wed, 9 Sep 2020 09:40:25 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the driver-core tree
Message-ID: <20200909074025.GA561485@kroah.com>
References: <20200909172317.170984de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909172317.170984de@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 09, 2020 at 05:23:17PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build produced
> this warning:
> 
> drivers/mmc/host/davinci_mmc.c: In function 'davinci_mmcsd_probe':
> drivers/mmc/host/davinci_mmc.c:1243:4: warning: ignoring return value of 'dev_err_probe' declared with attribute 'warn_unused_result' [-Wunused-result]
>  1243 |    dev_err_probe(&pdev->dev, ret,
>       |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1244 |           "could not parse of data\n");
>       |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   e1f82a0dcf38 ("driver core: Annotate dev_err_probe() with __must_check")
> 
> interacting with commit
> 
>   3a35e7e1bd50 ("mmc: davinci: Simplify with dev_err_probe()")
> 
> from the mmc tree.

Offending patch now dropped from the driver-core tree, thanks.

greg k-h
