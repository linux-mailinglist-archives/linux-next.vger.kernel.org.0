Return-Path: <linux-next+bounces-9665-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C84D223D0
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 04:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F63630A32F6
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 03:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BB0280014;
	Thu, 15 Jan 2026 03:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DcCIIION"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FB0277CA4;
	Thu, 15 Jan 2026 03:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768446104; cv=none; b=kFmgdp7LKOBZf3Yw+OE9B5vgZY/axtjY+Bje3PEBE2hOGFlRDwFJwTGR+Gix/L1tiqPK7ZIIEU+0teEJiGuHxhQ54NR8mr84OSCGTmu7DtFGq9dDM+8t3oMz82ImOEwTZZYOuzZa5n1brTIEOZBL9u2pGBSfpokVmxmPGTXHkaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768446104; c=relaxed/simple;
	bh=nzLW1plhQMF9/P8TUZDtN2+KSEIWQFpfiSg6MjxwfQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DRi4a6kfPl6df50lEbV8bFFuXWEmC7Q3yA62reN57/BXZddvGBmzqMGjwPj20OKv0HA5GGa3lZ0GLm/S4qNaxJ8xlzGURhznjEoomNc3awDIbj09YPbNxkwgvukhb8ILxROh+5+rBXy7NWvo4m0+ToG2659knK0EvZwIno18NmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DcCIIION; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768446094;
	bh=00Zw89qiY2gpcw17pElW4eeYXCsJNAf+RmRguD2BNF0=;
	h=Date:From:To:Cc:Subject:From;
	b=DcCIIIONxq5vfBA1hBfMOx5cHCm+yftKp6BRjHYqhvmGsHT38yXmOaQza6tpEq0N8
	 clOTVM/NMlbZYxaGKhi1EQt9caMyqsxZdKm1zK2nIs/0XvmIHRohYY7uuqjt+KXwsT
	 JB5GPzJPFLxAQRFqmy5Clj4UJkNpu+1STXA7nJniYfwoxrGXL59vcyn0S+xgUiibgp
	 8dxzAUrFc7DVj38sqvm+idBrmySCawOg/yNNRSxyG+BlU2rPdtv+fH4E6xs58BTNng
	 edCGCeL1cfc7U1PNdaQvocWMobBe6JkNNu/8svZWvDWChGijeICXXmzkjzYtnLl+mb
	 /5SR+7UkJkSHw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ds76k2s3Nz4wCY;
	Thu, 15 Jan 2026 14:01:34 +1100 (AEDT)
Date: Thu, 15 Jan 2026 14:01:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs tree
Message-ID: <20260115140132.6e0c05a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nM.8gosiCZky.3.5YB46nyv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nM.8gosiCZky.3.5YB46nyv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/filesystems/porting.rst:1348: ERROR: Unknown target name: "fi=
lename". [docutils]

Introduced by commit

  7335480a8461 ("non-consuming variant of do_linkat()")

--=20
Cheers,
Stephen Rothwell

--Sig_/nM.8gosiCZky.3.5YB46nyv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmloWIwACgkQAVBC80lX
0Gxmhwf+IGz7Ks++UAeB59SWU1iQI1YvtxfkV/MbRZYyFnj5cpEXSTJ/xJd0LZn9
4JdlwCr8qXITD36twHlaRZ7kI4jJUFFJ3N51gwp5b7VbgQKjaUAUOj+0xBrpCx8c
HXfaS3tK1UeSJiGynV2e0cUQngbQlzyG5LBxkXdXFmrbrJLcebUwMcnEKVnfhnfA
MnR6IrZ+lR8Pd6vkxByQASAhNcgYAyK7fugAOPwjwOEI56HgPaNIvihlNrdbuahz
3p+TjwCcYqNxQj6fQxBTaQRHJBUrjAI3UZFGDc02EmkQGtwsbV1ivA1OLc0vllXb
/IBHItHqsOg9FvlVhiTVp9exZ9pkZQ==
=oMrG
-----END PGP SIGNATURE-----

--Sig_/nM.8gosiCZky.3.5YB46nyv--

