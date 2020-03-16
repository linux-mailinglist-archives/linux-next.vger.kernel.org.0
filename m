Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA539186C04
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 14:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731329AbgCPN2y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 09:28:54 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:33255 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731154AbgCPN2y (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 09:28:54 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 58BB38A3;
        Mon, 16 Mar 2020 09:28:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 16 Mar 2020 09:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=kUt0/mQF3fFJa+SaSINLmVBKDef
        IWc4N6QePTDuzfSE=; b=MMITke/te69dqqbGeQu04RBDJ/CNFu9Mv7nGTbowzXQ
        xehmmtXo4k3FoXwb7bFvEt+NxawRNiLdWElmv5a9sO+ElRJBFW1tX2aTQMS0Dg1F
        bgPbGsl87QnQi3MjbqsE2+AhbfFmfVekKhzUHvKHVItp1zkRR9mARHPBX9U2IkRG
        J/sZxAyc4NkCLU18nWG4NHw1ZWJBq9I3Iwrn7CCcxhS+EvR5V1aLnTGy1ZurYaBL
        ip6SYvODCmITn1WB376t6NfiQohRp/hNAbn8/M/sPlzw+2gEP0nMp7sHWbj639nM
        BUsQyg3/mVQsRKogD4c6c6QBtJw36laiKWoHXClyiOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kUt0/m
        QF3fFJa+SaSINLmVBKDefIWc4N6QePTDuzfSE=; b=E54II+Zr/SHosUpbY1exrD
        7+e/dfXdJWjLHcaFp4ZWnrrX6ggOODSWkM3EGj1UA2RAQRGftL0M46aRp0721gzC
        NMEcE2o5p3KB+FSL9N5fMb5QnLX/vnoNqMn+q4FoTMGEbq9QO5klV/6R9Eti3D9b
        z7qeNVtMR30/buyfqBc3XOkdAfEmZmewKxoeWE8Lq+TmzxPGVUcXJfM3Waqs115H
        5wlNw/mmLQQk2011MOnqD4Ft1/ksvICBeomJY3r/KqeEKkeOO9mp9YXpGwL8L+tx
        gc8wPv5tzpOaSSk4PUVsShiDTlvsRPrBZe3L0xG8mEEOIGUOZqLKN2npUMCmzREg
        ==
X-ME-Sender: <xms:E39vXhN3ZlO3f_vOQKtaXChXo1UDvkVWaVPnwxl4F32q_QNynJ_c2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeffedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:FH9vXtb6YH76y_EsKcEvxoCb9vzxCMqmqBtTd2Y89tOnWXhJEiqZmQ>
    <xmx:FH9vXv1ehRBIrcJZo3SdhEU9g3eH4nR_W5e6EwN7LIGrvxCQGsr8MA>
    <xmx:FH9vXjfTR1tjN_Fnh7KZstrJtqZdkJHWKRJDKjKC6jPdOnHryLL5Yg>
    <xmx:FH9vXmXmU3EM1KURrh4IVJR_6wiDZoMX0ZKKfAOwyXJmu_QNo7ESdQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9B6F83061CB6;
        Mon, 16 Mar 2020 09:28:51 -0400 (EDT)
Date:   Mon, 16 Mar 2020 14:28:50 +0100
From:   Greg KH <greg@kroah.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Message-ID: <20200316132850.GB3960435@kroah.com>
References: <20200316141004.171649a5@canb.auug.org.au>
 <20200316113012.GA3049021@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316113012.GA3049021@ulmo>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 16, 2020 at 12:30:12PM +0100, Thierry Reding wrote:
> On Mon, Mar 16, 2020 at 02:10:04PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the usb tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > drivers/phy/tegra/xusb.c: In function 'tegra_xusb_setup_usb_role_switch':
> > drivers/phy/tegra/xusb.c:641:10: error: initialization of 'int (*)(struct usb_role_switch *, enum usb_role)' from incompatible pointer type 'int (*)(struct device *, enum usb_role)' [-Werror=incompatible-pointer-types]
> >   641 |   .set = tegra_xusb_role_sw_set,
> >       |          ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/phy/tegra/xusb.c:641:10: note: (near initialization for 'role_sx_desc.set')
> > 
> > Caused by commit
> > 
> >   bce3052f0c16 ("usb: roles: Provide the switch drivers handle to the switch in the API")
> > 
> > interacting with commit
> > 
> >   5a00c7c7604f ("phy: tegra: xusb: Add usb-role-switch support")
> > 
> > from the tegra tree.
> > 
> > I have added this merge fix patch (which may need more work):
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 16 Mar 2020 14:04:20 +1100
> > Subject: [PATCH] phy: tegra: fix up for set_role API change
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/phy/tegra/xusb.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> > index d907f03bf282..25223c350e66 100644
> > --- a/drivers/phy/tegra/xusb.c
> > +++ b/drivers/phy/tegra/xusb.c
> > @@ -596,11 +596,12 @@ static void tegra_xusb_usb_phy_work(struct work_struct *work)
> >  	atomic_notifier_call_chain(&port->usb_phy.notifier, 0, &port->usb_phy);
> >  }
> >  
> > -static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role role)
> > +static int tegra_xusb_role_sw_set(struct usb_role_switch *sw,
> > +				  enum usb_role role)
> >  {
> > -	struct tegra_xusb_port *port = dev_get_drvdata(dev);
> > +	struct tegra_xusb_port *port = usb_role_switch_get_drvdata(sw);
> >  
> > -	dev_dbg(dev, "%s(): role %s\n", __func__, usb_roles[role]);
> > +	dev_dbg(&port->dev, "%s(): role %s\n", __func__, usb_roles[role]);
> >  
> >  	schedule_work(&port->usb_phy_work);
> >  
> > -- 
> > 2.25.0
> 
> I can rebase the branch that contains this commit on top of Greg's USB
> tree. These are a dependency for the UDC and host driver changes that I
> have sent as a pull request to Greg, so this should all work out nicely.

Ok, should I take your pull request then, or not?

> Greg, I recall that you've said in the past that you don't rebase your
> trees. Is that still the case for the USB tree? Do you have a preference
> what to base my branch on? The earliest of your USB tree that contains
> all patches needed to make this compile? Or the latest?

Yes, I do not rebase my tree.  Please work off of the usb-next branch,
and you can send me a pull request based anywhere, it should work just
fine :)

thanks,

greg k-h
