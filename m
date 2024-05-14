Return-Path: <linux-next+bounces-2286-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F64B8C4A68
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 02:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC068B238E1
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 00:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0380803;
	Tue, 14 May 2024 00:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DLFXiicy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F31137E;
	Tue, 14 May 2024 00:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715646122; cv=none; b=jLxty4teFnGe7u5VJNCtwDFxSfcAetGno7pRJ3yKlzNM72YulU7ATuSZBAg1qjwfgdtW7S9/02Jra312wEgAXLvEHAmq0L2+o6E+oVqtj/mgTuHjphdaT0Qfmep++400eUbrbQiOo41VUuUzYyBw4/eqRIneWtPqGKOWeiUs3Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715646122; c=relaxed/simple;
	bh=vJPN+3q5pmL2mBir0A786TE09OA56aIE/H2usSaV0aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VVWAuEDLjJcYZ/PuJ91haMGVk4EuPzHITy6rM3ENNh2b3CHtDrvoQkyKmVoZra/fqtxClaSJwHevOqkgr/nEk1zHtV8PPn+gZrRK+NtBHGAyFkz8DAO8Aof8qxaGwUOgSVCL9BbtVf8/nDKG54+Ot3wxRcRWi9KNP4YTXHvks6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DLFXiicy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715646118;
	bh=p6jK3ytPsZmby8rR5ZkgUf/FGi+UEOaXM1g8mWvv2OM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DLFXiicyBDYFDkvnVjDBYU7ZgW+Q6geVE6krqD0+cmZebCvCzY1hCic9a4kiOaAAu
	 X71s7n1tCgDCDiESl99oLQ8l7YiGIFMMAqDn/sT0/6oEBMYfNGRRBrm97NT5NwG5Yj
	 3fx3kSaXCYkW7RSqRYjyyXdmtxr6TG8gZ/j7rkMTy2BsDDsfx1Nhiobdjv7m1E48G4
	 kK1R3lFekPPRQZu821WpfBPCfHfWF9IdaaJue6vvTvQi8XW0dXXewgRJimp5n7l7Na
	 XOCy/LN/HzoWaEDeowV6PGYXLkUc1CpttlsHrxeiFkhxaViivupuwZHLihsxdQ2H8N
	 Hy5byoGCEabIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdcVZ2vrmz4wc3;
	Tue, 14 May 2024 10:21:58 +1000 (AEST)
Date: Tue, 14 May 2024 10:21:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kspp tree with the kbuild tree
Message-ID: <20240514102157.46a330a7@canb.auug.org.au>
In-Reply-To: <20240513151316.6bd6fc87@canb.auug.org.au>
References: <20240513151316.6bd6fc87@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JmJ5pY5OSQ.th164gsgGMCL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JmJ5pY5OSQ.th164gsgGMCL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 May 2024 15:13:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the kspp tree got a conflict in:
>=20
>   drivers/misc/lkdtm/Makefile
>=20
> between commit:
>=20
>   9cf51a6d1de0 ("Makefile: remove redundant tool coverage variables")
>=20
> from the kbuild tree and commit:
>=20
>   fb28a8862dc4 ("lkdtm: Disable CFI checking for perms functions")
>=20
> from the kspp tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/misc/lkdtm/Makefile
> index 33fe61152a15,b28701138b4b..000000000000
> --- a/drivers/misc/lkdtm/Makefile
> +++ b/drivers/misc/lkdtm/Makefile
> @@@ -15,7 -15,11 +15,7 @@@ lkdtm-$(CONFIG_PPC_64S_HASH_MMU)	+=3D pow
>  =20
>   KASAN_SANITIZE_stackleak.o	:=3D n
>  =20
> - CFLAGS_REMOVE_rodata.o			+=3D $(CC_FLAGS_LTO) $(RETHUNK_CFLAGS)
>  -KASAN_SANITIZE_rodata.o			:=3D n
>  -KCSAN_SANITIZE_rodata.o			:=3D n
>  -KCOV_INSTRUMENT_rodata.o		:=3D n
>  -OBJECT_FILES_NON_STANDARD_rodata.o	:=3D y
> + CFLAGS_REMOVE_rodata.o			+=3D $(CC_FLAGS_LTO) $(RETHUNK_CFLAGS) $(CC_FL=
AGS_CFI)
>  =20
>   OBJCOPYFLAGS :=3D
>   OBJCOPYFLAGS_rodata_objcopy.o	:=3D \

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/JmJ5pY5OSQ.th164gsgGMCL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZCrqUACgkQAVBC80lX
0GzipAf+OL6Wke0xGW18jyKdWc5GS6Gj6iZHnM1VZHYIa63FE5UAyLwuSQ+qsgYX
OhyICGU+gLgCosufc3bRE6rqs8GsEwmQI1UzpsCJVGqItncMauFchy5Y6L419RRB
cyfFJcn5/xV0pW2BIYdYlkrqCAp61yNjct2IhNq8w+T16T6EkvI7iAlOrZiyMzXM
1t4iQvFap6YLm4MMF3/kHUayJeN2nbOp1IarSRMfDuz70uuePa2t/x2Jfd1IPEWI
iwGINItpK39/h8ye2rVZAcH1X04yOdPuwwiqUS2Z3m2F6nZ+lhO4SsulG2hE0r39
tQWkmKrkjexr2uI5KqlCsxFlsvfzFQ==
=5vuu
-----END PGP SIGNATURE-----

--Sig_/JmJ5pY5OSQ.th164gsgGMCL--

