Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7343F9961
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 15:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245162AbhH0NM7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 09:12:59 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:43373 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232767AbhH0NM6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Aug 2021 09:12:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5E584580A17;
        Fri, 27 Aug 2021 09:12:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 27 Aug 2021 09:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=bkR1Q1QpGYWyLY9OclKKSQyOpWv
        3rkNsGzg6KtErcvQ=; b=SMPCX1uzkWNEKE2KKOZGeqi4LcN/4X/yLql5VY79sH5
        YNobd09+hrfpSWtL84k5YbkBPLEUa2UkTRIMr+BzXy4Urw0VCoV42JIVNgZTkQtx
        dwcBRdgTyKSaSm3o6vBsO98DO5ddX7J754bCCzZHgK20+fFvMlVbf/8zwtp+aKwt
        9yq6trb7CwS8LX74MFKyFaPDJkzJWt3HzZHLXcjE4Z67OPLU8hmaZU2DuRNuNlXA
        eVr5Tm0TVvlDps2RrzJcLYVifLjWtMjL/3OLX952ecfEvHkvuS275PNQF3j2/OlV
        iUx5CPIXMZaDZeZZGBlx3jyNMUDF7cL2vwr3O7+ih2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bkR1Q1
        QpGYWyLY9OclKKSQyOpWv3rkNsGzg6KtErcvQ=; b=FdMNuE9rP8BkLo8dZI16Kl
        /oI8AIIDkJG37l+TmEXs80TgQ7z30yeGc/EXabAaMoGEsTtZbqNLEhnR6//r4wNB
        aeeCgXyfQGfFaX4pOstjgC9oViz70g859XyiEd+Np3BdaUjbjluvWv9zCQPHRtOs
        0YhwMDhuN4qFPsddjnrsXC7GE9giOaXOf956FFIqkApEckCxDY5y6akXJYlXGiWl
        DsTUapg8MlnvlaKMGtM+9p08uz5qo86K3vukJaTOyaMdmmPB7lGIBAwnihc39jzx
        LCFQ5HFhyI01opGc/QkCZeddLs2K78ZIwIH6VItgM8bcvf8GJ6QaFzJzISUvlx/g
        ==
X-ME-Sender: <xms:p-QoYaDzUwE1PdFnCA_HoBoQGxxGO2huxxf6Sfos8uM9ONMCBteGUg>
    <xme:p-QoYUiXFp12qH3mRfCktMSlPHBBs_-_6X80XS_BuFz3RMi8-QgI1VO2rj5dQTPB4
    utSi7bcRNsX9g>
X-ME-Received: <xmr:p-QoYdlxSQxFvWiPdoDgswrtGygPtTqBtPaCRNPVgmaIFDMLGvEgrWX1pNKp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddufedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:p-QoYYzbfZ5p3BLPCEnVaN0fAQLux04zjWofeumIpaD3nxq5npSUew>
    <xmx:p-QoYfQGKpjtZrwktMVOGBrwCBPsvXXZ30zqIC85IvzkD9nkn46ATQ>
    <xmx:p-QoYTbK-g3cABuCz3WD5PliZZPTR7kvWWdxUXZ4oyvR6bkfuYa70Q>
    <xmx:qeQoYbpDWauCj2sQmscTHZ2vxzhPNpCfHUFbl_CeH6d64aLTpYFXbQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 09:12:07 -0400 (EDT)
Date:   Fri, 27 Aug 2021 15:12:02 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: linux-next: manual merge of the char-misc tree with Linus' tree
Message-ID: <YSjkosA6yMrMmaNk@kroah.com>
References: <20210827164904.6b1d1f0e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827164904.6b1d1f0e@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 27, 2021 at 04:49:04PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got conflicts in:
> 
>   drivers/bus/mhi/core/main.c
>   net/qrtr/mhi.c
> 
> between commit:
> 
>   9ebc2758d0bb ("Revert "net: really fix the build..."")
> 
> from the origin tree and commit:
> 
>   0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")
> 
> from the char-misc tree.
> 
> I fixed it up (the commit in Linus' tree is basically a revert of the
> char-misc tree, so I effectively reverted the latter) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Hm, what should I do in my tree here?

Kalle, what commit should I make in the char-misc tree now to handle
this issue, and make the merge with Linus's tree "simple"?  Or any other
ideas?

thanks,

greg k-h
