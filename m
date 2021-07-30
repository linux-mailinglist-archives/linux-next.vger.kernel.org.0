Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11DD23DB9DF
	for <lists+linux-next@lfdr.de>; Fri, 30 Jul 2021 16:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhG3OAR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Jul 2021 10:00:17 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35965 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238961AbhG3OAQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jul 2021 10:00:16 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 475E05C0136;
        Fri, 30 Jul 2021 10:00:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 30 Jul 2021 10:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=AV6mcwgLoFgtra4SJrg+KJHj+RL
        GMs7+Cx0G0YGXzC8=; b=B6tvhyEXg8sJgiz69X6KSrNPcR/PEWakRR03lApaWXD
        Qd5SN5rJVCCVe+rgXqGSeKwtt5nafUSYxkHCviNEQSZu/SmcpR9SGOqUJFTmIjH9
        zWs1Q2+7k8qDWlpaQfl6cQLDM1bS65DDlNLsQgG2vR6VVIDr7jh3uMZBmsCl19Fk
        qGWIU9iM1qJQa4BZoVR5wO3qQy2Lkyw1+/8TDFbXSnXS2MPqCIVy09m7/4p2NlPZ
        Sz9byk+aGDXhWS7OTJENysDLTAmCgkjKYt/LefqZFfiJtXbr7xL/9UMf4vytKHvu
        rYCrCRh4seGD2ye/qMiVaDgrOLNXwAQgRrF0G1gslzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=AV6mcw
        gLoFgtra4SJrg+KJHj+RLGMs7+Cx0G0YGXzC8=; b=BQnboKZAOYIuMe5tD3atFC
        jcuMC8xJ/V3ZG0FnCCAsDWv/vCvJmyt9/OOrKJcwvCLKix2BIv2h4knFGvNlKkQo
        V+VmXVTtY1Ej4c0LgSkHUCAsTdZ+hrZjT29txSaer+ywte037UjbqjACfpXqxRzP
        h0lRMAsLcHid5saqePCTKTuouYtFSe8GPbtpwWDWngpoKElxCOmP4EbvxVCY91oh
        DzeEAIStd2tKsEJxuCMM0SeiVkwOruNryIxVVrqq+bEtnkkwDydEAeEgv0warIga
        KH+k6Fz8xdxX0bJKAkzC344pl/RZesvX97wQvrg9g0DKh4SF00zdOF1omowmGmCg
        ==
X-ME-Sender: <xms:6wUEYZU7vu5h6D-GOhQnxOUU99-ixLa0GflLKiu_bDnhtxdf_8ijmw>
    <xme:6wUEYZlY2ftI575gwPnrJcM0-dcGAlsETg_jNG-N9rwJchi2uwC4cFU6bLKYW4Vq4
    YOqSh2ErHaRRg>
X-ME-Received: <xmr:6wUEYVaHkNOi-7MqoLwKaI2DjHzXnirFgEj3YW498VJpVEUOIeEr3fd7NLcBuDB5JG2ZTtHidFuI8f5zY6lS0UZzLJHzcFnX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheehgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:6wUEYcVPTIpJqL9bNxr2g5fOsC8Sc4LEmaTHLqS0vJicWg976gn-ow>
    <xmx:6wUEYTm5CA7KH2oiz0QnN2ZbrgmeCEyni2YNDeG2_-mSfncLiMRFxg>
    <xmx:6wUEYZevkn-tn2j9t2Qv5oRCu80qZ-D97lOc6YeeG16rKqFZzInHUw>
    <xmx:6wUEYcA2ci8d8Dc4t1Wtf7eXddIB81jmus2NsQltYRBgXFwYHG2dRg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jul 2021 10:00:10 -0400 (EDT)
Date:   Fri, 30 Jul 2021 16:00:07 +0200
From:   Greg KH <greg@kroah.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: build failure after merge of the staging tree
Message-ID: <YQQF5/XhsxtZgj/Z@kroah.com>
References: <20210730135219.21723-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730135219.21723-1-broonie@kernel.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 30, 2021 at 02:52:19PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the staging tree, today's linux-next build (x86
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/staging/r8188eu/core/rtw_ap.c:22:10: fatal error: osdep_service.h: No such file or directory
>  #include <osdep_service.h>
>           ^~~~~~~~~~~~~~~~~
> compilation terminated.
> make[4]: *** [/tmp/next/build/scripts/Makefile.build:271: drivers/staging/r8188eu/core/rtw_ap.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> /tmp/next/build/drivers/staging/r8188eu/core/rtw_br_ext.c:29:10: fatal error: drv_types.h: No such file or directory
>  #include <drv_types.h>
>           ^~~~~~~~~~~~~
> compilation terminated.
> 
> Caused by commit
> 
>   15865124feed880978b7 ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> 
> I've used the staging tree from yesterday instead.

Very odd, why is this not hitting it in my builds?  Let me dig...

greg k-h
