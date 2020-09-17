Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC17C26E324
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 20:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbgIQSEc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 14:04:32 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43349 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726452AbgIQSE1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Sep 2020 14:04:27 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 88A0E5C01A8;
        Thu, 17 Sep 2020 14:04:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 17 Sep 2020 14:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=7VUzACW3o+6cNDJ3S+mM87r8DXh
        kj/NUDh7FQ3+b6dw=; b=IbL8jc4Jp3PoBZc4BTkAhnE+X46z9FxTw1uK5EA8ecU
        GzeN63qs/So8SD7gkgjDxRF65XWeW2038VwRCeO9icLO+nmcOvNYbIiO0xMJIUHn
        UJeRZKRExSZHN9+I3uPMJcy1j9/E+kxXg2B8rMfbpW9GzPQZ0UN9bXOTcKhQyGnR
        cF3D9s8a+n7RWtvSx+JYt5a3KdyeKXesm46PCHe5v9Hrj0SCMMj8RJmwk1xHtWfp
        Sj60dMKaHYgB/9znbBai1uKULA75vMT6ElMphCbBZraa8XoMRRWJ3B8FtIWIvn0f
        3lltKEMRgHIVkXdEuQ4X4OLDqwEbNeHgkJAsxMZjLTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7VUzAC
        W3o+6cNDJ3S+mM87r8DXhkj/NUDh7FQ3+b6dw=; b=FFE1l4n+yPi8zXSp0qU6l6
        Ee/L73SWpiBJgmwZSgtiphFIhl0FsVBHXdwOyRQFUlTnjygPCJjTr42qyiwCwObJ
        8lYHBdJvujEL6+v4DVEC7VB9ioNzmLcjRNnPlZTIZTpcQloNGPkQAlfrUHZ8ootw
        3frT2nBXOinYrtLP9FRzL9WLMl98MuzmW47ZN95keYcCzGrxW+4KwJ6Y9xo5oSlY
        jlExrTRuT8q7t7dnj5HGaGfd7DzqpT8Gc5rWA3QkUeneU8XHD6xKpab8iOYqNAvA
        ol25RZlxcT9ffwQm7HW06GSdynscc4sM/COfkhBRvgwySzXnWZRD9m+WDJn6LD5A
        ==
X-ME-Sender: <xms:G6VjX6tWm6JZ9U9KQ7H4bzteR8tpgg5fPx1-nB95_ADkAGeDXSPR3g>
    <xme:G6VjX_ekm0Mg1_HZxPXypoWKaYYY19ieMeJHMcnVigi9gN0zYbVYGishpfj0kssZt
    DeDwNZEbYDP2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeggdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:G6VjX1x_j9woSPdtqRBR4gn6bV-RrZ2KR29R3Nf5O-tDNcm4q9N1RQ>
    <xmx:G6VjX1NOOUumCHHwITKbxt9Y59kl1LoBfu2gzaGebptWifgypqf5tw>
    <xmx:G6VjX6-vjO6OWFFqgLCrNYXVTVcoXy4sLTKSOuGzSrIv5a8KJ4ignw>
    <xmx:HqVjXxbPP3s_fs0p2b8mUrwTOKjh1CgpXtPfo9gKJ4-y_cNGZqEoNg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id C5D0A3064687;
        Thu, 17 Sep 2020 14:04:10 -0400 (EDT)
Date:   Thu, 17 Sep 2020 20:04:43 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the jc_docs tree with the spdx tree
Message-ID: <20200917180443.GA871678@kroah.com>
References: <20200917121656.4116529b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917121656.4116529b@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 17, 2020 at 12:16:56PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the jc_docs tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   951f3e9f2086 ("net/qla3xxx: Convert to SPDX license identifiers")
> 
> from the spdx tree and commit:
> 
>   51652804d018 ("MAINTAINERS: fix location of qlogic/LICENSE.qla3xxx")
> 
> from the jc_docs tree.
> 
> I fixed it up (I used the former - which removed the line updated by the
> latter) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Merge is fine, thanks!

greg k-h
