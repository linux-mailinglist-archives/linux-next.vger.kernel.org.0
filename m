Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289701C33A5
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 09:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgEDHbm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 May 2020 03:31:42 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43555 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726411AbgEDHbl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2020 03:31:41 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 955D75C00EC;
        Mon,  4 May 2020 03:31:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 04 May 2020 03:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=QkLzSMTHeoZLIZu12MQB23Bppyp
        pRPzbceduSb0gG/I=; b=m6p5BqYd48bEDFBH9otxKTog0ifKfWMz4AJAbiIdb1L
        BU4kDas243e2cAxWcGzGE5tz9GaNEdj+4EQ9D3JIH5IQ2gSr9Pt7bXwmR9UxKnIT
        r9edS0UbAhgAcTAbUWQr04Enm4iXjg3KNw6QjorJkPFBjfbO6NBqoulkxUpk7lVx
        a8E4cbJUhPMZdXqvzBu4sdHVm0Pm7ww5pFviTkogmhgM16v6g4kKgJY7jv03oklz
        Ic+0gRTc9HC3tnfLz92DiVJyW5GVJokOPO0XbfJAfWDKBPpg3NE9v/Bdw1hhaVvb
        sfStCVcr3mVOfGfnpsH14+dLgs2utLesbCqALs0u8KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QkLzSM
        THeoZLIZu12MQB23BppyppRPzbceduSb0gG/I=; b=L4OcCxIE65Csq0aM4gZrN/
        Jr6BwoolBLp1UpAVJlzyxbh76AfakkCWYKZoXayWYE1YhExxQ4QuC92shHnA/TvP
        nboOEHQ2bmtgbvJ8XGs/bipMcl3nSPOOi8pK5IR7VEGAHhO2fdhBiPYQ4BdmZi+a
        vec8pd6YPySC2O5djFLO+5h3JCBAZEKnjkh00JUzWj5VBID8KwklahRiuPZZ5q9l
        8aGgkBo43PcCCq3InGm8fDnZSd9Cmnc9WNkyNQcA12bRql69164mePERx+qOEOdR
        fO6qbUywIobvDDuNxr37HQj7uXJT3KAuPajzSSf64FpRLHdGblppMYAFUFGc4+1g
        ==
X-ME-Sender: <xms:28SvXi2oGNW4OaNQc5gXNbdF_K7TWb4QF0ORWHY4Cm3Tg1rrxiZVUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeefgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeekkedtue
    elveeuudehjeevleeggfeftdetteelkeetgfevieduteetieekffffffenucffohhmrghi
    nhepuggrrhhinhhgfhhirhgvsggrlhhlrdhnvghtnecukfhppeekfedrkeeirdekledrud
    dtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehg
    rhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:28SvXgHCZmImg3CqPTLQifcO69uFcXhGzYCaVUZsbv5a0PhmO9yKHw>
    <xmx:28SvXvUVvfB4HGUECGbVA5iMPisN7F0YyuvuqMONbcLj1QNqvxZ1uA>
    <xmx:28SvXkUhY7O_YcaTk-uwRBw6pJDobW_0dTxxxnrjmQsnO8DjgbZgDw>
    <xmx:3MSvXuaPXwK-TJ9MV984_-l8hT_wkHGhzKPDBnCOfh1OLty0GBlLOA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8E8103066007;
        Mon,  4 May 2020 03:31:39 -0400 (EDT)
Date:   Mon, 4 May 2020 09:31:34 +0200
From:   Greg KH <greg@kroah.com>
To:     Rajan Vaja <RAJANV@xilinx.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jolly Shah <JOLLYS@xilinx.com>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200504073134.GA855714@kroah.com>
References: <20200504114625.1de2c54d@canb.auug.org.au>
 <20200504114756.37a4948a@canb.auug.org.au>
 <BYAPR02MB394115C2C80B1169D282A646B7A60@BYAPR02MB3941.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR02MB394115C2C80B1169D282A646B7A60@BYAPR02MB3941.namprd02.prod.outlook.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 04, 2020 at 07:05:50AM +0000, Rajan Vaja wrote:
> Hi Greg,


A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

> Nathan Chancellor <natechancellor@gmail.com> have already submitted
> patch "[PATCH] firmware: xilinx: Export
> zynqmp_pm_fpga_{get_status,load}". Will you take it directly or should
> I merge this change in my patch series and submit a new series?

I just merged that patch a few minutes ago, no need to do anything.

I will note that this is the 2nd problem in this patch series that was
found.  I had to drop this series previously for these same types of
issues, which I thought were fixed this time.  I think you all need to
do a bit more build testing on your end when submitting patches please.

thanks,

greg k-h
