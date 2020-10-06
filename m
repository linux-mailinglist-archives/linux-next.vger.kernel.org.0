Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A830E2848A1
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 10:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgJFIbO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 04:31:14 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44201 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725891AbgJFIbO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 04:31:14 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id B79D25C00A6;
        Tue,  6 Oct 2020 04:31:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 06 Oct 2020 04:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=A0uEjs8ek2TiwpBw4iCwjm/gIfz
        YDZHLIda4slMrPSM=; b=ulBkd0T64OyDJ/OlIOUECTmcUqo2QHTWX7zo5FVgevj
        wrhSV3KJyGFQN0rurHEgjDB1jDIOJWEndsq3R0Q6xTZqcN0NNy3qr8W+yjGcQuPe
        LEVJiDh7gyRmZme2hiyfPJbSx+AtHiZMZuK5yHhoYjckyg8k9jk4iqOXz8BROjdE
        pkBAr9MRm7ZaQMtIEcVPeyEgEGZ/vu8gPW66z45Mcom2iiUthNxoLe8y4pDTy74X
        TzmdCeReg+bS6u4iLJTCm7n5E0WuVeWzHYeXhNlcrMdcIlrSzALRkZzpisIy+iZ2
        AfJF9bh3P60/ZBRHF23v/87mjJPytWGEOEDzcd1gC7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=A0uEjs
        8ek2TiwpBw4iCwjm/gIfzYDZHLIda4slMrPSM=; b=ctGZbV8LA4l7ydxU6/Vd4t
        bSZmojZ9v8MxvAqwbNzuNIpgLNfj9gYOb65xpGNf2LtBturD60mTYD7g5CdofTxH
        aGy5e8hvRGN2Cqmni9zJoW9PrP+v/ro5d5C8SMTe8SarC0CPuoFIePqosjbPHO/H
        hHs4gQ2LtBv0qXU+5522uVnXAs+bqgEdwVv21rAT4eH3n1K4g0aoK3BkJ+heiT5Q
        Ao9UnetDwnlADXCkelL87ORieofkIpWVGHLxr+2ewyZQNQChYdhigSqMJ5hUBc//
        9ZnUf5oMJ3a0eCcKqoTA9oBJXaYxrkZakQSbCS52IPgAWeexw8PHyMj+T8HzK23Q
        ==
X-ME-Sender: <xms:Tyt8X4enpkdT1-Uq0nPdeRM0MEBeV_zbl4CxeCTqSQZutMjM9-65gg>
    <xme:Tyt8X6O64gafeyQIPC7qgL4bhEfVi8CAJGqJcB64Hg0oDLNgNoKvq2w0MfjyNHCmU
    Iz4cbyKabV4VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:Tyt8X5hB3AHUz3lh9Bbc_QDl7NF4Qz2Q5EJU3zMDB80iTQAOrxYN6w>
    <xmx:Tyt8X9_puTqns5Mc0kWxLrF6ER9VRBzJp_ip2ZXCwF6h9ddl-Rs4Kg>
    <xmx:Tyt8X0uyHkGAGsu0iglT9wyzU25hqu88wZj0xuCTmXvUbHICDA5dYw>
    <xmx:UCt8X-Vk-jVakxAcWO4_F78H2lr3HXf7BDUqK3uBUv7UJGDq-aUf5Q>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9FB5F3064684;
        Tue,  6 Oct 2020 04:31:11 -0400 (EDT)
Date:   Tue, 6 Oct 2020 10:21:30 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the powerpc
 tree
Message-ID: <20201006082130.GB12331@kroah.com>
References: <20201006183506.186a3562@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006183506.186a3562@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 06, 2020 at 06:35:06PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/misc/ocxl/Kconfig
> 
> between commit:
> 
>   dde6f18a8779 ("ocxl: Don't return trigger page when allocating an interrupt")
> 
> from the powerpc tree and commit:
> 
>   4b53a3c72116 ("ocxl: fix kconfig dependency warning for OCXL")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/misc/ocxl/Kconfig
> index 0d815b2a40b3,947294f6d7f4..000000000000
> --- a/drivers/misc/ocxl/Kconfig
> +++ b/drivers/misc/ocxl/Kconfig
> @@@ -9,9 -9,8 +9,9 @@@ config OCXL_BAS
>   
>   config OCXL
>   	tristate "OpenCAPI coherent accelerator support"
>  -	depends on PPC_POWERNV && PCI && EEH && HOTPLUG_PCI_POWERNV
>  +	depends on PPC_POWERNV && PCI && EEH && PPC_XIVE_NATIVE
> ++	depends on HOTPLUG_PCI_POWERNV
>   	select OCXL_BASE
> - 	select HOTPLUG_PCI_POWERNV
>   	default m
>   	help
>   	  Select this option to enable the ocxl driver for Open

Looks good, thanks!

greg k-h
