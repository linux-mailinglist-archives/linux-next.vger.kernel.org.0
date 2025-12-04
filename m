Return-Path: <linux-next+bounces-9336-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D575CA59BE
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 23:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C11873125A22
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 22:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B411E330B38;
	Thu,  4 Dec 2025 22:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dlFnFc4p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CA132D0E0;
	Thu,  4 Dec 2025 22:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764886753; cv=none; b=uUUjWxtweLFSc3xJkmKvWP/6qGXLek9vhiiIoJyLlnW4xpqmwet0fy9scMdHfD/Bdh6u/u6mN6s3YC8m42AG5iqEFYINaTcfND8eg0ORBa1Z2J5sCZerj8razmPLCEXCpl3SK3qPARaGTwDdG/G8myAcLopAh7soyif6o5F/7/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764886753; c=relaxed/simple;
	bh=W9cJPa511Nn2O2YX1wZ+CThKOx0Uv5tDgUoQyJlohtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T/SYu/BwrxTHtwP4ZlDWAZEAbkdQWMJZrt2kgEHfyek2DzysfV7TQxJ1gWlGekCEcRDb/TyHvWMGwgX53QRHZzh8yb8AKUMA24Ke//j2wsP7E6bKjljwLWBNYDxYFyF+rzaCuJDIHkVI8i2AZiv+BkRJpn4YS6kyOHV1iwia1CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dlFnFc4p; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764886742;
	bh=PH5JPlCPQ4IgY1O0zlp/yJ4H3gGdj9fPqyUWA4BPm/8=;
	h=Date:From:To:Cc:Subject:From;
	b=dlFnFc4po0OBBy5ZH7gPbbvjVxIYx51IkqQS/dZpN857e8hRoDEbznGmWplEqYVXx
	 GyOHfXAX65meGJUg4GvDgm5BBIzjnh89ezehmadqxnxPCtLvq/ytp+qLfHyJ6NROYC
	 5q4n/ugbidf9UPcR/38GkgAWS5VNcoj904lpPYJwCqkAf/lMPa0HRtO+w8GuFRdb0y
	 8mV9ppqSwNn83zHQsrZAgpHRBAkMcfoPZh1sD/KmEtRZj7P7s5JgMuyvYFGsyJ4+NG
	 EMR3Q4QvnuOGTteePJiWdsEz2QoQ2zVAXq0QT73Qg7ZzH/fghvBKGkOCicye1hBljU
	 eO2a68MdvsgZw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMpnd4pKYz4w1g;
	Fri, 05 Dec 2025 09:19:00 +1100 (AEDT)
Date: Fri, 5 Dec 2025 09:19:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: shechenglong <shechenglong@xfusion.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20251205091900.0dbcbe4a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ioAPG4OhxBJpgySsv7AdMZa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ioAPG4OhxBJpgySsv7AdMZa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4ce1aeacddb0 ("block: fix comment for op_is_zone_mgmt() to include RESET_=
ALL")

Fixes tag

  Fixes: 12a1c93 ("block: fix op_is_zone_mgmt() to handle REQ_OP_ZONE_RESET=
_ALL")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/ioAPG4OhxBJpgySsv7AdMZa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyCNQACgkQAVBC80lX
0GwMFggAgEJ1gRtrcdN1TyqO+omqajhNki7LwK+kW5fe9gQJUHWAzSYyWCXX1aAZ
WALcIbCYTe8WyS1cfjtAqqbOsniEfGwskxHVmDjIja4bgKPl2x94Mr/051Cow4+k
wLt2gh7gq1wvqH3QdJeX5P/UGzCh3C/dcwbI5GexnEmHvcDVfXj4VQGkU6WPs9r+
v71k/q8xwUuf/krY4J9BJQLJKuwRjwnnO6UamGCHc25igWbnXWapyYIPYdyCMFZT
SxVmWpWIvQvG5o/l/tN0P44ky9rJubcIO9P5J65ppMFCnwC3xCiM4miPV7W1d4qZ
mNloJTeNFyOrlieOpwJqzQShNa6nTQ==
=ZM72
-----END PGP SIGNATURE-----

--Sig_/ioAPG4OhxBJpgySsv7AdMZa--

