Return-Path: <linux-next+bounces-5259-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F44A16785
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 08:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 364C61883814
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 07:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310E518FC92;
	Mon, 20 Jan 2025 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xw7TM0gY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VE1Yvszi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xw7TM0gY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VE1Yvszi"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332717E015;
	Mon, 20 Jan 2025 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737358946; cv=none; b=LhlbaIBsl2uWdEwyypg/wPKUsDkWWgtL1C8EXDwABv0nHOcKGvY/AVLl8VccKpmKLyQ/egV6pXkvSiytdcaT7GexYvU8J9YXNGdfwJM+ZQDm8NVsvsiI/DQcy5uwwgFwtnq2YfFf0w8frC46TZYsvvIiBmLIQ4zb5f8DvwcG3qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737358946; c=relaxed/simple;
	bh=A2g75ZN/eZsM1mADFlNxaPY5aNTefKc5w4CM/QYn4rw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxMzjDd9Du0qAkL80oZU7VSUX9aAZldQ50+sMqAIxjqEvUtJVLLCaafdnVCSiy02Xv+6HrSq/ng3ewjNRmMvwPD6kTZDJAmMLMeVKvQdIFkE2kAnqUcQg5dElTR6mnbEL2r2j+9vRaI06TXrfOe49GkmafV1+r/Fh0D0ZiDUg9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xw7TM0gY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VE1Yvszi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xw7TM0gY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VE1Yvszi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 778D321133;
	Mon, 20 Jan 2025 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737358941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WL2+30Fl97XOgWPWUO20YoK6a/IpkZtlK8kww0M1v8Y=;
	b=xw7TM0gYr0UO7Ra9zxPYzQpnQXwug0qIoAxRg803GXXTqBsMsbsxAFaNd1W5BbffiIoWqe
	l7wt5jFTY+C2V1cWtF5PQ0PIFy5UrU0/a71ZvT/itPJvfBiVpkL7GfWKzpJQNbDOjVXWgh
	sruqqBlswCzw2twCSLwLsR07uzzgq0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737358941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WL2+30Fl97XOgWPWUO20YoK6a/IpkZtlK8kww0M1v8Y=;
	b=VE1Yvszie03+tJFJrMewxUO8htW3KNKjsAgmOMZ9COtBPoo24nQDf2saWEOx2e+WyLNtDn
	d22oRPmXghklKxBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737358941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WL2+30Fl97XOgWPWUO20YoK6a/IpkZtlK8kww0M1v8Y=;
	b=xw7TM0gYr0UO7Ra9zxPYzQpnQXwug0qIoAxRg803GXXTqBsMsbsxAFaNd1W5BbffiIoWqe
	l7wt5jFTY+C2V1cWtF5PQ0PIFy5UrU0/a71ZvT/itPJvfBiVpkL7GfWKzpJQNbDOjVXWgh
	sruqqBlswCzw2twCSLwLsR07uzzgq0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737358941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WL2+30Fl97XOgWPWUO20YoK6a/IpkZtlK8kww0M1v8Y=;
	b=VE1Yvszie03+tJFJrMewxUO8htW3KNKjsAgmOMZ9COtBPoo24nQDf2saWEOx2e+WyLNtDn
	d22oRPmXghklKxBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47F681393E;
	Mon, 20 Jan 2025 07:42:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xuuAD13+jWdIZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jan 2025 07:42:21 +0000
Date: Mon, 20 Jan 2025 08:42:20 +0100
Message-ID: <87tt9uors3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound tree
In-Reply-To: <20250120145617.07945574@canb.auug.org.au>
References: <20250120145617.07945574@canb.auug.org.au>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 20 Jan 2025 04:56:17 +0100,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> After merging the sound tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> sound/usb/fcp.c: In function 'fcp_hwdep_init':
> sound/usb/fcp.c:889:22: error: assignment to 'long int (*)(struct snd_hwdep *, char *, long int,  loff_t *)' {aka 'long int (*)(struct snd_hwdep *, char *, long int,  long long int *)'} from incompatible pointer type 'ssize_t (*)(struct snd_hwdep *, char *, long int,  loff_t *)' {aka 'int (*)(struct snd_hwdep *, char *, long int,  long long int *)'} [-Wincompatible-pointer-types]
>   889 |         hw->ops.read = fcp_hwdep_read;
>       |                      ^
> 
> Caused by commit
> 
>   46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")
> 
> I have applied the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 20 Jan 2025 14:49:12 +1100
> Subject: [PATCH] fixup for "ALSA: FCP: Add Focusrite Control Protocol driver"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Sorry for inconvenience.  I pushed your fix now.
(I tried to address yesterday, but it wasn't enough, obviously.)


thanks,

Takashi

