Return-Path: <linux-next+bounces-2724-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CBD91D4B8
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31EBB1F211C0
	for <lists+linux-next@lfdr.de>; Sun, 30 Jun 2024 23:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5B33C092;
	Sun, 30 Jun 2024 23:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Cgj3958z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6702C1BA;
	Sun, 30 Jun 2024 23:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719789354; cv=none; b=K1MLKw4fZqadfzcU5dvldziS/OscgvTzjLfY3Ue65bOQ3ulR6CrRSskha9YYSPLgIlJtndbdYx8NqAparrk29g6VD2FHbrhbUoTulbMbN4DlzU5x+QBxtqetfa5J0BQctwrMCh4XnRRKB65+lWpE66FFeBDobcDbLuvIX7nrlRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719789354; c=relaxed/simple;
	bh=yV5+UwY+/erEfpcRy6ZLCQdLq2tDXvTvj3TRwStv6lg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pU/N9fahiJcinzDNXeBSNwyWHNE8xDAqQYqzt/KoKIAPYW1CEpw4sjQTSFoN4V1CBDX4Lqke8IcXLyA6MQDdDP0mlhO0TeU86v+hXmyyhfyr2ys33DY7KfSoy24kneC/xYrLbWhcj6dVeF5VKDopL9ZDr+CZRtDOZTwOFem1UsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Cgj3958z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719789350;
	bh=F74zq8E+lZgMD2Z1e+5vPBXYSAbklHqjKsG3y2yCFU0=;
	h=Date:From:To:Cc:Subject:From;
	b=Cgj3958zWsaY/hDzGOFeHWRRZjEwGjxLrZ3FACMgoQSLX3jOYqTOnahJnfq8avrvP
	 kfqPtbmeAK2vwyOLEx2vdS6r2qm0tnuctqgrs2QMYcZua4P7g+RDZCawAdQMF6OQT3
	 /HFNj10vBSNk3UdNQqePsh7WLHFB/cHCWIw9qLpSfoYg/r9J7iSlFML07TwIGMlpB3
	 MS3f3RHY9hmJb2OIKOpAnOPILU0Besd3AzYzIEdKh5wlMYVgVVNMcQPVsEXp0xykjT
	 69QvhyiXO88uyrlQPWNzXR41b2bCRmoNC591mIWEUVRKhWZCLswn56FVDgDhGWbJ/6
	 2G1ilxkO4KD+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC4m60m2Wz4wxs;
	Mon,  1 Jul 2024 09:15:49 +1000 (AEST)
Date: Mon, 1 Jul 2024 09:15:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pm tree
Message-ID: <20240701091549.08218e8e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jeXFkq7slTDfy5VBUDfvCTt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jeXFkq7slTDfy5VBUDfvCTt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  c00d476cbcef ("cpufreq: amd-pstate: change cpu freq transition delay for =
some models")
  c7107750b2ff ("x86/cpufeatures: Add AMD FAST CPPC feature flag")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/jeXFkq7slTDfy5VBUDfvCTt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaB5yUACgkQAVBC80lX
0GwTRAf+NOKHkaOlPV7pKqRjbgDlt/rFSgj/EEzr8j+2mVHJLjkf8prjDwMNemwx
WOpsqdOOp7us1qm6VQF+JpkD8oqqxgVf4dnqQ9eHScROwfbkxd0cjn4mvFMSE/VU
QETKucRBRcv1YUL6Nl1lByK+/4T7pe+Zs98glGXZp2sAdssbwMGhzqTAjj8Ucjli
e0ivV4lyICiVPNtR68o3I4OS5dXHhUifWO1+VGJakWVOiojYMtN/Hqv9sYwSa+8P
hvOxntfIoeWh38/BPSJWHrfzAMueWixwf1sU8O9kSuYxEmaDNZlGxj5ubGvGjtqE
0pC9mUZhFIxIFZCaSUTy3C2MWW3dNQ==
=FJgO
-----END PGP SIGNATURE-----

--Sig_/jeXFkq7slTDfy5VBUDfvCTt--

