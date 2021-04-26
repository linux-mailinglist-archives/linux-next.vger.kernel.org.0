Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1036236B38F
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 14:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233376AbhDZMye (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 08:54:34 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:50967 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233262AbhDZMyd (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 08:54:33 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id AD7FA1669;
        Mon, 26 Apr 2021 08:53:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 26 Apr 2021 08:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=SJkxioAFqP3AnKW2nmESeAKEX4P
        5AWVlOsZB0fraRrc=; b=cx3kHJKCAjvz/2otcKGdmDqh+MeluLQsGreebh/aS4o
        PF/ITutfuy6zHdsIPjlsAR2yRph6jXLayPfUU3IOt8UVzmP0myfyaG2JDeEEuNJH
        Y4HXFIB9JhVqgbQVqUdCizXzwNsWwxC7qqHUDm3kmvkfHNNBnUpLLLU8lsepRdaq
        p5JMjv4BhAa7ANCs34+QXawKWf9sUQSVoK4pRcwkWZ37IzNm08HdrO5T+IGGEuNR
        OZf5DCJ5Jyewdo3C8Rqb0iFFUWOOheI++GveTbXW2aws6Jf/I3BgEGig/xMdyHM7
        oSKp8QYwGvEpXK+djU/lSamajWbx9IW+f0q4taog71g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SJkxio
        AFqP3AnKW2nmESeAKEX4P5AWVlOsZB0fraRrc=; b=gCT6Lt53gjCWX4dJByftkd
        QWTRg3k8jxzIrmypLo20up9pXKNEXsJgXS57rKoveYYRXNObwJ5heqYs/JjNAwa+
        B84xfiQQMQ/G7XLc0oypurz0cnzwJQmzcQPTozfeOl9Pu3GiSHUHZ/YVYpNEEswe
        +gdS27drqvLUGbEj974SjTSxflQLoTSskObqUHPYeo+XdGmOpyNXkDsI1Zgxlydn
        DOH1Afl1MX54/bmiDRTIEcTWhedMEJGXK2hgxrY9/KzGiQKRvXjlI2C4UL5fSkhr
        PD9QvwnerBZnyWuDHKHgNvhdi/a4JjpWNLWCUHjumHOIThMsGHMCZHinLPysdECg
        ==
X-ME-Sender: <xms:37eGYPybJci44lF73xUUsoa0qgkL5kVbE6wUiJDPddBfvk9bHj30qQ>
    <xme:37eGYPssO58zi4PpfevkaqWkmcd5VyY5g_dt69527ZUoWBnxUxLuW2cGqkxg_UwgV
    ZodEkOT27cFzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddukedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:37eGYJwY7ftJQ3qR4dmuRtoUEX1Qx3BX0j_1EyTwrluoMl9s8DL_Dg>
    <xmx:37eGYKBxVaYsEDMRG9x8F95LulzSs89gta8G4ZRZyigpR40xa3XoCg>
    <xmx:37eGYPc_J6WL-F4poWVGrq99N8jLWmwo5immYhx0Jo8-SxffAHCoSg>
    <xmx:37eGYGFfPHcBKyNlwqiTY27to0Jj4-7AEr91570517Fnyr3dZCzZCw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id E1985108006A;
        Mon, 26 Apr 2021 08:53:50 -0400 (EDT)
Date:   Mon, 26 Apr 2021 14:53:49 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <YIa33XMckeamVe2l@kroah.com>
References: <20210426223733.6aef5612@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210426223733.6aef5612@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 26, 2021 at 10:37:33PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the usb tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> drivers/usb/dwc3/core.h:865: warning: Function parameter or member 'hwparams9' not described in 'dwc3_hwparams'
> 
> Introduced by commit
> 
>   16710380d3aa ("usb: dwc3: Capture new capability register GHWPARAMS9")

Thinh, can you submit a fix for this?

thanks,

greg k-h
