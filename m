Return-Path: <linux-next+bounces-7382-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EDDAFBE44
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 00:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 546DC188E643
	for <lists+linux-next@lfdr.de>; Mon,  7 Jul 2025 22:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4005524467E;
	Mon,  7 Jul 2025 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EF6NQvxO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC9221FAE;
	Mon,  7 Jul 2025 22:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751927704; cv=none; b=HiI84FqGO/fD5YLp+NZ1+7z7q63ZqBxK+QldDA0PewOmCZthiF7987zQeCWRUOoG/Sm9I35hz6btf4bAIC5mjgvshnHFm9/bimePZ0d1nuaT1K7pIXV95nBcZzeDlCYNFQ6QFlH7w/k/CzTOSIFzYh4rGaYVPDkyfBMBgWLYiGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751927704; c=relaxed/simple;
	bh=00nK01ililGTrLPZSEvUQCU4RSu/+6BZG0FYGYPCh9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FC6cmj+IP96sy+RGcOHcehe5TN7kTEzgPjwRxdPcldCYZeMXqZdS5VcAjmVusU/NiNEO+JEkNimriJl8Yp9yvnmeqhXtKStHo7twV7nXP005+/C+vx+CvV33MZV0wuce2+Zf7JK6z1AuTGxnt2anwWt3ovcRhNl5A9JcV09duvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EF6NQvxO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751927634;
	bh=zCLVBw7Og7kouhz5bUbl9LzA4U+J6nnvvFJ9X/WWvWg=;
	h=Date:From:To:Cc:Subject:From;
	b=EF6NQvxORke6lurPHK4hZdXDultnAEhc0J5qU2Cmfa+RakbWtpCZ6rAPb6XWVONgG
	 WKtZPcn52k9RnFwQXE6J9WneM27DciQrHLbs3lv1LBgtnRP3fneFGRvAG968vy/RU0
	 9uWo09tmQ+7IKGwNmI1CgBvFrgLstHJHWxD+yOCPiR/HqbchjQRWA/ho1Lo3YCmbQ/
	 xaz6xVnFMJ8LxId3Bw8lj9u4M9ymIi+CERyD3GQmhkwJLDrUPd7ASQhRvyUT/Q7i5q
	 /HdfzkqoIMo6k4RGZ3weCUfCZp/8dFTGIoaAZKk+EdIoDygoXhwfERjNkfp70FK/Du
	 5A2aePhVK7uyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbfD23fKLz4w2J;
	Tue,  8 Jul 2025 08:33:54 +1000 (AEST)
Date: Tue, 8 Jul 2025 08:34:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: John Johansen <john.johansen@canonical.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the apparmor tree
Message-ID: <20250708083418.290291e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hIOhAvTHDlc6Jy9f_=Ue1bd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hIOhAvTHDlc6Jy9f_=Ue1bd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3c573e619d2a ("apparmor: update kernel doc comments for xxx_label_crit_se=
ction")

Fixes tag

  Fixes: f27efb59a52c ("apparmor: make __begin_current_label_crit_section()=
 indicate whether put is needed")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: b42ecc5f58ef ("apparmor: make __begin_current_label_crit_section() i=
ndicate whether put is needed")

--=20
Cheers,
Stephen Rothwell

--Sig_/hIOhAvTHDlc6Jy9f_=Ue1bd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhsS2oACgkQAVBC80lX
0GwUIAf/X2b7VykEmswSO9QTmEw545cKPSNKfm233TfdC7dJtVjasNo71GkUqbIM
mtFYHSNZgR9XicXrOOMq4mKutXR2EBFRS8Moq1e3erbAl/aMg5qonlqoX1ZILheb
r7U2t/rc6hXMb/EEHsxLtpD+4jIB+FeoHAakR3XWuWdsfLVAQyh0s9Kn+ADKgXWN
FiA+qh91Ghb7XJkPma8U6ao7ysZCxbo8G6GyimG0j9wPSfieAAxAtnHo1wh9RS8r
0RVNYulxOaY9Bl/JXjgt6HX+kAkS/BChKeKf1Yad6SM0jPTHT0fL4ymUnc7JfZBf
BuiB8DtDYPbnbD0F4vPEjOuJvLO8kA==
=bjXk
-----END PGP SIGNATURE-----

--Sig_/hIOhAvTHDlc6Jy9f_=Ue1bd--

