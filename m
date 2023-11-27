Return-Path: <linux-next+bounces-92-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E699A7FA8DB
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 19:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29C11B20EF8
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 18:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE043C6AC;
	Mon, 27 Nov 2023 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cbYCKymX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5A023778
	for <linux-next@vger.kernel.org>; Mon, 27 Nov 2023 18:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA2DC433C9;
	Mon, 27 Nov 2023 18:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701109258;
	bh=BPEZYswnHtTaDhuMtTBDQ96uRSzMIQ5kvejeliwaiw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbYCKymX+5I0u4bFW2dSOUBGffKJZEu4kdzCzL23Kk94zcTnWWAca+/slwSlhBAYt
	 4BTNz2Dbl6Hl6QFHfVyiEaintVNanLQNjr6r+l+ruFJhY663j1FjPtzt8Vu3k621z+
	 yL31ybOwTuhQpyAY9zO4VMWvlOt6zTZ70PKG5CBE=
Date: Mon, 27 Nov 2023 18:20:55 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: rafael@kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
	sfr@canb.auug.org.au, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org,
	linus.walleij@linaro.org, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to
 modules
Message-ID: <2023112739-willing-sighing-6bdd@gregkh>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>

On Mon, Nov 27, 2023 at 05:38:13PM +0100, Maxime Ripard wrote:
> Greg, Rafael,
> 
> On Mon, Nov 27, 2023 at 01:14:13PM +0800, Liu Ying wrote:
> > Export device_is_dependent() since the drm_kms_helper module is starting
> > to use it.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v2:
> > * Newly introduced as needed by patch 2.
> > 
> >  drivers/base/core.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 67ba592afc77..bfd2bf0364b7 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -328,6 +328,7 @@ int device_is_dependent(struct device *dev, void *target)
> >  	}
> >  	return ret;
> >  }
> > +EXPORT_SYMBOL_GPL(device_is_dependent);
> 
> So, a committer just applied this to drm-misc-fixes without your
> approval. Could you ack it? If you don't want to, we'll fix it.

Wait, why exactly is this needed?  Nothing outside of the driver core
should be needing this function, it shouldn't be public at all (I missed
that before.)

So please, revert it for now, let's figure out why DRM thinks this is
needed for it's devices, and yet no other bus/subsystem does.

thanks,

greg k-h

