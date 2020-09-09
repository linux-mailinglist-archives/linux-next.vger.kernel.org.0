Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11F5262926
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 09:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgIIHlf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 03:41:35 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:49663 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725826AbgIIHle (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 03:41:34 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 7A7573A0;
        Wed,  9 Sep 2020 03:41:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 09 Sep 2020 03:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=NOoNnSLry96ghkpKyZi33e5/if7
        J5y/CnHP8cELn0SM=; b=b86SL9oLP3SQFqC0LsMaCnSoxIu9bReZg74F1I3p64I
        fgHAlRtVAKnVw74NrlVXPmRRqh1Qe8ywCwiVpYWtxJ+CTm9QzSWC+mGZoWoSHEgK
        zMFto7danDXnZ3WqqVC3v3vIxYAq4IcNz2rr4nv1EZRKf0iZmesnAQGzuG3b+97z
        RgeDmHN4kCqt//iCJ4aQ8cF9/vsstp46SAiPu+Vi7UM35Game9zZMUprS3oiSrga
        ScBMSh0KM90TKStRPx+sU8St6+tn1p19RVLiW+OuPXOmYCw4osSfQ0F106qnfI1I
        mmetUz01Z7oC/iqlIoSuQv1FmKjJuZkoAMzMIZK1x6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NOoNnS
        Lry96ghkpKyZi33e5/if7J5y/CnHP8cELn0SM=; b=Spy2W2ONBiALJyEt7BvWSq
        0W7Z0o84+k6uZyfPQssUvrn1vVK4wMa7KOdt7QYKAY2qGjiC6RgPRsYst72eM3K8
        lxvI0/gjyziE1Qo22WwOx8c3oDxHZAQOVjzzKkM+L+otaKIEvi+OHzoeix0Ga5B5
        npZ2UFbwDIf/Mz/6CkTr0xSUckMyjek9rs76WsRKvxpPh4MvEHZtEBXbvfadaL1Z
        MPcnUSeuAKnLJwhN1w1CS3NT2grJRGhOhaGerJwgaa5cyx3xeXabSSZcu41XOoC/
        TubQ0kbDCPvBAN1wyP9lH3yw0xPi1zhMcaWvhe1U6DlTM6SQ45QZG2mxWW4bpQTw
        ==
X-ME-Sender: <xms:LYdYX3MrM2Ds2bqtA6n94l_jYAGLWbHsV5Q6jbB55OYcqZzc23pb-Q>
    <xme:LYdYXx_uzP5heL4KE22rzsGjm71eZPA8halIEAnW5TtLVNgN1rc3O-K9QX017Lf78
    z8zZU0V8cgQWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:LYdYX2SVJfkY8i79FZzfTePTdSaVxnwet3OjKPLRZ7woBXQaLMJ66Q>
    <xmx:LYdYX7vfS47hbhCaqadNwPJBK4JBqyoAYBBsBJ13xHwqeMctMy0iMw>
    <xmx:LYdYX_cI-Gd7ktElcOwGbmVKl2xz1BIF69uZKgVfd0GQbheunAk72Q>
    <xmx:LYdYX3EHGw6FrVld7z0VZdDmJJvcOJMhEc_QH8ENhyKgv2bimaPMPA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id B0F133064A9F;
        Wed,  9 Sep 2020 03:41:32 -0400 (EDT)
Date:   Wed, 9 Sep 2020 09:41:43 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tty tree
Message-ID: <20200909074143.GC561485@kroah.com>
References: <20200909155654.76fe3bd6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909155654.76fe3bd6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 09, 2020 at 03:56:54PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tty tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/tty/serial/8250/8250_bcm2835aux.c: In function 'bcm2835aux_serial_probe':
> drivers/tty/serial/8250/8250_bcm2835aux.c:154:3: warning: ignoring return value of 'dev_err_probe' declared with attribute 'warn_unused_result' [-Wunused-result]
>   154 |   dev_err_probe(&pdev->dev, ret, "unable to register 8250 port\n");
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   ea43a60b1548 ("serial: 8250: Simplify with dev_err_probe()")

Offending patch now dropped from the driver-core tree, thanks.

greg k-h
