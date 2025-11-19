Return-Path: <linux-next+bounces-9081-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A29C6C5C3
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 03:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B77B54E5251
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 02:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB47279784;
	Wed, 19 Nov 2025 02:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="owu4zzqJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD9927E056;
	Wed, 19 Nov 2025 02:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763518975; cv=none; b=PBgHT8m8YJ7rO+mceYX3aaLiXXpBkzKuxpbvh8DATgKJPoVrfYL2I/B0OxOIRHRkAnYRUJGjoIU7xQbCexmT/XgJ5BYcUda2gYe5lQ+TPYuGrD2uAe6byCgGzjwNzN5BOt2m6lbOUoCWZ4cBws9Pmv9PWMGSvYuPb/B45JB2IHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763518975; c=relaxed/simple;
	bh=GuAmR+ulvjE/F5jdM2VWcXK1o5uuf6xDgLdOpmIzxiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WFngU8oZOVb3IAIHiUS+ffLxKeOMdAWdjzMThGXB0RKs0lEsFVSegqyP2PTg3bVKiq6MMiox08SXXpZYrrFWYTdgASNibacCopKvQACM3OzAynKeLmEwwjoWCejsEpeq07a6eZxV0vYcNLPkDquvFbjPkkdzlG3poaSWpZsQuX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=owu4zzqJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763518956;
	bh=i8yrNTSg6VIXFMEPTOsX39nwSQfXcfDdYwSrJ9cjQKw=;
	h=Date:From:To:Cc:Subject:From;
	b=owu4zzqJmRnZhG2xa0ujSCrWmtYIDKT1Yhwdgapyr4qN7vX3LHjRrpOalBIDX3SaC
	 P4x5k4jE19SN1ypxouk88O0OmdWHR5pM11rSvVpORdhcrrb+nNBAfjcPivb1/GuZlf
	 jn3iMUm3MHh1vrSouAl0z2n7qyXKeu2e9VaikzMjb/KLM9eKnBmS9VP/igdRI1l7kY
	 DwYsf1nlxsukhQ8BdgPuGv6bchcWvDmwkrYzIl6z/GCilL+n3nmpJ8lDKEecSoF+ot
	 Q0VlKTVqoewEDOB+3lkrU6ZZUqC22HCot3qg7ljxJpxeKaT86adN4H24xVRvPw9XUj
	 bH3DrKMr7YTjA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dB4y44sXNz4wBD;
	Wed, 19 Nov 2025 13:22:36 +1100 (AEDT)
Date: Wed, 19 Nov 2025 13:22:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, George Shen
 <george.shen@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20251119132235.5db86bee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LBH/AGRWBJ=WN0vj3AR9q0Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LBH/AGRWBJ=WN0vj3AR9q0Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: drivers/gpu/drm/amd/display/dc/dc.h:2796 This comment starts with =
'/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel=
-doc.rst
 * Software state variables used to program register fields across the disp=
lay pipeline

Introduced by commit

  b0ff344fe70c ("drm/amd/display: Add interface to capture expected HW stat=
e from SW state")

--=20
Cheers,
Stephen Rothwell

--Sig_/LBH/AGRWBJ=WN0vj3AR9q0Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkdKesACgkQAVBC80lX
0GypCwf/ZRJB9TD2p+h52WneraBYBifcbbzxcVYv8UXxEeMNVMztFAfy4StzeRXZ
TP56LS949ANLQseqRPGlg2Wp9auTfL1ZXCufcE0A4xOFwW9kY6dQZcP9Utp4ZV8M
UqeKRw+7Dwn2efm3AyJAj64gi35HqJIklIrtdeHH83sV55IJWc7s64lb7JilTgxw
x579vyQNzbu44b0tIb8ABvdXRxHQX+81cFJO8mAPd0ylqT1983nvzPOuwhd8IYT4
IkvQuaTKxdTsp/EytpT4BOjM8mXbhGBK0tXPoCs8SatZ3SPvDEWCrN1Q6TRv+6J+
lvbcFtY3q03TRKiIa2k32am56gKGLw==
=dfaa
-----END PGP SIGNATURE-----

--Sig_/LBH/AGRWBJ=WN0vj3AR9q0Q--

