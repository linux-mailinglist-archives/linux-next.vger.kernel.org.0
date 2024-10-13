Return-Path: <linux-next+bounces-4249-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F5799BCBD
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 01:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 308101C20DD3
	for <lists+linux-next@lfdr.de>; Sun, 13 Oct 2024 23:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5804614AD38;
	Sun, 13 Oct 2024 23:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VO9Ho+Mq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78042F34;
	Sun, 13 Oct 2024 23:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728862151; cv=none; b=YyUARyW/SqYxGCGKglVGgDa0C6XlQ9pl2/7rSFDlB+Pq0Dym+AhZu8B26cQC2MK64Cz7cF2ROTIt/HMvAuLtShGZQjgyklEMXjH2MFOjwdo3KkCMSf/qGfzBy4k6Uwd+n+s2Y/FXVKVpREWQjNYKXiA3HHaO9PVSsEgzSeNCQDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728862151; c=relaxed/simple;
	bh=WXVzvS1BeX5UEMfirwNtrOrntcFiYeZz4Z5RBRULvZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JGBZWIXzXqphqIDqbLRKVwdVQAtQwuh7gCRb7qHEH6kTiQolYhReDMxqMm6/kYacJdr9fswJ+930EdWzqcDmuJqjatEd9dnCOZNCpjFY+7TwlXOH6zUyYsfivLCeI62uzrQR2OitTTH/xCE7OP7P97ZyYEmshoJkM9mzcLRZNS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VO9Ho+Mq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728862140;
	bh=2fTIJl49Nthj+UsmwIkvZkyz4Mq4IP7/B6FbAQs0d24=;
	h=Date:From:To:Cc:Subject:From;
	b=VO9Ho+MqOaxdt7VHdBBF6fltE3298vNtQ6NxKNnE2Jx0U5OqINu7p25bczZ/7Ztus
	 HffVcFqTHFMNqE/68rwkg1z7XNoMjpwUCmZ7RjlwSCahqFPeEMc3P1K3LEI+FNNfjv
	 utHWdnTNJH+F2uiaAKSyB5kappNJcHU34LLOA7m0gl9R0xciUbdR/AwI14+IrVZFDl
	 YDxP31sn3pZmLJyPqI8IIA45Z7H68rATTdXvnGVcdZO4SUj4BhyTZ0HI7wPEef5FyC
	 KweBgyET1+2EFlEmpf3hBTt3IvKGWssqMFXW+5qbKn/Eqo3oJGhS6GsQWLH91HhAGw
	 n9dm+jLpetNIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XRc4q5fq6z4x21;
	Mon, 14 Oct 2024 10:28:59 +1100 (AEDT)
Date: Mon, 14 Oct 2024 10:28:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Subject: linux-next: build failure after merge of the bcachefs tree
Message-ID: <20241014102859.53f4774f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QOW81lWMEAdOKEj9APDga0t";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QOW81lWMEAdOKEj9APDga0t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "sysfs_delete_link" [fs/bcachefs/bcachefs.ko] undefined!

Caused by commit

  c37fd6772eea ("bcachefs: Fix sysfs warning in fstests generic/730,731")

sysfs_delete_link() is not exported to modules.

I have used the bcachefs tree from next-20241011 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/QOW81lWMEAdOKEj9APDga0t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcMV7sACgkQAVBC80lX
0Gz8Ngf+MQmY5Xw7zfhPNDV9oOBi0t2tT3WGwA1NrUa+2KoHKmeGjkNr/DOXbxYz
3n9vvo0WTJd9BUzwp/Xb1MIaY3ZYzHu+fgByN4sOrfKzNgQwiNLLLIk89tbW3leH
8UW/vJ3sxTS71TVIEjklUG3KZZJL4pRl84jYtA72ybrkD3N6IlehDU6KHLQLxikR
wpsFRDJUS/U2uNUGniqVrL8SdigfQbvgbljZQ/S/inUSblRVJqkm3TD2mPd8CIdH
xqbSTNn/xpZhTAYK+hpOPfo4eVWhyfEItfUFjw3GbUAC2EROXAYRWEto2GUD14Gd
zYE27Mu1pxJxF+Nwht80nWHwUd2jKQ==
=ogew
-----END PGP SIGNATURE-----

--Sig_/QOW81lWMEAdOKEj9APDga0t--

