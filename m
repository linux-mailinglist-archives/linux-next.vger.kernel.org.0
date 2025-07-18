Return-Path: <linux-next+bounces-7633-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F13B0A175
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 13:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16E083B0280
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 11:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638C22192F9;
	Fri, 18 Jul 2025 11:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XJ4kWejx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963191A841E;
	Fri, 18 Jul 2025 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752836471; cv=none; b=lvw+z/zuV/VibnM3GleZfzcY+MV/w75qfkAI195+zEj00d6ukXMDrO03Sx6ZfUbedJgBozPexZjpDbCJY3wb+bQSLCD7i1o9rnTHZj+UsIO7aWsBW9UvGnukFGFvZJCflRbgLqURIxuWnBGmFZXc6QA8bNXC9kcG9fJbW1SQ9AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752836471; c=relaxed/simple;
	bh=I8D4OH1I4uFcDBVSAeempGAQ9vXZK3HnuS0u6gUpT3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IaGzpWuTBH2ECisnWkYh9V3Y63NyJYhBKQnyNLGGHLVXuB2nfX9rqMmK0Mqokn6HPC/oOUxl/9blblS5s57zg5O8P5E7k4rcqpGECOcDH9wDHLBBEWU3iUKb/tU2TC/lNPa/x6+xFFVcAro3hzFwTaB0XRbBvYsJc7arCgr72So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XJ4kWejx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752836335;
	bh=RPiFStHPSGr2FuHumOqoQfDFz4WKGE/wU5mxUzfi7rI=;
	h=Date:From:To:Cc:Subject:From;
	b=XJ4kWejxkyIeM5lt6IhPkLwxSUbJrdVdnT+zQS9NabxwPQC7CvbDshl4jTBbIgIuK
	 0hlt/9b0Pq+Cevp7JGjJ5M4mPIenpwahmS3G/gYqzojSUQ34NJF+2ROkPqoaRHP+tx
	 a22/hGQFNZn29+cPgpvX/NCcQHrtzM8wC4knLtrZhbwAUgonLWlIGcb/15maoc/0KG
	 FWFTwbdtf8rsOo2PT6mK9jX0AP5l8BTBxDhs7QvtmRjDuq6NRjqURFflesPyDrSfST
	 d1EYNjD/Ovrr1oG5+F3D9m5NG8r4T/lsOyFeVXhW415lVjgMblhiAm5bCTpBoL0TYJ
	 tIQUCxxs1B6Rw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bk6H34JzDz4xQZ;
	Fri, 18 Jul 2025 20:58:55 +1000 (AEST)
Date: Fri, 18 Jul 2025 21:01:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein
 <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250718210105.0fd8ad19@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CnO.sUv6_j_hSCTg_3wbFyt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CnO.sUv6_j_hSCTg_3wbFyt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/devres.rs

between commit:

  f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")

from the driver-core tree and commits:

  fcad9bbf9e1a ("rust: enable `clippy::ptr_as_ptr` lint")
  23773bd8da71 ("rust: enable `clippy::as_ptr_cast_mut` lint")

from the rust tree.

I fixed it up (I basically took the former version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/CnO.sUv6_j_hSCTg_3wbFyt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh6KXEACgkQAVBC80lX
0Gw0kAf/dyFEDn087jgotSLuwEc7RAR8yc951Pc9DuOCfrIrY27Pbt0J7Knio7uy
bzCydjSYBrPRsFrhPvuMKvfIL4Ia/9tP3kh1CBQS4X00GyW7qt8yanrcOROAdh1x
I0YdModO9DK04gGqjeDeEL94W1zv3hosfgH8f75uOKw30/+tX4DcGCLmqWEaKcHa
nWqwBFy95tKY5kjVyrWAkIosU/ye3qtvxQJ/ErzGWeP1XPiqT1gBihpkgFLM4f/C
1WgcSjPILcZcD8t25+1B8vQ3INRg28qyZqEykGorz3Y3Orct2nVvvipF2wFEu1sF
hIce1b6+mF5fS25xTlXx8/FFesNwUg==
=7oG6
-----END PGP SIGNATURE-----

--Sig_/CnO.sUv6_j_hSCTg_3wbFyt--

