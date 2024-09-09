Return-Path: <linux-next+bounces-3667-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9024970E0F
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 08:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 594AB282E75
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 06:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D615D1AD419;
	Mon,  9 Sep 2024 06:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="L7w99IE/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L9Fjn4n9"
X-Original-To: linux-next@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8D81AD3FE;
	Mon,  9 Sep 2024 06:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725864124; cv=none; b=jSJiQxFj6du21rj49sL15fD/PvoHopvEtAORu8OlncPPwY4n4goZopca6XyuIjo3k/58ZGxkyeg93aA56lfYRXhNnYETY1JLXQkLICDEAHyOGeMS0kJ+SwmR5ohmKuYZZlRiOp3/xibZI0Sx1ryCSv4Oi2FOv7HJFRdyH6jC4OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725864124; c=relaxed/simple;
	bh=+IZqSuW7/zdQu1TZg3oqjqLLPv5MLPSuBpnL+qttu5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4LdEEPI1i0udZBZdENggxJonRsBBJnj/Vqx4tkHyhuyqO1NqyzYh0S7TwHZxMz6eKdM7a+pgfZ50Z9sIQa3QxI22lDbQLV3dGjZsw9oGYXshvq26FbBdoQ55jtCw12r7T50OvOtDMHZGj2LbCbjErjdfe5s2WLdAbraIhJL46A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=L7w99IE/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L9Fjn4n9; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id D144213801F6;
	Mon,  9 Sep 2024 02:42:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 09 Sep 2024 02:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1725864120; x=1725950520; bh=LN8eEzO7Mp
	4j/F7493UnvELdSjfSjXr8RHdB2wQO4HU=; b=L7w99IE/6z/lfe0rUIRgMPbXEo
	uGVlu0QLEhvFv7wzoFgNSUN18gFYClzIp7q/LyCaaMZOdkgjB8AfMMRhxZ0iZQq7
	QDMZd+ZeO4AAXCZJKKZoWehefXf0jmGm/gsqzXlgJQkUInxz75GO5Pm0Cp1oD1w2
	urM+Y47qucxBoXGL2iumXUm/z8gTkXZ0pavoGeZx5r4pFHiLBn5Rwv2BUGkPOrCP
	fXO88zTW2Q9675tPBwIefmvyHl8fK+BfURiWR4k9oTkSKm68K3MW1GCrYAh3Fp97
	AkfUZHq0WragmYogVgM5PPriprIp1SyPhScmAY5GAdYUv3rD7csqYgTfON1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725864120; x=1725950520; bh=LN8eEzO7Mp4j/F7493UnvELdSjfS
	jXr8RHdB2wQO4HU=; b=L9Fjn4n9omYXOelCbbnnZliYJqWt5M9eTKQ9pvAwb71m
	75u+xfepuHip95BO3lgZQ3MbStKWCcgTnfv/E9kx+rfTrmLHghtd5sMm8gn0HCVP
	/LlCdUU0T7Uso1XsYKQ7sMzaBxPO3NXxFJAAyZQmiXV302uoNPeenY2U2V/RnmQI
	j1NMx0LDKm08UyTX4Y5b6SE7ydGirHIc5a5kCb1D3YX8zsXva2aEgCoBc9XOXKjU
	RMuWZwLZ4PyzJrRZ1j93rIb7hXLmBoRIA7A+M14PnnvU8ccd54X1b/blJbRsoIUA
	Ruxmf55OWHN0EOtjOH/Y8e7ra05/7T3se2m8JXgG3w==
X-ME-Sender: <xms:uJjeZi3OdZJOtE5CId3V6tsGuQfRaF3ZHSCxnnXqbPXPxrKP23M1VQ>
    <xme:uJjeZlFT15JXuDsbDv4tyiWjlXzjeLqujTuf_TlyHpivWzkDGtiLoDG0bhKH-qAqF
    ttzLCNDIjjHNA>
