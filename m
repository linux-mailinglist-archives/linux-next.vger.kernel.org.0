Return-Path: <linux-next+bounces-3253-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DC394B302
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 00:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0F91F228BD
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 22:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBD115380A;
	Wed,  7 Aug 2024 22:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="B8AOw8F8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3057D14EC5D;
	Wed,  7 Aug 2024 22:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723069633; cv=none; b=nnJFXEHpHoXfUiSa6KLnryKD4d1Y7Q5BHPmQ4nSG/cm1YvErDNco2zTFAizXDS9oReY7VvoQwNvJzTepgo9vCdemK+9koVVuNaHqVsRgFXqZEyDo3ES1pY1wR8dXhj0okiC/aNRkMKrPSq1yDMG/3i5NgZaC+KGlmmzUu6FBS6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723069633; c=relaxed/simple;
	bh=iRsbHq5qkO+S3Vcc/OEy9FSbP3uZIpBOaUm8jqQmTyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RZBVkQGtqLhS71Qqpo3QzFOjOb8ITcmU9vE+xjYf84bErQMbJ/5CtxANA50QWxDg9b1K0tphUARfCQpCXiTXRrxPg0jDrN2HCrT92rGlXdRsgIMqwKxxfFqfkIErPw3P/Z3ElMD154VCOpoAx55eH7Y82PsT4IMHaeQ1ltrZn+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=B8AOw8F8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723069627;
	bh=3GenrQuJTyiblNPzkLmaeN4DZ/GSLViIzFQ+p08vj/g=;
	h=Date:From:To:Cc:Subject:From;
	b=B8AOw8F8684Foti9HyFV1jIBo7VTfbA+EMZ5nZrDi21QHJm0jIF4MsuNl2kMWGcS4
	 gAjNi6/ySPHeR2V5SmjTcDQe+DLj4v9CS4KXDohBZ0cL//V0lZPJh3Inr7iSbIA1lw
	 jklNsDyg6zkpbU+PEMFjcPSGvsm9AiV0Y8ClfBBiDlzTnrpj1T7WKsAu3msW/NH3f4
	 mQtpaWn/yjKXAiZq9fwVBTEVCNezikG6fQG4PZLVi+y/ocVtij9sN6dI0MSRVehp+G
	 8aJsyMvzgfStrLznrNbrVa7KtKVnIh+CNuR7XWDnRyrQrYRmSKsXjiuRTdlGAsYRiX
	 MfaGPPwCYrBog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WfPtM2Rt5z4wd6;
	Thu,  8 Aug 2024 08:27:07 +1000 (AEST)
Date: Thu, 8 Aug 2024 08:27:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20240808082706.687536aa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RwlhDhoER9m0146pGEBriYq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RwlhDhoER9m0146pGEBriYq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a60b0e8f150f ("ufs: Convert ufs_check_page() to ufs_check_folio()")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/RwlhDhoER9m0146pGEBriYq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaz9LoACgkQAVBC80lX
0GzDcgf+Kusree7Bgc/WTSUqWUFp4R8vOu+PoN372nQmhihPnUbjidWKh2BKv6d4
5MVMKRAYw5X86k5Ai7kipx7tuRgEl01nECXvWsUgTcaNbsL/MJhBIyGmpTNEqlhD
vyA/ocmgtbTA2ayQGO95jMy9Tu39AwOg+ZiBZuyNUb9bMl/kQzUGhHQ/vwFfUIOW
BBJCOjYexHNggeDxflfhKe9xfGKfbh46OI15ru9DlFdjv++anqbMeXPP4w/m5TZg
tIGW3vXuVCtddnF3UmQnyA7WFU2enp7RjrCP/AmRE1fpbZum/47Bic3wRvd0N5Gx
Nphu4fdCPORfbGN1CdlSi1Im/4s5mg==
=UxN+
-----END PGP SIGNATURE-----

--Sig_/RwlhDhoER9m0146pGEBriYq--

