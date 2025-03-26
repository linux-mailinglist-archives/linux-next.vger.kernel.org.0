Return-Path: <linux-next+bounces-6015-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5172FA70FFD
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 05:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE0E53B8E3B
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 04:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12D6157A48;
	Wed, 26 Mar 2025 04:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MLKJL8zM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75F14A29;
	Wed, 26 Mar 2025 04:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742965061; cv=none; b=sgm1nFI50MpShWhpzkGRQvBWLaBIRlGPMHJqytLJD2iUsC/P9zd+EgUgbKxXNi0rpJLQkYSJxERGDOCIdSGNzKEyIHtDkLlN6Feyz7zFQ0PVSedocHgOswJHdlNcbpEXm9VzemcmGR4n4cTMbok0DBuwQ4aDoTGWTwm4GnWeQTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742965061; c=relaxed/simple;
	bh=93MlavBIl/4kdMRvF3+IZGoDg6KItSiY8xKTpxMFbOY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8+aeMUUZcWWWSIBNPXqZEL5wdAuc4BWwMucyE1/mFmieJh53eGiM9Yo6H09ptm2mt5LZMNrma6Ck4D2W7zpGGR0mVUcrEXi5S/AwizRtdgINbcCbE4hCWTJNqIWLe+Ml7fjVib27GJOQqE2bpY2lPPUmxEdzO8Milc39LGX38g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MLKJL8zM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742965057;
	bh=W90NTUGk+OF4Zdgnn9pdtm3xyyNXg4FMmcM3Gdh2gLE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MLKJL8zMuMsnTvI0RZXnImKPNNS3fi49D/IOL2kDilASWv5gaL3LF8pnf+ReDUK/o
	 71eneSEonwywrD/epEAR9w5BfhajiesxsvesPSQELbi6l2cxsvqP9FVKlYV99X3xem
	 E5qu9C+SjgnSgfJl4EBMGd+/hGdk1ZYFZ1ocE+LJNEt1U4tT/6OasePiLNlPYXIirS
	 GgQ9n8iP89QnkcgL5Y5gB/ByJrXBnRiGDpV/e3xMJBCPAo3Jxc2RdMWIqihY6CbMMX
	 nnZy0PpD/ht/tT6cb5mNWqYtm6hSXA954uNU0Db71Rt4ZJDxKPvvbqYHhTWX6NQeXb
	 2PwSXGaqpp89g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMvfm47LPz4x2g;
	Wed, 26 Mar 2025 15:57:36 +1100 (AEDT)
Date: Wed, 26 Mar 2025 15:57:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <shuah@kernel.org>, Brendan Higgins
 <brendanhiggins@google.com>
Cc: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Sergio =?UTF-8?B?R29uesOhbGV6?= Collado <sergio.collado@gmail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>, Thomas
 Gleixner <tglx@linutronix.de>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: linux-next: manual merge of the kspp tree with the kunit-next
 and mm trees
