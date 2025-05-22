Return-Path: <linux-next+bounces-6894-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AC7AC01BC
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 03:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5A3F166D4B
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 01:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A03B78F36;
	Thu, 22 May 2025 01:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c9R6DKQv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B977405A;
	Thu, 22 May 2025 01:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747877553; cv=none; b=toV9wTd7vXYaHaMow2nV5AYbBd7k0mFgS7R92NeDyP/B4/Mmbis2jlO7vvP6Dxdjv/iRMiT6K9RZ+pMmBbmOt64LRvfdO81Ctna/HD5ZGFcQgD7ALJNp2P2u+/QyC5pKdN95iKdlTu6nzkwVy+p4QimNIYHu/QnWJskGYe60Tek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747877553; c=relaxed/simple;
	bh=C/gD5dMZoR83n8ImW/pAoR4c3XRZ6Lj4RDbhTOWYJnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iJfhF/17PIbT6V+o5WYCA5PXbnTIgXnIuhCaS3op2c6gEXu7w5v/tv56DEyTiRd1nbJ3lU6TZGWzuBTlOnckUslWu5Lv08gUfX8Y5sIlhVV+zZqRrfFXYDHj4Q0qUpnqOvmlm5aTBr5AjM1gPgL8vDpewYdN1efWFfBlR7QEnPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c9R6DKQv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747877548;
	bh=jIm5sGavrETzeayzWRwVQOxSeqgi5x4XaXF/AMcZ+64=;
	h=Date:From:To:Cc:Subject:From;
	b=c9R6DKQvHyJQZMODLrYqJTlCaHTk7cATWvnQwWS7k20H/3pTZtPt+Tg2QIwe+3Bv6
	 LnkMgBa85qvBBFEmRcoKiKj0dGvxyIyXLzy/ES8maTGNQ+wAM9zdH1a1DkwoZNDsv5
	 xd9/zckxhyRzIZJ1MZ17i2JCryS8c6kcvyV6Iv44WD7MkhGmLJkNLj/cvn1VSujivm
	 w9zdOFWO+7oN9seyarZF3a9aSdCHdGTyE141S36ELsZZK+ZnCWTr74qyoyH41ZoOnd
	 EvGWtJHFyGj/OUIvNiKlqqEjB+wHeMqKFaUTfiEmYJz8Y7I6IU98M4qQdoVCaVALQW
	 DAlMMa5lyBjlg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2rPm2l15z4x8Z;
	Thu, 22 May 2025 11:32:28 +1000 (AEST)
Date: Thu, 22 May 2025 11:32:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the samsung-krzk tree
Message-ID: <20250522113227.7593f675@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9=fcJh8OPke/_9WaG2.l0_U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9=fcJh8OPke/_9WaG2.l0_U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  286e6e8787df ("ARM: s3c: stop including gpio.h")
  e0d7c81b15e8 ("ARM: dts: samsung: sp5v210-aries: Align wifi node name wit=
h bindings")
  e83a135a2b2f ("arm64: defconfig: enable ACPM protocol and Exynos mailbox")

--=20
Cheers,
Stephen Rothwell

--Sig_/9=fcJh8OPke/_9WaG2.l0_U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgufqsACgkQAVBC80lX
0Gy80Af/Tz8V5nRir3V5QENgRGt4PP1Uwl2pPCILM0OMHDc/ObLUhosEKu2b36Rn
oa/mVaRJt7jnjYZMkhHlaRuuZ0U565DzfhKwFuLsBxJso/XOybQtSMYHSCHDzDG/
JNLx3KxFilC2wXj8+x18gY6nYfsbfbcsNVrN28I1TdzVcd9Gr4eok3Dmy3GP9ZSH
43AkAeeyS6voK8/jjZQM/I4gtXpVP2s+vbh1v5gAO0oqhPV04T9ivcO7okY4+8F/
KFENcxkY0EJAI9Wc5PAhrl7lNE+ZYZVc0RmCkrpokvBswRgXDuAzfPRJs0qI9TaS
pRV6MRFki38SnierPyk3vYaJhQLVrw==
=kjTS
-----END PGP SIGNATURE-----

--Sig_/9=fcJh8OPke/_9WaG2.l0_U--

