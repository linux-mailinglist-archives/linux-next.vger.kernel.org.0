Return-Path: <linux-next+bounces-9349-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52878CA5D45
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 02:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8442E302B619
	for <lists+linux-next@lfdr.de>; Fri,  5 Dec 2025 01:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5876F2236F2;
	Fri,  5 Dec 2025 01:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="B01xcjM2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449F11397;
	Fri,  5 Dec 2025 01:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764898114; cv=none; b=SgiOMXSQSfrIAbqxqqZ1jxyAZw2248EUCzP73Ag6LWu4u4kSfM1ZFLchwiQzFbSSJGgsNt+O5xiNlCcrvedZqPbNPtMxap5sHeo0dMLhDeK4k0YL872OHpYWd0ovjTLSeqVsidjlaITjBkXdjjj+atJZmQZ96NJ4ftRxhT52X80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764898114; c=relaxed/simple;
	bh=iVY4oNxiYnceiJnvFXEQ/fR7tfRcncNw7xLRPVWk/5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JgB9KCLHet5k0nz976oSMNhFkTXTAmTMm64FY5WVB9ecMfV2FmHojngEQzrYP5kquwdtHsDsIIDMfwAPAQYkRdIjCgMTkDBCCrqVRnyoT6sCh6/jTqSotWU9QLx6DPN+m7LpZZICmFYf4VB6EwSFXRuBCJJDpQORq8T3Va0zzmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=B01xcjM2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764898108;
	bh=hj/jRVwyXOS4WNBlc4eYIYNc21KIOKBVrMqF60LCpvE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B01xcjM2TTj/hXp2LOpm5DCRM4Uohi/NAGBWy9ggqdkPQlQmaQ/4rPZius2iXO+L1
	 N3Ii4Y1eM5LniQcacrWYr1m7bc5XLgG1Ckab+osCUknDaXtsVmJCMmmjvkhMsZzUzd
	 E2GZ9TjosNcSuEPAQgt7ZRFwfXg8Vdb8/qiGWvwb2jdkfeISuQJm/mZDSBv69ieXfp
	 dFNCeZmV0EFzD0sJlAX7mPCR6Xe90i+aFmL+9gEgOU2tMXZp/xbqaYZEf1+cE03orm
	 jqEfG4ssrxrsCUjvXAtoxWwhges10LFw7xqSDdeEwImyLTIMon4XmPU4pBG1x6WK0E
	 TlAN+VZgl/a5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMv0C5m1gz4w23;
	Fri, 05 Dec 2025 12:28:27 +1100 (AEDT)
Date: Fri, 5 Dec 2025 12:28:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>,
 Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the net-next tree with the
 mm-nonmm-unstable tree
Message-ID: <20251205122826.090fd398@canb.auug.org.au>
In-Reply-To: <20251124125006.3953f1d5@canb.auug.org.au>
References: <20251124125006.3953f1d5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//NxgHZW0cth4HJ1pxNtT72U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//NxgHZW0cth4HJ1pxNtT72U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Nov 2025 12:50:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the net-next tree got conflicts in:
>=20
>   tools/testing/selftests/drivers/net/gro.c
>   tools/testing/selftests/drivers/net/hw/toeplitz.c
>=20
> between commit:
>=20
>   7edd42093cb0 ("selftests: complete kselftest include centralization")
>=20
> from the mm-nonmm-unstable tree and commits:
>=20
>   89268f7dbca1 ("selftests: net: relocate gro and toeplitz tests to drive=
rs/net")
>   fdb0267d565a ("selftests: drv-net: add a Python version of the GRO test=
")
>   9cf9aa77a1f6 ("selftests: drv-net: hw: convert the Toeplitz test to Pyt=
hon")
>=20
> from the net-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc tools/testing/selftests/drivers/net/gro.c
> index 76aa75469a8c,995b492f5bcb..000000000000
> --- a/tools/testing/selftests/drivers/net/gro.c
> +++ b/tools/testing/selftests/drivers/net/gro.c
> @@@ -57,7 -57,8 +57,8 @@@
>   #include <string.h>
>   #include <unistd.h>
>  =20
>  -#include "../../kselftest.h"
>  +#include "kselftest.h"
> + #include "../../net/lib/ksft.h"
>  =20
>   #define DPORT 8000
>   #define SPORT 1500
> diff --cc tools/testing/selftests/drivers/net/hw/toeplitz.c
> index 4b58152d5a49,afc5f910b006..000000000000
> --- a/tools/testing/selftests/drivers/net/hw/toeplitz.c
> +++ b/tools/testing/selftests/drivers/net/hw/toeplitz.c
> @@@ -52,7 -52,8 +52,8 @@@
>   #include <sys/types.h>
>   #include <unistd.h>
>  =20
>  -#include "../../../kselftest.h"
>  +#include "kselftest.h"
> + #include "../../../net/lib/ksft.h"
>  =20
>   #define TOEPLITZ_KEY_MIN_LEN	40
>   #define TOEPLITZ_KEY_MAX_LEN	60

This is now a conflict between the mm-nonmm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//NxgHZW0cth4HJ1pxNtT72U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyNToACgkQAVBC80lX
0GxYQgf9Hac1CaArptDfml3tmlh1RyIdGUwgijrUqElpIbv4EoV2d5BO/p9cEy8x
/dSv2c8qSfuYdMMKn6UDCoN8QJH8LCc/RfbU+UhBmfNlpvcuafsFh08rWP9bSaRv
yeo9TRw2nD40DKn4Irzs52VKvSeiERWql8R3SdpWVq+BL2mhHQ/3zMcf7utpFGdZ
IQ56fymBcBNslOa+X2OUdo6xCfbkrmFS8hkqGiTKOBceXvUAfM0GHkXCuxt4PX+B
z3OGCw3ytHzKDJuz8cBBgwY30Z7aToZQaQtEjSo51iUk0HloTPZpd+S/fnjagzeA
7k6cO5+NixjmY0GNE9Ng9TMjboQIjQ==
=Hanv
-----END PGP SIGNATURE-----

--Sig_//NxgHZW0cth4HJ1pxNtT72U--