Message-ID: <20250326155735.55e4677c@canb.auug.org.au>
In-Reply-To: <20250317213953.01ca90e9@canb.auug.org.au>
References: <20250317213953.01ca90e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uJsNFQgVtXLRjpWV2SBjjqn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uJsNFQgVtXLRjpWV2SBjjqn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 17 Mar 2025 21:39:53 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the kspp tree got a conflict in:
>=20
>   lib/Makefile
>=20
> between commits:
>=20
>   62f3802332ed ("vdso: add generic time data storage")
>=20
> from the mm-unstable branch of the mm tree,
>=20
>   c104c16073b7 ("Kunit to check the longest symbol length")
>=20
> from the kunit-next tree and commit:
>=20
>   db6fe4d61ece ("lib: Move KUnit tests into tests/ subdirectory")
>=20
> from the kspp tree.
>=20
> I fixed it up (see below and added a merge fix patch) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 17 Mar 2025 21:35:42 +1100
> Subject: [PATCH] fix up 2 for "lib: Move KUnit tests into tests/ subdirec=
tory"
>=20
> interacting with commit
>=20
>   c104c16073b7 ("Kunit to check the longest symbol length")
>=20
> from the kunit-next tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  lib/tests/Makefile                     | 2 ++
>  lib/{ =3D> tests}/longest_symbol_kunit.c | 0
>  2 files changed, 2 insertions(+)
>  rename lib/{ =3D> tests}/longest_symbol_kunit.c (100%)
>=20
> diff --git a/lib/tests/Makefile b/lib/tests/Makefile
> index a434c7cb733a..f2c3c4f74608 100644
> --- a/lib/tests/Makefile
> +++ b/lib/tests/Makefile
> @@ -20,6 +20,8 @@ CFLAGS_test_fprobe.o +=3D $(CC_FLAGS_FTRACE)
>  obj-$(CONFIG_FPROBE_SANITY_TEST) +=3D test_fprobe.o
>  obj-$(CONFIG_HASHTABLE_KUNIT_TEST) +=3D hashtable_test.o
>  obj-$(CONFIG_HASH_KUNIT_TEST) +=3D test_hash.o
> +CFLAGS_longest_symbol_kunit.o +=3D $(call cc-disable-warning, missing-pr=
ototypes)
> +obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) +=3D longest_symbol_kunit.o
>  obj-$(CONFIG_TEST_IOV_ITER) +=3D kunit_iov_iter.o
>  obj-$(CONFIG_IS_SIGNED_TYPE_KUNIT_TEST) +=3D is_signed_type_kunit.o
>  obj-$(CONFIG_KPROBES_SANITY_TEST) +=3D test_kprobes.o
> diff --git a/lib/longest_symbol_kunit.c b/lib/tests/longest_symbol_kunit.c
> similarity index 100%
> rename from lib/longest_symbol_kunit.c
> rename to lib/tests/longest_symbol_kunit.c
> --=20
> 2.45.2
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc lib/Makefile
> index 651811f5d677,89b8a4bce108..000000000000
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@@ -131,7 -119,7 +118,7 @@@ endi
>   obj-$(CONFIG_DEBUG_INFO_REDUCED) +=3D debug_info.o
>   CFLAGS_debug_info.o +=3D $(call cc-option, -femit-struct-debug-detailed=
=3Dany)
>  =20
> - obj-y +=3D math/ crypto/ vdso/
>  -obj-y +=3D math/ crypto/ tests/
> ++obj-y +=3D math/ crypto/ vdso/ tests/
>  =20
>   obj-$(CONFIG_GENERIC_IOMAP) +=3D iomap.o
>   obj-$(CONFIG_HAS_IOMEM) +=3D iomap_copy.o devres.o

The "longest symbol length" part of this is now conflicts between
Linus' tree and the kunit-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/uJsNFQgVtXLRjpWV2SBjjqn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjiT8ACgkQAVBC80lX
0Gx/gAf8D+Rf8Of+J4VMcqmmtg73AUyb0k5ZshFMwmEz3DPlLjAIELRvDu3uooYY
yNYZEB1xnd/eXtqTjszlYhhpCG8GfguelO9PJshx5l2gEAhl1ap+5PSmLzMcZqkK
yTLWS8aQ/hVU/VUonaJ7NHiwIVe3OqoFJRCkA67OkfVskU6DI/jTLZ/VMvNDD/VQ
2t/oHFrTyorfV3ViIxZR/vLv4Al8TRR1VPLFxJGOZGG/Mce+DLfOHVpLYXiZWNFH
Xz6g2nYnfzXmXNrsmVl5jby2w4l0Yd8k/EHoRecMnP5I4dLXpLKC1rA+dxH8/+kE
DRH05eLUCLmo5a5C5ZRxk2baA62nGQ==
=wjLF
-----END PGP SIGNATURE-----

--Sig_/uJsNFQgVtXLRjpWV2SBjjqn--

