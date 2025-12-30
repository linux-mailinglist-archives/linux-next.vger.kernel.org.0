Return-Path: <linux-next+bounces-9512-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57491CE9A6D
	for <lists+linux-next@lfdr.de>; Tue, 30 Dec 2025 13:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43B0430329DA
	for <lists+linux-next@lfdr.de>; Tue, 30 Dec 2025 12:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011F22EDD78;
	Tue, 30 Dec 2025 12:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="x0wNEmuP"
X-Original-To: linux-next@vger.kernel.org
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E41D416C;
	Tue, 30 Dec 2025 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097557; cv=none; b=vFjlicby1wl8dzQTEfv5LJA3ufwUHpcMeglJhROL2NpAgHi56J467BnAgQHGDggnaXuSkgbod3NRn/BT1k2az9Giv8LfVf1X3imbcy8GXUY7IVN4zsvkZelz4mDEftQ9kxgmnBp+r/v53q26+akVwk5IEcUEw7741LMPKxy2Mjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097557; c=relaxed/simple;
	bh=MQRkymz0aI75p72QKuUuSGmmcfQqw5F7Xa7YToTDrkY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBJgHr/hmDSmo1KZTLG6L8fIcZjkW8n9dxOCs3dPrwEGQlWIsqjAZGJgwlTTjTr7QAjcNUikTZ/4M1QMtvblMyMbLqN1KopvR8R5lRKL0ytylILuhPqQcQvxmjLfYR/IBaP3YnAW72uRn8nvVBJsdLjelGTlXfrC4MdR3WiNtxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=x0wNEmuP; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
X-Virus-Scanned: by amavisd-new using ClamAV (24)
X-Spam-Flag: NO
X-Spam-Score: -0.635
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1767097543;
	bh=Ih1oNrDIRN30m9hjYu0UQBdcWcllJnU2Yu6b5P76YOg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=x0wNEmuPTMAy74VTM4S8zfmfEBJgcC2bjBwiYm1LQlflOXGDIyAodTmstN0pn2cdO
	 dwVRzJ8aLSl2beE0KKLlD2RHLXJlaklm2hYJq3pIv8NcTIjNkU29ZggKI6tG6jZAW2
	 Q5GmMe7klhzE2PvWBjxw/XUeB3wRIxfByCO5lTzlcCJyVeNGiUDNNg2mD4+VZMjg26
	 xY8w1iRbXFlpwkBC3oGutI4S/U1kCMRQyUrWy5r7+C+n5x0mBf+pEGgRINOu9vbfFa
	 c6/Xpq82vDtb4AAKpCZfDX+cXw2IPm/4w6u8Coh5GLmpTfO6POGkXe8l2NG7PfGdIW
	 7DyUjZFBz/S9A==
Received: from fedora (91-150-220-202.dynamic.play.pl [91.150.220.202])
	by server753313.nazwa.pl (Postfix) with ESMTP id 439A91BD578;
	Tue, 30 Dec 2025 13:25:43 +0100 (CET)
Date: Tue, 30 Dec 2025 13:25:42 +0100
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Brahmajit Das <listout@listout.xyz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, <linux-sound@vger.kernel.org>,
 <linux-next@vger.kernel.org>, <liam.r.girdwood@linux.intel.com>,
 <peter.ujfalusi@linux.intel.com>, <tiwai@suse.com>, Richard Biener
 <rguenther@suse.de>, Richard Biener <rguenth@gcc.gnu.org>
Subject: Re: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
Message-ID: <20251230132542.27c99ab5@fedora>
In-Reply-To: <4b85c90a-727e-43a2-b1bc-91dd00045e90@intel.com>
References: <20251221185531.6453-1-listout@listout.xyz>
	<176650962400.445350.17331328109538303145.b4-ty@kernel.org>
	<20251223192409.50a6e4ab@fedora>
	<aUsBgVbloPqBa6sZ@localhost>
	<877bucgpob.wl-tiwai@suse.de>
	<aUvP7FL6c1snBc_S@sirena.co.uk>
	<3cd18fd0-6fef-4804-9474-41a500329e6f@intel.com>
	<aVOKgHJ4NXs5mKe_@localhost>
	<4b85c90a-727e-43a2-b1bc-91dd00045e90@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-NA-AI-Spam-Probability: 0.48
X-NA-AI-Is-Spam: no

On Tue, 30 Dec 2025 10:36:27 +0100
Cezary Rojewski <cezary.rojewski@intel.com> wrote:

> On 2025-12-30 9:32 AM, Brahmajit Das wrote:
> > 
> > Not sure if it would help but I tracked or narrowed down the issue to
> > this section of the code in the avs_condpaths_walk function.
> > 
> > 
> > 	if (avs_tplg_path_template_id_equal(&template->source,
> > 										&template->sink) && dir)
> > 		continue;
> > 
> > If I just comment that code segment out, then it builds successfully;
> > both with and without the hard coded name length.  
> 
> Outstanding! Thank you for this exercise.

Yes, I also managed to reproduce it on my machine.

You can also just reverse the order in
avs_tplg_path_template_id_equal() to:
return !strcmp(id->tplg_name, id2->tplg_name) && id->id == id2->id;
which for some reason makes the error disappear.

> > I was also looking into GCC bugzilla and there seems to lot of reports
> > saying these kind of error could be bogus or false positive. I'm not
> > familiar with GCC internal or experienced in compilers to say/understand
> > whether this case in particular is a false positive or not.  
> 
> Wouldn't be the first time, though having successful builds ain't wrong 
> either. After all we have git log and incremental changes/reverts are 
> not a problem.
> 

I've bisected it down on GCC side to:
https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;a=commitdiff;h=fc62834533f357125b9c1934f80c2ba249adbf9e
in particular it seems to be caused by code added in gcc/tree-ssa-pre.cc
I'm not that familiar with how GCC works, but to me it seems like maybe
it loses size information during this conversion.

I would make normal bug report, but apparently I can't just make GCC
bugzilla account, so adding Richard to CC, while I go through request
process for an account.

@Richard
Hi, we seem to have hit a slight problem while building kernel with pre
release GCC caused by one of your patches, full thread is available
here:
https://lore.kernel.org/linux-sound/20251221185531.6453-1-listout@listout.xyz/T/#u
and my reasoning above.

> > BTW I can't seem to send the email to Amadeusz, hence removing them from
> > the CC-list  
> >> msmtp: recipient address amade@asmblr.net not accepted by the server  
> 
> That's weird. The @linux.intel.com is gone but what you mentioned is the 
> correct one.

Yup, that's weird, but nothing lost, I'm subscribed to mailing list ;)

