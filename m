Return-Path: <linux-next+bounces-2249-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C45F8C19E0
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 01:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC4241F238FA
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 23:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E7286245;
	Thu,  9 May 2024 23:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TCxLAsxu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76016129A6F;
	Thu,  9 May 2024 23:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715296933; cv=none; b=WzH1ggb0JPpHqPrKsaN3W1GfQUnCVIbzDpqTZS5uuOUAzXb8ZtLKS48ibXHkCGntOneY09fozyrMAqefmCPCzupk9eHGde4s+E2wc5E0sGz2yNK2aEEw26Is1PJ0q9U2UXgyq4RVr2Sq5c9bUZa8lKLHEB0I6CAI004fNUBGVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715296933; c=relaxed/simple;
	bh=hDrY//Uiqhy+HCq634k7pNbJivqBAegZvoPN3T2Hg94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cXo4+pr+xh/JHerIOI5/lGYHnP17mt3GkgnEWrb8CXSjxWd8Ib8t62tNhhsdKHWpAGIY4wz0s40tx8SyfPkW6w1Aq3tWZeVnhHIN2sT4p89cyO3dCLMdHhNVbdFBz1e3D3IIQQ5VSZcORIiXWviiSU6GgHqsVRCFakICnUn0oyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TCxLAsxu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715296926;
	bh=2XRqo6Zz6CVYNzebclt601u06+nXtaM0cV/6U2ljK9M=;
	h=Date:From:To:Cc:Subject:From;
	b=TCxLAsxuA/IQDf0eFqWRRE+NIPfJw0h34vh8SmT1+MN2Il7HLeM6xDCbdwXDmsZit
	 /CH7G8JSLbhl8Cr9hMbUez4jLMOwERNGYKOENMv6xf+bjw76cBQY7xTCspxDBXEOnt
	 ZsPLmisg0VSxCkX7JdfXHG2EsLl+xlsaOq3c0HPWREJ+Z8f61OtBRdysXzryDU2CZS
	 0YcZw90gwMkv1dEpoOWbCS49gxH7BpbbJhItCNlWcwy2P6/iUWoCehwyBeeXrKLD5e
	 VmbnYA8OMXJS0EG5lt7QaYPyOs0ZaQRQg3nQnAemSe542aOd0gWGdVe8++iuUjl0J2
	 R+eSRynjyoQog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vb7MK40Zfz4wyY;
	Fri, 10 May 2024 09:22:05 +1000 (AEST)
Date: Fri, 10 May 2024 09:22:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tao Su <tao1.su@linux.intel.com>
Subject: linux-next: manual merge of the mm tree with Linus' tree
Message-ID: <20240510092202.5d7df5a6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UMbiVPOBNRoNU7ZDd1PCN63";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UMbiVPOBNRoNU7ZDd1PCN63
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm tree got a conflict in:

  tools/testing/selftests/kselftest_harness.h

between commit:

  caed8eba2215 ("selftests: kselftest_harness: fix Clang warning about zero=
-length format")

from Linus' tree and commit:

  89bc631bb87f ("Revert "selftests/harness: remove use of LINE_MAX"")

from the mm-nonmm-unstable branch of the mm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/kselftest_harness.h
index d98702b6955d,7eca89267962..000000000000
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@@ -1208,8 -1201,7 +1204,7 @@@ void __run_test(struct __fixture_metada
  		diagnostic =3D "unknown";
 =20
  	ksft_test_result_code(t->exit_code, test_name,
 -			      diagnostic ? "%s" : "", diagnostic);
 +			      diagnostic ? "%s" : NULL, diagnostic);
- 	free(test_name);
  }
 =20
  static int test_harness_run(int argc, char **argv)

--Sig_/UMbiVPOBNRoNU7ZDd1PCN63
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY9WpoACgkQAVBC80lX
0Gzx7Af/csdy9gKml+ESzh/6FujKznPX23xqzbgVonDIEHEwjIRCM0qiNk2mKseG
sa4KgquC3dpzCnwa6CUwFcwZ6gvnZdNmvyWKkDN9NIKaHNDW31eRF3S2HI0b6+zZ
eTcwhhL5NadKYHzNjnSDG5txe02FpgpbLJROLSW0TQgOXLY6d4qs0EXPLb8nK7KI
Fu2T1WmIb0W3VQlHaeZ2JWUeJX6lR+hCrUED04XW8zifJllsoa+Oz82Sn0t4FoD/
o47P5lLejs8Gr7t8yaBhtQYy4AGhLJ4DCsSBibZynPygoNa4eQTbKJiLTF08Crkw
cNBJuYAkle0b6ZXVo5IJdnsEI4gkxg==
=dSVX
-----END PGP SIGNATURE-----

--Sig_/UMbiVPOBNRoNU7ZDd1PCN63--

