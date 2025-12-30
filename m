Return-Path: <linux-next+bounces-9509-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ACFCE8FC0
	for <lists+linux-next@lfdr.de>; Tue, 30 Dec 2025 09:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD6213025FBE
	for <lists+linux-next@lfdr.de>; Tue, 30 Dec 2025 08:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1742F7AD0;
	Tue, 30 Dec 2025 08:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="g2CuOUwe"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6393009EC;
	Tue, 30 Dec 2025 08:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082158; cv=none; b=Ah2TNJnIVjI+5AntibnKRr6muaSXlghNblLmQVtkZWJBa3mB3HuDzbUz8F4xAbC2RoKJ1bLYzH443GWXpjviWZko09rolnqqTCOXsC5+pYZqkMXsqEFtN9Ai+fFgQU1NDQTcnXDnVl7EzB1CR6cM4GjaWbNwInmIKMTr+YyF7QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082158; c=relaxed/simple;
	bh=EE8iG00lFFYRdgbODTVxEAf3ou7WLZTCeBo8k7Pty/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YERz0w5oXTlx4LAx/R/uBnQY2kMVjuUID1EfRXMJYS96DqzTkc76qdKFc9CfNvD4qDiEG8q5XOehCuMRgH7npa5Grp9f9bRQ+HcEOrJGpR5uvzB/1EHg2ZExyMJCF3rXvwg9jGAdG7a9jRUdGrA2S/xCZcauC5HeD56rHNJIAXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=g2CuOUwe; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dgQTb47WLz9tf6;
	Tue, 30 Dec 2025 08:59:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1767081555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvnsWEuPgN8jE9Mwi9uKyXKkrad7PSMDsiT4kslg5Q4=;
	b=g2CuOUwe6z94nH+xHtbNM59Ulh0TKIkrEZWHQGpuFLKjTbVO6HxgK8H65b8tE7Z2PmNHJW
	k7rzCZ7u/m5LI9qEsbNol1cClAHaVK4zT4TnMBJ8Zhmezc3SGuZoy+auJsVaBVXZgU4WMy
	FWTJuyPbL3R45JKc7x9Y3oD0hh9JEfvhxayhEhUVke8C59XWpS7PfQw0XXsBmY4wub79DO
	azSLbd+pbFyk7Yfr1427ZUE0F7CXvLLeOUJKebLPG110VF1GKkHuuIjU+HH3QpPtAnv8/S
	wp/+4cLmtfhNsgxKyWv9K0kjnbCH696SLoCxTshfscqbkC6oPBgYflMgUHaWFA==
Date: Tue, 30 Dec 2025 13:29:08 +0530
From: Brahmajit Das <listout@listout.xyz>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>, 
	linux-sound@vger.kernel.org, linux-next@vger.kernel.org, liam.r.girdwood@linux.intel.com, 
	peter.ujfalusi@linux.intel.com, tiwai@suse.com
Subject: Re: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
Message-ID: <aVOFeKLgan1McTTa@localhost>
References: <20251221185531.6453-1-listout@listout.xyz>
 <176650962400.445350.17331328109538303145.b4-ty@kernel.org>
 <20251223192409.50a6e4ab@fedora>
 <aUsBgVbloPqBa6sZ@localhost>
 <877bucgpob.wl-tiwai@suse.de>
 <aUvP7FL6c1snBc_S@sirena.co.uk>
 <3cd18fd0-6fef-4804-9474-41a500329e6f@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3cd18fd0-6fef-4804-9474-41a500329e6f@intel.com>

On 29.12.2025 11:03, Cezary Rojewski wrote:
> On 2025-12-24 12:35 PM, Mark Brown wrote:
> > On Wed, Dec 24, 2025 at 11:05:56AM +0100, Takashi Iwai wrote:
> > 
> > > I believe it's a false positive, too.
> > > Or is it about potentially unterminated strings?
> > 
> > Regardless of the warning being spurious or not the cleanup seems like a
> > sensible one.
> 
> Right now I leaning towards Amadeusz' opinion - looks like we're masking an
> issue. id->tplg_name is being used in strcmp() context few times in this
> file yet compiler complains about one particular location.
> 
> gcc-16 is quite recent. It's good that we get the kernel building but after
> the Christmas break some digging may be in order : )
> 
> 
> Brahmajit,
> 
> While I'm sure you did, just to be sure - did you try clean-rebuild with the
> 44-hardcode proposed by Amadeusz? We wouldn't want any old-artifacts to get
> in the way.

Hi Cezary,

Yes, I did make clean and make allmodconfig after reverting my changes
and hardcoding 44 as Amadeusz suggested.

-- 
Regards,
listout

