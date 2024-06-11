Return-Path: <linux-next+bounces-2507-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C779902DEA
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 03:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D87511F2295D
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 01:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BA363B8;
	Tue, 11 Jun 2024 01:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dS2U8hTX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C3A8BF3;
	Tue, 11 Jun 2024 01:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718068856; cv=none; b=DwagazLkwol4mVLnMJ76CFkrpLSGvYYN5EtDPUqPaP7D94HmX7fjr7ilpvia8H2hg4PPAXzNEOXcoDhEH8eumS7VeH86279v5l0yMaA//WO5PdWov9yZt5tnDN3Ri1OfKZLFZZkAqHVmDl4VtcZqV7ksmE369Hq+WQZIgK3OOqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718068856; c=relaxed/simple;
	bh=8u3ndo/rkwZjCbSsgSBXuKjRmrEe/4o3yLsA5atomGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Of1kINTMGGMeDYU9VN3nvXYKPIkQgpay9ZgA+WjFpjNWweYGd+M8H4VN6uIWQvxb27j+K48XKe0Sxi8cr3HycnC+x9PlyheMoYPm2m91vjLDK8gmvtuo4YcIRQIR6ZUZKmoCD53hHEKZ44pPruvSabFgLpq/3rnyuj+yvb+SrNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dS2U8hTX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718068849;
	bh=7V+xHlceVSRyiCvHklVocjTe6W2fS9l7R6qcD8yAY/s=;
	h=Date:From:To:Cc:Subject:From;
	b=dS2U8hTXLFeelogl0KyURXlx7kZ8+yePMoaPD1Kr+Xc+V9w8cB/K6YeJUGoX1NTwQ
	 Jy9cMpe0QzcfMMb/VUAW99gUBCRbb4GmbdHOnZ/5iaSxTP7yoU2kVeLW3mYy4P9EvN
	 JDTRmYdYyYL+tRqabjYJbxP211peDmyXRXqXwTK+D270hcMgRarVMoxW7VDftHY2O1
	 CgvRgJPq41sZg4S6huxcyGWku6UX92eGsAArseoX4NKYIQ07WDMPIS6iFstKnwbcpJ
	 UpYkd7G2E5CuGmYH5Y6zxUQj1zW/AUhI8mwDiDcPPz4Nr70QR190ZzVX3i6bWCzuom
	 T4Ccg0YrJahIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VyrTX2xMDz4wb2;
	Tue, 11 Jun 2024 11:20:47 +1000 (AEST)
Date: Tue, 11 Jun 2024 11:20:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tomoyo tree with the net-next tree
Message-ID: <20240611112046.1d388eae@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NmrhB/rGJ4ubXrctjEVxLYa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NmrhB/rGJ4ubXrctjEVxLYa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tomoyo tree got a conflict in:

  net/netlink/af_netlink.c

between commits:

  5380d64f8d76 ("rtnetlink: move rtnl_lock handling out of af_netlink")
  5fbf57a937f4 ("net: netlink: remove the cb_mutex "injection" from netlink=
 core")

from the net-next tree and commit:

  c2bfadd666b5 ("rtnetlink: print rtnl_mutex holder/waiter for debug purpos=
e")

from the tomoyo tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

It looks like the tomoyo tree commit should just be completely dropped?
--=20
Cheers,
Stephen Rothwell

--Sig_/NmrhB/rGJ4ubXrctjEVxLYa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZnpm4ACgkQAVBC80lX
0GwiWAf/dZp0iC5CaGqTg+J3jHa+LDyDCAu8r4UJgWEQhFbXy0Xep3Ej8tH+xYZn
yanA8pQQ7ArdltXNh2d+V9bt9RkeenpgtbojDO2kpWrpAl7C/VN++4wMn5XPy5bV
WXTxt+Ul5Aeou+qXt2y4UrP8KdTUR6Fxq43MmP3mQFW+rRUtO2/LnI57PEI2Kp1r
Ekonh+oYIJOvlfn/Z2fbT8y9EzccrYbI/PHXVnPdQGbD9lNLNzDN83B1t38RkXAZ
9xIRqEkHvb1eVPQwz+2vLUU80vvaIG/fhpX8uIKddf2lBd0cWYpcUUYhrd3U4Gtf
imG20D+thxMIxOUZ2u4KU0P6BP8qZA==
=SPO1
-----END PGP SIGNATURE-----

--Sig_/NmrhB/rGJ4ubXrctjEVxLYa--

