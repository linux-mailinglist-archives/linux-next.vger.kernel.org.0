Return-Path: <linux-next+bounces-2438-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FBD8D5B77
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 09:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A41DC28226D
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 07:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D16B42071;
	Fri, 31 May 2024 07:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gMVCYZla";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pnqQzyFO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gMVCYZla";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pnqQzyFO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E12B28F7;
	Fri, 31 May 2024 07:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717140651; cv=none; b=o8g/7hPbdAz3xHnzcyNbJ+DApdKHAO5JdAlU8kCunW/kN+n7ddBw5epGGsfjP1jMBPUybZVeRtb6kTTJ1zQv6De3gRBOBWj+CdUeO/T5wHiC/N0kfLyfN4UrMFs/zweFezasJwcKxOCKaT44x1tTycZ30fhRcDiQ9qDYjLMUqQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717140651; c=relaxed/simple;
	bh=MwL+R1ziTfEfmIOi/UNXAUXKdxdbLyfmKrrIDevvxJU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVfHYXZozc0YJvJBtHN73WFUStP3MLIFszdfP2gPZj4PrJ/NDuN+mVX8JtKTyEJWAS73WgHtWQdXX51dH8i+2Wm40dfLUcq1ZvAV6UuqknMtmNm3V15EhZ+xu0ds2IGDe2op6+uJUq0u8DsTlPNoRBdPZ0hfBpIey+Z3+J4O7wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gMVCYZla; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pnqQzyFO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gMVCYZla; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pnqQzyFO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A6BD1F7D1;
	Fri, 31 May 2024 07:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717140647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cI4mDkwAqsOIrnuO5HWNh4d8edY4aV2NANgbvDfsSoU=;
	b=gMVCYZla2oJehAQMIYeAwXgSKhGf7Oz10wlgZpsgyf/tMM2ZklwRpPBQWGFP5H0Wk4OzDH
	CwIoD02mOLQSqORVLxk0aV8p6tFTD6JL9fejJ8Wo7T+4+yGb7KXjWtOCh9wbXY8oatEnsT
	R2EV0luAGsEFbmaxOV5X5yAh3da3/tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717140647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cI4mDkwAqsOIrnuO5HWNh4d8edY4aV2NANgbvDfsSoU=;
	b=pnqQzyFOt6a0ng5lgErg+bCwM8cGt4xaVJXBsgN5h1brrfXyinTHSEtTPN2StBKd3PZuOz
	Xdj6KjBcbY6QDEDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717140647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cI4mDkwAqsOIrnuO5HWNh4d8edY4aV2NANgbvDfsSoU=;
	b=gMVCYZla2oJehAQMIYeAwXgSKhGf7Oz10wlgZpsgyf/tMM2ZklwRpPBQWGFP5H0Wk4OzDH
	CwIoD02mOLQSqORVLxk0aV8p6tFTD6JL9fejJ8Wo7T+4+yGb7KXjWtOCh9wbXY8oatEnsT
	R2EV0luAGsEFbmaxOV5X5yAh3da3/tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717140647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cI4mDkwAqsOIrnuO5HWNh4d8edY4aV2NANgbvDfsSoU=;
	b=pnqQzyFOt6a0ng5lgErg+bCwM8cGt4xaVJXBsgN5h1brrfXyinTHSEtTPN2StBKd3PZuOz
	Xdj6KjBcbY6QDEDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 664E0132C2;
	Fri, 31 May 2024 07:30:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Weu9F6d8WWZZdgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 31 May 2024 07:30:47 +0000
Date: Fri, 31 May 2024 09:31:09 +0200
Message-ID: <87wmna1lqa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the sound-current tree
In-Reply-To: <20240531093717.37c4ccf3@canb.auug.org.au>
References: <20240531093717.37c4ccf3@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-2.99)[99.96%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.29
X-Spam-Flag: NO

On Fri, 31 May 2024 01:44:03 +0200,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> In commit
> 
>   700fe6fd093d ("ALSA: seq: Fix yet another spot for system message conversion")
> 
> Fixes tag
> 
>   Fixes: c2bb79613fed ("ALSA: seq: Fix incorrect UMP type for system messages")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: edb32776196a ("ALSA: seq: Fix incorrect UMP type for system messages")

My bad, the old SHA ID was kept there after rebasing locally.
But since I've merged other stuff after this commit, I leave it as
is at this time.  The commit has another Fixes tag pointing to the
right commit, and this should enough for indicating for the stable
fixes.


thanks,

Takashi

