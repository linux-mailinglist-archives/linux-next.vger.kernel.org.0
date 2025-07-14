Return-Path: <linux-next+bounces-7518-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAD4B03AA5
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 11:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F7C24A0744
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 09:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338242405FD;
	Mon, 14 Jul 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o7n2dh3D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mBQmaIad";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o7n2dh3D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mBQmaIad"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7743323F42A
	for <linux-next@vger.kernel.org>; Mon, 14 Jul 2025 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752484701; cv=none; b=e6/UCWmez3ojYiWQUB/03GrnSFyHtrCYOhc8rl32opo2Aig5jifkcuccG++tjOy0eY0gTjkobIIWLv1u0M1ozOt9U991iSExA1jmuae/3VlnWA07RJQNkcUT2/FiPtRqdxc3y0FZNer0vQFvb59Pd3YVHGNaukzfQAWfXGPJtdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752484701; c=relaxed/simple;
	bh=RDrles8DEnLcUn3NIgE9ss2/zp1WroVHFMW2MtcuS54=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yi2nGBbtbKJZuiqKrsyCDfFse4G+tdLd7ZiHzIv3ltYAPkvFozACDJhBbQlQadyAn3njlf6UnzitOcw7hQ5c7G4UIpAqNRzlI3zr3MQw3zHU8qWrs9u18jO8bmZEX9zVefNC26V8AK7fGYj2owKl3iJ3iRkREa8fPhLUsNKsTgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o7n2dh3D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mBQmaIad; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o7n2dh3D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mBQmaIad; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A09991F7A9;
	Mon, 14 Jul 2025 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752484697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nc5HoPyCGpHMjcV/1O/vCk8mruKFytfnsClT8E+ahA0=;
	b=o7n2dh3DbawO1/z2JepfpLrO+tnYWBXFr+AK/+kZXh7otcv6dOGx2ym0MoDNBxFDhOlSIx
	kBKuxvoliIK4QesErukj/haIJp2zSyXXSxmqVakk6dq+R+PLmaFFRI+uUj5pB97oQXQDeT
	GOxprd49alrhpfjtieeXcS6L1FMq5kA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752484697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nc5HoPyCGpHMjcV/1O/vCk8mruKFytfnsClT8E+ahA0=;
	b=mBQmaIadydHnzQ4nB1CAgIZqV5udXlE28/t2F35Q4hfxVS2h/mekfwmkxLpwaUJELiLk0F
	/o4ki0v8O029//CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752484697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nc5HoPyCGpHMjcV/1O/vCk8mruKFytfnsClT8E+ahA0=;
	b=o7n2dh3DbawO1/z2JepfpLrO+tnYWBXFr+AK/+kZXh7otcv6dOGx2ym0MoDNBxFDhOlSIx
	kBKuxvoliIK4QesErukj/haIJp2zSyXXSxmqVakk6dq+R+PLmaFFRI+uUj5pB97oQXQDeT
	GOxprd49alrhpfjtieeXcS6L1FMq5kA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752484697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nc5HoPyCGpHMjcV/1O/vCk8mruKFytfnsClT8E+ahA0=;
	b=mBQmaIadydHnzQ4nB1CAgIZqV5udXlE28/t2F35Q4hfxVS2h/mekfwmkxLpwaUJELiLk0F
	/o4ki0v8O029//CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CA73138A1;
	Mon, 14 Jul 2025 09:18:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kaNBGVnLdGg4PgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Jul 2025 09:18:17 +0000
Date: Mon, 14 Jul 2025 11:18:16 +0200
Message-ID: <87frez871j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the sound tree
In-Reply-To: <20250714130122.58f531e5@canb.auug.org.au>
References: <20250714130122.58f531e5@canb.auug.org.au>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[canb.auug.org.au,gmail.com,suse.de,renesas.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Mon, 14 Jul 2025 05:01:22 +0200,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> Today's linux-next merge of the sound-asoc tree got a conflict in:
> 
>   sound/soc/codecs/hdac_hdmi.c
> 
> between commit:
> 
>   ed677858d4fe ("ALSA: hda: Move widget capability macros into hdaudio.h")
> 
> from the sound tree and commit:
> 
>   039de8f598dd ("ASoC: hdac_hdmi: remove hdac_hdmi_jack[_port]_init()")
> 
> from the sound-asoc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc sound/soc/codecs/hdac_hdmi.c
> index b33cd5178008,3aae0a2eb047..000000000000
> --- a/sound/soc/codecs/hdac_hdmi.c
> +++ b/sound/soc/codecs/hdac_hdmi.c
> @@@ -24,7 -24,7 +24,6 @@@
>   #include <sound/hda_i915.h>
>   #include <sound/pcm_drm_eld.h>
>   #include <sound/hda_chmap.h>
> - #include "hdac_hdmi.h"
>  -#include "../../hda/local.h"
>   
>   #define NAME_SIZE	32
>   

The conflict resolution looks good, thanks.

Mark, could you send an early PR for 6.17 about ASoC stuff?
I'd like to catch up the conflicts earlier.


thanks,

Takashi

