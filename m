Return-Path: <linux-next+bounces-4774-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD09C69CC
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 08:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B68211F254AB
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 07:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE9D187342;
	Wed, 13 Nov 2024 07:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="obMkOGJz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MC8s0ZhX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="obMkOGJz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MC8s0ZhX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64852173347;
	Wed, 13 Nov 2024 07:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731482607; cv=none; b=qhNwJ2FtgOpw4GIwjPeQsBX0ISoVrrUjshuUwFXiQXcVSBVsBehcguAfVQWbZ0Ur8Zm2+iqjxPxsYl8ThewctWL6CanJ4PcjO0+/9aDiNdIWrNKssttqOwh17jw2QG/oNQzpwC19J5tp6vWHLOBPUs1uKuC3do3k3XeS3xpX1cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731482607; c=relaxed/simple;
	bh=XsHh/+otLT6HYF6875AIRZpU053cbVkpKVqjpeA1SKA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EBKpDtvxVuYBrk97rhn8K1Yr2j/3b1PRqMpiMxLxFt4msdPtg5W5KatVsPkWetm9IpmizXhXIBZXGzarU8Xh4M0sxadVxBsD+BnTtSt7DoLJj3Hj5qzdud3tMcP91Msv8hTStQcdkmrhU/lfWI4KZzBYJzIJNHY6nnLVnkDuCbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=obMkOGJz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MC8s0ZhX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=obMkOGJz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MC8s0ZhX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5357F1F365;
	Wed, 13 Nov 2024 07:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731482603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l9YhU7Pxoqk+/Pk7EE+7jItH3Q6nJ6Scb14DoHYDzaY=;
	b=obMkOGJzZBJUeod2Au1Vuysl8OJ52TRnCzUngajC6n0lAw38W8KMH9AeypK01UPDiGqclG
	OJGvN9BMEjIg1f3gCe6VGHyLtTbZUiBeaUnLpHSRHTsYbkrEztwjNx9tPw913MC7tkb72J
	AJqveFmfaTJ9cSjsawRRm2b1oFBuHSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731482603;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l9YhU7Pxoqk+/Pk7EE+7jItH3Q6nJ6Scb14DoHYDzaY=;
	b=MC8s0ZhXFB/uImHsx/ugtgkhUcK3nISJ/ybkHgFaKcSIxPS+7AlagWufVaj37L2sQY6LMm
	LK/H5nij6rP/8EDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=obMkOGJz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MC8s0ZhX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731482603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l9YhU7Pxoqk+/Pk7EE+7jItH3Q6nJ6Scb14DoHYDzaY=;
	b=obMkOGJzZBJUeod2Au1Vuysl8OJ52TRnCzUngajC6n0lAw38W8KMH9AeypK01UPDiGqclG
	OJGvN9BMEjIg1f3gCe6VGHyLtTbZUiBeaUnLpHSRHTsYbkrEztwjNx9tPw913MC7tkb72J
	AJqveFmfaTJ9cSjsawRRm2b1oFBuHSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731482603;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l9YhU7Pxoqk+/Pk7EE+7jItH3Q6nJ6Scb14DoHYDzaY=;
	b=MC8s0ZhXFB/uImHsx/ugtgkhUcK3nISJ/ybkHgFaKcSIxPS+7AlagWufVaj37L2sQY6LMm
	LK/H5nij6rP/8EDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 242B513301;
	Wed, 13 Nov 2024 07:23:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rQJvB+tTNGe1FwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Nov 2024 07:23:23 +0000
Date: Wed, 13 Nov 2024 08:23:22 +0100
Message-ID: <87r07fsil1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the sound tree
In-Reply-To: <20241113173111.16c0aecc@canb.auug.org.au>
References: <20241028193731.4b0c3788@canb.auug.org.au>
	<20241113173111.16c0aecc@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 5357F1F365
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[auug.org.au:email,suse.de:mid,suse.de:dkim];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 13 Nov 2024 07:31:11 +0100,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> On Mon, 28 Oct 2024 19:37:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > After merging the sound tree, today's linux-next build (htmldocs)
> > produced these warnings:
> > 
> > include/sound/compress_driver.h:176: warning: Function parameter or struct member 'task_create' not described in 'snd_compr_ops'
> > include/sound/compress_driver.h:176: warning: Function parameter or struct member 'task_start' not described in 'snd_compr_ops'
> > include/sound/compress_driver.h:176: warning: Function parameter or struct member 'task_stop' not described in 'snd_compr_ops'
> > include/sound/compress_driver.h:176: warning: Function parameter or struct member 'task_free' not described in 'snd_compr_ops'
> > include/uapi/sound/compress_offload.h:151: warning: Function parameter or struct member 'reserved' not described in 'snd_compr_task'
> > include/uapi/sound/compress_offload.h:180: warning: Function parameter or struct member 'reserved' not described in 'snd_compr_task_status'
> > 
> > Introduced by commit
> > 
> >   04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
> 
> I am still seeing these warnings.

Thanks for reminder.  I submitted the fix patch now.


Takashi

