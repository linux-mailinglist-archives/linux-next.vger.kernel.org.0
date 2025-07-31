Return-Path: <linux-next+bounces-7786-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621F4B169D9
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 03:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98C72580BEE
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 01:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BCA40BF5;
	Thu, 31 Jul 2025 01:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UnYE8I/W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A8615442A;
	Thu, 31 Jul 2025 01:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753924052; cv=none; b=BG+GAR8rxc4DIZOUtad8rKmlMyDpr/w1Gafnqr+kLrZcnZhEZqoNCrrDkTSdCQB56lAiY1g5R0MdysLoia3Ntgai9LxXgvDDZmfzoWQy6t0V6/o2nKaT4CQ+ogeypFym4RvSbePmfM251NbE6Qn6ML4v5yOiTDxw1WcbzpNKzPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753924052; c=relaxed/simple;
	bh=t+YhfT27uWWB0wdrWk21wODn8AeEf/aiFh0l/5kWXaU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BNy7salv5ReTB4j5xYlhSlHI0drCke9WyPqEA7I33A0QHj4OYIzgDxjtSsEywtJ8sDfEam8b/yBNpOlZviaGddyhiYBuZF8moAYiBIOtgtvTVcSkXLXT/+fjzRsR2gW2rK6+dHbTidUpScTSqVEspnipg4/ldxDjYWaQ9jljEao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UnYE8I/W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753923826;
	bh=JU7519F7Sf4/nQLnsL65ShBgjJnS2iRXYWUGF273tCI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UnYE8I/WI0q2EzZHNGrO+4sheYMzcA++lzy6xT7t8nP0Umf7z+gVPafdwGmXEhsDx
	 tjnagkQ6TKiIaiuortxkpaW6ihP0fUHaVZ/wkacBkVtCoTtEe8k+aT5Ff9I2xmPR9l
	 CZzX4AVUWkvCMsviso5GsexEQDO9y765ZxVC2JHpd9CEQcx+RjMiQJ9/L0G54d6grd
	 GT8nXQTS7udBtoMYwJJ9tLmGXrKjG31j5DyX+0kFxBbBXL3Ut0BdDBga+OaNUEY4sS
	 ndS9S4bqqrFJF8JOFzqP3nkBWtG/k9Uimw4WQvtKzy0GYbcYPSdFSNqQC/fChXXmj0
	 6UoilrcKZBSvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsrSL315Hz4x4w;
	Thu, 31 Jul 2025 11:03:46 +1000 (AEST)
Date: Thu, 31 Jul 2025 11:07:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: Re: linux-next: manual merge of the paulmck tree with the
 mm-nonmm-unstable tree
Message-ID: <20250731110727.5de9db79@canb.auug.org.au>
In-Reply-To: <20250729104245.6be6957a@canb.auug.org.au>
References: <20250729104245.6be6957a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5W47mCtKBPrvaIxEiD27_NO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5W47mCtKBPrvaIxEiD27_NO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 29 Jul 2025 10:42:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the paulmck tree got a conflict in:
>=20
>   lib/Kconfig.debug
>=20
> between commit:
>=20
>   c2d288f7ab13 ("kho: add test for kexec handover")
>=20
> from the mm-nonmm-unstable tree and commit:
>=20
>   d19e9fa61f60 ("lib: Add trivial kunit test for ratelimit")
>=20
> from the paulmck tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc lib/Kconfig.debug
> index 54f11c2713b9,d69d27f80834..000000000000
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@@ -3235,27 -3225,17 +3235,38 @@@ config TEST_OBJPOO
>  =20
>   	  If unsure, say N.
>  =20
>  +config TEST_KEXEC_HANDOVER
>  +	bool "Test for Kexec HandOver"
>  +	default n
>  +	depends on KEXEC_HANDOVER
>  +	help
>  +	  This option enables test for Kexec HandOver (KHO).
>  +	  The test consists of two parts: saving kernel data before kexec and
>  +	  restoring the data after kexec and verifying that it was properly
>  +	  handed over. This test module creates and saves data on the boot of
>  +	  the first kernel and restores and verifies the data on the boot of
>  +	  kexec'ed kernel.
>  +
>  +	  For detailed documentation about KHO, see Documentation/core-api/kho.
>  +
>  +	  To run the test run:
>  +
>  +	  tools/testing/selftests/kho/vmtest.sh -h
>  +
>  +	  If unsure, say N.
>  +
>  +
> + config RATELIMIT_KUNIT_TEST
> + 	tristate "KUnit Test for correctness and stress of ratelimit" if !KUNI=
T_ALL_TESTS
> + 	depends on KUNIT
> + 	default KUNIT_ALL_TESTS
> + 	help
> + 	  This builds the "test_ratelimit" module that should be used
> + 	  for correctness verification and concurrent testings of rate
> + 	  limiting.
> +=20
> + 	  If unsure, say N.
> +=20
>   config INT_POW_KUNIT_TEST
>   	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
>   	depends on KUNIT

This is now a conflict between the mm-nonmm-unstable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5W47mCtKBPrvaIxEiD27_NO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiKwc8ACgkQAVBC80lX
0Gwt+gf9FG8kn4rDuYvQeiJMtTm5eYWDYLIoNIy5eM+Cb/gx4/oZ9ba+QNZ6+/i6
hF++4QaSiLdpslfQZiXgfAraRqHnzBbIPwR11SeS+R7W5lvxrJKH5mETT8yL1ASe
IqFNrLTvPanLskoh/oBGRmorxuCX9lEwCOd9tF/kpBuDafXVfmHFYewbaTx7T5aQ
JBTJ64f3AqoI0MzzemFM4RTsCyQSENnV5yOfHxR6tX9qN3WrC/5no+D7Wr72q0SR
5QvXF9n5ZgnYVR8LFapeseZBcBwrqsjCUsbUqpSdeO1X25ryo7Ig/SoxUrI9h2Ls
3bp8yXozMFYY14F2LgqUX1asGm7ynA==
=ny4u
-----END PGP SIGNATURE-----

--Sig_/5W47mCtKBPrvaIxEiD27_NO--

