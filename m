Return-Path: <linux-next+bounces-9513-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C07CE9F83
	for <lists+linux-next@lfdr.de>; Tue, 30 Dec 2025 15:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD6B83015EDB
	for <lists+linux-next@lfdr.de>; Tue, 30 Dec 2025 14:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136BC30E851;
	Tue, 30 Dec 2025 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uYv0aP1s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rwawA58b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uYv0aP1s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rwawA58b"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE8330E829
	for <linux-next@vger.kernel.org>; Tue, 30 Dec 2025 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767106084; cv=none; b=SbI9vXLniKD1/lwDnSeoZVyy0o5xzkbYmbVHjfc8qaKi4STaprT5WwJLq4dBi7Zo+CNX6r39HZ824NFmPmVgUOzdNtVjCNlrAryzSssQt/T2qdAt2BvQC0DNOMSP6HW26QZ5j5QH5CXerqFbxN0aFeECqh6vejinUFcT92eo2NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767106084; c=relaxed/simple;
	bh=86YxvffXdzhiRDnZ7Cz3ttihzhPnIkUW8CUHVCS1mLY=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=egLl8b6BlRZVU6PprORrYfqfeDH3Ba/FxDi8b8/rN/OBhhGVxquUW7QMt/45GoW/GUFyVxHswsbxmU6xwXJBK7/nFJBGITy589cR8W16rpzDqtNKGZUvMg4OqvKqPOxaF8jXMT4m3KJnd4kQPyICDTzt9qkkOiGqH90RwTie4FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uYv0aP1s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rwawA58b; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uYv0aP1s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rwawA58b; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4ECF833683;
	Tue, 30 Dec 2025 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767106073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2f129EplgPD25oA6CVml3VSpc9/LxaEOBuvabgGLHCM=;
	b=uYv0aP1sxIlVrAh4kbrrG3g4MOBzEOy6aZj4Seo49yeSZNRIJeFZo9SxDDS5tcAh0fR3NR
	+iyDcGx/0GMx6qrt8Nzg+HvJXZoxut31U2RcGDHVjkvV1wgpcxdZERcNmlfBzNLRDOLybd
	27IT8JtAT8J1hEOd2KQQjhUi4aYKRyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767106073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2f129EplgPD25oA6CVml3VSpc9/LxaEOBuvabgGLHCM=;
	b=rwawA58bhb59k2H1cV7HEIKQrDx1KPJReRoggjcopiKt5k0cp1PHOcJYegwDs7mYiDj5M3
	M2ko68+gaSz5u6Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uYv0aP1s;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rwawA58b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767106073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2f129EplgPD25oA6CVml3VSpc9/LxaEOBuvabgGLHCM=;
	b=uYv0aP1sxIlVrAh4kbrrG3g4MOBzEOy6aZj4Seo49yeSZNRIJeFZo9SxDDS5tcAh0fR3NR
	+iyDcGx/0GMx6qrt8Nzg+HvJXZoxut31U2RcGDHVjkvV1wgpcxdZERcNmlfBzNLRDOLybd
	27IT8JtAT8J1hEOd2KQQjhUi4aYKRyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767106073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2f129EplgPD25oA6CVml3VSpc9/LxaEOBuvabgGLHCM=;
	b=rwawA58bhb59k2H1cV7HEIKQrDx1KPJReRoggjcopiKt5k0cp1PHOcJYegwDs7mYiDj5M3
	M2ko68+gaSz5u6Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A46F13879;
	Tue, 30 Dec 2025 14:47:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id t7YzDhnmU2klIAAAD6G6ig
	(envelope-from <rguenther@suse.de>); Tue, 30 Dec 2025 14:47:53 +0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Richard Biener <rguenther@suse.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
Date: Tue, 30 Dec 2025 15:47:27 +0100
Message-Id: <3F5AC302-8FC6-40A7-A180-F10B46A2E077@suse.de>
References: <20251230132542.27c99ab5@fedora>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Brahmajit Das <listout@listout.xyz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
 linux-next@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 Richard Biener <rguenth@gcc.gnu.org>
In-Reply-To: <20251230132542.27c99ab5@fedora>
To: =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
X-Mailer: iPhone Mail (23C55)
X-Spam-Flag: NO
X-Spam-Score: -5.51
X-Rspamd-Queue-Id: 4ECF833683
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[asmblr.net:email,suse.de:dkim,suse.de:mid,intel.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,gnu.org:url];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,gnu.org:url,intel.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 



> Am 30.12.2025 um 13:25 schrieb Amadeusz S=C5=82awi=C5=84ski <amade@asmblr.=
net>:
>=20
> =EF=BB=BFOn Tue, 30 Dec 2025 10:36:27 +0100
> Cezary Rojewski <cezary.rojewski@intel.com> wrote:
>=20
>>> On 2025-12-30 9:32 AM, Brahmajit Das wrote:
>>>=20
>>> Not sure if it would help but I tracked or narrowed down the issue to
>>> this section of the code in the avs_condpaths_walk function.
>>>=20
>>>=20
>>>    if (avs_tplg_path_template_id_equal(&template->source,
>>>                                        &template->sink) && dir)
>>>        continue;
>>>=20
>>> If I just comment that code segment out, then it builds successfully;
>>> both with and without the hard coded name length. =20
>>=20
>> Outstanding! Thank you for this exercise.
>=20
> Yes, I also managed to reproduce it on my machine.
>=20
> You can also just reverse the order in
> avs_tplg_path_template_id_equal() to:
> return !strcmp(id->tplg_name, id2->tplg_name) && id->id =3D=3D id2->id;
> which for some reason makes the error disappear.
>=20
>>> I was also looking into GCC bugzilla and there seems to lot of reports
>>> saying these kind of error could be bogus or false positive. I'm not
>>> familiar with GCC internal or experienced in compilers to say/understand=

>>> whether this case in particular is a false positive or not. =20
>>=20
>> Wouldn't be the first time, though having successful builds ain't wrong
>> either. After all we have git log and incremental changes/reverts are
>> not a problem.
>>=20
>=20
> I've bisected it down on GCC side to:
> https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;a=3Dcommitdiff;h=3Dfc628345=
33f357125b9c1934f80c2ba249adbf9e
> in particular it seems to be caused by code added in gcc/tree-ssa-pre.cc
> I'm not that familiar with how GCC works, but to me it seems like maybe
> it loses size information during this conversion.
>=20
> I would make normal bug report, but apparently I can't just make GCC
> bugzilla account, so adding Richard to CC, while I go through request
> process for an account.
>=20
> @Richard
> Hi, we seem to have hit a slight problem while building kernel with pre
> release GCC caused by one of your patches, full thread is available
> here:
> https://lore.kernel.org/linux-sound/20251221185531.6453-1-listout@listout.=
xyz/T/#u
> and my reasoning above.

It would be great if you can share preprocessed source to reproduce the issu=
e, ideally attached to a new bugreport on the GCC bugzilla.

I=E2=80=99ll note the diagnostic in question is highly dependent on prior op=
timization and known to be prone to false positives.  I=E2=80=99ll investiga=
te after holidays.

Richard=20

>>> BTW I can't seem to send the email to Amadeusz, hence removing them from=

>>> the CC-list =20
>>>> msmtp: recipient address amade@asmblr.net not accepted by the server =20=

>>=20
>> That's weird. The @linux.intel.com is gone but what you mentioned is the
>> correct one.
>=20
> Yup, that's weird, but nothing lost, I'm subscribed to mailing list ;)

