Return-Path: <linux-next+bounces-6429-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57423AA021C
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 07:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CB9D841A4F
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 05:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E3F26F469;
	Tue, 29 Apr 2025 05:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AbE/ku4X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E66126FA54;
	Tue, 29 Apr 2025 05:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906056; cv=none; b=VFCa+LvWHo0zjO5tPBs1JBw6w/F1rUBjfhNKzWBTc1qxkPADmb81Noy8tROOIXyiiY5L+iQowabFa1+X26XdPZ8wbaH+8f3Hkno5T6munPdr0x+p0blLv8mvpyoC5K1FavLo7BBkoFyA0fU48ZKA21jpGNpW2V2nOsj2+GTydxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906056; c=relaxed/simple;
	bh=1P+md1hj7ACnRGFyejNeOYHSJEhXlPbhBFkjUAEOecE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G5nia59vZXh9esStPIIsxdA3NdK5Pi8gC4rDKik+7CO7YICAESR7hhO+peq8Goj1mwYSWt12K2xOrj1EbYRUFWfsW5dlpg6c6v0yj+sVKhJQCFLYrMfnDDssiUxodc+ZJANhSwOVHIcghIRk5PX/wOWk4Hye9TK5MnPEBlsETbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AbE/ku4X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745906047;
	bh=3WUp871j+20++yrPckg29AMuSnQ66KJhzVjkYNuWwBc=;
	h=Date:From:To:Cc:Subject:From;
	b=AbE/ku4XvqNSZMpqyWNOBdiGhWegqTHT7O8N2h65SiFbkksmlIrMbQtsH7/fP8apc
	 kohbuP1xVDfofMQEQOWzidr18Tqx1hcPQT7xWjsRaNSERUbUqhYcTjC5PliFFUvbit
	 RvPAQNM77T7xYHX05+P4y55h3StdQ4tdZNLupoNvhQTwcBpQTeLZa0uwM1TXiQMEVQ
	 kVcqcnVJvIZqqEAfG39IAnO65P4Uw2JjBsZbtFxnlELEOrMvDWnZ61fvwn9I8hhCi7
	 rlkuF3S9fRtAwynldXzWpr2YHYkS6kxQIDFoHtZ0BmFW1NEC8EWiduu54yI48R9oEx
	 1lnMAZnGdm8yQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmqJG0TF6z4wyl;
	Tue, 29 Apr 2025 15:54:05 +1000 (AEST)
Date: Tue, 29 Apr 2025 15:54:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thadeu Lima de Souza
 Cascardo <cascardo@igalia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the char-misc tree
Message-ID: <20250429155404.2b6fe5b1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WJT/KAb=VnGm25xilKDLJPe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WJT/KAb=VnGm25xilKDLJPe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: modpost: "init_mknod" [drivers/misc/misc_minor_kunit.ko] undefined!
ERROR: modpost: "init_unlink" [drivers/misc/misc_minor_kunit.ko] undefined!

Caused by commit

  45f0de4f8dc3 ("char: misc: add test cases")

I have used the char-misc tree from next-20250428 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/WJT/KAb=VnGm25xilKDLJPe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQaXwACgkQAVBC80lX
0Gx5ewgAh+QdVCPIjKjSPIJc8jkqRhdHKAUb69a3H2LLpJRHQp/po8vkGo63xd0X
D0Z5jmUZnFnXwuSNVii5kNv8LjWKxJjPH6J6WkY76B3zCJWncm1kcWtte54lMAfO
rXPT8Z9fvkjM8mGZPL8JW/CYeKsLTnmyD96qlG1/coG2tazRu94loI/rETWGR87D
2O4OTzjFojHiPJRhKN2O6ySI14PlZ2GOcFPA2jmiDtCTdEkaY9slbBBjv0y50pd0
KGW73krRJFY9/UMyj6EufIvVb8Ca3wmuNpZuEC9GqjFd19CwOna+TOIc81WKXs2i
crwGvGdJ/Ieo4KSnSKE0yTx6XyOaeA==
=SoWS
-----END PGP SIGNATURE-----

--Sig_/WJT/KAb=VnGm25xilKDLJPe--

