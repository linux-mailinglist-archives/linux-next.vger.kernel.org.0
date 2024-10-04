Return-Path: <linux-next+bounces-4103-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CEC98FDA0
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 09:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB5AB281377
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 07:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BE9135A54;
	Fri,  4 Oct 2024 07:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v8L24YHw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p8EjwkWt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v8L24YHw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p8EjwkWt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B391D5AC1;
	Fri,  4 Oct 2024 07:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728025203; cv=none; b=AQ56X0k8a0MPtyD3/7OewfyPbWbwMJ1USbx6iVzqsOlwfjSwrYjWurqSg+op3O1ED3FQAwAFF4uAutCVrUt5LZ9ZEcMDtRpKnJ7xSx1gvI0zMSglQkvSJ1/fr47mDeZgKkEgomrrJLZi4q0lJom2+XTaHPXCgnfX9J6EI43u+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728025203; c=relaxed/simple;
	bh=GMCd6y3UdrdOt1zb/Tlc8QmDYJLG7Omf4NMjoMkBqTQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGyj0YXdquneAK4MnZAV4fIaSDH+m0SVqfAL/QqtQ8VCbzyzaUg2D69+kMI9iiiTTLXFGbEVjLpQ700Je+cDtCky/YH+Eqgc9DvUqYjTgaLesgizMRCgzL8VUY0tHuTjpIj4M+kAVQpgokxE0Ld5AHYukqWdxjb3QzOtJkRjWDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v8L24YHw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p8EjwkWt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v8L24YHw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p8EjwkWt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3047021E47;
	Fri,  4 Oct 2024 07:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728025200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+BZdU1snn74n/5QxU3LwDTvxOdxasAo3RVQw/8BD+H0=;
	b=v8L24YHwzzV8oxpzCuqDMKuIxOWPKsFVvJDTbeRYS8mDzhKdks7wpVdABJlFVWbnpfRHfe
	wmzQ95BCY4gfXZ06mUkmOsTQTLMLUSvwVFJ3ZFqtVYgTgKstinzJPVJb+9Py2ks4vTc546
	L1PowUiLZL27pk3/5lH3YR2zmUA4THc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728025200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+BZdU1snn74n/5QxU3LwDTvxOdxasAo3RVQw/8BD+H0=;
	b=p8EjwkWttgzrywaP9hAEwiEMurtFEbZoKIZJrC8Fa0JpN9XJ0d2FIxqaOWNuiscvE9u6Mf
	DoDFyptP1ChqaQAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728025200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+BZdU1snn74n/5QxU3LwDTvxOdxasAo3RVQw/8BD+H0=;
	b=v8L24YHwzzV8oxpzCuqDMKuIxOWPKsFVvJDTbeRYS8mDzhKdks7wpVdABJlFVWbnpfRHfe
	wmzQ95BCY4gfXZ06mUkmOsTQTLMLUSvwVFJ3ZFqtVYgTgKstinzJPVJb+9Py2ks4vTc546
	L1PowUiLZL27pk3/5lH3YR2zmUA4THc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728025200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+BZdU1snn74n/5QxU3LwDTvxOdxasAo3RVQw/8BD+H0=;
	b=p8EjwkWttgzrywaP9hAEwiEMurtFEbZoKIZJrC8Fa0JpN9XJ0d2FIxqaOWNuiscvE9u6Mf
	DoDFyptP1ChqaQAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0ABDA13A55;
	Fri,  4 Oct 2024 07:00:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id E2UJAXCS/2ayWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Oct 2024 07:00:00 +0000
Date: Fri, 04 Oct 2024 09:00:53 +0200
Message-ID: <87y134mjx6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the sound tree
In-Reply-To: <20241004123417.2dea135f@canb.auug.org.au>
References: <20241004123417.2dea135f@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.29
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.973];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 04 Oct 2024 04:34:17 +0200,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> The following commit is also in the sound-current tree as a different
> commit (but the same patch):
> 
>   3e8800273c4b ("ALSA: hda: Add missing parameter description for snd_hdac_stream_timecounter_init()")
> 
> This is commit
> 
>   740986edaf2d ("ALSA: hda: Add missing parameter description for snd_hdac_stream_timecounter_init()")
> 
> in the sound-current tree.

Fixed now, thanks for noticing.


Takashi

