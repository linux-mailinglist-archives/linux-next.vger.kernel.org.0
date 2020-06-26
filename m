Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335FC20B43E
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 17:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgFZPOf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 11:14:35 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53593 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726003AbgFZPOf (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Jun 2020 11:14:35 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 9C7BD5C0138;
        Fri, 26 Jun 2020 11:14:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 26 Jun 2020 11:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=mdDfMVgGX6DVlavsJba/Ots6WaF
        nHhT+zaX/gKQNVD8=; b=rHpn5UtsdoT8u14Uw9CcMeZ4xsmZ2C0ECAzqEDzBWc/
        OzBKYeP6SmUQ+C3iY9KQgixevhxVaTILdO7jsdGT95EFQV1eEAoCkBCJFsm0sj4h
        8hAsf3axJiG9BVvROuxXZgPVrtAyU9Pp7ggSJhxaBihSlZeGCoKGcMbeveDoNrHT
        qird18pytWtPlZy9Qh0wCBE/eSHigE4wJ9al/Gyz/AnCYlxCc2zfrM9SJQoXW3JW
        E4SMjuaF1jKm+9cal0qP3OHbWX0s61BQTHkcAG36QDwT5zDrqGJEuw2HdiaOcUOS
        xbTT8rKMft7vBJQvAeKadCIWLsRhlZ454JPNiXrOwWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mdDfMV
        gGX6DVlavsJba/Ots6WaFnHhT+zaX/gKQNVD8=; b=M6zbpZDXjU6zRhU13joRNi
        8ciggz8WzYbniBti+s/oi0ymVL6f5irZdXFL5o0aAhCkMGQXepG/JEdhVvUbXH6b
        8ml4sOksDgsRgaf20XS/htPVQL4loEq8VkTGby0m54TawfqJI1FDbCW81PkOPHYB
        9TOSKQdbyV8vZXhWqfTYP46kFPPBWrYX7ugmAfObF15Ow/3f6MEBcW3GUq8CQp0a
        9cfadW8WT20fT9pfDowNyC6v63hdedODMzxwCu4lDA8vphZT9qSDY1KCaEN/eYAH
        idfyLctJEAHVVqNiOTP/Ay4qvHwXshyXvhNjzqqOsul5qvFTLc1g7lapv6sjNmaQ
        ==
X-ME-Sender: <xms:2BD2XszIFZJiv5lWw0f4rMJJLAh73utrZJHC5eXMueek0h8sMWhqSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeluddgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:2BD2XgTjsxFRN7XYrClOloWrT-2vpbyMDr3IeLhIIGOENl_qVII-1w>
    <xmx:2BD2XuWYnd4t5v_fJG_ElEsMTMxm_HwZVSkRnDhoiQ2i63yTo_w7CQ>
    <xmx:2BD2XqhDdy7dv4_TDCNz4sPIg3pqQ2v1Ii452wjrHz2rApWSCZ9BQA>
    <xmx:2RD2XpoNrRD5CiyZ7J9rslTp1nTYKZpKQScqOFByt00yIprOUnd3Lw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5A83E3280063;
        Fri, 26 Jun 2020 11:14:32 -0400 (EDT)
Date:   Fri, 26 Jun 2020 17:14:24 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <20200626151424.GD1404596@kroah.com>
References: <20200626132910.73031f1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626132910.73031f1f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 26, 2020 at 01:29:10PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/cdns3/ep0.c
> 
> between commit:
> 
>   c0e2a0341cd8 ("usb: cdns3: ep0: fix the test mode set incorrectly")
> 
> from the usb.current tree and commit:
> 
>   62fb45d317c5 ("USB: ch9: add "USB_" prefix in front of TEST defines")
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
> diff --cc drivers/usb/cdns3/ep0.c
> index 61ec5bb2b0ca,04a522f5ae58..000000000000
> --- a/drivers/usb/cdns3/ep0.c
> +++ b/drivers/usb/cdns3/ep0.c
> @@@ -327,12 -327,11 +327,12 @@@ static int cdns3_ep0_feature_handle_dev
>   		if (!set || (tmode & 0xff) != 0)
>   			return -EINVAL;
>   
>  -		switch (tmode >> 8) {
>  +		tmode >>= 8;
>  +		switch (tmode) {
> - 		case TEST_J:
> - 		case TEST_K:
> - 		case TEST_SE0_NAK:
> - 		case TEST_PACKET:
> + 		case USB_TEST_J:
> + 		case USB_TEST_K:
> + 		case USB_TEST_SE0_NAK:
> + 		case USB_TEST_PACKET:
>   			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
>   					       USB_CMD_STMODE |
>   					       USB_STS_TMODE_SEL(tmode - 1));



Thanks for this, I'll handle it when I merge the branches together
sometime next week...

greg k-h
