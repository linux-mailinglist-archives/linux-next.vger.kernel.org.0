Return-Path: <linux-next+bounces-6409-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E40A9EAD4
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 10:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEE32189B630
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 08:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA6425D1F0;
	Mon, 28 Apr 2025 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="QWL+CQ1J";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sJV9tOLy"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C52925E471;
	Mon, 28 Apr 2025 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829166; cv=none; b=frMrnWxLurFw7oV0dTFQA41ZcFqLFA+tp0y0vfDDvhgbNsU4GnXrXysDNmtE4zWkr5RsBnE81gQqvtOMtc61zzsf7amFuB0BG89A9bI1DB0r0K8391WLBfydGRXAfMg9GZN3NnYN3Dg/u8dHQGvOS2xAa19niaKltTDk+V91lj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829166; c=relaxed/simple;
	bh=VYIGYAzPWiB6IechB7rf7W/hwN4m0GLx1G4VKA0f7EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpV2rbV7kaMWNLS9QnVhmxQK/yfTCvDOl0elBbiyic+H+MhrzcsPiKb4zVem49t+N6ojX7JgWzUaioP07/13Y7PjdUWxKUvxSuqi6aNlDoQsOf9KovBknTtHRQi+ye8x5A+sNNApPKV9W8edLjAD0PaKVZJ0oWvJEKtgv4n7MRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=QWL+CQ1J; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sJV9tOLy; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 79185114013A;
	Mon, 28 Apr 2025 04:32:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 28 Apr 2025 04:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1745829163; x=1745915563; bh=fUGKdEE1P/
	KyC1z4PqewzwNp7GLhrY2uDJFiS8OfGSc=; b=QWL+CQ1JvvEtE+YnM83g2MMLUg
	xEbEpALy42wBsWlfUfxAqkHVOs5S3UdLET0t9wyT1kmI0S9cXUJdPkFF6t3gEbuv
	ZMmt/KnWf3kCsK/rWgwWoLbOrETmzS9P43a83VQW/N8kCs5xnuKs+dQ2KMeH7RQe
	u2nbAxjumNl/xCm75gA9evfXyl35Lj1eNSfL73DHRf/FHsMWqsOYQhU5V6yuvVYX
	CoRLjC8R/pGNRhcEFg8WlCOreEt0cTjfG1nYh5gchltF0s+SIi5oPUW1KmVKy15D
	3sFJiVsqOUBq7QMTnTu7T7Q3isfKpVsdWQktCpqg94OcPLHQ+Fd9h42nP1iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1745829163; x=1745915563; bh=fUGKdEE1P/KyC1z4PqewzwNp7GLhrY2uDJF
	iS8OfGSc=; b=sJV9tOLysCjtfR3+vAHF2tSbaMWq/AcAxA3bLqhN9gS91qBFgef
	yz5I5ttzuWIIwn+keCbMWvBFbDGcevU/WSJ3zC1wGkunmZfq8lbb32w+COtUB1J2
	o2X5z/5UoaVTuxIfTR7TbyEbvTNAr5qpmqwYEVO9qW/AHy/JPAI3rQu5LJ+nQKzE
	rY2qANFLtgaAEeHv1e6ajMDO3bulyQNLu3YOuaVwPBQKFP9wA/A4k7R5g8gjVorE
	AzZUBpYte082NoHe1B6tR+/bPZwsMS1N91nMSw5OaYgSGQTm79qRd3IV7fQnkGqK
	DUSWkgtZhKpJferw7Ww8LF6VRBkwc1NCrZA==
X-ME-Sender: <xms:Kz0PaNwZx0pfDDM2VT9p37yv1ozOyeDD0hQanfngSw1XKkcCMYEgdQ>
    <xme:Kz0PaNTGx56JJP-2j47gzJTdGtUj0SX8enf9nAgfhH1mzyzvg3g2Qi2dHmQCMO70O
    w_MjacMt-OMkw>
X-ME-Received: <xmr:Kz0PaHV4gjKow3FKX-dLrTrss5ABtlfIGdvD3nOfC54DR6psna1eO1OPPpATZI2BqfDVacsJhpofw0jVoxCStLSsoA2vIvE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedtgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtohepphgthhgvlhhkihhnsehishhprhgrshdrrhhupdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    gihurdihrghnghgpvdesnhigphdrtghomh
X-ME-Proxy: <xmx:Kz0PaPjThYAFwwusQLo4dibIFj4NvfXyi9mVO3iqp4qTDedbap0eXQ>
    <xmx:Kz0PaPDUT6o1fkBZyC7qjUqjuUyrROATQh0SX3wNFizzBhbUlyGHCw>
    <xmx:Kz0PaILmcyvOnvQHDM-kfaRHfPH7frLkqAmq5j30rPSVmkhJPkvzuw>
    <xmx:Kz0PaOCC508OWGfGJNbrrSvaUanmt6M6VIjor-IgbGGDwcUbdKKHjA>
    <xmx:Kz0PaPja-mWd0pjj-qpbASYvaumx6YJTJRyd6X0vvucTinzI3ycSZvGt>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Apr 2025 04:32:42 -0400 (EDT)
Date: Mon, 28 Apr 2025 10:32:41 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <2025042832-bronco-rasping-3517@gregkh>
References: <20250414142307.7df3443d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414142307.7df3443d@canb.auug.org.au>

On Mon, Apr 14, 2025 at 02:23:07PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/chipidea/ci_hdrc_imx.c
> 
> between commit:
> 
>   8cab0e9a3f3e ("usb: chipidea: ci_hdrc_imx: fix call balance of regulator routines")
> 
> from the usb.current tree and commit:
> 
>   ee0dc2f7d522 ("usb: chipidea: imx: add wakeup interrupt handling")
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
> diff --cc drivers/usb/chipidea/ci_hdrc_imx.c
> index 4f8bfd242b59,c34298ccc399..000000000000
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@@ -336,13 -338,16 +338,23 @@@ static int ci_hdrc_imx_notify_event(str
>   	return ret;
>   }
>   
>  +static void ci_hdrc_imx_disable_regulator(void *arg)
>  +{
>  +	struct ci_hdrc_imx_data *data = arg;
>  +
>  +	regulator_disable(data->hsic_pad_regulator);
>  +}
>  +
> + static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> + {
> + 	struct ci_hdrc_imx_data *imx_data = data;
> + 
> + 	disable_irq_nosync(irq);
> + 	pm_runtime_resume(&imx_data->ci_pdev->dev);
> + 
> + 	return IRQ_HANDLED;
> + }
> + 
>   static int ci_hdrc_imx_probe(struct platform_device *pdev)
>   {
>   	struct ci_hdrc_imx_data *data;

I've now resolved this in my tree, thanks.

greg k-h


