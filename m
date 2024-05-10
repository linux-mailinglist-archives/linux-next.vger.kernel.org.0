Return-Path: <linux-next+bounces-2261-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB38C1EEF
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 09:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9A051F21DCD
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 07:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADC615ECC1;
	Fri, 10 May 2024 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BBmfbTTB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9KsAXVKF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BBmfbTTB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9KsAXVKF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDECA1311B9;
	Fri, 10 May 2024 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715325914; cv=none; b=Q/0bOksRyyCkQFVSaNf7dxClg4CW61yU9mJX6LNXBu7iaksrSiqLtwqdZKuKUs+mrgQdhSOfpy68mzeqINLN/5dhBZtdKbRi3ktrIeoItMxTyBvc3uWA01vXR3rkJjoQVnVs//pqJDwSQPpyUwoI5Ag9QP0vIlo84wzCTss7ZF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715325914; c=relaxed/simple;
	bh=nd4cW5pghAvNmY1E1H9w2jdwWMlpCmdGAGLC9+HF/ls=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l6L8vmexWm8sE13KujPqChlX4mwH4JebWdBquMJoiizzc2pQf7AAV6GzBTuaVFmCh3RnL4vSX3kMdrFoRyV7z7QwHJP3g8AOqOle+OF0M/FePFnnmcsEwYIn+3QayjEePwJyutVGwqG+iv6pwxhjbdXAHKA4EAqP24MRHlZKz+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BBmfbTTB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9KsAXVKF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BBmfbTTB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9KsAXVKF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D0DFF61135;
	Fri, 10 May 2024 07:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715325910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iLwlNz1udgFJgXEAjY7nBeVpbOODhDsDqWXUtj3ajOw=;
	b=BBmfbTTBQdDmAHlDdv08KjwXiyPm/2rxU5MaHs7VgauiMQhzESBAV++vXvQ6AMj/XtHFiH
	6yhFicV1iYnKb6gVneglQc2s82yvksFJ5vvacEix5pwkqI8Wa3loNSrRTHqvCYD53a70zT
	rF2y9NvmzZWxPu+Nu+HRr0041WZjBQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715325910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iLwlNz1udgFJgXEAjY7nBeVpbOODhDsDqWXUtj3ajOw=;
	b=9KsAXVKFPQVA5J6imO8DRyFum4R9y47mM6m5AbMFJ9xtbpkVmVEFfjLWtsVjz00hsxD1/6
	ywCIsMEZDMbDATAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715325910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iLwlNz1udgFJgXEAjY7nBeVpbOODhDsDqWXUtj3ajOw=;
	b=BBmfbTTBQdDmAHlDdv08KjwXiyPm/2rxU5MaHs7VgauiMQhzESBAV++vXvQ6AMj/XtHFiH
	6yhFicV1iYnKb6gVneglQc2s82yvksFJ5vvacEix5pwkqI8Wa3loNSrRTHqvCYD53a70zT
	rF2y9NvmzZWxPu+Nu+HRr0041WZjBQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715325910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iLwlNz1udgFJgXEAjY7nBeVpbOODhDsDqWXUtj3ajOw=;
	b=9KsAXVKFPQVA5J6imO8DRyFum4R9y47mM6m5AbMFJ9xtbpkVmVEFfjLWtsVjz00hsxD1/6
	ywCIsMEZDMbDATAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A20A2139AA;
	Fri, 10 May 2024 07:25:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tiv5JdbLPWYWEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 May 2024 07:25:10 +0000
Date: Fri, 10 May 2024 09:25:25 +0200
Message-ID: <87h6f69li2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
In-Reply-To: <20240510170305.03b67d9f@canb.auug.org.au>
References: <20240510170305.03b67d9f@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,suse.de,vger.kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Fri, 10 May 2024 09:03:05 +0200,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> ld: warning: discarding dynamic section .glink
> ld: warning: discarding dynamic section .plt
> ld: linkage table error against `acp_dsp_stream_config'
> ld: stubs don't match calculated size
> ld: can not build stubs: bad value
> ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_shutdown':
> acp-probes.c:(.text.acp_probes_compr_shutdown+0x8c): undefined reference to `acp_dsp_stream_put'
> ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_startup':
> acp-probes.c:(.text.acp_probes_compr_startup+0x84): undefined reference to `acp_dsp_stream_get'
> ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_set_params':
> acp-probes.c:(.text.acp_probes_compr_set_params+0x108): undefined reference to `acp_dsp_stream_config'
> ld: acp-probes.c:(.text.acp_probes_compr_set_params+0x140): undefined reference to `acp_dsp_stream_put'
> ld: sound/soc/sof/amd/renoir.o:(.toc+0x0): undefined reference to `sof_acp_common_ops'
> ld: sound/soc/sof/amd/rembrandt.o:(.toc+0x0): undefined reference to `sof_acp_common_ops'
> ld: sound/soc/sof/amd/vangogh.o:(.toc+0x0): undefined reference to `sof_acp_common_ops'
> ld: sound/soc/sof/amd/acp63.o:(.toc+0x0): undefined reference to `sof_acp_common_ops'
> 
> Caused by commit
> 
>   9c2f5b6eb8b7 ("ASoC: SOF: Use *-y instead of *-objs in Makefile")
> 
> I am not sure why, but reverting that commit fixed the build, so I have
> done that for today.

Ah, there is a bug in the original Makefile that didn't use "+=",
hence it overrides.  I'm going to submit a fix patch.


thanks,

Takashi

