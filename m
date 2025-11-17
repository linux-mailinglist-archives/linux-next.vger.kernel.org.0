Return-Path: <linux-next+bounces-9042-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06862C6294C
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 07:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E02F43B0FA2
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 06:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C031EA7CC;
	Mon, 17 Nov 2025 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QsazC50e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FBF316193;
	Mon, 17 Nov 2025 06:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362051; cv=none; b=R4QAhufDFKzJO+poqNFhrJP8bUxrpcfanst6XzrA8Ma4tSnvj8Yy+xuLKUYC4mZlD8SjZ0GW08SXIPhJ/qVH6BTrr93lyLm7Uuh9PiM+ZQ7+Q66opyuePo6/y4tMt+j60fCM9NNlYv8t1DTpiQJ0n53oAUVc0H9udXSi4qVq5ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362051; c=relaxed/simple;
	bh=N4LnK+7S5rwm8B9DK06Ownkq2BY20uI6o7/aw8OOy4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VYP0LFXP7FlOAC2bAB+GAJ2ql2Z6lsNE5WLffT2LggyDcQQRgoPGfUE/ZjCGo9JMnQmvCZQ9GH116luUkhSCaIQlRvxdzr72ujTN+EHpKVqnFqJtmQ/9VPL7Wuz5GQlxAJ9UAweUg8pRVxFfzi1TCrKn+L0KOUrAQX+GMv/RGYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QsazC50e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763362046;
	bh=E9Cu+ogwlFnfZQ6t/IJ4b7pFyKPVvcUJZ1sMvsBIjWc=;
	h=Date:From:To:Cc:Subject:From;
	b=QsazC50eXKZqCp1LUVNVpJfj7C5a1d6qsUMKu2UFa5kwYjpWgfJGbDHNpgMVP8EZ9
	 Pe+kEwGdn0QH2hs6sv4xD2N5pu9uH6VkB8T/M/bv7DSboGiHZDMNP6UFuyqIW522z8
	 HXx9tRpMmTVIz00SWsEcdc5Zz4KZujj6E0bHZSEiY2r9BMlMyF530pT+FO+mUOxpT6
	 jw8QMkKrrTBwQjVMdd0qEh3KR0m23Gmp1QvWpg1M/uAhaS1rl259tEeuEHdpiVHmKn
	 9LgkRtWG9/2qIff7TmbpE+iiOWH/d4wlfiA9PL8KTJYxvm+83Fx9jUniAfSBn7w+38
	 b6CoZ7r4duOjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8ywZ0r2Fz56lV;
	Mon, 17 Nov 2025 17:47:26 +1100 (AEDT)
Date: Mon, 17 Nov 2025 17:47:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20251117174725.39e7d914@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S3MhN6jXU9tumtI.GJ21Lu2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/S3MhN6jXU9tumtI.GJ21Lu2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced these warnings:

WARNING: fs/locks.c:1706 function parameter 'flavor' not described in '__fc=
ntl_getlease'
WARNING: fs/locks.c:1706 expecting prototype for fcntl_getlease(). Prototyp=
e was for __fcntl_getlease() instead

Introduced by commit

  1602bad16d7d ("vfs: expose delegation support to userland")

--=20
Cheers,
Stephen Rothwell

--Sig_/S3MhN6jXU9tumtI.GJ21Lu2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaxP0ACgkQAVBC80lX
0Gyj7gf+Kk+qlzOpHIdlYdHFlGPaupeGtJNqESeIrJ7CGsm+yPXQzJY/LT5eGsoU
wat/nBMbwS7WReNhCnDrvl4+ZSLr9lrEjBgiRGtBeQvEIYAK8qnL+InOIgf/yPF/
ikLI70/GsohsxLebL37KW1ojZzSfJ7eDmP0CtqNPc5DvaoSrY1TJzh3DtRDIVwyB
/BWE0nBbKXqvZrzmJ3ojln8hCKd0y4nHGA8z5AB+5znVqERQ/oG231znYCYNGDhN
eSnr2JFn1ABgP8rIPZuUYZoC0mTaD2Yods7pvBUui65sekAP+pGPsfllBBbBXROo
rI9vaQfKBEqHUBA5pSPQcGCyKRcmYA==
=eNkh
-----END PGP SIGNATURE-----

--Sig_/S3MhN6jXU9tumtI.GJ21Lu2--

