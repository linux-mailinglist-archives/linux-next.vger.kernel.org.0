Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACA8272AAE
	for <lists+linux-next@lfdr.de>; Mon, 21 Sep 2020 17:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbgIUPtq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Sep 2020 11:49:46 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43097 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726810AbgIUPtq (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Sep 2020 11:49:46 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id F3A135C0232;
        Mon, 21 Sep 2020 11:49:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 21 Sep 2020 11:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=g/6aPpa9+HFyn43lywpwZ+M9VIS
        vOyQKwhfMzJ/Fcsg=; b=VeYvcbIl9FSggoyfvyCU/siOJLDc10yw0Dn832LHvZP
        NErBKLBq+h2lxTeqVZuMJBG3875PKwaUWaDXCv1+MQ782KCzYoUXN85o5uZow9Kt
        bY0sw0rPRWtYvOi2yKkBBCBDW/H1rUi5tg6ycovKbfMdU1V7o/+bIad4OhZxDd4C
        utj9Y7gu5uDqBOBmby/fFcGPo/0SEQNawbG5otu5Wmex1fdb82p5GsgJPtxLPQ2Z
        XPaT2dVd3R/w111d7iDt6UxSrv1vkd07YwEByZrFDNjEeNriiJQOdxzB/ghcHE2F
        rganRq3J5FVZ9Cx6Vb2LFvSmwDLlRW2BvYDR5Ojf2sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=g/6aPp
        a9+HFyn43lywpwZ+M9VISvOyQKwhfMzJ/Fcsg=; b=EmATRWIFcn5LOsd74g7Qan
        XSFoMach9t6/M7JwZ+p+OHowSAwhJHNbg74fRNE2G6WCRt1VKpllcktdrmAhjSse
        RXF0YDjT4/qSU88tnB01h3ltb1gOdtMEHwy6w+bkSP0WOr+IMCkFw8w4i4lKzUpK
        StT+zRBMBf3khsD+nBZm9ee9xGXyEtdTab6G+owAhSXqbF11wA5WQ1rX6oAEVr+/
        c9YdTYjNoJ+hCXM+4iH1wOtP5gqU7h+uhX9JkhRfjUfddMabIKv6KS4UwO/EDGsB
        Rg/L4971Z/y9TkKktjYdOJZzrOvsJjpYmMisn3+j0lc84gu9oDJVo1UnsuJcaD2A
        ==
X-ME-Sender: <xms:mMtoXyoU7gMuI306PmwtKQXtwgnohkKr5vdz6Dp0XtbMqDnHZYDDaA>
    <xme:mMtoXwpuKt3x-mlh1Xu7CZcZnFKZtzR9heMjBhYYVXYl5ML6U27fRIWoK-aTTjxst
    OosdDvFsr9d3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvgdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:mMtoX3Muhl68_1Fx6G_hGi6smGvcONxw7Hg5XFxIE0HwpoHTfsOZJQ>
    <xmx:mMtoXx6FxJ3BlcLvFDzcLsZsn3JVpwQEmyxyujiBrvJP_cL5g5rIyQ>
    <xmx:mMtoXx5mMbTMgKy-0-gmCJ30xfUJZDmi0V0AUmIdOc_vFcrZSRpoVg>
    <xmx:mMtoX03DlkbkqWfsukHUW2AuYQcUkO6oSeXfQ-Kr1UsPzyApdcafhQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id BD6E83280059;
        Mon, 21 Sep 2020 11:49:43 -0400 (EDT)
Date:   Mon, 21 Sep 2020 17:50:06 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Jim Quinlan <jquinlan@broadcom.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the pci tree
Message-ID: <20200921155006.GB1023551@kroah.com>
References: <20200921151807.637905c0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921151807.637905c0@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 21, 2020 at 03:18:07PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/pci/controller/pcie-brcmstb.c
> 
> between commit:
> 
>   1cf1b0a6dd95 ("PCI: brcmstb: Add bcm7278 register info")
> 
> from the pci tree and commit:
> 
>   f48cc509c935 ("Revert "PCI: brcmstb: Wait for Raspberry Pi's firmware when present"")
> 
> from the usb tree.
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
> diff --cc drivers/pci/controller/pcie-brcmstb.c
> index 6e7aa82a54a3,bac63d04297f..000000000000
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@@ -1213,8 -929,6 +1211,7 @@@ static int brcm_pcie_probe(struct platf
>   {
>   	struct device_node *np = pdev->dev.of_node, *msi_np;
>   	struct pci_host_bridge *bridge;
> - 	struct device_node *fw_np;
>  +	const struct pcie_cfg_data *data;
>   	struct brcm_pcie *pcie;
>   	int ret;
>   

Looks good to me, thanks!

greg k-h
