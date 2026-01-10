Return-Path: <linux-next+bounces-9607-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91FD0CA24
	for <lists+linux-next@lfdr.de>; Sat, 10 Jan 2026 01:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A3EE3034349
	for <lists+linux-next@lfdr.de>; Sat, 10 Jan 2026 00:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00038125B2;
	Sat, 10 Jan 2026 00:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nE1RbFMS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2861DDC28;
	Sat, 10 Jan 2026 00:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768005361; cv=none; b=aSiHIl5SPGmT+uTxWpW4eniQXUJnmXe5u0DbjprfjUXtyPLdUk6ddyXZSST8aoFt2LMUcwU6mo7ME9pF1VGy1n3A/MenukI+fwf7B/xqUpQSJ7XCvvqvp5nLlY1ThmCxCgQtBpUU8zX/MXeliQMFEauWeuKSIZBKOyfTqrQWGYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768005361; c=relaxed/simple;
	bh=clWggC5G4aVjFJ5kBOnUcKOo/4sRLLIDwHLsCs5p+Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KycFFkMLp+eudEMWFMEG8X7HSCs5Z39Ro2bpPn0TxjaMHLxAYMPH2qErC215t5rS4mI5566VLwEezFQ+57UMGHOu4kf/tk5fXGMF3MH8T3KeclW5jfs55Juy7jghKXZBJemoqkamIpyp4IfteOuQ/riOzVVM8XH7MRfsvyTY478=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nE1RbFMS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768005355;
	bh=sD3CN/bwGP8a64NO0vXDJO3f3GtBvv9/IOSYQG5Zh/s=;
	h=Date:From:To:Cc:Subject:From;
	b=nE1RbFMSUGWbjKc82S2qr5XvWHUHoke03xHCzR2Wg5jgUAzvlY5E2jsSmshEMwO9W
	 ZaY6BFLbTfOjeHhhIvJKda/TZUEXU38e2418qUrMeBMBZIlGXwncGzxkKILat8u8uG
	 tZuRe7kGTK+n5IR/DXEq+uqg2Jy69KRUySNwPVAskcUPm2fVQNknd32JG3qNrK3JYk
	 yy7Zq7qURpsrq1YAgOLUgZXVRRdf6ZDUziZfv7CUc/04kbq/Tn7qrYnIx0+FdakjQ9
	 lYnWHWMCOmdoKTelQgH6sJot15oNzyM2E8GXfemkR5oj29g7nsusNquMyeCRi1jJaL
	 h196AkNX2Kdmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dp06z3NLYz4w23;
	Sat, 10 Jan 2026 11:35:55 +1100 (AEDT)
Date: Sat, 10 Jan 2026 11:35:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release on Monday
Message-ID: <20260110113522.2daaa21c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TvHEX2EJT/.brrd.WzQZDLm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TvHEX2EJT/.brrd.WzQZDLm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next release on Monday (January 12).  Normal service=
 will resume on Tuesday.

--=20
Cheers,
Stephen Rothwell

--Sig_/TvHEX2EJT/.brrd.WzQZDLm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlhnsoACgkQAVBC80lX
0GzU8Qf/ThXN/ybMhj/IrnDfT4guy4jzfqGaOh8ho2KLX17CLtKbKTjbaPlmcQJs
gyKZjUxtYh9l97IUn3BbTPD3ikcSaLtXd74IHsmedtYAS7uUS3kSQm5tw9A1QLU8
5BUchxig1UoWCIIrMxFG6SWsZAXVL54fD7IqvG2H/+anMJBIBsxCaD+p2ZWhVcWl
r+PH9iTh6R9pGYEFrBjEXCItPEMwHK3Pgk+rSReOtPmlw3ffHSJfVzDGMFcfbJYc
y1dFEDBVxEZNC3ekZmpvZ4zHVJr7QGgIgRaJLDED0XEAHbAnR5bJNC9eMxE6bqOC
582VMMdhbvSNYsVogiK98zvyehVL0Q==
=orqH
-----END PGP SIGNATURE-----

--Sig_/TvHEX2EJT/.brrd.WzQZDLm--

