Return-Path: <linux-next+bounces-3274-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5609F94CB92
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 09:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F38CF1F25662
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 07:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529A717D345;
	Fri,  9 Aug 2024 07:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mvyiaiCC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+mc2Z3jk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mvyiaiCC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+mc2Z3jk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AE517CA14;
	Fri,  9 Aug 2024 07:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723189385; cv=none; b=Ns0MjLCWqensz6mbF3YeYCJ3WYCM0HdhfJ/SBM5HfUU8UHHq2kqoFRe6nLnFKFsXBnHv8p+vYCldx9vI+dUs/aR37QwmEpT2q2M3tk0DwsJ1j0YSwRrCLyo6QecjC5vZGs5eTQnCirirs3mZz07NLB9PnLk0Y7xxVCbU3izeVBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723189385; c=relaxed/simple;
	bh=MUNK1MC9nNM3if/M7wOMj4s/Sk9qNqsGtLb9K9dr+5E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ckd2RnZ81AP1avgHqPxofWKfCWdRdxJrcEh4kFaEde8bmKbitza/gAaUgv7WSlhwua/w2pPo2k8sEN6YqQFlelT/A+CKjAICqYdDeh7D9uCaBy3AFnpp6fD1k8aCFGACPLr+NFSSJTYOqr5FjjVR7bcS1B3nHHBeVNu+KeuyAus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mvyiaiCC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+mc2Z3jk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mvyiaiCC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+mc2Z3jk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE3FC1FF1B;
	Fri,  9 Aug 2024 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723189381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L9ys9DELbUmcV7BaxDeRtIVEoPz61t8Oy5OkhzdcExc=;
	b=mvyiaiCCkn9/dwcmlKOUB0xUlhygaoQ8tnvKKC3F4SJcukJzPGap26cSE3JvQUWejCh6Rp
	O6Rf5gSfe2zLe4kKH29pkuaYSEaX9fE5N/DxXCOxjas3syI0/p2ScwKHUc/ynPgISQh0/C
	smjM+a6/4/1Lzmt/GhD/S8+f/e5BsEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723189381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L9ys9DELbUmcV7BaxDeRtIVEoPz61t8Oy5OkhzdcExc=;
	b=+mc2Z3jkCC47yU/N9PL6/4NmIi1I3NNCaDEEDbT1VPkZVtdkLvkPazZA7SGN7qwe3PYX0m
	o7PeWPFYbesGs6BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723189381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L9ys9DELbUmcV7BaxDeRtIVEoPz61t8Oy5OkhzdcExc=;
	b=mvyiaiCCkn9/dwcmlKOUB0xUlhygaoQ8tnvKKC3F4SJcukJzPGap26cSE3JvQUWejCh6Rp
	O6Rf5gSfe2zLe4kKH29pkuaYSEaX9fE5N/DxXCOxjas3syI0/p2ScwKHUc/ynPgISQh0/C
	smjM+a6/4/1Lzmt/GhD/S8+f/e5BsEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723189381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L9ys9DELbUmcV7BaxDeRtIVEoPz61t8Oy5OkhzdcExc=;
	b=+mc2Z3jkCC47yU/N9PL6/4NmIi1I3NNCaDEEDbT1VPkZVtdkLvkPazZA7SGN7qwe3PYX0m
	o7PeWPFYbesGs6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5EFE1379A;
	Fri,  9 Aug 2024 07:43:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qTc0J4XItWatFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Aug 2024 07:43:01 +0000
Date: Fri, 09 Aug 2024 09:43:41 +0200
Message-ID: <875xsa87ki.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound tree
In-Reply-To: <20240809112252.5af8025f@canb.auug.org.au>
References: <20240809112252.5af8025f@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 09 Aug 2024 03:22:52 +0200,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> After merging the sound tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> sound/usb/caiaq/audio.c: In function 'snd_usb_caiaq_pcm_prepare':
> sound/usb/caiaq/audio.c:179:41: error: unused variable 'i' [-Werror=unused-variable]
>   179 |         int bytes_per_sample, bpp, ret, i;
>       |                                         ^
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   e95b9f7f2ee0 ("ALSA: snd-usb-caiaq: use snd_pcm_rate_to_rate_bit")
> 
> I used the sound tree from next-20240808 for today.

Thanks, I corrected now.


Takashi

