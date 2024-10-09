Return-Path: <linux-next+bounces-4178-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B66B996258
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 10:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8622B212C9
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 08:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA9E183CA7;
	Wed,  9 Oct 2024 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jftn0cMQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nKi4Pj31";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ssji292W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CodwJhsG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6988178CC5;
	Wed,  9 Oct 2024 08:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462255; cv=none; b=IveACADXLDxn03GZ6a5EEO3oLftvlVaznvUWWqfP1PburjYoG5EwUvBLVtbGSCQGmYFCx1v2FCmpKq72SNE4Dh3KwjD+gT9s72AAcyxSY83d//XipJT/bJzURvVeI7RC741VZc62GsaatQaEhcF2sekt0aTvkR7q04FrcKvEJ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462255; c=relaxed/simple;
	bh=FDBpzgyIgvRDtMkbk6f9TPOyszpQmHWB0yHmYLOtb6g=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=cxUZcw8tt67SMgkrPp0B/X4mocnlAGMQq76tQLxPWG5sdQfX7ebrtb+3sOvQSnMZsb8vlCfIStZfO+qFp/9yeFmP6O7nPEzsCFe1VHeGTZagVaH7Qsaii0dqGHklLlTSZk3UxyJSI8rVgQjt3FEJAzn/CqcDnSssAJiHiO67GVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jftn0cMQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nKi4Pj31; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ssji292W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CodwJhsG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF81D21D02;
	Wed,  9 Oct 2024 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728462252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zS64yBY5Rmp3ERwjtxhTvL5L38yGTO94XRd/B6dj5fw=;
	b=Jftn0cMQ5/EV9IceEPTPotciDO+xsX4gm04IT+c7dsm0uZMnB6zpkXVWuxpeTdlUOnR2jU
	0hPZK5dxJy9+GLHSOHgv6ViZlbIdbnWW+5K1QjgVGCTL+IIxB1FWuBmFfPLdIa1xEbd29v
	btL9JzZuyBc/HGzYs0T+G1ykdblUrwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728462252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zS64yBY5Rmp3ERwjtxhTvL5L38yGTO94XRd/B6dj5fw=;
	b=nKi4Pj31aRjOUfcEmSIkr+594wvSqSaGAFQ5wwYX5rJUksxUsCKYiufNoKpf0k5i9Vpsi9
	sx0OndLXKxa5rVDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ssji292W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CodwJhsG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728462251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zS64yBY5Rmp3ERwjtxhTvL5L38yGTO94XRd/B6dj5fw=;
	b=ssji292WQVMRMhwa+GLKPIS9dQi1tbOqahYJ2A6UVf15NL3eHrgS2nou0UVM16NngvFvAS
	/9Ij3WfWFQBG9E8wEs0yeXZK1iCLdtP23Xg3cG6QAw+DQGL6Pa1iJMDMUqlnBu6I0BRIr2
	H1pFoc+W8XTu3+BsqYSpOea0t0N/3Ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728462251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zS64yBY5Rmp3ERwjtxhTvL5L38yGTO94XRd/B6dj5fw=;
	b=CodwJhsGQCPvuT9XoVDkR0YRY77SMDR899rL7tPOzzOS2zj5fqsHpMXeqPrIQY8tlswjdx
	zJcqusF3MgE1W8CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CAB1B136BA;
	Wed,  9 Oct 2024 08:24:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WtuqH6g9BmcTTAAAD6G6ig
	(envelope-from <neilb@suse.de>); Wed, 09 Oct 2024 08:24:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Ingo Molnar" <mingo@kernel.org>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra" <peterz@infradead.org>,
 "Kent Overstreet" <kent.overstreet@linux.dev>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: [PATCH] fs/bcachefs: Fix __wait_on_freeing_inode() definition of
 waitqueue entry
