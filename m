Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A1330867B
	for <lists+linux-next@lfdr.de>; Fri, 29 Jan 2021 08:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhA2HfG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Jan 2021 02:35:06 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36323 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229463AbhA2HfF (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 Jan 2021 02:35:05 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 1A0CA5C01BF;
        Fri, 29 Jan 2021 02:34:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 29 Jan 2021 02:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=2Iv/h6y8prc+xbluEd/liuCbI84
        4QOZE5eOtTk1htoY=; b=d7epQ5Qqft+KNVcH40ESV9HgYQ1rV3wmxDNWC/DGJwg
        Jlv8hDivyh298a7NJc6ETxkqDHjW++spmsm9d9S8fDd4mkpKcScwmsUbU6YbSGik
        Y6rBPY1fSdHoai5IS4i2QoQsKAzvkBUU/iPyhhBlOh6YiqvC2KY4Tua9EXqzhxWA
        jnGuhFObL3VJ8WEmK0eL3xn9efDusRYDTB21zH7lDNgFfsfuC0tXKjElkHRI/ENT
        4BxX+WLLGU/NHMMseKxXoBDO2jnUV4/LtWPPn3fSlkDFQ78NB/znPI65P9P+Jouw
        1nUDuXqmUNxkh/uCUT3ioJlWeFDxgseEphMrm2qjwXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2Iv/h6
        y8prc+xbluEd/liuCbI844QOZE5eOtTk1htoY=; b=rXuJQWV4915Rpgdjqsbgri
        /nUV47fR9YYFTsZmmgozSTRnqRBo1ZhBZbBBRIsWuUsqnytHGnhk6Pkqv3P9uG2S
        TecpCahox+Zwxjash4+t7IoUN3o8Pu5fcw0sHtV1sUdq9v0Q7DwmxJarLPP0vUwh
        rrJnVGvvNh5WX/H5wW0maKbo7ju5ybzvltAb6U0LV0QVXbO3vp05poJuOO0EbRBm
        2MhxGuhcY7BXONFQj+NF3imt5+ORJTbdnT1FO03qhjkTMcNUkUPGDal3Kgf2n30k
        OglHxlCTTj9B3S7DJzvumMwSTaFIoy8/8Lm5czeZ3KUcgt57vzlKjQqYiQgtfe/Q
        ==
X-ME-Sender: <xms:eLoTYBdebRtW5rMjeOn8jIggJZLewh6f4AtZae_SzF2hSKlz8F3gGQ>
    <xme:eLoTYPPVQ-crL0KTF5n3E8cRDUjN0bEgOKnY-BudHczZMoidLFO20H6P0a01qm-T0
    bAXUWNG5wt6Hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedugddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:eLoTYKjCfld8xjbhkxTZndIWVrMBR7XN1XEpCRLUgScZfPCYug9udQ>
    <xmx:eLoTYK89n4urdLGnHiVrYJVFRbRw7cWz5wVd4mwFki7lflMexkun8w>
    <xmx:eLoTYNtB0F9vDal4tsu1DgwIN2PjVKP6gRe3oSn5OdCMTZ5hHD3rLQ>
    <xmx:eroTYFLvXU3JKeul1w6MubBAaeT4kHMBmQ1xhQzpvjo55WxXrrAAdw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id AE9C424005E;
        Fri, 29 Jan 2021 02:34:16 -0500 (EST)
Date:   Fri, 29 Jan 2021 08:34:14 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the tty tree
Message-ID: <YBO6dpug0zkHcdE9@kroah.com>
References: <20210129155341.1868ef9e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129155341.1868ef9e@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 29, 2021 at 03:53:41PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got conflicts in:
> 
>   drivers/tty/n_tracerouter.c
>   drivers/tty/n_tracesink.c
> 
> between commit:
> 
>   3b830a9c34d5 ("tty: convert tty_ldisc_ops 'read()' function to take a kernel pointer")
> 
> from the tty tree and commit:
> 
>   8ba59e9dee31 ("misc: pti: Remove driver for deprecated platform")
> 
> from the char-misc tree.

Thanks, I knew this would happen :(
