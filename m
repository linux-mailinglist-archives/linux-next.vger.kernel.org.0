Return-Path: <linux-next+bounces-9244-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 449DEC8D582
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 09:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 042F73A7617
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 08:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46A531CA6A;
	Thu, 27 Nov 2025 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DNf7Cktt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE82D9EC4;
	Thu, 27 Nov 2025 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232146; cv=none; b=bfmVQPxaNrRA94GtVJxOSe45d8Qg1VjbS9eNh9Wnf0NzieE/IcdQ1PiFyhvooFJ+2rX7jROsY5l0fhipBL9r8bla5y6bvU79p1UKi9I/rNeBlgAqVZQMQQcu6u1h/zcAgUiloO/Bf9AsXugdRInl0AHWhp/dlf8yWJ25voMMbKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232146; c=relaxed/simple;
	bh=XDnWZhwF6hdUw7X2NJWegncDTsqHc35sPqTdiJCgnNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNZeOrNAYNnwE0s0RnZp8DYKINwRRVS61bd+4q6psxnWO05pYbFrvKp8T539MnbwMQiHRnZR/l9ooMa/L0Kr78fTvO+mSeew0PZIcjEIFHqlKHmKi9tZKBD1YzKXBjWqzreJsOg4/skfRVaDgXI/ruDte5pcvv1eWbxQ3bp7mHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DNf7Cktt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7367EC4CEF8;
	Thu, 27 Nov 2025 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764232146;
	bh=XDnWZhwF6hdUw7X2NJWegncDTsqHc35sPqTdiJCgnNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNf7CkttM4EX943jsl5GYEMrVDlUwh6xGdPDTxKBybn27mqbl1d0eo/NLieribjim
	 etOjbk4jD39bR0lwIE5pCx7TIJw2supCY8CL7KQmRoFYMA64onRtxPc9Hlr+tRiN2M
	 UGFa287MVgB5DJovcfzJdN9AzSpNVwYWFD4En9IQ=
Date: Thu, 27 Nov 2025 09:29:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, rafael@kernel.org,
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
Message-ID: <2025112705-registrar-drivable-2341@gregkh>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
 <2023112739-willing-sighing-6bdd@gregkh>
 <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>

On Wed, Nov 26, 2025 at 02:13:03PM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 27, 2023 at 7:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Nov 27, 2023 at 05:38:13PM +0100, Maxime Ripard wrote:
> > > Greg, Rafael,
> > >
> > > On Mon, Nov 27, 2023 at 01:14:13PM +0800, Liu Ying wrote:
> > > > Export device_is_dependent() since the drm_kms_helper module is starting
> > > > to use it.
> > > >
> > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > ---
> > > > v2:
> > > > * Newly introduced as needed by patch 2.
> > > >
> > > >  drivers/base/core.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > > > index 67ba592afc77..bfd2bf0364b7 100644
> > > > --- a/drivers/base/core.c
> > > > +++ b/drivers/base/core.c
> > > > @@ -328,6 +328,7 @@ int device_is_dependent(struct device *dev, void *target)
> > > >     }
> > > >     return ret;
> > > >  }
> > > > +EXPORT_SYMBOL_GPL(device_is_dependent);
> > >
> > > So, a committer just applied this to drm-misc-fixes without your
> > > approval. Could you ack it? If you don't want to, we'll fix it.
> >
> > Wait, why exactly is this needed?  Nothing outside of the driver core
> > should be needing this function, it shouldn't be public at all (I missed
> > that before.)
> >
> 
> Hi Greg!
> 
> Sorry for reviving this old thread but I stumbled upon it when looking
> for information on whether anyone ever tried to export
> device_is_dependent() before.
> 
> I have a use-case where I think I need to check if two devices are
> linked with a device link. I assume you'll prove me wrong. :)
> 
> The reset-gpio driver is a reset control driver that mediates sharing
> a reset GPIO (defined as a standardized reference fwnode property
> "reset-gpios") among multiple users. reset-gpio auxiliary devices are
> instantiated from reset core when it detects a consumer trying to get
> a reset-control handle but there's no "resets" reference on the
> consumer's fwnode, only "reset-gpios".
> 
> It makes sense for reset core to create a device link between the
> auxiliary reset-gpio device (the supplier) and the reset consumer
> because this link is not described in firmware - only the link between
> the consumer AND the GPIO controller.
> 
> Now in order to make gpiolib-shared.c code (generic support for shared
> GPIOs) happy, I need to handle the side effects of interacting with
> reset-gpio which does a similar thing. To that end, I need to know if
> given GPIO controller is a supplier of the consumer described in
> firmware OR the auxiliary reset device which is only described with
> software nodes.
> 
> The logical thing to do would be to use "device_is_dependent()" but
> this thread makes me think that won't fly.
> 
> What should I do? What's the "correct" way of checking if two devices
> are linked? I assume that fiddling with the supplier/consumer lists in
> struct device is not it.

fiddling with those lists is what device_is_dependent() does, but no,
you really don't want to be doing that either manually or by calling
this function.

Who is creating this "link"?  Can't that caller tell the gpio core this
relationship at the same time as you are wanting to keep track of it
too?

thanks,

greg k-h

