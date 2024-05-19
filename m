Return-Path: <linux-next+bounces-2351-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB78C96D5
	for <lists+linux-next@lfdr.de>; Sun, 19 May 2024 23:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE0701C204FC
	for <lists+linux-next@lfdr.de>; Sun, 19 May 2024 21:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D363F5B1E5;
	Sun, 19 May 2024 21:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="q+OKe+f4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5DC23BB;
	Sun, 19 May 2024 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716154480; cv=none; b=droH5uSmsvzTl/51mOQN9pR+wHZrmZyoXStLCp7nUVEjtAhrjHuEcmqzh7U27ZtPMfgp83HVDUH0oBLjY5vaqbXmc9gMbpf6YOG7jnG5QS6VyU8SkNV4Ven/05UlpUD4PC3y1JnHZrZutBx53ksNtM0WDTquzZAXHY8/azRaGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716154480; c=relaxed/simple;
	bh=qVMB/LyakvS5ewW9DcI9S9PSmPNh8r4BJJ8XEDPnRDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kxElWjAu+ypkJVUo0bgc2WujY933+a5YAyVKhIXsy8HqOQxuXEiYiHCU1JummPIjGHyZT1N70lZ22hzAcgYboRRR23+FN+XdKeT3CeActwceLmBlw7BDS7tPPIq6SWBSzBPCL2e5te0LHERtlpdkTiJDry0S/dO9gwvEZyWVxBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=q+OKe+f4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716154469;
	bh=bDHlLiM/QtV4z5R4r4xYeNeJp2pdpiRKmtwQfn4AmPI=;
	h=Date:From:To:Cc:Subject:From;
	b=q+OKe+f4gIlIliNjWTSSsBY3PzZAUyDA57gEvMSTGQ6kCz7cSs6OZzrd8HBuJX5D+
	 2IeW4Di4CBQzVxim2To4ATuJNAUpX7qoLRcuo4vO+JpiF8N3+ovgc5sjjbnxprgmCw
	 YCJqw0/18Ho5paDGWMfdhNZoyNNgyVjXur8ceqdLWpJ7vcbCa0l+JU0IvObkOre9Nv
	 Kty4FgWGoE9a1IizO+BNQSZBZBeYQfJLk3nalj0ETKM3LW6bEBSS0HXsdKHopwYWU0
	 JCytLYc1mlG4PUE96G9ZJRbzmGwL89J4jqEwRCn1ZcV/mXY84c9ROdeSEtqtFO7c4U
	 OGfSfKcvVtUow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VjDVY2YfXz4wby;
	Mon, 20 May 2024 07:34:29 +1000 (AEST)
Date: Mon, 20 May 2024 07:34:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the perf tree
Message-ID: <20240520073426.7d8bd11e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KoV2zI.=GkrxJiH=j.a7hgQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KoV2zI.=GkrxJiH=j.a7hgQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patch):

  cd88c11c6d89 ("tools lib rbtree: Pick some improvements from the kernel r=
btree code")

This is commit

  bbed8b9ffed1 ("tools lib rbtree: pick some improvements from the kernel r=
btree code")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/KoV2zI.=GkrxJiH=j.a7hgQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZKcGIACgkQAVBC80lX
0Gyepwf6AtMF0BwzXN8R3eAaKZsq3fNroPu75os/vM2qiEwsJU2Yg+4J9pfdYJHl
eLcz0Ng69R5pph2AQw8dTBYRYLCjS6gluQBq7f6+pFx4yKYeMGqoU4zVc8GAM4YU
qPsn5VeQCuFcrWzI2JfoTN3FfYUioUmDwRATqJdbd7cwOOdENVDXvoxxQI6VlirT
09VizitgTx/3P8gOTTeQrXXYBczviXd9R8OxzpfmbyyF5qRQvXBR7v0zxGv6Yuj8
yabdKm6+5sV6Remew9Mzy0x2yn1M8qW5+2AHKCOFYHdZE/K3jTkvmGHVyWR6G0p7
vIe/F9KC/Ewgb/vcQ9ZY6Btxwq/XEw==
=c0DZ
-----END PGP SIGNATURE-----

--Sig_/KoV2zI.=GkrxJiH=j.a7hgQ--

