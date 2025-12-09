Return-Path: <linux-next+bounces-9380-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A1CCAED73
	for <lists+linux-next@lfdr.de>; Tue, 09 Dec 2025 05:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAE56300CAE0
	for <lists+linux-next@lfdr.de>; Tue,  9 Dec 2025 04:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60228224249;
	Tue,  9 Dec 2025 04:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Nx7QtsCH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3140B1C84D7;
	Tue,  9 Dec 2025 04:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765253335; cv=none; b=Sse/tNvheuM8yM555sd0GXI/aNAK0OwpULf0cbBhA0PT95V7e6W3uvGq1dP69EzSxqJAC18om7xvNYIhUF2mj0PoEGW90hnRmyRsLXEp+9h+aV0hyf1F2cFdS0+kVpoE4HkMutsiWTqcLjwJqT8sLVtFJMYPLaC38JuocoVBEDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765253335; c=relaxed/simple;
	bh=4ndButt/cjU5gwFtGfFeApVDwAJ2qXMDrioYFFAvyHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P6aSGF71vjV6ExtkY56lhOyAOUSLGgQ1CeMLVRxZvt2JfdM73ojnk4xuhymp8HImOd0zNlJKRMh3FlcwGQCBWBakDq2/6deV6BkS3O3aD8vZO8oRPawIBR1IfuMYxONi1AhLZCOE/qE2KGGOw/SztMPQGmueJQyhVObiDiLxJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Nx7QtsCH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765253327;
	bh=osCmCXWIHecCN+1dXpuOek72krNrWGgUOKgY3C7NOL0=;
	h=Date:From:To:Cc:Subject:From;
	b=Nx7QtsCHw/rFfjP82De53HJQ6c2vHxHo/jz8mN2Uko8L2R5C3/1AHaV3k45ZtzrM0
	 d21LvxRWtSJKaj0zXSCLht+8T1E6wPEudAbwh4RXCIpT6v10RMrRRAJjxpqfPZDdni
	 Y3cpdlHu0d7ln3qtY44NfbOAe7/8DYTvl0qzEgZidiPGcNiDN6/+ncqI7365Nk5fe2
	 59yxTSaR5XSke9OpVqpR3Df+0OuSpc1Uzz9/C7/hm278FTOOdA64hguhD5iOz0NuyP
	 sFZqoWXxAK0UIFC3wW+eh9/YP2cQPckJ2a+b8aNmVV1v05S2v8SkSU3L38SXVaZ5ha
	 hKXd3hY3UM+Cg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dQQMM3hW1z4wCB;
	Tue, 09 Dec 2025 15:08:47 +1100 (AEDT)
Date: Tue, 9 Dec 2025 15:08:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-ID: <20251209150846.31caac6e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nL.qs0Lg_2xb_WXBVNPv/+K";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nL.qs0Lg_2xb_WXBVNPv/+K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c8d11fe8bcc4 ("mm/kasan: fix incorrect unpoisoning in vrealloc for KASAN")

Fixes tag

  Fixes: a0309faf1cb0 ("mm: vmalloc: support more granular vrealloc() sizin=
g"

has these problem(s):

  - Subject has leading but no trailing parentheses.

The closing perenthesis was split onto the next line.

--=20
Cheers,
Stephen Rothwell

--Sig_/nL.qs0Lg_2xb_WXBVNPv/+K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk3oM4ACgkQAVBC80lX
0Gxztgf/Q2heup0B3XaYLHviGWZQ+ytlHJFL0+AreM9HTB7NITk/jecMsueNxuc0
1vG7GYcdEDLhxl/0pAeAOZVOAKAL9e6JEKAlke9k68N5ZUR/HOhSwRY2UE9pLl9B
edDlYV6IeEBygrEZxA8LXmIBXhIVjHeyt+DBECtphs4GKufw4RAC4Q4GyHYU1mbQ
Cv/jpoMyh1tcu8Fwa0B37aO+cQBOUyvNWm6bx4rm4KqUuLMpZX9wd+EsQJm7ZucQ
lMgi1yJhLxy+U+XPUhoE7jWnhfKfwSdxL4s6Y0BqieXi6zEPq1OiDPCkQcCAOrmw
NyR56qgwYRWL3K5/npmHsX1R4H6tRg==
=jU5x
-----END PGP SIGNATURE-----

--Sig_/nL.qs0Lg_2xb_WXBVNPv/+K--

