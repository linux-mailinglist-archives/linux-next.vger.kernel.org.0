Return-Path: <linux-next+bounces-5373-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6132A29CCC
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 23:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 162957A21F8
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 22:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809EB21505E;
	Wed,  5 Feb 2025 22:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ScgaJ/gn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457F3192D83;
	Wed,  5 Feb 2025 22:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738795432; cv=none; b=gI70uwCSvIghnLBUoMNoA3hG/3r7gNOBm7U+bc45wfaMoQqUnMStNfHeGSorHmyVA8xSPvjg9OMIthHBHsLe2w+mp1O2Kr1OmpzkP/6G9zZztU75QpkGZ+7STcimS8JfJxueIoE7ru0yUJIDGprruvKNI5YElldIhEhA5vtk99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738795432; c=relaxed/simple;
	bh=bOUalrxp7jG3ZgR6do7zefLQcA5EfaiJ/ToVZgxk9oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OvrZJJEkB94rd7/+9B4RvH9OYpkKQPfVmlhu0OxHuJP7+anSF4uSLN4UOS6TcPmYn24Q+ZrsM/dX/7JqQ6VmueMp/ESzSlp0ZaDkzrJLSOvfu8bzmtlZ5P/4Lz3odVLw3D9YP/8dvHoH/LQ8Szv6W/3ILXaIs6K6WKzFNh8XhBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ScgaJ/gn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738795414;
	bh=F9QakszKuP8ByB6pho/CiHISDfLT0b2YnYhAlOWSH/I=;
	h=Date:From:To:Cc:Subject:From;
	b=ScgaJ/gncv+v1bgXcjqTDXR7kWyho+bshZuTTpb/0gKC4aM2kTQzgZR7fhbtkRzic
	 oaneLpLFq9i78dJjaI5ZYyKeY2VvrBTX3TlnxLMOOaWQDZjw55IOWjO7l74LQXRQ/c
	 b0tbVo4zacbmCZ/om58lkveImm/KV/S38/gdu3P7EzjWb6uQJeoyCtrSJN4p7lfmBV
	 pf+UWBiH9qgEcET2BrBdMRbBCi3kGOVQpnQDzViNo37sjQCQ8WyJGDsGQS2UM6Ne2G
	 XX8yb1rDS9+zkOAEihJHHDR4vAyn0Hk1oOCAKw1a03NLX3kbgKngnVFNXDVouRA9El
	 BT05bkAb3rNXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YpFdK54xCz4wj2;
	Thu,  6 Feb 2025 09:43:33 +1100 (AEDT)
Date: Thu, 6 Feb 2025 09:43:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kbuild-current tree
Message-ID: <20250206094342.1a8cea88@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W6ziQFaIJg4=sdAzbtDozK9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W6ziQFaIJg4=sdAzbtDozK9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  738fc998b639 ("scripts/Makefile.extrawarn: Do not show clang's non-kprint=
f warnings at W=3D1")

This is commit

  c6530a209ad6 ("scripts/Makefile.extrawarn: do not show clang's non-kprint=
f warnings at W=3D1")

in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/W6ziQFaIJg4=sdAzbtDozK9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmej6Z4ACgkQAVBC80lX
0Gyk2Af+JJWHonS2CLAmcHasugB8AKG4nIxahbHOQUftKnf4ucCaHDWKNx13di3r
8vpNzbL36mhXSbYT6X7nxPusZB4CsNVElo92j9QKC/IFmjCofPnuY8HSQxwJXpOJ
E1PF/6T5EXgSXUBnpWXpJfkFmVqI0tSUdWphb5tPFj4lCfBPBFga4R26fEPq4mWN
fVBsd1ibnPIhVfYy18VE+Ma/4/gcSvJhdbjSKhJmpimWbn/xkBvEW9qArW3XKWjE
xlD8ETH1e8gh+eXm/WZiXc40Wwel3aIY+yN3DZ3aO6ath7JtYAhUsAisYZiqkJCd
xEbzBWyyPW9owkOXejBhFBpH367yiA==
=/RLP
-----END PGP SIGNATURE-----

--Sig_/W6ziQFaIJg4=sdAzbtDozK9--

