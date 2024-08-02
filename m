Return-Path: <linux-next+bounces-3213-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A550945813
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 08:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC5901F23606
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 06:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A564282FA;
	Fri,  2 Aug 2024 06:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ilW3kSQt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="db89q6fp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ilW3kSQt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="db89q6fp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8D134B6;
	Fri,  2 Aug 2024 06:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722580565; cv=none; b=Of5PYTgy3K/zCAimNEnOtstuctsJY2k93avR9ROaun4lssvVuVV4wTRqY1gazkkVf9TadvgLHLKxAo9xLkiclPWabSDUlBk3cZWkp+ErF+x3f82iISDBhdmdB0t5l9IPOvKilfREqnhsncdKCHFTkGvsmZf33XJX63O/WL6aeJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722580565; c=relaxed/simple;
	bh=sAqoXYerHI9hNI+lJHALuT+GhZWTmkH77iK7Y+MHmFg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SAfmA32nSM3AW3duuJx+zL2s5mk/NUPBSWtpOws50iFDsY3/MEWcNDFDToc+STQfKfxgQX8Wt+phczsz9NBZzsSY922ZEGndq1rsik0alHW1vsKKcvO3UK0sYRbV/+vpXn6cPF3bak3x+Q4o8Pbji3wS/5z1DBglGTJllQ/s4IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ilW3kSQt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=db89q6fp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ilW3kSQt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=db89q6fp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 845F821A21;
	Fri,  2 Aug 2024 06:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722580561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hKI2L+NoERSIbYAKkhhz73Hnoa6+HMmim8DwxJ1Zrxs=;
	b=ilW3kSQt2+ecfNk+44ZrP/j++C2OHNv/0lxfSAImJ9Rr+LcUXmxg9Nn/6izens/3N7ZQiB
	v8agIJrFCeOyBLVQwMdiQo6c+SF58oOwnO2mS/bZkG0oJrtUCdWnyMYiIG8Vew5rIS5apQ
	5cTWYMcbhUx076iGRTjb0yBC1t2AEj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722580561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hKI2L+NoERSIbYAKkhhz73Hnoa6+HMmim8DwxJ1Zrxs=;
	b=db89q6fpJy4qdDpDMczy4htNrUr+4l/sxCoINRyqZsOlucvDL3VYJYzQOSgDv7dbAQN8dY
	GLug42PgPOoTT3Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ilW3kSQt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=db89q6fp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722580561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hKI2L+NoERSIbYAKkhhz73Hnoa6+HMmim8DwxJ1Zrxs=;
	b=ilW3kSQt2+ecfNk+44ZrP/j++C2OHNv/0lxfSAImJ9Rr+LcUXmxg9Nn/6izens/3N7ZQiB
	v8agIJrFCeOyBLVQwMdiQo6c+SF58oOwnO2mS/bZkG0oJrtUCdWnyMYiIG8Vew5rIS5apQ
	5cTWYMcbhUx076iGRTjb0yBC1t2AEj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722580561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hKI2L+NoERSIbYAKkhhz73Hnoa6+HMmim8DwxJ1Zrxs=;
	b=db89q6fpJy4qdDpDMczy4htNrUr+4l/sxCoINRyqZsOlucvDL3VYJYzQOSgDv7dbAQN8dY
	GLug42PgPOoTT3Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 536D113999;
	Fri,  2 Aug 2024 06:36:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5fR+ElF+rGYtdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Aug 2024 06:36:01 +0000
Date: Fri, 02 Aug 2024 08:36:37 +0200
Message-ID: <87mslvig7e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the ieee1394 tree
In-Reply-To: <20240802122120.480789ac@canb.auug.org.au>
References: <20240802122120.480789ac@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -5.31
X-Rspamd-Queue-Id: 845F821A21

On Fri, 02 Aug 2024 04:21:20 +0200,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> The following commits are also in the sound-current tree as different
> commits (but the same patches):
> 
>   c2f9fd3d6ad7 ("Revert "ALSA: firewire-lib: operate for period elapse event in process context"")
>   e29ed9a81fd4 ("Revert "ALSA: firewire-lib: obsolete workqueue for period update"")

Sakamoto-san, with your Reviewed-by tag, I thought you gave a sign to
put via sound git tree?  I'm going send a PR to Linus in today, so if
possible, please drop those from yours.


thanks,

Takashi

