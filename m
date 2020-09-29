Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562E727BE0B
	for <lists+linux-next@lfdr.de>; Tue, 29 Sep 2020 09:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgI2HcK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 03:32:10 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:43757 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725535AbgI2HcI (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Sep 2020 03:32:08 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 259875C0105;
        Tue, 29 Sep 2020 03:32:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 29 Sep 2020 03:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=i
        agB2LUS1CCbxMstdb45o3Und7M5dIrnvWY92w//hVU=; b=gfrIyw4lobRU0cqRq
        Png8qGruUEeFaP4xF5SQaNoIgVDONkhFC+6dVCACZewyo335vM4xYXyXUqIDZcZH
        mVgquuPGGxIwaAQh3enUswKeYYAlt3NYEmPuieszpFHFDYT1oVIznpi0EuqPVsOU
        2kACYvL9tCdhOhlWnzXVctUQut70qjdVZIsU33lF3wAMqh8GR11lpe1x35TysQNO
        U5Ahe0/X5/tAprEcgLIa3IFaGN6N8Waoa3GQlNn6JDcCERUglsMJTDTjBv0PFfEd
        98a2y4QIvnNjkRkLIOgXqVwOCb/HjLbuUbfRXYq6mXKLuoA/UHGHfHNKA4MRtA2o
        utTFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=iagB2LUS1CCbxMstdb45o3Und7M5dIrnvWY92w//h
        VU=; b=ega3JuZKHw7a8CHW9DOGsMIO2Noes2zJ8PP8WOZLPSMFMhAz6QY1pNqcf
        eJwXYbBCqizEXnM3y2ShMxUry8E44J+RMvIKLTwvRDC63kriR03XnoCe6LqKuxh7
        SfkCMJ82xOXK+Zq+JvIJbr7bRrz5eC+X7LD/mpPlX59pssFvpSl7kDxwZqHDH7XL
        oDr/HJ50SfCg0z3ORIC4dE8+gnGi5BWkf3oAUaX0YOIPXvaSS6fBq1J9CckiL8g5
        ASYotn4J/ZXjc/jgtJ8fBmg/ioiJyJ8rJmsKLWpacQ7LUQZ0gezz7tcclTVfvufQ
        kiZ4mfY4yBLEPAC81PmF8N+hqdkow==
X-ME-Sender: <xms:9-JyX5WLump78Ly-r9HwXKXkiwq7zjhNmZ9Rc9PJ_0ILNs-HEvcRVg>
    <xme:9-JyX5loJzYxn7yuq30_mRCwXlY10pTtgn3ub1Hpjj6AEEY7Ys_LrtnjKXWBkIlB4
    Lrf4f7yavE7rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdejgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepueehke
    ehlefffeeiudetfeekjeffvdeuheejjeffheeludfgteekvdelkeduuddvnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:9-JyX1ZXLYkyYpU0tN779gascUb7cveCr2E9updImwjtPDMOmydoRQ>
    <xmx:9-JyX8Xf8IByEn_xs-FBRJG9oarO2_lpJixw7NKFSPiwVBP0RMJIoQ>
    <xmx:9-JyXzkJeqtigx0CUJVFTDepQB3XFi3hsyvcde-gXkLkm-jFA2cfPA>
    <xmx:-OJyX7s-2AcZXCU-SBHs8Q5XFqFxU1V66LJZay_O8OJQLDybnSTlDw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id AC5FA3280059;
        Tue, 29 Sep 2020 03:32:06 -0400 (EDT)
Date:   Tue, 29 Sep 2020 09:32:13 +0200
From:   Greg KH <greg@kroah.com>
To:     miaoqinglang <miaoqinglang@huawei.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tty tree
Message-ID: <20200929073213.GA409833@kroah.com>
References: <20200929160111.18719071@canb.auug.org.au>
 <2e36e978-1276-6b86-3956-4346fc04093f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e36e978-1276-6b86-3956-4346fc04093f@huawei.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 29, 2020 at 02:41:27PM +0800, miaoqinglang wrote:
> 
> 
> 在 2020/9/29 14:01, Stephen Rothwell 写道:
> > Hi all,
> > 
> > After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> > 
> > drivers/tty/serial/mvebu-uart.c: In function 'mvebu_uart_probe':
> > drivers/tty/serial/mvebu-uart.c:806:6: warning: unused variable 'ret' [-Wunused-variable]
> >    806 |  int ret, id, irq;
> >        |      ^~~
> > 
> > Introduced by commit
> > 
> >    b63537020db3 ("serial: mvebu-uart: simplify the return expression of mvebu_uart_probe()")
> > 
> Hi Greg,
> 
> Sorry about the noise for remaining the unused variable 'ret' in commit
> b63537020db3.
> 
> Should I send another patch to clean up this warning or send another v2
> patch instead?

A fix-up patch would be best, as this is already in my tree.

thanks,

greg k-h
