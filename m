Return-Path: <linux-next+bounces-9510-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB47CCE90A5
	for <lists+linux-next@lfdr.de>; Tue, 30 Dec 2025 09:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD31A3010A92
	for <lists+linux-next@lfdr.de>; Tue, 30 Dec 2025 08:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2051A2FD1BC;
	Tue, 30 Dec 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="gLnP3QjF"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B733296BBC;
	Tue, 30 Dec 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083558; cv=none; b=LcC6eZ6LM7B5HKZQg1H0ZTioCPnpvuUM0Jx/2q2zCps2VFgFUlKYqFX8jd3xwnE4eItrt8pMKbO28bUP/4HG1qmOg+7NIMq/svsKHmZ+6q91HpZ/oeC+GLSN6XH8gJ1e8BiV+p+9KWR+VgxxXiWS+/msJ8FeGUNO8EKRh00DLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083558; c=relaxed/simple;
	bh=+64jrnCjkzrDgt+liLo7SMl2Mbn0RK5z+P/Tv6odsKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRfRo4wy+dV5pTbGavX1O6kXo1Zjz1sKU33Fs7p1+oypiQUJFB5xSQd8vkP2nIWe83x0Us8a8zX8iO6aiPFrMBOAkGjHN24Pt29YracPVvaQCkUb76mJF2WloYJUi++3wgsnFhUkpWi9I5rlR2q1FqPA/JxfgbK9q6RRMhiRTww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=gLnP3QjF; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dgRCs601nz9t83;
	Tue, 30 Dec 2025 09:32:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1767083545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WB8PDAH+L+yyJ3NdQUj01EhV7SO3kbIqZR36MISVRkM=;
	b=gLnP3QjFKcp692wYnwQ4sQn7Gx/0ifYDybvBctaP+3xMLYW/8//sLyunEf0yo+KIk++35M
	oB8yT6oR/wTM/OkOXZJz9egK//6oburLQWvyQE3mrhE1iLyTlU0NodVm4jSU8km64YYGz+
	Fh1C7jcX9K+9dVhvLCFpNbhp445K32Vfy/kbAliD+KcyQfB4khCBwghWVMSB6RM6pAjlpI
	DnwbUG5JLaejYwmfV7rmUU1/8ECPCZAIXnzpcI51qAT2Tw5HO5gkwO/Nus+4cGP+POo2iY
	zaqL2dGsAPmJj3nshh6QXaASdrM0W+A1JjrjGb0uMu9En+JDVs4cZt0ZEtxbsg==
Date: Tue, 30 Dec 2025 14:02:21 +0530
From: Brahmajit Das <listout@listout.xyz>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>, 
	linux-sound@vger.kernel.org, linux-next@vger.kernel.org, liam.r.girdwood@linux.intel.com, 
	peter.ujfalusi@linux.intel.com, tiwai@suse.com
Subject: Re: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
Message-ID: <aVOKgHJ4NXs5mKe_@localhost>
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
...
> Brahmajit,
> 
> While I'm sure you did, just to be sure - did you try clean-rebuild with the
> 44-hardcode proposed by Amadeusz? We wouldn't want any old-artifacts to get
> in the way.
> 
> 
> Kind regards,
> Czarek

Czarek,

Not sure if it would help but I tracked or narrowed down the issue to
this section of the code in the avs_condpaths_walk function.


	if (avs_tplg_path_template_id_equal(&template->source,
										&template->sink) && dir)
		continue;

If I just comment that code segment out, then it builds successfully;
both with and without the hard coded name length.

I was also looking into GCC bugzilla and there seems to lot of reports
saying these kind of error could be bogus or false positive. I'm not
familiar with GCC internal or experienced in compilers to say/understand
whether this case in particular is a false positive or not.

BTW I can't seem to send the email to Amadeusz, hence removing them from
the CC-list
> msmtp: recipient address amade@asmblr.net not accepted by the server
-- 
Regards,
listout