In-reply-to: <ZwY6gWsZCq_SdDKI@gmail.com>
References: <>, <ZwY6gWsZCq_SdDKI@gmail.com>
Date: Wed, 09 Oct 2024 19:24:01 +1100
Message-id: <172846224138.444407.2293511819402322368@noble.neil.brown.name>
X-Rspamd-Queue-Id: CF81D21D02
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,auug.org.au:email];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Wed, 09 Oct 2024, Ingo Molnar wrote:
> * NeilBrown <neilb@suse.de> wrote:
>=20
> > On Wed, 09 Oct 2024, Stephen Rothwell wrote:
> > > Hi all,
> > >=20
> > > After merging the tip tree, today's linux-next build (x86_64 allmodconf=
ig)
> > > failed like this:
> > >=20
> > > In file included from include/linux/fs.h:6,
> > >                  from include/linux/highmem.h:5,
> > >                  from include/linux/bvec.h:10,
> > >                  from include/linux/blk_types.h:10,
> > >                  from include/linux/bio.h:10,
> > >                  from fs/bcachefs/bcachefs.h:188,
> > >                  from fs/bcachefs/fs.c:4:
> > > fs/bcachefs/fs.c: In function '__wait_on_freeing_inode':
> > > fs/bcachefs/fs.c:281:31: error: initialization of 'long unsigned int *'=
 from incompatible pointer type 'u32 *' {aka 'unsigned int *'} [-Wincompatibl=
e-pointer-types]
> > >   281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
> >=20
> > The fix we want is to replace that line with
> >    struct wait_bit_queue_entry wait;
> > I should have checked more carefully - sorry.
> >=20
> > I guess we wait for rc3?
> >=20
> > Kent: could you please make that change?  The inode_bit_waitqueue() does
> > initialisation equivalent of DEFINE_WAIT_BIT() so you only need the decla=
ration.
>=20
> Since the breakage was introduced via tip:sched/core, I've applied the fix =

> below.
>=20
> Does this look good to you?

Perfect, thanks.

NeilBrown

>=20
> Thanks,
>=20
> 	Ingo
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
> From: Ingo Molnar <mingo@kernel.org>
> Date: Wed, 9 Oct 2024 10:00:09 +0200
> Subject: [PATCH] fs/bcachefs: Fix __wait_on_freeing_inode() definition of w=
aitqueue entry
>=20
> The following recent commit made DEFINE_WAIT_BIT() type requirements strict=
er:
>=20
>   2382d68d7d43 ("sched: change wake_up_bit() and related function to expect=
 unsigned long *")
>=20
> .. which results in a build failure:
>=20
>   > fs/bcachefs/fs.c: In function '__wait_on_freeing_inode':
>   > fs/bcachefs/fs.c:281:31: error: initialization of 'long unsigned int *'=
 from incompatible pointer type 'u32 *' {aka 'unsigned int *'} [-Wincompatibl=
e-pointer-types]
>   >   281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
>=20
> Since this code relies on the waitqueue initialization within
> inode_bit_waitqueue() anyway, the DEFINE_WAIT_BIT() initialization
> is unnecessary - we can just declare a waitqueue entry.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Suggested-by: NeilBrown <neilb@suse.de>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> ---
>  fs/bcachefs/fs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/bcachefs/fs.c b/fs/bcachefs/fs.c
> index 5bfc26d58270..c410133541ba 100644
> --- a/fs/bcachefs/fs.c
> +++ b/fs/bcachefs/fs.c
> @@ -183,8 +183,9 @@ static void __wait_on_freeing_inode(struct bch_fs *c,
>  				    struct bch_inode_info *inode,
>  				    subvol_inum inum)
>  {
> +	struct wait_bit_queue_entry wait;
>  	wait_queue_head_t *wq;
> -	DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
> +
>  	wq =3D inode_bit_waitqueue(&wait, &inode->v, __I_NEW);
>  	prepare_to_wait(wq, &wait.wq_entry, TASK_UNINTERRUPTIBLE);
>  	spin_unlock(&inode->v.i_lock);
>=20
>=20


