Return-Path: <linux-next+bounces-6207-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B521CA87441
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 00:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 255317A385E
	for <lists+linux-next@lfdr.de>; Sun, 13 Apr 2025 22:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8061716F288;
	Sun, 13 Apr 2025 22:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WQtk3ADk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85F22AF10;
	Sun, 13 Apr 2025 22:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583640; cv=none; b=M000Afmg3mIQL7PhOERqhaY+zr7J9DRKKu2HMQetjDrvkwVlehyeRuuQZBULPbCUsX3DIv29g9uYMblwYpIdoJGv2Klgtb59osgRXCSsRTRwqsGgpKy0pQrhR8lmjQzGVJfcChta5+ipOVsKlOs5LbUr9zszqymrmquADFFMSZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583640; c=relaxed/simple;
	bh=cnHyfKYqJCNmgcbwfrkajpEYCSOI0t1APQwP1Qu4nSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lTqw/F5eWBKiPq6Y26ewlCxpbGjrI6OryORXCz+aW1AGA5NLCdZDOuDF9MSfoe49UCvdmt3eL96+elF+R1p/UTV3CAyHc9/o1PJpB17Cv1fOD2uiwziTL6nruQTyGU2dRTwEHVeke3bam3DHxF2G8dYsj9HAFNSYWSTReC+hWM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WQtk3ADk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744583636;
	bh=1JPryc/McusmY4Havf/t/FrVk+y5maazOnvcO0QCuTc=;
	h=Date:From:To:Cc:Subject:From;
	b=WQtk3ADkQXYnAGLapjU+tRYCsDhuPZbUdNC9bDW9ZB7YpZv0xWaiJqZPfZZQFOfF1
	 6ACBSW/B0lVSFpoWAIUt96G4/shLqw2P88rrMfEMh/3ovqDVrf+yYkJUwbO59qrbRy
	 IVIDoAHu6+jwG0UD4Ua0BtwyTMyHOoDU7ASKZ+Yyrfk90B3esS10FhYrrGvZMcrAn/
	 UjEiXaGYoUq/tD0lcpdNetMYkCizGR8t+klQ7VI+UmOlk1puHwKBo2cGx4rKm8s6tj
	 sU19xBIkl1gDD99inylhUHRwjreugWRhd2TSaO1R62ABZrYvZL3DBnGdIGIyQPbL5o
	 5ps6WVjNgjETA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZbQFH2HN3z4wcj;
	Mon, 14 Apr 2025 08:33:55 +1000 (AEST)
Date: Mon, 14 Apr 2025 08:33:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pm tree
Message-ID: <20250414083354.38f6911e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bZxb3Xh040g5ST2gjIfylvm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bZxb3Xh040g5ST2gjIfylvm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0f8af0356a45 ("ACPICA: exserial: don't forget to handle FFixedHW opregion=
s for reading")

Fixes tag

  Fixes: ee64b827a9a ("ACPICA: Add support for FFH Opregion special context=
 data")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/bZxb3Xh040g5ST2gjIfylvm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf8O9IACgkQAVBC80lX
0Gwbuwf/cFVULn46o/gFDSxs4ZlU5XgLPDicMrF4V0iD8cge15/Bjw+7/ZYp/pWB
HUfXEVxn5uXWFKrzPU8fwaOw+MTnVNDr7kyTDYk05TDxhS+raCt05DqnXGC2y/JR
z0jewe2j+jkpojUt4AoU9RrSzu9vV32dnMVlG3+W7OGzNdMAVvbiBMXW2D2rZuoJ
1SNjELf9RAoUE5qtyyFvYvYlQiiZWDP8Vqt4ftu7ruev9HDpd24m0RMRFRAYrf6P
kTrHRTP/Z21DyG7NF9+oRVw8pKIKm2em2qISQp6Mwx+CQMLFQp3HBBXmGkc6RzEF
lVDCdtn7/IFUm8hPugvpNiiaK1PFKg==
=B97L
-----END PGP SIGNATURE-----

--Sig_/bZxb3Xh040g5ST2gjIfylvm--

