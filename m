Return-Path: <linux-next+bounces-4200-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F43997BE4
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 06:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62EC21C22407
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 04:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CF519D8BB;
	Thu, 10 Oct 2024 04:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OPc4TmS6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847333D966;
	Thu, 10 Oct 2024 04:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728535144; cv=none; b=c01fyJOl8cI2WNNfby/5NgrefIMJzhl1Tv7URCqAg18BXzcQK0o7eeQ3vQyex+VT8GmJDKH1KfVLaHSGwkFY3G5+TItr+VndKTTtLNuqd1DarfvNazGDvsd9E10Pc2R8aDF3HDfXHyzyP7EVls3r1NHM2F5Ci7wx9124Cw57/p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728535144; c=relaxed/simple;
	bh=auxPCeoMEO0y3ixV0vbsi+IF+OB8SurD0diMLCy44zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXa1g8f2q81Hurzxq1K1iEDQA2rsEIvy7BvemoJv6zYknkCJgK8nGktYImBQuZ2rYIQokwejPQN7dIzAy5k/j9WbyDk0XsIdJ9TcJLMBLBUvifmuD9FJIQ0IKcxW1cGkyTanAYN8VyQGeFL32ul+/Vfoq34fQ2u6aH1SeXr3z4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OPc4TmS6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728535136;
	bh=adfydLp+GrLJBYnZEHiwZhz3OHnz2HDLLti006J2PMI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OPc4TmS6sGfBYltlbp2Ds3FZ1IOKZrocTkoGuoWt6+hihyVLPuW/DHPwXT+ZxxcRJ
	 Zd15CArJ9n2X8L9LdNXN5F/FBOqT/fWSCVbfmfRD/Cmzchr43NFXUSgE4aeTKsS11X
	 vuNV8ydNYP/ZGLTVtxjRPlSW+TC8yeaJrnjD2UaY/M+DIyy8d6BVjC8C7YCg8yEDpl
	 M6pRleabvIDr9kn1Cf+1koBczDbztK2+bEqd6FB3EtbuMBJCwYoUGG6CkZ7/2vDpAq
	 UxCRVkNYsm2CDof2mulsAOMhehokPoSl9o1FcrOSLNXxMlxo6J7qBTe1twH8qoxdom
	 QBlvZ/D+Oj4gA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPH8H0Y9Kz4wcL;
	Thu, 10 Oct 2024 15:38:54 +1100 (AEDT)
Date: Thu, 10 Oct 2024 15:38:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2?=
 =?UTF-8?B?bQ==?= <thomas.hellstrom@linux.intel.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <20241010153855.588ec772@canb.auug.org.au>
In-Reply-To: <20241001134423.62b12a80@canb.auug.org.au>
References: <20241001134423.62b12a80@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FzZfJ=e7szFsEhR2SZ/0mXT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FzZfJ=e7szFsEhR2SZ/0mXT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Oct 2024 13:44:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the random tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
>=20
> Caused by commit
>=20
>   38d1a9d296c8 ("random: Do not include <linux/prandom.h> in <linux/rando=
m.h>")
>=20
> interacting with commit
>=20
>   5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
>=20
> from the drm-xe tree.
>=20
> I have applied the following merge fix patch for today.

The patch is now:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 1 Oct 2024 13:33:48 +1000
Subject: [PATCH] fix up for "random: Do not include <linux/prandom.h> in
 <linux/random.h>"

interacting with commit

  5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")

from the drm-xe tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe=
_bo.c
index cd811aa2b227..3e0ae40ebbd2 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -8,7 +8,7 @@
=20
 #include <linux/iosys-map.h>
 #include <linux/math64.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/swap.h>
=20
 #include <uapi/linux/sysinfo.h>


--=20
Cheers,
Stephen Rothwell

--Sig_/FzZfJ=e7szFsEhR2SZ/0mXT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcHWl8ACgkQAVBC80lX
0GxP+gf8C/0ob8vjxwnIqa5MHaBA2/matSb5MEnTJSbF7vlHacyMYeEdlKN9OvJs
iC5WNaRDuoaZjRqMH9X0hMw2H8l8R74jrYZJ/jc3N6CooX5FTymeT3MhMJJWei14
WOTdlMAb5JWT75SbyTo9DNVtsz3E/M5DI6fEHc8KwXW73ndbUa/QG67936yGN94/
JGnjOWqp1UhE2hj2oDdiKj4/mmYi6wCOwtdsqNs/nuQf7FxtLZgcRqRf9c7MkTwN
eR3mIDXHbQ4MFuIOcUwV4WZ2jWxs8pWU+L5W69ObaWxvLa8bE6ywZRrRNDhqZUFe
g6UQqGsHCs3ryS2BFrGmxf0viONGAA==
=P1WO
-----END PGP SIGNATURE-----

--Sig_/FzZfJ=e7szFsEhR2SZ/0mXT--

