Return-Path: <linux-next+bounces-2448-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A8D8D7A15
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 04:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 328D9B209F2
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 02:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04BD3236;
	Mon,  3 Jun 2024 02:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WGhM550C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF3D15D1;
	Mon,  3 Jun 2024 02:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717381995; cv=none; b=K6qJm8ltN9aOi8QfgGMOFZMn3Vn+G5E3aKW6khawecZIoxrfR72ohklP7ym8t2qXottfDx3va8BPAgBcp+jOY+uU8sPmKKL1zifqsFkfoOuMqA17aW2BF6opxp/kvWp9BdfhzNAotnZnu6IsphTZfMt4xPem04U5aQGgDjLhIcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717381995; c=relaxed/simple;
	bh=LyzyMXf+Pvw4ht2lY9vW7hoDtyqzIxH774qV/hRs4Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MlGW5blwZ3vah/Qm5ZWnSLg8q81VsUWTzfmk5B3pJhTwIUmpuLSWU54YI5GRdr01OiGfM862rXkHr4b9hPLXHnwZLqc9wa0Ev4n2LINnaDYL1jHJTtvlBvyMOrD9FuP+twugoCIJ0iwF4HzUngwrYoT2Aq0dhKf24SgDHTKW3Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WGhM550C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717381990;
	bh=wBScdLHriUy6y8ctymJvvAmc+IVF07l0O0hi4eSNeuw=;
	h=Date:From:To:Cc:Subject:From;
	b=WGhM550CxcZAYmd21uhYcZaaJWJvYzhvcSkqEMavC5qfTughluAYsjIHwCkSbfnVM
	 VSOqJyj0KovgM2V9j+Xpjc1Lwe8DrEdc6XAT9iZu7EaoY0XeP1GTMSo22OVvoUPy2x
	 m8tfpQjvRomlF5NQtVf/ZWwVCDOX/MNVBpjT1XPDyt3NRTzvu7ybIe5gjooFP/IPZU
	 76HUmEIoJ+ayEtkqi94C6TbbjOgYYc18xRQ+0BF9Nw+TPTW/ICpDowcu8IzuHoB0kk
	 L/hyJIUX74cav+xG8OtKs/FP9wlITmLnJ2fpjSzCgJqU1odkYPP4yeIEbOI8hhC+wP
	 mM3K2AphhkRng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VsySk11szz4wc8;
	Mon,  3 Jun 2024 12:33:09 +1000 (AEST)
Date: Mon, 3 Jun 2024 12:33:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Kees Cook <kees@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the slab tree with Linus' tree
Message-ID: <20240603123251.473fca71@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yR+s=W1xhAq8HmRDnLUyb8w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yR+s=W1xhAq8HmRDnLUyb8w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in:

  lib/fortify_kunit.c

between commit:

  99a6087dfdc6 ("kunit/fortify: Remove __kmalloc_node() test")

from Linus' tree and commit:

  a0a44d9175b3 ("mm, slab: don't wrap internal functions with alloc_hooks()=
")

from the slab tree.

I fixed it up (the latter includes the former, so I just used the latter)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/yR+s=W1xhAq8HmRDnLUyb8w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZdK2UACgkQAVBC80lX
0GxQIgf/cA2Td5l6sK8ULLrNlBjkQjTUmGPXAHfe114/6ZCwQB1Qf0MjjyEVY+1Q
k8HoUxbB7t6mqwcDDN1oyPxNakKn6K17br4cz/Jvw/l2Kr3pTSeu5DoGobIuZF5G
bJDUKk5loVIUNISWCmKLI6y75vWG7RuzA3DqfDbhhxMBquHCGJyXW7wLeh+4sIay
8G4mvKJ+4zBLtXJeM86IJW3fBpglq95IDwL6jVcrYUM7B6LZbVdLIUMNx4oCQf5s
JAG7XKmJaUGAr5LW/pjOJ/6VSNvECEElPKj7GdGJCsYI79msKA1pJ8SjQwEid2wA
ueOQtD3n8WAZaSZtauAhzkIrwblQPQ==
=c6O1
-----END PGP SIGNATURE-----

--Sig_/yR+s=W1xhAq8HmRDnLUyb8w--

