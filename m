Return-Path: <linux-next+bounces-5505-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA73A3CB2C
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 22:15:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4566189E9C2
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 21:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0242500CF;
	Wed, 19 Feb 2025 21:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JB8kVsz8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zy+SKcQh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WQ5DtBRR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2vtti/c4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D871253F0C
	for <linux-next@vger.kernel.org>; Wed, 19 Feb 2025 21:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999563; cv=none; b=kMuCcUGpHL19kbM3BUKkRHx1Y55H3W6K+TdVuQVmXGZPtrBe2cpbcQRZSF3LIR+PeAlj8F8tITXr3jspowHOuVZQppKhBeSsu+Gb7Vzb1iJXS4+6Cjiq+elw23eK740qvm0hKe5FdqES+RPkIKvi4XeVTMJhrTrMA/ATIlRPuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999563; c=relaxed/simple;
	bh=cRtn6DLNU/SjK8wv/JWpI/qrM+g7kwfGr63Ft/6txWk=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=nG2CQt1DnYYacgAOj7YF6ELaqOn5OcYwl4ygw+qrEbZM75QqIYtzLkWSsqNdmRNGyS/i7WCo8XGzvom4C6kMfTUXu4OL+bJDJ00w4LsGvTMqGXSdmAgm6H7D0iQMM1qsEylLk3L4eUFeaCMWVTbw32Z8S9uye/EBZwMoQhX6Qmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JB8kVsz8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zy+SKcQh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WQ5DtBRR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2vtti/c4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DF2481F86C;
	Wed, 19 Feb 2025 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739999554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpldkGZefhNxtKiLXQCmXZ8Zj1sa/cliTtoWiaTp7II=;
	b=JB8kVsz8FkGzsf4H/dCAqb0IWrFSr43o+rlV2ORYi0kkdGREn1c2PMz+9XVe1R1iNTFZDy
	C7nETKuOuqQi1p1nxFtK23hgSvEnBttJl0Lk9qJStf83TNAWV1UPmpedBETstXqumA63Lj
	RiFZUhKO9eKsWDc02a5R7cUSknSPJKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739999554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpldkGZefhNxtKiLXQCmXZ8Zj1sa/cliTtoWiaTp7II=;
	b=zy+SKcQh3ivV9gUJG6EcN4SGHHKH978jACHycR5dMdagcN/MVDdYiyOs0IqFg8LDoffn3+
	MS67G7lozbYoj2CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WQ5DtBRR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="2vtti/c4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739999553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpldkGZefhNxtKiLXQCmXZ8Zj1sa/cliTtoWiaTp7II=;
	b=WQ5DtBRR9tfa2qlW25hhkchumb8HLqFG7YrYYnpCq+6HnuwPeSiYnGYb1naSTCd49Jhic9
	mAXKtvuQ+Vi6IJFqzwiIXVCIWIzeuzaxx3DfQsWz7m1hReEjrf9MD8gjT9+cPM7JdQaNAt
	tvtMOO99H9bZOE4NSFTM2UT8esYiH0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739999553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpldkGZefhNxtKiLXQCmXZ8Zj1sa/cliTtoWiaTp7II=;
	b=2vtti/c4sqXdKs463U2ojTwqf87l+ggXZbSD1a4ZVrqbnIw/hKNuMlRzyxM7IDh5fTBK+B
	TLDamDIwvnMRY8Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1949F1366F;
	Wed, 19 Feb 2025 21:12:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3+HtLz9Jtmf7IAAAD6G6ig
	(envelope-from <neilb@suse.de>); Wed, 19 Feb 2025 21:12:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Bagas Sanjaya" <bagasdotme@gmail.com>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Christian Brauner" <brauner@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
In-reply-to: <Z7WaNWHRkqt2rFGA@archie.me>
References:
 <20250219153444.0046e433@canb.auug.org.au>, <Z7WaNWHRkqt2rFGA@archie.me>
Date: Thu, 20 Feb 2025 08:12:28 +1100
Message-id: <173999954863.3118120.1592139865849565534@noble.neil.brown.name>
X-Rspamd-Queue-Id: DF2481F86C
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Wed, 19 Feb 2025, Bagas Sanjaya wrote:
> On Wed, Feb 19, 2025 at 03:34:44PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > Documentation/filesystems/porting.rst:1173: ERROR: Unexpected indentation=
. [docutils]
> >=20
> > Introduced by commit
> >=20
> >   20c2c1baa9ab ("VFS: add common error checks to lookup_one_qstr_excl()")
> >=20
>=20
> Separating the bullet list should suffice (plus s/recommend/recommended/
> for consistency with the rest of docs):
>=20
> ---- >8 ----
> diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesyst=
ems/porting.rst
> index 3b6622fbd66be9..cfac50a7258db6 100644
> --- a/Documentation/filesystems/porting.rst
> +++ b/Documentation/filesystems/porting.rst
> @@ -1166,10 +1166,11 @@ kern_path_locked() and user_path_locked() no longer=
 return a negative
>  dentry so this doesn't need to be checked.  If the name cannot be found,
>  ERR_PTR(-ENOENT) is returned.
> =20
> -** recommend**
> +** recommended**
> =20
>  lookup_one_qstr_excl() is changed to return errors in more cases, so
> -these conditions don't require explicit checks.
> +these conditions don't require explicit checks:
> +
>   - if LOOKUP_CREATE is NOT given, then the dentry won't be negative,
>     ERR_PTR(-ENOENT) is returned instead
>   - if LOOKUP_EXCL IS given, then the dentry won't be positive,
>=20
> Let me know if I should send the formal patch.

Thanks a lot for correcting these for me!
NeilBrown


>=20
> Thanks.
>=20
> --=20
> An old man doll... just what I always wanted! - Clara
>=20


