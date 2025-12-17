Return-Path: <linux-next+bounces-9449-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F47ACC990A
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 22:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 205033042517
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 21:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9EB2C3253;
	Wed, 17 Dec 2025 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VnGlJzgs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33CF30F922;
	Wed, 17 Dec 2025 21:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766006244; cv=none; b=eu/u/UjatFYOD92/XUoog4FVNiZ0muo24cWgV+/UYw/R0wAawOJ6o0r+tLeC7lXjOErXi2i6KkmGb6M6DJ9GWQjk+r8N/VtFRX6Hcv99dCF3utspjINv88mt8itcZV5sCLem8YOX9ZFcPVF1rGxUFteViXcuaklWm8hH+PfL848=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766006244; c=relaxed/simple;
	bh=tSA29+ZLYMl/8thd/t5rG/aqaAbWGYCseuoacLb5blk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u1IL5IQ8zX7SYkZwrWgyf6Xre4AV4ljYZ+KPKCTM7ieh3H/A1HojupMfSz4Uwtwo7fL0RTZqCAQ+AderEABLuVme6v7ctsN+UlHTvKzUCheQfi3Us5rczou2tK59WPDjhfRXBZ7betQsd8/xp8LFwX19YK70CC+U1+u6mLFmK+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VnGlJzgs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766006240;
	bh=fKx4AH+FCjEWB+cvP7rybCMzH3woN43vbuY0RsxC0Ls=;
	h=Date:From:To:Cc:Subject:From;
	b=VnGlJzgs72dhCZNg2BTPISvoofDfYiXZPKcoRXBWknyIH0OPsa66cQ9rKbjG86Ydu
	 q2BZyomxWfRXDNu0ngbD0Qa0MPoDAmt92DbqaooCHEIr7xvE2wg51Xwq2HUoGBdI3Q
	 pt8qtv+hB7sqgbNhy9uk5oL8XppJKF3cansruvcoKIqFcX6NZXKhzX7Qr9Okij97qS
	 MtsPgj8Z/W2kKn/u7WZEll/UJPFi0ITUgSXLmI3ouptFKjwC+Q6SnNfvYi6rlYJMtV
	 JYiLVJQwy6NVqY3rzCbjlyLT36oMl47gNUpWqXPpAmIsrpF5yDIg7XmrqH3BEQ1gvE
	 FA9nOfv5WfKQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dWmpS39LBz4w8x;
	Thu, 18 Dec 2025 08:17:20 +1100 (AEDT)
Date: Thu, 18 Dec 2025 08:17:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bitmap tree
Message-ID: <20251218081719.231bc99c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iEQFfLnLDGBCmAad4tVFIxI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iEQFfLnLDGBCmAad4tVFIxI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  4f2c51b6bc72 ("rust: cpumask: add __rust_helper to helpers")
  924ca2f7fcba ("rust: bitops: add __rust_helper to helpers")
  ec84614d00c6 ("rust: bitmap: add __rust_helper to helpers")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/iEQFfLnLDGBCmAad4tVFIxI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlDHd8ACgkQAVBC80lX
0Gwojgf/SJpGzIACdiQRf0XmvlnCrtXYRyw30HLBjlDU02bWhp8BLMJ2liyNXtm6
H6v40VwhI3066CkwlNsFkNcjGqgJ790Es/vKOUx9tnSsH7HriVlJMY5ZwYiGsc4L
ia4yIYN5tNadJBXeOMWECELMMS6cOPC9M1T/+CqShj9qpFd/YAuzmfgF6xLD38a0
jJAg760BMFIKjS6aH7Xduz7axuw6lM6UKDBXdRImPBcAgCt4eQ1fZahl2tvMC0gF
CAd2yJLSMJfys/10auqcAdw7eXmbZBEuY6WULWtZAQcm+JbQtXZ2R/u41WDq5ilQ
mPasBQ9UyrIHAsF+gYH02sAepoIbeA==
=4hbv
-----END PGP SIGNATURE-----

--Sig_/iEQFfLnLDGBCmAad4tVFIxI--

