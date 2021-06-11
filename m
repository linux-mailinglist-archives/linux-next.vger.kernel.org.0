Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8863A3CF4
	for <lists+linux-next@lfdr.de>; Fri, 11 Jun 2021 09:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhFKHY7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Jun 2021 03:24:59 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53921 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230523AbhFKHY7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Jun 2021 03:24:59 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 056895C00ED;
        Fri, 11 Jun 2021 03:23:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 11 Jun 2021 03:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=xk/SDAozeusOCiVd/AOLYjvNzUg
        FN/hAbFytA3X5bJo=; b=oTaCJV4NsUBSGGvFxgo7BUtfW8e7oJK1Jw6cF1nXTqL
        bMepTo0M/n6LY0OExElQFEaofkqbJWuEarDpiklzrdkMGRhjQDj9VLbeb0cQUJi/
        1UuP3E+QDWCjZhPfue9oVOha+ZUoKQCgu8KxacbVo+o4jZ6i8TJySX3oypzRuPm4
        tsheNYivNptqdeFbjPefyvpzVi5ohYES17nMAzlxlnk1q7pq2R83T3KLfvqBqfU+
        xoLxyWWXnyJ5WZbZIYOc9BCZy7p/gcUfKUgk9uUrtF3z0rzFJpPgVEJr2NCmEX1f
        qi3WqrkOo90KJiQzOmKDWj6p1jhjDsDThD3nxbz5CGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xk/SDA
        ozeusOCiVd/AOLYjvNzUgFN/hAbFytA3X5bJo=; b=F6sZZLNwmt5Mn6vYYEwZfA
        7yXYa9A6zxLBEOg37iJ5MgzjfYqMzWcPahAV+a7CODNTu6BOFLEQOCJDMaFYsBnV
        FrMAsfzAxjDVP43Z5+1BaEaLyYwEKZQxjSaHiJfx2peluA98VBlDmANGWjwejiAN
        BU05XDZWYvqmZggu7l42OyuXO/isjAP7fGOPFrjVnzC3IzNqYxmg8JGhPKyNtcKb
        +6TZDqC1ixEdLmPV7gNBJ5r7xdCtQJfLFNtmjPDptvRU9qIFoBA9c2wYeYYT0wSH
        NbmOIgTK80dlRUgHBNj0toUbmzXqXRtsAlqkSNRXWeTC1xinOC56ys8Lp+1+RNOQ
        ==
X-ME-Sender: <xms:VA_DYMlMNXX2q-A1WkS9pewQ95SGtC76dgaY0kFRVdH2nxFblumOEA>
    <xme:VA_DYL1j8CkkjlSlrYLOMpsONqvlzfPN9ADoC4ADq69Ru4QPkqgmTLZXW2V8gXusX
    OAD0Uqu_pt2LQ>
X-ME-Received: <xmr:VA_DYKqdkqTivUB4Gz4zOhcZRUZPv7k-lgoyMXrlsho3cGmNS6b4Zx6eugSsLoj1t6daun1-9iNb7lttN7QcUnu8pMUuXq8d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduiedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:VA_DYIlJr9VLSoD00Ky2XIxuxtRXLeQJvmjtVQ8Gdl5YBHirSxaDwA>
    <xmx:VA_DYK0pQ0x_7fa17azm8nCZD--GnC82B7cNldqI3AmhQdlWZx34mQ>
    <xmx:VA_DYPvIbMKIZDfGR6bUd8r0jEa3EQsMDX3ftQnhIGZEe9JSgN9cqA>
    <xmx:VQ_DYEp2owNJCO_Lz7kORFSJKGSYrMS3HPCnjSfeCxuPBug0If5zAw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jun 2021 03:23:00 -0400 (EDT)
Date:   Fri, 11 Jun 2021 09:22:58 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Joel Stanley <joel@jms.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the usb.current tree
Message-ID: <YMMPUvw2/ZHXzwQK@kroah.com>
References: <20210611085213.4c8379ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611085213.4c8379ca@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 11, 2021 at 08:52:13AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the usb.current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arm-linux-gnueabi-ld: drivers/usb/gadget/udc/fsl_udc_core.o: in function `fsl_udc_remove':
> fsl_udc_core.c:(.text+0xc88): undefined reference to `fsl_udc_clk_release'
> arm-linux-gnueabi-ld: drivers/usb/gadget/udc/fsl_udc_core.o: in function `fsl_udc_probe':
> fsl_udc_core.c:(.text+0x1c44): undefined reference to `fsl_udc_clk_init'
> arm-linux-gnueabi-ld: fsl_udc_core.c:(.text+0x1dcc): undefined reference to `fsl_udc_clk_finalize'
> arm-linux-gnueabi-ld: fsl_udc_core.c:(.text+0x1fe8): undefined reference to `fsl_udc_clk_release'
> 
> Caused by commit
> 
>   e0e8b6abe8c8 ("usb: gadget: fsl: Re-enable driver for ARM SoCs")
> 
> I have reverted that commit for today.

Thanks for the testing, I have now reverted it.

greg k-h
