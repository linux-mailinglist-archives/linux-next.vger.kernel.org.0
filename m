Return-Path: <linux-next+bounces-7929-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CCDB24133
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 08:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F11C01B684EF
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 06:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5DC2C1585;
	Wed, 13 Aug 2025 06:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Io7tQ0H/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B84BCA6F
	for <linux-next@vger.kernel.org>; Wed, 13 Aug 2025 06:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065585; cv=none; b=KQ5EGe3/4MWppkNn1leh+Djh/ZTgoGEk+e1JyL16XifNLIbkZuMQfV4121V5gPM9TJfac/fqVXM11Db5nNcadQaLOWPZcOw03Mki6ExVFU7c1WrCas/FjhJXNbov96v3m6G8vjDig0jikL2ut2q5PJn9PZfzHLgkPxO8Yg+16IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065585; c=relaxed/simple;
	bh=gGvv5qBocT3MGjOCRTO++ZDE2aZYiCw9yd8Lmihb7Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hOqXSmmpHdUxtChVZApmEKugmU/Z5lEFporkrY4OQ1GtFe/0kPw0vUGC7GMrZMs+2xwGObHBfrBcWSEWkcpqmvKAR37Sxz0y6tDKiwz7ROxb/uDgONZ2Zuw1vwQiRntbfycXqJ3R2KBz5oxY+n5PXfg9mJcY46ByBL/wbTIvN1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Io7tQ0H/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755065580;
	bh=qYVt4Zxf129LD0FO9JFjw9WPOgPssVkDWXKWHNiLpWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Io7tQ0H/yZIxPUu8BhvWpZAectB1JJV8dO5CxeWWWZNI8Gst7Q87lN5iC82gKNUa/
	 o40ScU9YMnCKoUda10x7bCgHS+4OOgrFO4wg9j+1KFmqvPoWXAug98f0rUCaETPwbg
	 MEMdKOtKoe3HgNpAOLeRtZ81xOFjDGqGfxuRgqZJBuhLtPyhuK9Ju1H/tahzqn5a5R
	 nOJgfeaXqyUUpD3D8wI1Q/lW328bEClgr+E03JPt4EfIMUn6uM20hmIjpMZd1K5B0V
	 7tnPqcqmXLX622XmseSa1SqoH0jwComw6Zlc1axvCej+My8grwYDLtnRb03zp++JXM
	 pBgBurynAny/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1yj73YXnz4wcn;
	Wed, 13 Aug 2025 16:12:59 +1000 (AEST)
Date: Wed, 13 Aug 2025 16:12:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: KernelCI bot <bot@kernelci.org>, kernelci@lists.linux.dev,
 kernelci-results@groups.io, regressions@lists.linux.dev, gus@collabora.com,
 linux-next@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [REGRESSION] next/pending-fixes: (build)
 ./include/linux/iov_iter.h:171:7: error: variable 'remain' is used...
Message-ID: <20250813161258.68661171@canb.auug.org.au>
In-Reply-To: <175506114403.296.12737351814093118427@99cfaf6094a7>
References: <175506114403.296.12737351814093118427@99cfaf6094a7>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ckNnx3JwNN/So0/By+g2gap";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ckNnx3JwNN/So0/By+g2gap
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 13 Aug 2025 04:59:04 -0000 KernelCI bot <bot@kernelci.org> wrote:
>
> New build issue found on next/pending-fixes:
>=20
> ---
>  ./include/linux/iov_iter.h:171:7: error: variable 'remain' is used unini=
tialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized=
] in net/core/skbuff.o (net/core/skbuff.c) [logspec:kbuild,kbuild.compiler.=
error]
> ---
>=20
> - dashboard: https://d.kernelci.org/i/maestro:e3e604796d8d054968bf2b979c7=
940708d16e0ee
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
> - commit HEAD:  1b07edbd37d5ab410613ebe09b0641d0f4fe717b
>=20
>=20
>=20
> Log excerpt:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> In file included from net/core/skbuff.c:66:
> ./include/linux/iov_iter.h:171:7: error: variable 'remain' is used uninit=
ialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>   171 |                 if (skip >=3D fsize)
>       |                     ^~~~~~~~~~~~~
> ./include/linux/iov_iter.h:190:7: note: uninitialized use occurs here
>   190 |                 if (remain)
>       |                     ^~~~~~
> ./include/linux/iov_iter.h:171:3: note: remove the 'if' if its condition =
is always false
>   171 |                 if (skip >=3D fsize)
>       |                 ^~~~~~~~~~~~~~~~~~
>   172 |                         goto next;
>       |                         ~~~~~~~~~
> ./include/linux/iov_iter.h:163:22: note: initialize the variable 'remain'=
 to silence this warning
>   163 |                 size_t part, remain, consumed;
>       |                                    ^
>       |                                     =3D 0
>   CC      drivers/pci/search.o
>   CC      sound/core/seq/seq_dummy.o
>   CC      lib/ctype.o
>   CC      lib/dec_and_lock.o
>   AR      sound/i2c/other/built-in.a
>   AR      sound/i2c/built-in.a
>   CC      kernel/fork.o
> 1 error generated.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
>=20
> # Builds where the incident occurred:
>=20
> ## x86_64_defconfig on (x86_64):
> - compiler: clang-17
> - dashboard: https://d.kernelci.org/build/maestro:689c1610233e484a3f9165be
>=20
> ## x86_64_defconfig+kselftest+x86-board on (x86_64):
> - compiler: clang-17
> - dashboard: https://d.kernelci.org/build/maestro:689c1617233e484a3f9165c4
>=20
>=20
> #kernelci issue maestro:e3e604796d8d054968bf2b979c7940708d16e0ee
>=20
> Reported-by: kernelci.org bot <bot@kernelci.org>
>=20
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
>=20
> Made with love by the KernelCI team - https://kernelci.org
>=20

This is caused by commit

  eacecdbf2789 ("iov_iter: iterate_folioq: fix handling of offset >=3D foli=
o size")

in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

This is now commit

  b8da3ae0ae53 ("iov_iter: iterate_folioq: fix handling of offset >=3D foli=
o size")

--=20
Cheers,
Stephen Rothwell

--Sig_/ckNnx3JwNN/So0/By+g2gap
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmicLOoACgkQAVBC80lX
0Gy1+Qf8C/PHElFrT+Rpi3gZlFVtsREeuOH+grAsgqS+YB7xk1mjzx0ZGnbUs5YN
JYyjWNFLlddQSgtWyJ3pFhQdGjzGJZglx96YZ1U2OLvrhpdPeOK4Wpe+1UJ+qeZ4
X0wkjBDzpP0RzfGJ3p1SIOS1NOeYk3BghGSO5+OF6Iiy9aoKcpPo5Ys6GIWfGbW+
ykhXQMm+dZ/SVqJZO6/SCtNR5nu34qXSU142PVxQt6w3vUSI/aV6TWTz+Ui5A52W
JDWZ7TauQ1YsXITWiNj81ZH8Qjgf+Lhx7IXV0Tca9FsoKA5JRsBhzHZb9g7UhSHA
41llClX/pqZXLPgDcAICbjmZr0dtIg==
=Plwf
-----END PGP SIGNATURE-----

--Sig_/ckNnx3JwNN/So0/By+g2gap--

