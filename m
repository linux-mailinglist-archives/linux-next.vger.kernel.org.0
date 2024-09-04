Return-Path: <linux-next+bounces-3598-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC496CA8F
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 00:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E59462857AB
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 22:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9124A1547D8;
	Wed,  4 Sep 2024 22:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GR6zidaI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A051F146D7F;
	Wed,  4 Sep 2024 22:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725489734; cv=none; b=uG1UQcRbombF8yHC4wHdAsP0O6AwRTB1JrlP+0+EJ/HTXxP568vkBGiYROU8gcJa+EvCR6c4XTPPwlJzMfH6grndg5N6+aqsziwjpsRaDPHSRptcJjnQR8zDEJZYaYAG3nMrB+8jg5OQ6BZkXcGe+Z0WuvKaiNWRZ35N/uoDxIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725489734; c=relaxed/simple;
	bh=A1QppiQ4BCgg4QDQXK6JibKQMdbtjXSH6rCHs+lp4u4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BPmSRVa74VS5QCUABHXEenLYfIHbfsuzesPrgj+b81QqyBYKsgnBEiAAhZPBQauCgBhV0TyQg2I2sURxVEaHXf2hzRjZLP6YLLqOTqzpBA1zE23+d1tUEzzUiANH5d1r+DW5OHwH/GasyCNbwJsPqc1vAtlbnXNj8NfHtoL2Ur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GR6zidaI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725489729;
	bh=4EfHIIDWCzyWNu/Kz5sVR2Pj6+7t2drz1rRVzgdtwuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GR6zidaIsGspKfRrvNdaolPpUIGHhBfEytKlnoWa9UKyaRupfAhA3vB8YNq6VvEf+
	 51VDTtEMCRfp9OogHY1BvB+Rw63dE+wgmiihDk2xztfCO7wWFxGXRf1swSME7+BAQz
	 syA+x6qMXOBlVPsveuAwYuHBI24RWTHCg6QlNyNneI2zi11sBqWQX133O4rSa/2qxC
	 iKq7Y4fm5Ax6l8r5G6yJ7ynh/AXN7hDzdj2/HR1JplSIlYUMqeu9ufxEWF+9PqJmkh
	 g9HXjglPaqjpkc3wVrGmPr4fK2b+/k6CZBuy3uGnPt0GTL6tkv+UxEjxvtp20gNAxQ
	 jYc8Qh12XP21Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wzctn50pQz4wd0;
	Thu,  5 Sep 2024 08:42:09 +1000 (AEST)
Date: Thu, 5 Sep 2024 08:42:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the perf tree
Message-ID: <20240905084208.78279c14@canb.auug.org.au>
In-Reply-To: <20240902105121.1a5b25f8@canb.auug.org.au>
References: <20240902105121.1a5b25f8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/acL/h8JtZqiRuMuCfv.eadj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/acL/h8JtZqiRuMuCfv.eadj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 2 Sep 2024 10:51:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The following commits are also in the perf-current tree as different
> commits (but the same patches):
>=20
>   6236ebe07131 ("perf daemon: Fix the build on more 32-bit architectures")
>   2518e13275ab ("perf python: Fix the build on 32-bit arm by including mi=
ssing "util/sample.h"")
>   74fd69a35cae ("perf lock contention: Fix spinlock and rwlock accounting=
")
>   37e2a19c98bf ("perf test pmu: Set uninitialized PMU alias to null")
>=20
> These are commits
>=20
>   478e3c7ebbe7 ("perf daemon: Fix the build on more 32-bit architectures")
>   4cb80590f12d ("perf python: include "util/sample.h"")
>   60f47d2c58cb ("perf lock contention: Fix spinlock and rwlock accounting=
")
>   387ad33e5410 ("perf test pmu: Set uninitialized PMU alias to null")
>=20
> and this last one is causing an unnecessary conflict.

These latter commits are now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/acL/h8JtZqiRuMuCfv.eadj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbY4kAACgkQAVBC80lX
0GyPRwgAkKeoxbzLz4zBTJzsc2YAoqeq54et/vXwTFbHq00oRRR1R+/lzBi3PmZG
3IfpVWA8S5yfbzWfzCUZ5hHWOXfNkkM3Vc7qCG28YmEW6FZD+AIE4m+u2be3COJe
TXFZjcOR9A2Rr3GSce0Kn0MBYyLoEEY3FWNdQaCjTtxwGqV+8Q5GEFECDK651loj
1I6IRpOq8FU/s+nFlAFWahaSO4DkyxautJZVTOB7V7+iAODQPTbYNonQEmpwNV05
FKi+vBw/Gc8w5MQu+ISImVE7WVpywDxXs90WeeFdu0UwbPAMa2SIk/xRW0UPTyrM
hOEPITSN+90Q2EoBsKrcv0zkvh3vYg==
=zwpS
-----END PGP SIGNATURE-----

--Sig_/acL/h8JtZqiRuMuCfv.eadj--

