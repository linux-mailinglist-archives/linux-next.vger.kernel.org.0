Return-Path: <linux-next+bounces-7913-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1B8B21E89
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 08:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E9A1892BA8
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 06:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91406279DAA;
	Tue, 12 Aug 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OdVQuMfh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91532DDC3;
	Tue, 12 Aug 2025 06:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754981084; cv=none; b=Vt7PRHIUTWrfE4b1YWVDZrYEakUd8V4pSmQ15ElMuNkHqb563Nbgcg5DWxQ4g9EcStmvk95974jaClZy/bkO99EJphwF4z3P3Am7CQRQcCzq5UXBxA6PkgqZUC5+4M4VqLIYXExnu2VZGt5g2QJobMvvsc+CzVzRO5aEumQIoXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754981084; c=relaxed/simple;
	bh=oSSI4tuEwKmctPFFNs3rhIvGXN3Xpdi74WZsmBv8Y2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JVUCZdjwt74OXIPw0CCzHJcoq+GVFK9gat4RiHCacFKJgJ2ONiEnz88pcQIV6zC3eE1qwUQTfsvRkAeMFfutUGWzUZNBoEkOgkLfEdin0DgHy5Z5q/ZDeJMVFbPbQmL8eTMj7FytfmdnwkKDMkznGvbJAEt4rTfXfU+rJeXdRZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OdVQuMfh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754981076;
	bh=BiJp9XjGaPrIJJd6/v7qPyLt7cvw8zpMyvinyA5PGME=;
	h=Date:From:To:Cc:Subject:From;
	b=OdVQuMfhSJ9I/dFoTiK3gmyds8sUKkIiTMJ2GfFHe6BvSLS9KzRNUl4pLY7DdYvOM
	 mN3CiZ3MNKIO+XMgGGvjRmwj121hxy7viYAhFuMAWffKUeR4LSj8TiE5skt/MkhozM
	 DddZ71/jM/hi/NXgPzWbUdcEEvwWplVQdk5ggr0IGfwlePyOqLrmFwLBGK7CmJsyvl
	 mpb5Aww3kVncGCOzw03citqFJQmw7RnqGrHTczJ5Tk3fnOmSUEKTZei40K2toEi+uE
	 PVJzEnYFJEeyzTYaci7QztnYBvR/N/EeOP7HU1ukm8y1e+oTq23GDX2plnoH6eyx6s
	 gbr4ctNr6cPjw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1MS45f8Rz4wcn;
	Tue, 12 Aug 2025 16:44:36 +1000 (AEST)
Date: Tue, 12 Aug 2025 16:44:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-ID: <20250812164436.557c805f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b.KZglyq9/36ZZ2eOi5t9vc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/b.KZglyq9/36ZZ2eOi5t9vc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  25ee3c404f35 ("kho: mm: don't allow deferred struct page with KHO")

Fixes tag

  Fixes: 990a950fe8fd ("kexec: add config option for KHO")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 4e1d010e3bda ("kexec: add config option for KHO")

--=20
Cheers,
Stephen Rothwell

--Sig_/b.KZglyq9/36ZZ2eOi5t9vc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmia4tQACgkQAVBC80lX
0Gwh8gf+PzY1oVOcFZUshlJJ+TOPZlsh3vTCRKxdvTBVM56nq7d544KUJmULBJv5
SXGgrCLY9BskzzR1+2JdUwmVaaDDeu+O130Vci+oK4+FAn7JcKcbCltCBeNzxRD9
B7wn0jiFypS8kE1w2YPqo/trPozqs5n2oOYSjv/dSE46Kjk+1qIsbH+z3dKNRd8D
y1Csv+j8VtsfWNKNXgaKmfQBpLZWmfIzEV6iBgIh+Jd1TIojSxxQRHyPrBRpV3+l
YoY7Xb/CbBeslRMx/9WumCTOECE292t8Cg7jl1af3qJ8DHs5ZofaxKMxYlNAYBsv
5+139pShJ72h8P/ymtRME8YS5NcsFA==
=PJQP
-----END PGP SIGNATURE-----

--Sig_/b.KZglyq9/36ZZ2eOi5t9vc--

