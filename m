Return-Path: <linux-next+bounces-5260-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F6A16787
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 08:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA77D7A3FF6
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 07:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C524D19004D;
	Mon, 20 Jan 2025 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GaD3xWst";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RYjtVPI/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EWrEG67g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="noJmPgft"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E295F17E015;
	Mon, 20 Jan 2025 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737358971; cv=none; b=LH40k0/RuLLE/AtsBlUP3hFVomc92vBUorgnZSeOPZcrSIWPvoE0dZh+26jSdHq7d0nVE+RcyHxr8epMxrlZ4QGiG0xH193raUdbZKDS25bsOFWYHpcSaRuXoPc8ckCpapFUTI8BhM+lKB6otVhQGvDotVtqhnwCf15UnGG5j80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737358971; c=relaxed/simple;
	bh=yE5SP9ZAHCRch3S9/p+SWiJXHIVd8EkZKL3+ar5jchQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bq6m77fmXGtpCC7Wmiy99tf4+tgCtyhy5O3H68H6md9KVB+GzFztYdUKR6bp1t+SfBFkTNcKNlP3EwNRkS/nUQkT4BJLtYM7And/mzcJ715bliX0FkkMT2ltY53mvQ8iE5vZyQ05OsA5gDwd31CshcafxZc0nEEfb87Rwbzy2i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GaD3xWst; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RYjtVPI/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EWrEG67g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=noJmPgft; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCDEE1F79F;
	Mon, 20 Jan 2025 07:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737358968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VfMii5EnBx8uw1WU8FGMltbNbslUlYHELqAutYSE2ms=;
	b=GaD3xWstj/gfugj0vBOryjHbFnNijBVkVW0OImOmAtNXK8UNJx4FDMTZa0m3R8f7wNQS9X
	x10L3cLxxWrQ/zVOnD8P/ki9Vnt+8/BsEIVqExjFs2VsJSC3ZxIZjUHqyO6wGa5oHV9xdD
	/qroGBs6tiyS1MGMl9r3dUqzsCjaZAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737358968;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VfMii5EnBx8uw1WU8FGMltbNbslUlYHELqAutYSE2ms=;
	b=RYjtVPI/ozNHs6b1fkr113SoUeDXxQBrGDOVtRkJyShhOL4J28gFXWBxzevPRlS7r4cFlY
	Z+Jjs8fROrBFjxDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EWrEG67g;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=noJmPgft
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737358967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VfMii5EnBx8uw1WU8FGMltbNbslUlYHELqAutYSE2ms=;
	b=EWrEG67gxK/Gx6ZMc+DORj6cTDEBPq/unxA2b8kkAW4Rkv7KzpJ7HXOOSDGpcmYmzuesNZ
	N6sLAz0tojQUsFhWvuJYK1eMBTiGxuYS53dJILvWZt4BygWjT/U/1vzm9KMYyvmnobOLb6
	Y/FREr/vUDKtjRX494xMTrylTd4nF34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737358967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VfMii5EnBx8uw1WU8FGMltbNbslUlYHELqAutYSE2ms=;
	b=noJmPgftz3DETrMsGGSqTD4wYSc+y76J02iwm8hM2sZDAYrZ8psp7FFfbO0uyE6G1vN2VA
	IPq7/g5kRknOLYCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC1DE1393E;
	Mon, 20 Jan 2025 07:42:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rIi+KHf+jWcgbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jan 2025 07:42:47 +0000
Date: Mon, 20 Jan 2025 08:42:47 +0100
Message-ID: <87sepeorrc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Baojun Xu <baojun.xu@ti.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the crc and sound trees
In-Reply-To: <20250120072810.GA68617@sol.localdomain>
References: <20250120181744.6433557e@canb.auug.org.au>
	<20250120072810.GA68617@sol.localdomain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: DCDEE1F79F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Mon, 20 Jan 2025 08:28:10 +0100,
Eric Biggers wrote:
> 
> On Mon, Jan 20, 2025 at 06:17:44PM +1100, Stephen Rothwell wrote:
> > Probably caused by commit
> > 
> >   bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
> > 
> > from the sound tree - it selects CRC32_SARWATE.
> 
> It needs to select CRC32, not CRC32_SARWATE.  See 86c96e7289c5 where I already
> fixed the last one.  Not sure why the same bug is getting added again.

Sorry for the overlook.  That's a new driver from the past after long
development time, and obviously we overlooked this upstream change for
i2c driver.

Will queue up your suggested fix.


thanks,

Takashi

