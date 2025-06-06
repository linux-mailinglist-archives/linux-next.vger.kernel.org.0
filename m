Return-Path: <linux-next+bounces-7087-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E3FACFBCA
	for <lists+linux-next@lfdr.de>; Fri,  6 Jun 2025 06:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C01116AF00
	for <lists+linux-next@lfdr.de>; Fri,  6 Jun 2025 04:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B5D18DB01;
	Fri,  6 Jun 2025 04:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HxVAor0F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB2C19DF48;
	Fri,  6 Jun 2025 04:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749182496; cv=none; b=glMGhdP7If5zK0tcAx9uuwO1HRtwwYEsl6EhchjGMRc1STzy3GofMQyS38K1MxMIL3fT3yANN06ctj+slCnmWxDuYH8XRuvv30fk5Vh8XztJ5zULGdXtyGeNf1L7FmRGsL2W7tu2rpp4jFqwEi3/qsSm2tBBx6SWjmx4ZqzLZrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749182496; c=relaxed/simple;
	bh=DDS5dStpv4Phe2CUL39WuSaC+xFWB7pcBXDUCVm3cPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HPIAbf3cWrVJjhvwm3JUJFa7BlAaA/+89XtMbmp1j9NFqjxTAFlYnQ4Q96ROl1GX9UPIdcxVEyfOd09mmHI5E8sCr5ut30gu0bckxu2YbxeR8EGIUyp0AeLPcDTLL6ISzQgxbAbVs3l9MFSAyBw83WIMRhlBaESzpJegjtRR/Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HxVAor0F; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749182487;
	bh=XRYFhEROpuudKYJIxPwbblwi7fZS7rNq2xej0Yrdj4Q=;
	h=Date:From:To:Cc:Subject:From;
	b=HxVAor0F8/fS8qcm90+pFMuw2jM0AEIDjVli4FFeFwkkpF4Sd+4y7RjMeurcTrf8z
	 J98tcsoQmEGHmupe14DJHvluuPdw6Rm3KdHuncvcFp4/4vVNP8tuJZAqJS1CUhibqt
	 Ljc/p9WOuDdss7zLnNfGmwd0CDnTBd64R9Av8KC3k+57TD53sPfjhAnPehsIj7i+W1
	 K85SvINZo4vPWj0m0mdHNRpzqyPMz7arnceQ4u8exF6lt2VRo7Tur7fuW1xw+IeiJs
	 fHtcZyYE3cHJ7EJywh9synUwaVw/ijwmecpOqJKeIVEAkx1ec/w3dvLysi/DA0Xrx9
	 B+Bm9gCQzkHdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bD70l4MB7z4wbv;
	Fri,  6 Jun 2025 14:01:27 +1000 (AEST)
Date: Fri, 6 Jun 2025 14:01:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kbuild tree
Message-ID: <20250606140126.10b191fa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z._KaMwLMUH+jmT2gKsPcvg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Z._KaMwLMUH+jmT2gKsPcvg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/kbuild/makefiles.rst:1104: ERROR: Unknown target name: "non-b=
uiltin vmlinux targets - extra-y". [docutils]

Introduced by commit

  3db6f0026e85 ("kbuild: set y instead of 1 to KBUILD_{BUILTIN,MODULES}")

--=20
Cheers,
Stephen Rothwell

--Sig_/Z._KaMwLMUH+jmT2gKsPcvg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhCaBYACgkQAVBC80lX
0Gz7ZAf9Fl3kGKCF3zA573AEa27cSxFbdjN/rHTsLSXZlqltlcDXx/evf619Hxwn
ebOcbrS0gXN/hSQ80WQhITFD6NWDaqVLo2yy/WgJrJqreQro2tgDVM92Xkt2KzOL
EGAfMo7XzHs24l2Ng1FCMUzFLTuGJbOCAXkfLzNjfG/47W9mBzbU4O+GunQ30eBJ
3YWU5I4bAo/B4hTlv3ByHa8dZWcfSk+ukB79egFZGaqpitdLHPDPtwttgL/C/J5A
+5unBfVzEBzqYaI6ObRv/304GmQ+2hoqSbJ6Hd2oOdX9tdoBT26skpN86UKS9w5k
grguyMYks/pd40ZGqlMwUs8o9I71/w==
=+R9G
-----END PGP SIGNATURE-----

--Sig_/Z._KaMwLMUH+jmT2gKsPcvg--

