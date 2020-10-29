Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B9A29E721
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 10:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgJ2JVY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Oct 2020 05:21:24 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38353 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725803AbgJ2JVX (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Oct 2020 05:21:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 3E7805C00E3;
        Thu, 29 Oct 2020 01:22:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 29 Oct 2020 01:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=O/vbVAWU5hJ9PibzVsJDqDex3sz
        6mycigPeBpUsyuNE=; b=cbBmqTB+zycWnQwyOILmwrPiJuaSSPn/R2Edtrjjn3x
        i0hJqUoebuMazeK+LhHxaEP1UJvH3R3RfcZk1nW3aN7QXzNBBEj6nZbODyUBJm6N
        9wMXsR06+ajgmgHp2EZLemdOKvJiATpWLTz5WZ2vr4TDILZRZ77cLDeHdyejOGVK
        RmnUAsNaTbXGzHiOI0Ic6OshreRTURf2h2SYnpmsIwc5wjke2YKUsaXutUDfjPgF
        cWZcXZxQJVP9/IhrtOoMgdFufTPx0xDG2LxZQBDhxrw5FpXpA115oh50V1la/NW4
        ZFX6A6bZOQYzAGIzUzPWg/cQUmNFzXblllAiMze1tZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=O/vbVA
        WU5hJ9PibzVsJDqDex3sz6mycigPeBpUsyuNE=; b=pLAzjbPEx4EwfWGuFKdD6P
        f/cw0/N7yazEhEIZ1FbjvSkPYVg8I4W0vJenJoH2t6X3lffM9WJ+xRyCT0nFFVRT
        08XB2KSgB9sPxHHj+7qJLfoHJD+NKcPsOcq9xUyewr2WsKSlE9HZT/H9zgnvTvdH
        Uj3wRGC9YnuwJJ5ztMrJphWmEY9w4tr+BpKYq1i3cra+gl5z8vmccXRLEdpqoZpX
        jQUPYQfe6QZvbxovMuhvU5IBORoCC27wziwjdQ6034zOshOp4crCmGjxXtYgRyeN
        v7j5Ilp8BBuu6giFoGjRWSUL9GO/Ocqckm5golIdosGQFOazozr4Fd1ln8V9Dgmg
        ==
X-ME-Sender: <xms:lFGaX5hfKZeEc7aT0YUzyK536lu9fGaU0vuwdlM1pHjXID781vrxOw>
    <xme:lFGaX-BflsCJwX9QDuXalcIJ8cEsZ0n2udMBCFiTkgLmWgi9DihSRuV2LwRXa5YrN
    llFEi-rdrOBDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrledvgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:lFGaX5FqCrQWnCfbGGmti9yCgq9Sw7DjQEb8b9pV7X07VoADrjoJEg>
    <xmx:lFGaX-QRvUSRddVlNKgLvjmBMolHc5vge88sFXo0_mpMCkp5lQTxUg>
    <xmx:lFGaX2w6B5UTxZRQGoV-DPJgKSH0icORNtw99kK0r1Nn3FsjrU9Rgg>
    <xmx:lVGaXx-pnvWS-rPVrqyxADgEZ8jKqMUsGmTQQJSpe-4plEVazq0CCw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7DC6A328005A;
        Thu, 29 Oct 2020 01:22:28 -0400 (EDT)
Date:   Thu, 29 Oct 2020 06:22:25 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shuah Khan <shuah@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tommi Rantala <tommi.t.rantala@nokia.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 kselftest-fixes tree
Message-ID: <20201029052225.GC282324@kroah.com>
References: <20201029132713.3a41c80b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029132713.3a41c80b@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 29, 2020 at 01:27:13PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got conflicts in:
> 
>   tools/testing/selftests/android/ion/ipcsocket.c
>   tools/testing/selftests/android/ion/ipcsocket.h
> 
> between commit:
> 
>   08c5d41130e5 ("selftests: android: fix multiple definition of sock_name")
> 
> from the kselftest-fixes tree and commit:
> 
>   e722a295cf49 ("staging: ion: remove from the tree")
> 
> from the staging tree.
> 
> I fixed it up (I just removed the files) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Easy fix, thanks!

greg k-h
