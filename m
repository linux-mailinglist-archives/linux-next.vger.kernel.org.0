Return-Path: <linux-next+bounces-5935-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99251A6CEB3
	for <lists+linux-next@lfdr.de>; Sun, 23 Mar 2025 11:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FF103B51D1
	for <lists+linux-next@lfdr.de>; Sun, 23 Mar 2025 10:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465E4203713;
	Sun, 23 Mar 2025 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="O3FK1bGd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CD020127A;
	Sun, 23 Mar 2025 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742725801; cv=none; b=dIH8YZruLPDO1rF2QGKtiNBNaE2NrhhS2pG8apYDtxeMNAXBNIsb+s2R5wwxESBeQZkIP0p+3xXtIyoNPay93+DqCBDwlxKylQ7aFB38Oc2s39iW32IsPA8vVBzmbRNsoL6YuvX4qv4RzJetgRCzfJrTYuDRmYyfovxoufdjYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742725801; c=relaxed/simple;
	bh=NmWh1k7W3U0d0Kpxq1obaK4D4zcCIG1K9ztnfmVdzNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a/+NpZ8/j0jVj5j8T6Way8pIFF75cqrHHfuSaEfqsZdEDH5Cx5jYJoFoPIUU8EdPPoZpf3L0QEI8KKzJAkjEN2AjMaFDqnccgjaoZMcAlivBtLrmMaukpCScnaeSIodIJi3voHwgnEvzw2V7b08sl24h0P4dyOrHqA5mHFZDIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=O3FK1bGd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742725793;
	bh=abI0svhSiSukWr9bs81MFOT2BJ9fk2+6xqNcz+6ja+A=;
	h=Date:From:To:Cc:Subject:From;
	b=O3FK1bGdW4tdW8tnTgAupsJWhlr4O+hdwztz2MYnR5zEcuzh0rFwmmAv3Im+lS/VT
	 Rwzk+MIeQOO0BZIEtmaJmqdIb3dfKMnF6EMUcI1AjV/DerIxifPT8Q+FBxGEA+HCB2
	 CMuPowWlUb8ffb2TSWzLqHkpFZ5G4RTGYAkMOuIr7vKMSpVU7HIII0Of5cjD2DBu1Z
	 To05OH9ILUS+MhH8fIURb9bSr6T3YvbzHVCDTSaw1er6TWiVhDaf9B7fOBL+KCrDNL
	 ecniUJrGlRGDWiz/NiexxrBV5jsw1HNDFrIBaKu6kpf1ud3CFOZD6x0bC+VphpV+jK
	 AHJmFmHiJig8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLC9X6JL4z4wyk;
	Sun, 23 Mar 2025 21:29:52 +1100 (AEDT)
Date: Sun, 23 Mar 2025 21:29:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20250323212937.4f182bd3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PAIwbpigSvq_PW3U4nYp_rN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PAIwbpigSvq_PW3U4nYp_rN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9ef52d529bb7 ("ASoC: SDCA: Correct handling of selected mode DisCo proper=
ty")

Fixes tag

  Fixes: 13fe7497af19 ("ASoC: SDCA: Add support for GE Entity properties")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: d1cd13f80dc6 ("ASoC: SDCA: Add support for GE Entity properties")

--=20
Cheers,
Stephen Rothwell

--Sig_/PAIwbpigSvq_PW3U4nYp_rN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmff4pEACgkQAVBC80lX
0GzyEQf/SkMu+zDRNua6I9DfSuUTT3m+orHSTvcdKldaOBo8EbVmk8Tt1hQ309sA
/1yVD9BTCQy9zg9UCyYR1xQfN+vysAQ/lZ68QW56uWfX7rHY7nwIGMmAqNtSY6Kd
Po/PkJ31Yt3DN5Q6vlS6Qm0MpS7Lc3bLlaZixutB9LXF+16C3tPmOAc0midy4sdq
KeIZQS1eLYgxioN4Ogc++/7zFyWQ0ffQBE6eGlijkvEmKMjsV3MB7CotNl0jviUC
z+aQHRVHFAL/7K2rtcxdJ5AhK8QzESwbnXTajcgfEeWLz3a7lsA3qvgxmywNSki5
kXBiTikE85nnJLMrBoqPCEhWE2eT7A==
=1j2q
-----END PGP SIGNATURE-----

--Sig_/PAIwbpigSvq_PW3U4nYp_rN--

