Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BC9262E88
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 14:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbgIIM3P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 08:29:15 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38351 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729942AbgIIMXu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 08:23:50 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 62B745C0115;
        Wed,  9 Sep 2020 08:22:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 09 Sep 2020 08:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=2SOLSpPpbJ6alM6o5mTR7VtjcY7
        hlGA+zbD8ILNxWF0=; b=kjBrjqy3FxBh+WZafGd1T+kZqsMcFGYVw1edzheqpQP
        ahhVBONmCMZqScL6k5LYlXrhG9p3w4uV2ZaHWGGVB7l3xbO6FwZvF0CZDx7S5XpK
        Mf4MsW7J/5pnhsj+jOw8h5gObwa9/X1eVDzQDVILBytLy4EUMyHtZEdR+fIopcxd
        cDmVJOK95raiRhPANFLGSi0X4MKL4qucuYHRbYXbApoqlvbpGI1f6mM0UIvLRG/p
        x86uDo3JB2cYWQ5LkZUKx4RiIXXuXZKoXVH9yzBQ/TSWQxg4gtNHZ0Q+ac9VwszA
        8H+wAYRdVjI0MKRhWWFwR3N61qPrzj2zeLTj1fBxfrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2SOLSp
        PpbJ6alM6o5mTR7VtjcY7hlGA+zbD8ILNxWF0=; b=VKQVjDcwQMybEhQiiYZBBX
        RPe1q8SkCVGpM2Ezl5nmi0+l5HuncakjKNNxr8rRdGflRmMQL5HWB6dSdNeCDN+R
        EU7vnXYkpPBM+GhrpKTNpviFIk9zCfP+7aImqtZ6/9XFMThcTuamxp9D1C9VnxNP
        qSwmKZ5HSqCXJmPQUYZtCUofsnw/+TBePc/W2CXKjJ80d94s2SQNQNFDT8AZT3v0
        ejpInU0463dcRXr0HhaaA21Er6T2tRavoKVemzrxdy4J6pvkjUXMlIdl/kDkk0r4
        aAqKaVCcukYE85lcw+Hl7nVZtckA2meksDFIGRMVa3PFBIgYF7WRf68vOG6s9I2w
        ==
X-ME-Sender: <xms:98hYX8wTviGOxptQIEfqB5MGLGmxe1ZXqNUAk2FI7Mye3Xlrs_zGig>
    <xme:98hYXwTSvZMsBqmQnsGLcLJOT1zGhRT2lIWRMCaR4MbzKbXJWsQ19dglx8Nw3fj4E
    BMQfCe_2quspw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehhedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:98hYX-Vbkn2pzgxXIC2hFo9uPfGS3fxh3YXr7y9NPQ7ex8qA_JvhhQ>
    <xmx:98hYX6hK4Id1xOuht8yew7ZjzIQ7l1Jyxku2A2863LmE0N3kiW5s3Q>
    <xmx:98hYX-B9thw4mHijU9v-Le10sBQm58bvQwtvk7A_aTE7Sqdeqy58LA>
    <xmx:-MhYXxNn3xnbeeR5xfteWQ7OEvnCPwhDISF_Iuo8hNVKZK-bTmgQOQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 26A823280064;
        Wed,  9 Sep 2020 08:22:15 -0400 (EDT)
Date:   Wed, 9 Sep 2020 14:22:25 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jim Cromie <jim.cromie@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the char-misc.current
 tree
Message-ID: <20200909122225.GA668220@kroah.com>
References: <20200908094317.6dc1cb2a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908094317.6dc1cb2a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 08, 2020 at 09:43:17AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc.current tree, today's linux-next build
> (x86_64 allmodconfig) produced this warning:
> 
> In file included from include/linux/printk.h:7,
>                  from include/linux/kernel.h:15,
>                  from lib/dynamic_debug.c:16:
> lib/dynamic_debug.c: In function 'ddebug_parse_query':
> include/linux/kern_levels.h:5:18: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
>     5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
>       |                  ^~~~~~
> include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
>    14 | #define KERN_INFO KERN_SOH "6" /* informational */
>       |                   ^~~~~~~~
> include/linux/printk.h:369:9: note: in expansion of macro 'KERN_INFO'
>   369 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~~~~
> lib/dynamic_debug.c:116:3: note: in expansion of macro 'pr_info'
>   116 |   pr_info(fmt, ##__VA_ARGS__);   \
>       |   ^~~~~~~
> lib/dynamic_debug.c:119:28: note: in expansion of macro 'vnpr_info'
>   119 | #define vpr_info(fmt, ...) vnpr_info(1, fmt, ##__VA_ARGS__)
>       |                            ^~~~~~~~~
> lib/dynamic_debug.c:388:3: note: in expansion of macro 'vpr_info'
>   388 |   vpr_info("module:%s queries:'%s'\n", modname);
>       |   ^~~~~~~~
> 
> Introduced by commit
> 
>   42f07816ac0c ("dyndbg: fix problem parsing format="foo bar"")

Odd it doesn't show up in my builds, or in 0-day :(

Jim, can you send a fix for this, or is this due to some other tree's
issues?

thanks,

greg k-h
