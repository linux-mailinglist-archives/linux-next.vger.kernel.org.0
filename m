Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CAC3D3A3E
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 14:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234885AbhGWLtQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Jul 2021 07:49:16 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:45983 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234774AbhGWLtQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Jul 2021 07:49:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id ED17A3200934;
        Fri, 23 Jul 2021 08:29:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 23 Jul 2021 08:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=+eOXjkFr/vzl4LWj2qFm/QH3AyJ
        2LUE6Kqq+Nzq4Hmw=; b=aFoYCfq/zea4KY88rBSjeQ6mfQMaJ7Q2UitG3WdFFfl
        1AaISfon+I8XJeogcaEMi6X9NCDmCbBGpzQ5dsMSBFD2W07948Fg+GuIcMZW3mRO
        r4JkKTcek5+wrClYPSEPqAZMfLUgezQUS2nXEK3Blz13qOHX87Cjt7kTfAaGItj1
        IUcPZkTHkO68V6vL1T1Wa7J+rLXbmstpSZQG9zEsolqnLPzQdoKzcaR6DcBOAYJZ
        T+m3w8myE+YXSiIlSExkxcBkuJotDMUFir1SBRoZBz9uXEU0pObtZ0WYUcHaVte0
        8Tew8g0Ui3mQ+JvQFnqxf9CpNzmkIDxIqUI+dmsSaKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+eOXjk
        Fr/vzl4LWj2qFm/QH3AyJ2LUE6Kqq+Nzq4Hmw=; b=SFug+O5ZtgCZZnm5H/40Uv
        c3E1M0T8TBP8WT/e1TQ0r1zUr9YxR75Egc+bZBd4zL2obzMhXnjXXmbc8BhN7Mx7
        iWQEWOMz1QFJeeE8LtcaAeXmlZI2hqVLgUAnCfIVv32JYYOfLLPL0xv/qQ7iaV6L
        NBHZg6ekb1qie6bfxoQeKOt3kCG9/BktDR1TglsUMJFPLm3tbuRBICUHFqMTQNUK
        oDjbhthAS0sLJnWG2ZjeKJE1MHNbivKcKMFYHFlJ9O8Vp524Z63Kst79hMWmKvYm
        HEW2sJBGhoqZB+/+wt47nNJFK9B94ESL7kiV0S5rfOB1r01bUPHXZBy2I9HW0vGQ
        ==
X-ME-Sender: <xms:Orb6YJQUzgdVTxOqNRoXgrHPiBVp9EEFwOflLRaHQf_UyYwj6Pfaug>
    <xme:Orb6YCzXoRGl5K2LHxBHvekuFQ8C1W-Dd9W3BTBRkrWj8YbHFQ4uRDtBkNgf11S1n
    elqFZfUPg5Hqg>
X-ME-Received: <xmr:Orb6YO19KmXKr36Dye5c7H4N7obx4bb7_9t_V3JclsCzKO0CpXLJuN3cbLqq1Yzs95XHXiVhaLOCdK555sBbwA_xbmADf3EZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeekgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:Orb6YBD4mSFvaDvaXRbs40vILO2a06tSsiP6GY5Bh9-D44RZrX5Svg>
    <xmx:Orb6YCjDcG5xTE7uS0U8AdSGxH1r12IKHCLx2ROCGWMcDGvui9_dwg>
    <xmx:Orb6YFqkH29W5sPTOKSxjWk2_b_RVzXlrdVVA-FH0lCG1m2x-Dz5iQ>
    <xmx:O7b6YLW72Ctj5gWPcyiOA-PoRe9h0Yn54iRh1uFMcL6ozFQTGSyoCw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 08:29:46 -0400 (EDT)
Date:   Fri, 23 Jul 2021 14:29:43 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linyu Yuan <linyyuan@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <YPq2Nxq7oa4p0b0Q@kroah.com>
References: <20210722141228.57a92e94@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722141228.57a92e94@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 22, 2021 at 02:12:28PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/dwc3/gadget.c
> 
> between commit:
> 
>   40edb52298df ("usb: dwc3: avoid NULL access of usb_gadget_driver")
> 
> from the usb.current tree and commit:
> 
>   9f607a309fbe ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirements")
> 
> from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, I'll fix this up when Linus takes my usb-linus branch soon.

greg k-h
