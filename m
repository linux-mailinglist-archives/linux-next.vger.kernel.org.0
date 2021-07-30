Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25E7F3DB9ED
	for <lists+linux-next@lfdr.de>; Fri, 30 Jul 2021 16:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239084AbhG3OCu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Jul 2021 10:02:50 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:33569 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231137AbhG3OCt (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jul 2021 10:02:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 9367E5C0093;
        Fri, 30 Jul 2021 10:02:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 30 Jul 2021 10:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=AWxV+BgGTu0QHIp9fEqiV3+Doi0
        FTh+yjS3KUrF3PGc=; b=CPCT7PPLiTfNf5fjTf3qyD53d41gfk43HFScQD/1QqW
        63Lm3fnVvoRD4UJXBhheUt8BQTIBcGWP8yEAkl4iCH3XTnooZRNeHKHEQnL3Lz9V
        4gU46SR1gH402hDOko6QwIJV5lhM9ZO4c3W9OLVlzFBlDfhusvPVN3ih/cSbmaEs
        AuapVVbWYVL9eOd6rBK0DNnm56Dv/W2OJQ953X9CNfhY0AoijOkNt+3L2bhV+f/1
        CihxpxTIs/nzQpN3wpAIk0i6c6pfAM1UkbUGn9z2TUHR2RkPgHmMeDc9eaK74OFz
        tBg1ekgPL4ip6FxLYDjOXPm7o85JDVWLkU8ebWakznA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=AWxV+B
        gGTu0QHIp9fEqiV3+Doi0FTh+yjS3KUrF3PGc=; b=JfIWpRDL9zQ2Qs0G7fe2KE
        GkvxQRHD6jTVfbVmqufw62ziomFzHrT9BfdTXTZIyinManMiJA2G1zNNI1Szp9LF
        tDBDaXXhC1Ul5r0nBRRrLG2DGJb9edl8m2AFN7ho0HuuFhdCDsUl7bpz3/EkY8DE
        29+u0QExhgXG3UHYZij9He4JYqe6jMBy4Piq+gSRr0COYZMIXlZEwJrAUDzcJ7mU
        C2Uhy7VgrDFDAvzjkQuTXVjp6FMfFp/FldatRk3roz6fV3l6e4GfzHjsv1B2FoLn
        dKUATAMQfU9rf24Oueto5r5KGTFZe/vECExfT6QIsZR526dw87XZoF434RKOCGqw
        ==
X-ME-Sender: <xms:hAYEYYy24qZVSzDBQmfo9ytlqG__5L8hWKOcnBFGMaUYrD6PKK5lrQ>
    <xme:hAYEYcSdj7cMIqrnC0lUHZQ8WUBcUoEQ8hKRVNEVAy4aeOPA2eOY1-XlGB-Ut3ueM
    7dsbALITvGY4Q>
X-ME-Received: <xmr:hAYEYaWc9I_vm-Y-0sMdbBM8q-1EgI8ewsbUzXCwsfXkS1FflxKLzw0jiwNJMCUyGx6QaexqF6Gh6bKlv50k17HkcXE99jRB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheehgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:hAYEYWhc4tIi588BtQHMEDtWi0PRn4D71SDwdV6BdK8EJlAPZlOeYQ>
    <xmx:hAYEYaCMisXU4DInAMKTRP_RBf8pG8i31IIyAUFYBsr2uO2u-eVKQA>
    <xmx:hAYEYXI8vHqJqz61O3LAZnU2RJpvL7UIpD84qI3zYrbiwr1f3Sjz2w>
    <xmx:hAYEYc3W2ge9vWQd9W0T-ZBnupQUjtOLvb0A4JOU-nVZWcUQy6h0Xg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jul 2021 10:02:43 -0400 (EDT)
Date:   Fri, 30 Jul 2021 16:02:41 +0200
From:   Greg KH <greg@kroah.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Phillip Potter <phil@philpotter.co.uk>
Subject: Re: build failure after merge of the staging tree
Message-ID: <YQQGgReGba/Ld40y@kroah.com>
References: <20210730135340.17863-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730135340.17863-1-broonie@kernel.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 30, 2021 at 02:53:40PM +0100, Mark Brown wrote:
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

Ah, are you building with O= ?  That might be the problem here, I think
I had to fix up that mess with the older driver in the past...

thanks,

greg k-h
