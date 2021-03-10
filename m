Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23FA333B25
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 12:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhCJLMa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 06:12:30 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55517 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232727AbhCJLMK (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Mar 2021 06:12:10 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 9B4615C006D;
        Wed, 10 Mar 2021 06:12:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 10 Mar 2021 06:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=moI2GFSgSRCf36qbchKppPHwzF6
        CuD2PGOZg2Xc4k/w=; b=AV/JyT4SLOS6MOhl9pbsDIoVvmrYv83VrRLvYM+aEjI
        SArigcZrblgSaty/XnEGi10KzldNX/AC6PMtXr4CJFOImQK35lKDes63FVcY+ZwQ
        xCNuNZyiB29v10dHJoxGkOV50EtjKRHiMsMj59rZ40y7MDmR6pvYjzzCYvW00QEU
        LaBuEs9yoCI1LD0YszWt8HZ0Z/b8WRGnalf2zeO3xT+BzrDdAFAB6u0LGdk+UBt/
        WqUI6C0AwM/Y/1Pl0i7wGvej4VA4ZsgiNJopz87iYDjtGyE/h5pvf0kNqhKvwwpz
        AR5NxSGaKUz0s68Qfcvnbthg51rrVmDEiLMixEAkViw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=moI2GF
        SgSRCf36qbchKppPHwzF6CuD2PGOZg2Xc4k/w=; b=BWFRQwY+5/fLdiiOheUJg5
        Ws8iQHzitAJ8Hi0MzCPLhpPLcMPPAchJibB8V4OkoDduuk8uXG9ZBi1NrmiBSvRX
        iTWiKI+v32dJx5uf7sdwBm8TVPWdKUgYRqU1GcliMHqy9/1lbaEfpvzwndYVGKqZ
        hkjfMoIuFMg25YYjrkzdL9ylyjNq2A8yodIdrTf5DiJSs1+TyLwb+lHQ+I7S/hck
        HNTWqNfS4YNfvi+aYLEclvxi/yin012GUmuUIkd38hK9ydoYYXwLHuxbG3E7961b
        xMYLfhZQsuTDyqGP1oz0qs4hzVeHaQWLfckhFYxUsJsnJeW/UK6Ct7MkyYgKyWmw
        ==
X-ME-Sender: <xms:h6lIYB8JWt_n3ABdT8nTngOVcQHXzgQy9XvWHcJWTSXF-9_G-MkmDQ>
    <xme:h6lIYFvYEZBDkC8u3hwdYSnvsOVmSdPCGO8EA9I3pN4zNqPXLR4aojS4H3wFcB9QZ
    iJC8MMvzJ0wuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:h6lIYPA4P7UgMt8eFWWpaXNwxa5NyEDuz0_GdUUY39ri3GGD5tfZgw>
    <xmx:h6lIYFdKNtsef39VTo-aZA6Qcu9aEnTswIpHDGWO-hF99uT_5vjcFQ>
    <xmx:h6lIYGOVX1OCULYDgJ0hIzor-8v3hPuDi-gKftkQRL-UDrLuZiimGQ>
    <xmx:ialIYPbLNO6MyAIoR1KCX8sfwZdVHqzYKzukPo2gqdXyiL0giktZiA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id A5EFE1080059;
        Wed, 10 Mar 2021 06:12:07 -0500 (EST)
Date:   Wed, 10 Mar 2021 12:12:05 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>, Oded Gabbay <ogabbay@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the
 char-misc.current tree
Message-ID: <YEiphZVhmY4rYzbJ@kroah.com>
References: <20210310220404.086c426c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310220404.086c426c@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 10, 2021 at 10:04:04PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   15097e9338ed ("habanalabs: fix debugfs address translation")
>   ffd123fe8397 ("habanalabs: Disable file operations after device is removed")
>   27ac5aada024 ("habanalabs: Call put_pid() when releasing control device")
>   16db6b532fa4 ("habanalabs: mark hl_eq_inc_ptr() as static")
> 
> are missing a Signed-off-by from their committer.
> 
> Sorry, Greg, one of the hazards of rebasing :-( (which I know I asked
> you to do).  I guess what should have happened is that the habanalabs
> branch should have been rebased onto v5.12-rc2 by its commiter and then
> you should have pulled that into your rebased tree.

Ah, yeah, oh well, I'll just live with this, I don't want to rebase
again :(

thanks,

greg k-h
