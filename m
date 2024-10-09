Return-Path: <linux-next+bounces-4163-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D259C995E69
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 06:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55B6C1F23DAA
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 04:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F9A7DA88;
	Wed,  9 Oct 2024 04:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rsSbDGm1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I5qMwwz7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X7nRv5Nr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3g6cKlPB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC307208D0;
	Wed,  9 Oct 2024 04:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728446539; cv=none; b=nSPqbRm33TmXsw0kYKKSk9ezLZEH4uuzwuxvRtpsNgVoitGFN9zeiOVZaDdUK8QdMOz6ovyFgFmTxvgBZCqhGC/Nxhss9VQXOFszicjRNIfpPkgM+5ARMmx50/OTFZw90+s7QITazJGyVAYcvpohDPVa1AFVaQgvh+PVD3fnMDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728446539; c=relaxed/simple;
	bh=ZCmr6Jko34VqmD4TInSmUrrSkXVgMiEdj1LIiH2dQvE=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=TnB935e7JJwk0qIJIL5nkSGA4GSIHxWEANsk9eQvTReclvcOFmfhBLHjT8skxuoJ6U7f2JZmB4QvWi7aBjspjtn/V4/LbIEmd3OEFeKnxngp6wOGTPI9/y/S7+pZ0XoRs0viO1qqokJoSP2Ep67ZAY0HesUh6Gp1z6kiSKfXBok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rsSbDGm1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I5qMwwz7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X7nRv5Nr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3g6cKlPB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D3FA21FE6A;
	Wed,  9 Oct 2024 04:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728446535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wqo8sSF1CPsmAksuNelZaO6AY0CRJYERvryEEhSHHdM=;
	b=rsSbDGm1Ob/4eGh6EWZdaqdg5NSQ2ImptoAoly8xXSig1Yd5BLUV9NKsMoncLi3vxOF09n
	D/oR0Q96Fx1bWcbjeQ6mzEG+nAiKgIpEkyQKTvnesX091BDaI13rclYTb0ikj2HT7Pyqs5
	5F0aNfw5mC+IAFGzisl+CxWVGrT4x8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728446535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wqo8sSF1CPsmAksuNelZaO6AY0CRJYERvryEEhSHHdM=;
	b=I5qMwwz7Nc0ilQ3hvn6oX/CYnlZrOlTVszLSKV0aiMm5fgdSugpLZTscW76hRb1gjTM3ax
	8eUhhBdF2K5ZjfBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=X7nRv5Nr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3g6cKlPB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728446530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wqo8sSF1CPsmAksuNelZaO6AY0CRJYERvryEEhSHHdM=;
	b=X7nRv5NrVkLbg+NO3n48GXR/njxNGEFffbNM29WJxS58kTqT421ltvXcXgvF4y8bFgeseO
	phLg5SFszhAYymMqWFBSEEv+R/e+b55RC0CawDiuxCGlOjMqSn6TYy9Lb6Pv0aQMOC46Yf
	TOSmglJU8Mt7gbD7VqvBbr7n5qi1Jlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728446530;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wqo8sSF1CPsmAksuNelZaO6AY0CRJYERvryEEhSHHdM=;
	b=3g6cKlPB8J4Or+mnAWKVP7YEyiWj88LsBVWqdLgGPrcyJpCGzz7/ILRti9iuy0lLZwxhmN
	8zP0BV9yoOHweKCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2616B132BD;
	Wed,  9 Oct 2024 04:02:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Lg03Mz8ABmdLAgAAD6G6ig
	(envelope-from <neilb@suse.de>); Wed, 09 Oct 2024 04:02:07 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra" <peterz@infradead.org>,
 "Kent Overstreet" <kent.overstreet@linux.dev>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
In-reply-to: <20241009144511.5fd62c94@canb.auug.org.au>
References: <20241009144511.5fd62c94@canb.auug.org.au>
Date: Wed, 09 Oct 2024 15:02:00 +1100
Message-id: <172844652013.444407.16580824583469743404@noble.neil.brown.name>
X-Rspamd-Queue-Id: D3FA21FE6A
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noble.neil.brown.name:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Wed, 09 Oct 2024, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> In file included from include/linux/fs.h:6,
>                  from include/linux/highmem.h:5,
>                  from include/linux/bvec.h:10,
>                  from include/linux/blk_types.h:10,
>                  from include/linux/bio.h:10,
>                  from fs/bcachefs/bcachefs.h:188,
>                  from fs/bcachefs/fs.c:4:
> fs/bcachefs/fs.c: In function '__wait_on_freeing_inode':
> fs/bcachefs/fs.c:281:31: error: initialization of 'long unsigned int *' fro=
m incompatible pointer type 'u32 *' {aka 'unsigned int *'} [-Wincompatible-po=
inter-types]
>   281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);

The fix we want is to replace that line with
   struct wait_bit_queue_entry wait;
I should have checked more carefully - sorry.

I guess we wait for rc3?

Kent: could you please make that change?  The inode_bit_waitqueue() does
initialisation equivalent of DEFINE_WAIT_BIT() so you only need the declarati=
on.

Thanks,
NeilBrown


>       |                               ^
> include/linux/wait_bit.h:22:20: note: in definition of macro '__WAIT_BIT_KE=
Y_INITIALIZER'
>    22 |         { .flags =3D word, .bit_nr =3D bit, }
>       |                    ^~~~
> fs/bcachefs/fs.c:281:9: note: in expansion of macro 'DEFINE_WAIT_BIT'
>   281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
>       |         ^~~~~~~~~~~~~~~
> fs/bcachefs/fs.c:281:31: note: (near initialization for 'wait.key.flags')
>   281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
>       |                               ^
> include/linux/wait_bit.h:22:20: note: in definition of macro '__WAIT_BIT_KE=
Y_INITIALIZER'
>    22 |         { .flags =3D word, .bit_nr =3D bit, }
>       |                    ^~~~
> fs/bcachefs/fs.c:281:9: note: in expansion of macro 'DEFINE_WAIT_BIT'
>   281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
>       |         ^~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   2382d68d7d43 ("sched: change wake_up_bit() and related function to expect=
 unsigned long *")
>=20
> I have reverted commit
>=20
>   35f4c66b66c4 ("Merge branch into tip/master: 'sched/core'")
>=20
> for today.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20