X-ME-Received: <xmr:uJjeZq6Xlf4wrt3QxOVn2LPzwKSuJmHhFbH-D7lYs_PT5QoYsAUyJ8G9Kwxz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiiedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehhvghikhhkihdrkhhrohhgvghruhhssehlihhnuhigrd
    hinhhtvghlrdgtohhmpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdr
    rghupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:uJjeZj1VQ8nJSe5LOFGxCvvgbEXs4DHt51O7omI0CI0deJRy6vWmeA>
    <xmx:uJjeZlHdv-bHDb9XCG_je6STzymVbPjgyqR5nsfKoN_48C2pEPCL9g>
    <xmx:uJjeZs-dGma1AQU9cCmqI5iymiIB9EB7LNrK7k0fD5QA520sWOdiiw>
    <xmx:uJjeZqm8jtLKzx2rGG-W_FUl2Do-yoCKdM29cc5fHC9KL7_Hen9n8Q>
    <xmx:uJjeZrbHsQHd6OzSg0STWekWd5o_kswHwl7Ql5n-ntf9Q4QByRUXxaNS>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Sep 2024 02:41:59 -0400 (EDT)
Date: Mon, 9 Sep 2024 08:41:57 +0200
From: Greg KH <greg@kroah.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <2024090940-reassure-prolonged-67da@gregkh>
References: <20240904150522.0410150f@canb.auug.org.au>
 <2024090439-hexagon-imply-db4e@gregkh>
 <Ztgb1nQ79+eSZXil@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ztgb1nQ79+eSZXil@kuha.fi.intel.com>

On Wed, Sep 04, 2024 at 11:35:34AM +0300, Heikki Krogerus wrote:
> On Wed, Sep 04, 2024 at 08:16:10AM +0200, Greg KH wrote:
> > On Wed, Sep 04, 2024 at 03:05:22PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the usb tree got a conflict in:
> > > 
> > >   drivers/usb/typec/ucsi/ucsi.c
> > > 
> > > between commit:
> > > 
> > >   87eb3cb4ec61 ("usb: typec: ucsi: Fix cable registration")
> > > 
> > > from the usb.current tree and commit:
> > > 
> > >   73910c511b1a ("usb: typec: ucsi: Only assign the identity structure if the PPM supports it")
> > > 
> > > from the usb tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> > > 
> > > diff --cc drivers/usb/typec/ucsi/ucsi.c
> > > index 17155ed17fdf,f0b5867048e2..000000000000
> > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > @@@ -993,11 -929,12 +939,12 @@@ static int ucsi_register_cable(struct u
> > >   		break;
> > >   	}
> > >   
> > > - 	desc.identity = &con->cable_identity;
> > > + 	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> > > + 		desc.identity = &con->cable_identity;
> > >  -	desc.active = !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE &
> > >  -			 con->cable_prop.flags);
> > >  -	desc.pd_revision = UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(
> > >  -	    con->cable_prop.flags);
> > >  +	desc.active = !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE & cable_prop.flags);
> > >  +
> > >  +	if (con->ucsi->version >= UCSI_VERSION_2_1)
> > >  +		desc.pd_revision = UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(cable_prop.flags);
> > >   
> > >   	cable = typec_register_cable(con->port, &desc);
> > >   	if (IS_ERR(cable)) {
> > > @@@ -1094,8 -1009,10 +1041,9 @@@ static int ucsi_register_partner(struc
> > >   	if (pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD)
> > >   		ucsi_register_device_pdos(con);
> > >   
> > > - 	desc.identity = &con->partner_identity;
> > > + 	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> > > + 		desc.identity = &con->partner_identity;
> > >   	desc.usb_pd = pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD;
> > >  -	desc.pd_revision = UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags);
> > >   
> > >   	partner = typec_register_partner(con->port, &desc);
> > >   	if (IS_ERR(partner)) {
> > 
> > 
> > Heikki, does this resolution look correct?  I knew there would be a
> > conflict, just want to make sure we get it right.
> 
> It's correct.

Great, I've made this merge resolution in my tree now as well.

thanks,

greg k-h

