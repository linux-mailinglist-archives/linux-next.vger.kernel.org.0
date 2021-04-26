Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F3F36B389
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 14:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhDZMyN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 08:54:13 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:42551 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233528AbhDZMyC (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 08:54:02 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 3496D221;
        Mon, 26 Apr 2021 08:53:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 26 Apr 2021 08:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=H3Ty7Phe+sDnO2HQcSm0sxQT9dD
        B5XC7OPmO4cgKZHk=; b=CD1SS36pkAU2XF7yJ3FZL2qJlbStfWDtilPJ/ZvLe9B
        sSKglEkxM5IR4q9e4csbldzvEeeQo2CqSxV8Q5a4m/BOFbd6v5ldS5xpIZO0cVR3
        0YXYmQisYsM0jvf7IPbNzhw9KE4f3Iuw0DH6XgrbUqGK+NQnvWYicat/VsBkO+Lv
        mYMlT4SMbKBqN9g2S1beHjMDOWpuXggxEbbMwBcfb9935ngBMIZmfjgNAh9QflCx
        DcYvlAT8KJTJQsoD0St8cK0NynDIG4Hhbu2dTljDNEn8mQG7mio6FuDKPFHEVJmR
        9jtkyzkW80mZysilDz7jMptjCPzGKUhErJdnPngMAJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=H3Ty7P
        he+sDnO2HQcSm0sxQT9dDB5XC7OPmO4cgKZHk=; b=FVxC5zPPQTe4/2Cx4CrAik
        9g6QWI7Y15h4JZDz2oCLmjvffdVhE0I244UzGQiyuPUtAXkvBs3D7dDZcGWq+Epj
        353rBRgoyWQKdO/z2ju+tT3rJHsCvYiFrWKhsJzKPvP6L/J/fZ9U4882ynCvPvHa
        QlGv+KPEIKqTm0TKIpJXZU5+4RIdjTaHjaP2vVjaiCFXSfUQv5ZUirEhSCsmWDh/
        KISRWNkI05E8hEnR7nfbzvZU39HWL5je9uSCXR+0bZnbsctLTP2mjdUXBsQ4UnN/
        Z7eht5K39frtUzZURur7cSUSJ4dnquqIFhwotXsP+frEwgcPAZW/JwIgP3ttVCZw
        ==
X-ME-Sender: <xms:vreGYBHcPeo9z3hKoJcfn-jS34SSgNQ6Nh0TWTNtciNOO39bbKX2nw>
    <xme:vreGYGUVsDWF8DaSHA_IYA870V6CZuNVwxmc2s-a_OOfSbEh1LLcJode2VPbyZf01
    mE9aNEwHbF-Cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddukedgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:vreGYDIyrlUG1D2FbdNZY_-0BhDvz5y6O68KGYX5Z1mOnVPFKhs2Tg>
    <xmx:vreGYHG3P-P2gtVXqsvTW-G8phDFVd-lQowGi1ykFLahwSuCAe1qTQ>
    <xmx:vreGYHVlYFdVjQKXAyojLz63iUu1ijmldZ1Xe3SE7UZiWAyIB0fKhA>
    <xmx:vreGYNddjRZRzjMmkrKYKDw-sKAuQ0Qw3ARVg5IVEgcT2noxoNC4Eg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Mon, 26 Apr 2021 08:53:17 -0400 (EDT)
Date:   Mon, 26 Apr 2021 14:53:15 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <YIa3u0RCcOf+tZMu@kroah.com>
References: <20210426224413.2ce59504@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210426224413.2ce59504@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 26, 2021 at 10:44:13PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the usb tree, today's linux-next build (htlmdocs) produced
> this warning:
> 
> Documentation/driver-api/usb/writing_usb_driver.rst:129: WARNING: undefined label: usb_header
> 
> Presumably introduced by commit
> 
>   caa93d9bd2d7 ("usb: Fix up movement of USB core kerneldoc location")

Ugh, we'll get this right yet, there's been updates posted, I'll pick
them up after 5.13-rc1 is out.

thanks!

greg k-h
