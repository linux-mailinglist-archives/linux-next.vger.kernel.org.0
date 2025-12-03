Return-Path: <linux-next+bounces-9317-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25554CA07D3
	for <lists+linux-next@lfdr.de>; Wed, 03 Dec 2025 18:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EC5231FE9F3
	for <lists+linux-next@lfdr.de>; Wed,  3 Dec 2025 17:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E01364051;
	Wed,  3 Dec 2025 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0ufHCE+/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994FF2FB62A;
	Wed,  3 Dec 2025 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781307; cv=none; b=QOZlukKJc1H4VcuoFj80iYhG92C7K5LJHF45F8wGGbtdy2roLUqrVujVRJzhgKNbi9k/CGLTIYXRjgat/jE5VLjDSFtCkuj8Crtts3NrCjTh/bW/o9wzvqdBljSUlGp+JQopOhNGivmQKdoYsq8n8rqTwjitJo2KlMBr1Yx796Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781307; c=relaxed/simple;
	bh=+MjL92ZMkrZCBW5lElh4bK2pJsKAMBF2mj6+1z5TaT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PALTQhs1HfUPelq7l+2jxEnVh0+tWbjIjDy9AjkG+zhTJOOdTpnsrTuEEIFLii9lKtECznJXJhyJvGB2+ZsaWJFCE3F0Al/00zFA8FJGo+ROoqXagUlTTpJfabM293M7ZSyoC8yZkjkpjWfIMm0OqiaTkN99mzdwObVronvQG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0ufHCE+/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF26BC4CEF5;
	Wed,  3 Dec 2025 17:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764781307;
	bh=+MjL92ZMkrZCBW5lElh4bK2pJsKAMBF2mj6+1z5TaT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0ufHCE+/RsO4oCC/YzzBAP+ab0dKjTPYCyTPPuyTjR3DsRktPrvyMu+QTbi+CT2ik
	 IUOU1zRTrcDtHt3sM5XSkRXb/ZDte78dV2stxyY/nwc5HueTc/husuqAYHTDKlVrad
	 KgZymMzX2pV0MXjjRpR8KI2qdzqo68/mhLd0PFNA=
Date: Wed, 3 Dec 2025 16:47:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, rafael@kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-next@vger.kernel.org, sfr@canb.auug.org.au,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
	airlied@gmail.com, daniel@ffwll.ch,
	angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org,
	linus.walleij@linaro.org, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to
 modules
Message-ID: <2025120326-treat-unstopped-f883@gregkh>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
 <2023112739-willing-sighing-6bdd@gregkh>
 <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
 <2025112705-registrar-drivable-2341@gregkh>
 <CAMRc=Meb0-Q7UCPhbfQ+pLybS2Jp=QpwxXGXNfQ+Ti64okoqYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Meb0-Q7UCPhbfQ+pLybS2Jp=QpwxXGXNfQ+Ti64okoqYw@mail.gmail.com>

On Thu, Nov 27, 2025 at 05:19:19AM -0800, Bartosz Golaszewski wrote:
> On Thu, 27 Nov 2025 09:29:03 +0100, Greg KH <gregkh@linuxfoundation.org> said:
> > On Wed, Nov 26, 2025 at 02:13:03PM +0100, Bartosz Golaszewski wrote:
> >> The logical thing to do would be to use "device_is_dependent()" but
> >> this thread makes me think that won't fly.
> >>
> >> What should I do? What's the "correct" way of checking if two devices
> >> are linked? I assume that fiddling with the supplier/consumer lists in
> >> struct device is not it.
> >
> > fiddling with those lists is what device_is_dependent() does, but no,
> > you really don't want to be doing that either manually or by calling
> > this function.
> >
> > Who is creating this "link"?  Can't that caller tell the gpio core this
> > relationship at the same time as you are wanting to keep track of it
> > too?
> >
> 
> The link would be created in reset core.
> 
> Let's consider the following:
> 
> GPIO Consumer A ---> reset-gpio ---> |
>                                      | GPIO Controller pin X
> GPIO Consumer B -------------------> |
> 
> The GPIO core will scan the device tree and realize that A and B share the
> same pin. The reset-gpio device is not described in firmware, it will be
> created only when A requests a reset control. When it, on behalf of consumer A,
> requests pin X, GPIO core can not associate the link between consumer A and
> pin X with the link between reset-gpio and pin X because there's no such
> reference in firmware nodes between consumer A and reset-gpio. To GPIO, these
> are two separate references to the same pin. Only reset core knows about A
> being the consumer of reset-gpio.
> 
> We could add a function in reset like:
> 
>   struct device *reset_gpio_to_reset_device(struct device *dev);
> 
> which would return the actual consumer of pin X for a device we identified as
> reset-gpio (for instance: with device_is_compatible(dev, "reset-gpio")) but
> that would be adding a symbol for a corner case and a single user and for
> which the relevant information already exists and could easily be retrieved
> from existing device links.
> 
> I hope that explains it better.

Yes it does, thanks.

> To answer your question: the caller can't tell GPIO about this relationship,
> GPIO would have to ask reset about it but having a dedicated symbol for this
> doesn't really sound like the best approach.

Ah, ick, no it doesn't.  I really don't know what to suggest here,
sorry.

greg k-h

