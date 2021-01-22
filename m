Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFD52FF96D
	for <lists+linux-next@lfdr.de>; Fri, 22 Jan 2021 01:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbhAVAZk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 19:25:40 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41085 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbhAVAZj (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Jan 2021 19:25:39 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id BD10D5C01B2;
        Thu, 21 Jan 2021 19:24:32 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Thu, 21 Jan 2021 19:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=pMu2u0JXdX26Iu25upndYWf4ySXL7H+
        ACYBp69Hi7Zo=; b=EyMDx2S97U0BQXR+Dztp5VgNUYP422VTe7rIBJ9LkLu2SL8
        qZpU4ToJ402C3xoN8KZaTku6Xdb2rTnCI1lhOfsAZjG+PZwzr3wRE5AjMqNMcW4n
        +QBshECTJO2r2FBTVcmfQ2CmgnmGMHe6utBipXYqhWqK3bqmJuAPQzy0T605EGyn
        InJjQTUJwzdPjCETKoQK9Q8uXWmbjmIo2Lb1QZ9wjxx5Sd1cuqKXdI6DlwDAZG4n
        1bpWSm2J/5DftNY8UCPsk32KyeW1wv+kG6c3tA9JgoZQs5KPIrvsLyh3TbfsExuG
        5Rw2wpDaGwubv5Ol5W0VWVQS9nExL+Ny1wIvE8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pMu2u0
        JXdX26Iu25upndYWf4ySXL7H+ACYBp69Hi7Zo=; b=SvvYkouHQFBgWDLhfrtded
        x/R3bcJNYdZrPL8txOTgywumCX5rTIzSkQsRqc5YyIj2i+sVea6W442f7hix1vBu
        KliO6GWE1l/ZPlZwhX7xmQtImstpbu9AKf9KfEiRVYlTU2in0WSxrc+T/aBp/NJD
        NwT5iT0r1UcVZIR7JoXsAyZSRYEFGz5wJdHDUKgmQqPaHipg/tr9X9RUyfTe8qGQ
        g4iAM+btdEJzDBp68vkUbemBWLVeF88LRYhsqATJjhfBaCCxW2ltVb2RrzJJOWsX
        7CAye+FjNNjhenyfoaLlg9EmTEd9aPWMzyeqFrFTP5J/Ipo3Hj9ATxMCqolKeDzw
        ==
X-ME-Sender: <xms:PhsKYKt0ebLF8V10zhjIu_I1eApatb97z2jp1reEldQ7_OmxDgl5vQ>
    <xme:PhsKYPdqIjy-SeIzfhA7d61cVw7Vfq8fL29i2eCFlUjFHNSBp52uwE_wsiXmK5niI
    WedPouVnT2FUKxHwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:PhsKYFzN1UuFnqmHh-vbgCYSwhtOI6FxVKKytTe5yIebqkhrOHRVFA>
    <xmx:PhsKYFOEPL4NjB-XNT3aXw3WnZpl9Wm9VE-r8To6gn51N-at-Sj17A>
    <xmx:PhsKYK-tbpGao10FTmtDsgla00bDxJUjDaGBDmwpOyCOGUEYGE1p4g>
    <xmx:QBsKYBa1690_-cMuBU7hfbkiZRdP29IMjSR1d1dmAWWSHiKyKDXkvg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D8F9EA0005D; Thu, 21 Jan 2021 19:24:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <b1d4ca80-8dde-4c74-b71d-e73ede9dbf7d@www.fastmail.com>
In-Reply-To: <b221bec1-0f04-c81c-a82b-a8cd06434708@infradead.org>
References: <20210121182847.04ee4e32@canb.auug.org.au>
 <b221bec1-0f04-c81c-a82b-a8cd06434708@infradead.org>
Date:   Fri, 22 Jan 2021 10:54:10 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Randy Dunlap" <rdunlap@infradead.org>,
        "Stephen Rothwell" <sfr@canb.auug.org.au>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Cc:     "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "Ulf Hansson" <ulf.hansson@linaro.org>
Subject: Re: linux-next: Tree for Jan 21 (mmc/host/sdhci-of-aspeed-test.c)
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On Fri, 22 Jan 2021, at 06:37, Randy Dunlap wrote:
> On 1/20/21 11:28 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20210120:
> > 
> 
> 
> Hi,
> I suppose that I have some config combo that has not been tested.
> 
> 
> on i386:
> CONFIG_MMC_SDHCI_OF_ASPEED=m
> CONFIG_MMC_SDHCI_OF_ASPEED_TEST=y

I thought I'd tested that, but apparently not. Let me sort that out.

> 
> Full randconfig file is attached.
> 

Thanks.

Andrew
