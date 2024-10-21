Return-Path: <linux-next+bounces-4354-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1814B9A919E
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 22:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A94E8B20ED9
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 20:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7181FDFBE;
	Mon, 21 Oct 2024 20:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oLr04C+7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597441C9EDD;
	Mon, 21 Oct 2024 20:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729543818; cv=none; b=aOjOCsmZjYCr1pYJltM4Zn+SYtFESI8vJzrQdFKjEdi0nCfxqnwRHaA6wfnu18AhfH4E84I96H9SZ7viZn1UsasVsl+LofHHX/NPlzyWszngB6iVzrGJ/RAZtx07higxZ4+V0b/CpwwRFBEdITKOb9WAaibc7rFyg/ZeXLjcFkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729543818; c=relaxed/simple;
	bh=FJBh0R1sjKvOe7ZaRx7rQ0Rhy0uNGJ7rDJK8f3yEUY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BxSKq+Zk2ZP810wAPQu7iEqgCU/mopEK/LukCbC42qwFW+DNcwOXj17nVWhellvIE0Kiv8k0reMjjvtP1WSqU4HM/bGRDVlbgXBZVPgMnTDmtuQMFFDPNP2weFuJtt1KiF/EtjCdcqbf4KDoYtdC6OqlJNeRKK6509jzSjDnFRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oLr04C+7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729543804;
	bh=rH+CO2y4DJGXU4U5GosY0T8R9Epnke5MUBhioxrSy0U=;
	h=Date:From:To:Cc:Subject:From;
	b=oLr04C+7hpqyRtGytDKwILnBWGlV4XGDelBgHb5YfS/MFsqRoRB8h7QY9XqYojfiA
	 EjzZN73D5CYb6oZ6Y6c2ybf5sAzm3YmVeNBEhU3MIcq2b+kqJA1/sgQqYAsQxN5Qcy
	 X19zCuvPUZaSLWDrZrqAUyuF2HZAo/d0AA8v8Rv13Ndqm7TH+Q4+GkzT+UXESIA+ZA
	 +FcD9FG29uw/mtIJPeP2tRoaW4cL+LqRI5v6F09MqbZrO+PlkuWwHZqSJCSfwBFLVv
	 hwgFOltvPuUz9hB5R9DxS4iPQXWSc2vi8KLYcq1EiPzjwaMqfF/Sa9BA0kM/aKz4Ji
	 FIbfWYjF2rhHw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXS9l4Y52z4wb7;
	Tue, 22 Oct 2024 07:50:03 +1100 (AEDT)
Date: Tue, 22 Oct 2024 07:50:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Gruenbacher <agruenba@redhat.com>, Steven Whitehouse
 <swhiteho@redhat.com>
Cc: Qianqiang Liu <qianqiang.liu@163.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the gfs2 tree
Message-ID: <20241022075004.3369d8ec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kgm2zns7YHrDfYTJ3rry/V9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Kgm2zns7YHrDfYTJ3rry/V9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  507da2cb5d8a ("KMSAN: uninit-value in inode_go_dump (5)")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/Kgm2zns7YHrDfYTJ3rry/V9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcWvnwACgkQAVBC80lX
0GzxwQf/YSo6vaQcBjHATnr9dSEkXDA4MGIMFP7OZwOsItxUN5JKVCTfui4QBqpG
WEHZFZody1JX8IK/Hb3Qb4B7vcVN7hT7VDZtFyW7zs14iL1i1cf0jNpAwpzdXwoS
7FF+D0kRwHZpz7rpXHMCBqDW0Z7UoVcL0FrGtOGNBzqXpfM5dA/b0wq6rk2g2qU+
1wztXpy/uPaSUrS/KDjqK5M1c4EnhWYJHpnPCqQtjWHLBRPuacuuRUNGCNonYikH
6jKD6AoPXVawUKWBi8ip0PPJ3c4I39b/EIjSH8VED7e3yJKWjLB/o4E63TK/R2Zw
rJsc8NsGMsA776NC0EHLC53OfU7oaw==
=jgwy
-----END PGP SIGNATURE-----

--Sig_/Kgm2zns7YHrDfYTJ3rry/V9--

