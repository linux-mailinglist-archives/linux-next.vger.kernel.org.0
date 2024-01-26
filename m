Return-Path: <linux-next+bounces-866-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785983D1AD
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 01:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CCA51F250C6
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 00:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C69C387;
	Fri, 26 Jan 2024 00:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sZVb6XfZ"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B093385
	for <linux-next@vger.kernel.org>; Fri, 26 Jan 2024 00:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706230224; cv=none; b=H/sMo9fwTuMMt+D5vGpBu95MbWRhzfK8ekQ5/wjBgILaVTgyxIVB+yGcfyRyyVBjYdo+A+C7Oqn8DQQQDo3Q9ro/w/k0L6sX8inzU7TGxv8ZU29h18VZE1/VMUR3As5dur5lCxm8KQZ9JBlZTHvc6vh0m5uVJiQOwvatIQVQjYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706230224; c=relaxed/simple;
	bh=3DWj8pSCzeZJTikbndVPAYbpq7RMrIRiBxq2rFUbJ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KAZh0Pm2NHMDXXA5OQhmAvd50gtNpqQe9YlSPmRkCfcCjzUADdLcuV2ce5PjXpW4cDe+M5oGSTKNm5yl8CzxprsYDVOyEP527fcT76tcE9Dzb6VAk55OWFocO6PtoY6Mqk3EI7RlJDYVmIyoXSUoppc5s2zTRkBm0wUN0AV/Uf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sZVb6XfZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1706230213;
	bh=BtSnX3NBBkDR68i0ZL4r0B1qi/S+RsdDf5av0W9n+yw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sZVb6XfZeKQfY9G8D0v3k5NV/Ua/KpIm9tbhRvzJjk8vDo7Hn1rZKM4mAQK5R3qwt
	 ZPE9da1AqNe4iU5jfnF0pNHgpcPHlCiFVr+XfPXQpJPvzZA7kAY/Ed0e/xuYUbCUEH
	 f+ogwg85yq4Y7/a7PPIBG+9F8gJSf0kjMatbn5qsah5EyL22irU/TIVBysLGZmgG2h
	 tzQ/QEzakXf6mYfPMo/1Sv+J+9OsnbXLgRvwHjOv5yXRVUO82PQwAMWjHlhKR1RDAq
	 UGepDA5KAuxaygfS1w3hqDpdqvtlnkOiXItLWGnaglKmcw6gz9sYI5ziZJyLRRuC5C
	 dDOpXdrlo1F8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLfHT1qP0z4wcJ;
	Fri, 26 Jan 2024 11:50:13 +1100 (AEDT)
Date: Fri, 26 Jan 2024 11:50:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <20240126115011.55da6838@canb.auug.org.au>
In-Reply-To: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5aS8mW+mZsoloMtNRPsAcxp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5aS8mW+mZsoloMtNRPsAcxp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Thu, 25 Jan 2024 21:28:09 +0100 Andi Shyti <andi.shyti@kernel.org> wrote:
>=20
> could you please include in the linux-next i2c related branches
> from my repository:
>=20
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/linux=
.git
>=20
> the following branches:
>=20
> for next:       i2c/for-next
> fixes:          i2c/for-current
>=20
> I have requested this branch to be the main repository for
> collecting i2c host patches[*].
>=20
> Thank you,
> Andi
>=20
> [*] https://lore.kernel.org/all/20240124225031.3152667-1-andi.shyti@kerne=
l.org/

OK, I currently have an i2c tree from Wolfram who is listed as the
maintainer, so I need to hear from him (and do you meant to replace his
tree, or add another one?).  Also, above you list a git tree from
kernel.googlesource.com, but in the patch above, you use
git.kernel.org.  The latter is preferred.  And currently, they do *not*
have the same i2c/for-next and i2c/for-current head commits.

--=20
Cheers,
Stephen Rothwell

--Sig_/5aS8mW+mZsoloMtNRPsAcxp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWzAcMACgkQAVBC80lX
0GxD9Af7BbtYvQuoahlTLf4dmSYnzzgJssMTdyzyI8T4QAc5yB2TGuKrKg99ZP3O
GFmR0BXfKRWcw4ecw6n/FYSCI5eAgdGxEnsFqwKipVNw+fFD6xYeBo+DYmvbjRYn
Jvfw78t1eEtm+k1O3gDKxreMHLiurpPN8daMO6pfEUUamyHEqR3+rLSQS2iVWUkk
aLJonNHvSwYdR3J06cl8GKV+ml21jFHRVfXMh+iTYVE7dW9WJvM6j8L+efXMBo5B
TsBVCXR0Jo8Gv7L5hZDeTYUqvzlvi+0WsrOqEW5BzlHR4NEamGXJz57CYOcSNBVQ
yV/vxdqbBZoVbRkiJbzf5DhT3h/gKQ==
=QhQ/
-----END PGP SIGNATURE-----

--Sig_/5aS8mW+mZsoloMtNRPsAcxp--

