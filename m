Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9131A26D3D2
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 08:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgIQGlH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 02:41:07 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:46665 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726149AbgIQGlH (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Sep 2020 02:41:07 -0400
X-Greylist: delayed 418 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 02:41:06 EDT
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id B1C775C0808;
        Thu, 17 Sep 2020 02:34:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 17 Sep 2020 02:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=PCE6lj2tpNNnedt+ugMqE+F0Nym
        m0Rkhhc6R7+Hbr3k=; b=oH1vUNVY9ls7dj5JQnlhxF8HVFA0U4kle0BP4wf7Ojy
        hmz/IeESPe8uTUBCEwtYLh7lF20fZyyN0M44co0PPYVfbzT/bBTNl82mHxNwlIr8
        9DDBnQs976GGVB35amHzrDimP+ryP/4NC6qqPVl+OWpDqmGnJMRJdRUcwiORuICQ
        1NEcjbLNjAh/YFrLE5zVBm9Ua9XvWlLl+dRE2q0i44NHI+s3g24t7mjBIUEbI5Tp
        OZq7WpQvXu3R6ESpbiPlmECRAlDmNQVqjhOFeRQM2uIvz4MiUbO4XYvldk7nU4Xg
        nFR2b3I6rFHRw5cHRiMuE7cCTZw1jVURVHcypfQ4kxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PCE6lj
        2tpNNnedt+ugMqE+F0Nymm0Rkhhc6R7+Hbr3k=; b=XyKlSk+vVd2ibIv07wWyzu
        d3WL9MdN7bsvvipkqDd5njQLmj1gRE3O9zEe5ywcDEWB8LhkbR0ySskpVit3GoQC
        bbDdYzwuJI4TfwW/ag+BqdzxnwifldbGdWUtUPxX3wFKGVSa3KyqorBdK4VUh0iY
        G/U4XDMnoYKzlmvIyhydAxBFuSbf0XD/JtOlG9NFhPH2rWume1Gt2nREZfJtjnj6
        4c6EQ/rkOxaVADjcc/f6vKVi/c6RTp32htK18rxXyjvK/SnM4wEMgKJVybqn7wqW
        bmc6OsPX12gquBwJtFGwAetZTl/pOnuwcDyFUdmLv84o/QRRWHvYjNfSk6ayTUWA
        ==
X-ME-Sender: <xms:XwNjX3ulZxAHqfDGHt8ZAig-Qx2IVLxKCUl3abMihZkHV8mZ8cfFIw>
    <xme:XwNjX4cTKJq_n4-FNoFhYD9Sm6aZjN1rYh-qru-FWVafmRX70cqmHHZxJwUzjzSx3
    ry6hj3vjxquvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgddutdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:XwNjX6zyb65lql-vZlTqBg6yibYuW6nBYCF0nPtFvRhh945PbWm9dw>
    <xmx:XwNjX2NHJP1olNaULHbBYu8zq_rP0yWr2AHajsvhNPs-hsnXZx8QxQ>
    <xmx:XwNjX38bHUb0e9j3FH8gRE3Maw4oqnyTJuP-IW51R1dCiOeoTNNMHg>
    <xmx:XwNjX5J5-rQ-VkMuEEx3qSyAQ8FiA-rBRnUWvr3wAzu0RWXCcubj8w>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id BBC34328005E;
        Thu, 17 Sep 2020 02:34:06 -0400 (EDT)
Date:   Thu, 17 Sep 2020 08:34:38 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Tobias Diedrich <tobiasdiedrich@gmail.com>,
        Du Huanpeng <u74147@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Message-ID: <20200917063438.GA3144339@kroah.com>
References: <20200917160946.02dc6bb0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917160946.02dc6bb0@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 17, 2020 at 04:09:46PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   drivers/tty/serial/8250/8250_pci.c
> 
> between commit:
> 
>   3c5a87be170a ("serial: 8250_pci: Add Realtek 816a and 816b")
> 
> from the tty.current tree and commit:
> 
>   04b6ff5f25de ("serial: 8250_pci: Add WCH384_8S 8 port serial device")
> 
> from the tty tree.
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
> diff --cc drivers/tty/serial/8250/8250_pci.c
> index 55bb7b897d97,85810b8b9d20..000000000000
> --- a/drivers/tty/serial/8250/8250_pci.c
> +++ b/drivers/tty/serial/8250/8250_pci.c
> @@@ -5566,17 -5618,10 +5618,21 @@@ static const struct pci_device_id seria
>   		PCI_ANY_ID, PCI_ANY_ID,
>   		0, 0, pbn_wch384_4 },
>   
> + 	{	PCIE_VENDOR_ID_WCH, PCIE_DEVICE_ID_WCH_CH384_8S,
> + 		PCI_ANY_ID, PCI_ANY_ID,
> + 		0, 0, pbn_wch384_8 },
> + 
>  +	/*
>  +	 * Realtek RealManage
>  +	 */
>  +	{	PCI_VENDOR_ID_REALTEK, 0x816a,
>  +		PCI_ANY_ID, PCI_ANY_ID,
>  +		0, 0, pbn_b0_1_115200 },
>  +
>  +	{	PCI_VENDOR_ID_REALTEK, 0x816b,
>  +		PCI_ANY_ID, PCI_ANY_ID,
>  +		0, 0, pbn_b0_1_115200 },
>  +
>   	/* Fintek PCI serial cards */
>   	{ PCI_DEVICE(0x1c29, 0x1104), .driver_data = pbn_fintek_4 },
>   	{ PCI_DEVICE(0x1c29, 0x1108), .driver_data = pbn_fintek_8 },



Looks good, thanks!

greg k-h
