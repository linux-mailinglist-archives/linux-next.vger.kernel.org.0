Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE307EF658
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 08:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387701AbfKEHUz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 02:20:55 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:46985 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387484AbfKEHUz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 02:20:55 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 79927510;
        Tue,  5 Nov 2019 02:20:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 05 Nov 2019 02:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=UJLtdOaEwqfmY7P1hSDZedWEWW/
        B7GmvAucQ8GBiNdA=; b=HK0KyAv0xX5FkE2Bl2MhYXZRHxhyOpFP9o7jiYhztt9
        9prPq9c7QMeHuqTXU443EcHzQe57eMG5W8VTe3upGUPv8hRsyycFcc8/ayHcjYqG
        zqsWDi41ORfffH7sESLWAxyWwh3WkMQVMdrQVwyasdSdXuXeNDcsAq85bCMbEqmt
        XdQVaAFsr48U/NHra60/rvdJzC/0wFbw85Tkf9d05F8jWbj/Dt0cD1r790rOQkb6
        OmyNCowuXWj50hKn5SHzVU+l3Xd5b63LZ7dP9R6D4F1U4N3THrJigJkGP8KSymxy
        6dEQ4H/4R3tcrhXgWBcwsMPKxy9Smmqv/xPQfHNhQew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UJLtdO
        aEwqfmY7P1hSDZedWEWW/B7GmvAucQ8GBiNdA=; b=whBX6ZttplPe9JNGm2pk1f
        MQjoC3Btyo/kpf0/fhIWgqWwjHTGqYmdW/BVnF3hVHkcoALzYfCfZDrif6Y23vVm
        fYWbOrHRFQ5o7+vvMP1AqqzpgVrai70uzFH/t4CSmRw7GSDnmpXsLK/buSdNJByI
        gOEB00r+4+4UkTWrRSFOwDP0ghpU2NvkpWj7FQyhX+a1lroabWQrsEDoORKdIhXH
        /Fl5WRIOlZ7+VrgKNVMXICiMVvlcc9Z1JgRrrs8GB+dMBR1RvV4cugv8VMtq/5LP
        4FZC/Ba2wfDkWSuNADUYjCFa8biJxToKa3BG6/egsyfB+kAmlkRQehY5zaZbVI9A
        ==
X-ME-Sender: <xms:1CLBXSK_NBF4gBGN1X45ZcS4gnskIo_ZTqXccjAvsTqMdJWFsnrKGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddugedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepudelhedrieekrdeird
    dutddvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:1CLBXfGiEnRbccl8KpXrA84esmYpBQ5gazvIsoxd9-koOFn1anksuQ>
    <xmx:1CLBXW8WAOAzC-jvfcLIx2BBKZeCeIMDG7rTgBn4w1mYL-1N8CH4wQ>
    <xmx:1CLBXXL9JnaFMVMoJidcH0uyxvsrMp-qbfRVuEo_UIhNvNQAyM82xA>
    <xmx:1SLBXUQ9ueFBppllzY2pd7kRCsuM6WYVsITzqlQM_zJgQg4F8H8O4w>
Received: from localhost (host6-102.lan-isdn.imaginet.fr [195.68.6.102])
        by mail.messagingengine.com (Postfix) with ESMTPA id B055D80059;
        Tue,  5 Nov 2019 02:20:51 -0500 (EST)
Date:   Tue, 5 Nov 2019 08:20:50 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Joe Perches <joe@perches.com>,
        =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current and net-next trees
Message-ID: <20191105072050.GB2587462@kroah.com>
References: <20191105165313.59a5cc11@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105165313.59a5cc11@canb.auug.org.au>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 05, 2019 at 04:53:13PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got conflicts in:
> 
>   drivers/staging/Kconfig
>   drivers/staging/Makefile
> 
> between commits:
> 
>   df4028658f9d ("staging: Add VirtualBox guest shared folder (vboxsf) support")
>   52340b82cf1a ("hp100: Move 100BaseVG AnyLAN driver to staging")
> 
> from the staging.current and net-next trees and commit:
> 
>   a7a91ca5a23d ("staging: wfx: add infrastructure for new driver")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for this, I knew it would happen :(

greg k-h
