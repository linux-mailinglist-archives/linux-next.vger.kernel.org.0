Return-Path: <linux-next+bounces-3530-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 043EC967F46
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 08:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2510F1C21168
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 06:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F776152532;
	Mon,  2 Sep 2024 06:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zPXdKnEm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p0zbnxxB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zPXdKnEm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p0zbnxxB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE9F2AE99;
	Mon,  2 Sep 2024 06:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725258092; cv=none; b=pKPknIax8i+hhQMHgl1YI4Q0v86Bm6phL2w3U+GZ8vxypUEh96OpLBOSO6NSgN2BlypnnWqNB00G5EUCmvQgBW0EZU3riYiMe5heZ/x7A4E79KO0Ve7HwqvTluQ7OuL69b1DojD/c57e+XZ5l6KuhUDEsg9LjH90bYCwCgVonvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725258092; c=relaxed/simple;
	bh=s1znN0abf0bneMhDEdFUQTPrWmEEVSJLI2aW+93mYi4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SxRVXatoFcSKGfUYGyTuDwp9/vzyK59A/HBGyc+HYeyiBD2aTQJlim9ug7W/5z18epffn0FQ3xjxZ8WPGsXMjfmxpz3rt54DEfSy/Qo5X8g5BcUg78DQRZeuCR65VIXvh+6aDIHYaQNE+m43EuctZrxz749tW2EaJhrwSuDCIWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zPXdKnEm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p0zbnxxB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zPXdKnEm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p0zbnxxB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 814971FB97;
	Mon,  2 Sep 2024 06:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725258088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C5fxKOT/fbTx8VLeFZjFRznfQhjLA9W+Q/jOug0T1O0=;
	b=zPXdKnEmnXZ5RAdeMlGjugZxTaTHfI1A/Tf+6IPq4uh8m3Yi2K8SLIQnhOTNX2YBYNbnvD
	O2SdJKdI+do6Gh+ncxxvGsDbLQ1bJPd6TQLogIIEUzNaLKN7v737fyaL3qe1QF8OH5M0xZ
	CyqwClzRWepvgeN3su5lHzC+GLXqpUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725258088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C5fxKOT/fbTx8VLeFZjFRznfQhjLA9W+Q/jOug0T1O0=;
	b=p0zbnxxB+I1NsCAEy2BC3fIzKv2Bt/ZsaP2g7MEVa1m92W4BOtH8O7putpVZkrjyXQ18WI
	Hn8lgJmT7TKVDgAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zPXdKnEm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p0zbnxxB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725258088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C5fxKOT/fbTx8VLeFZjFRznfQhjLA9W+Q/jOug0T1O0=;
	b=zPXdKnEmnXZ5RAdeMlGjugZxTaTHfI1A/Tf+6IPq4uh8m3Yi2K8SLIQnhOTNX2YBYNbnvD
	O2SdJKdI+do6Gh+ncxxvGsDbLQ1bJPd6TQLogIIEUzNaLKN7v737fyaL3qe1QF8OH5M0xZ
	CyqwClzRWepvgeN3su5lHzC+GLXqpUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725258088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C5fxKOT/fbTx8VLeFZjFRznfQhjLA9W+Q/jOug0T1O0=;
	b=p0zbnxxB+I1NsCAEy2BC3fIzKv2Bt/ZsaP2g7MEVa1m92W4BOtH8O7putpVZkrjyXQ18WI
	Hn8lgJmT7TKVDgAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5BE4C13AE5;
	Mon,  2 Sep 2024 06:21:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qEQjFWhZ1WYbGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Sep 2024 06:21:28 +0000
Date: Mon, 02 Sep 2024 08:22:14 +0200
Message-ID: <871q22k221.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the sound tree
In-Reply-To: <20240902132904.5ee173f3@canb.auug.org.au>
References: <20240902132904.5ee173f3@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 814971FB97
X-Spam-Score: -5.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 02 Sep 2024 05:29:04 +0200,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> After merging the sound tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> In file included from include/asm-generic/bug.h:22,
>                  from arch/arm/include/asm/bug.h:60,
>                  from include/linux/bug.h:5,
>                  from include/linux/io.h:12,
>                  from sound/core/pcm_memory.c:7:
> sound/core/pcm_memory.c: In function 'snd_pcm_lib_preallocate_proc_write':
> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'long unsigned int' [-Wformat=]
>     5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
>       |                         ^~~~~~
> include/linux/printk.h:135:25: note: in definition of macro 'no_printk'
>   135 |                 _printk(fmt, ##__VA_ARGS__);            \
>       |                         ^~~
> include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
>    15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
>       |                         ^~~~~~~~
> include/linux/printk.h:620:19: note: in expansion of macro 'KERN_DEBUG'
>   620 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
>       |                   ^~~~~~~~~~
> sound/core/pcm_memory.c:215:33: note: in expansion of macro 'pr_debug'
>   215 |                                 pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
>       |                                 ^~~~~~~~
> 
> Introduced by commit
> 
>   43b42ed438bf ("ALSA: pcm: Fix the previous conversion to kstrtoul()")

My bad, will submit the fix patch.


thanks,

Takashi

