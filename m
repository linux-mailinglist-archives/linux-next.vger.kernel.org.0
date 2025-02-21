Return-Path: <linux-next+bounces-5522-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E849A3EC23
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 06:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3C003B46B9
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 05:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7AF1F8EF7;
	Fri, 21 Feb 2025 05:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ftTW6X0Z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38C38F6E;
	Fri, 21 Feb 2025 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740114834; cv=none; b=KgsDbczU5zVx3ECBjvETk3KzMJgngn7KvyoNUSMHMLc9r18mIwrCIl3vNEwUJS7q+5IYae/CZSWKj9fQh3kBWzRIFeAgIJFS6tPcwgF4OJDSjSFrGqkzcm351tPiM+CPxe6HLwWh7/iMZYG0QcgJEoeZICRjMgnEieq+V2D+f5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740114834; c=relaxed/simple;
	bh=bCnlce8i7dGSpYtOclM4CZSE4PpBrn0D5fA7+6QX0+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uRalUqz9Y7Jzm/Hf9mLceIfruj2baKkMRu61Lh72AfLJpn0bL8dcn3+V0dDn2XVwurEAGHD68y3onGrODu8LFU3g4CP9tqOkcUboTxNuFi1eWDeLSAfOVJc2dFmjJHSKKDGwJSFIs9SYb7Q04oChbVv/j9GT8Els8FZV+BJuQNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ftTW6X0Z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740114826;
	bh=QZJSptSXv7XhoHYvvkpKwkMMc+Y2h48XHJXrayYMBG4=;
	h=Date:From:To:Cc:Subject:From;
	b=ftTW6X0Z0fKSnFTJovgv/EdlC9+59Q2SNAHsyuXljmNUEIaAghxwGYer4DA3G6uoM
	 LJG1HIVR4051gvj/OObFNo1JkBZxT8GKVAlwOgoAIaCgwxA91VENu+6RH5Stuz3n05
	 yilssKeiKagE7+1Lv2XxALnsW3hi47ciJvaJE6lfdStqmnUhybrX+96anTM6mcKshb
	 7uVLaYp94t/RdRri9jpYg56YpBFLrLwX6lGl7eu/eFQnJtHgcWpuYlxmlJ2INs+vGt
	 tBqrD1J942Td0jog1NxwjB6uhhJURgnawtl33cZf2bp6le+LGpAkqQFxNpSlsDR/mc
	 yXwb9Hop3dyqg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YzdZd6vCjz4wcm;
	Fri, 21 Feb 2025 16:13:45 +1100 (AEDT)
Date: Fri, 21 Feb 2025 16:13:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Greg KH
 <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mhi tree
Message-ID: <20250221161344.09a6cf09@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7iRQ1AjpTTwnsjL5q8YlyCv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7iRQ1AjpTTwnsjL5q8YlyCv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc.current tree as a different
commit (but the same patch):

  0f96e4d32983 ("bus: mhi: host: pci_generic: Use pci_try_reset_function() =
to avoid deadlock")

This is commit

  a321d163de3d ("bus: mhi: host: pci_generic: Use pci_try_reset_function() =
to avoid deadlock")

in the char-misc.current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/7iRQ1AjpTTwnsjL5q8YlyCv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme4C4gACgkQAVBC80lX
0GyZEgf/X2yBeO153/LlBpwl2T2eqxX6GYlRcF8RMi1Y+FKCPj8qi4tCAdsrzVJA
eoyuv8OBVy4vY6zS0Kf+gHc4r7YVu1tcC6BtZELKpI4rt+mJsie/4mm9W9FKanpB
yw5n0cAwVsSJXRdrgKBDDFYWTAu7uqGPKdJmV6xQGkXE7CTKrrF/a1auwwmf9Ogv
rHqrxABIBUomUlKsYl2MB/JgXak7v5HmtM1Aw+70w7gj+6RGWqc8NJWAT3HbLVDh
D9PrC2ORQeY2H1EqIz0wl9GCjfz6+LOK7G0cSJP/ocLx7l9RTtW7ticFpBeXhqSn
m9DEs19Wm27YlVROzpQIzcfgCeRe2w==
=0Rb+
-----END PGP SIGNATURE-----

--Sig_/7iRQ1AjpTTwnsjL5q8YlyCv--

