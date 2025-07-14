Return-Path: <linux-next+bounces-7528-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 318D3B049C3
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 23:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9706A1A63E80
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 21:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B710523D288;
	Mon, 14 Jul 2025 21:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Hh8srgfL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBEE23BD0B;
	Mon, 14 Jul 2025 21:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752530086; cv=none; b=gYZKXSU0EfzGwiAM0v0SmNzFKkg6qwt8LNvQWJ2INC1uv20JK1lTst2z36x4WuavWzgxy2ZEW1ZOsr2kbRXjHg3+8t/WMiytib5A2cTvV5HDxFUEgbDThJokvK75Nn66eo9R2DpPX+OSKFpG/u6YilRJe1fO1qaOAirYQ8jgAaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752530086; c=relaxed/simple;
	bh=y3apIVhDaYHUL0k2dYILHSdKD7I65cyv3Ei8sNMbUMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RmSlzkHauXiZOgIlqgs1gbuXNMswh9NV76lX9Pq8ZMM/sgS4B6qyLTNf9gOp6CbxMTWYdI/shT8g8PbDBDXpV+bDJD52OqJp6ePvpAFlpg8LkXOqWJ1ROM08y7jcdvNjH+orPPSpKH+5/TXxY4auXR1/DxoWD6LzLc1SEgKXBCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Hh8srgfL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752529977;
	bh=ufgTgL9+bLmKGUjRPwq3k+sZPkts4QONMGODqbMFjzI=;
	h=Date:From:To:Cc:Subject:From;
	b=Hh8srgfLD2cz0tkmKX4H6Aea86RxtzNf9phB5QnZISId4LtXO5OOBYKujGWUwUXFo
	 8/Tw6c/exQU0olgOV4KUlyWgTFggzpr29XsumkINMLuuthKxMgAnBbSvzCrrJTAgEc
	 YOSZCUPoMTS6kKJBTpfmAY3iIwPRyyRRVF0pByPJqac6ZF6dAG9J0U75sLN8AOVhuB
	 2Eau52/pUK/tkJXzhKsWHXEhqlVOItlHL6LHs4mvUzQ3lxwJeyfo1QEGZFK07SKKio
	 jCLpXZ/40RGK0GKy+INldP8R6AKxy7MKMJVfTf1W3uXkR0RL9HqIa1h6mB8X5/pdS8
	 Tltd62Z+7xUYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgwzX3vz2z4wbY;
	Tue, 15 Jul 2025 07:52:56 +1000 (AEST)
Date: Tue, 15 Jul 2025 07:54:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Trond Myklebust <trondmy@gmail.com>
Cc: Tigran Mkrtchyan <tigran.mkrtchyan@desy.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the nfs tree
Message-ID: <20250715075441.10417fbd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zZ9fv/sepfCIMY1u4ciB8+2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zZ9fv/sepfCIMY1u4ciB8+2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9f9cfd0ebd6f ("pNFS/flexfiles: don't attempt pnfs on fatal DS errors")

Fixes tag

  Fixes: 260f32adb88 ("pNFS/flexfiles: Check the result of nfs4_pnfs_ds_con=
nect")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

Also, the Fixes tag line should be at the end of the commit message with
all the other commit message tags.

--=20
Cheers,
Stephen Rothwell

--Sig_/zZ9fv/sepfCIMY1u4ciB8+2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh1fKEACgkQAVBC80lX
0GyrBAf/YV5EoZH8i8DOYMrazpbwDnYkAPpbMI8QWjW9ZJ6JEGfXp+f1xfzEfM0m
rJDZDSDzQQestHhYOma3cZyxz/GzvBCPBBcAcWaLZwuuChJuEuS8chu1Icl34Gs3
1O2ifLDOMlvN+FI0eATd5yxfDN/xIYoUZCcEhVM18WArDnXeZO0U0t120zFDRLNn
st+hestcpmO0vepwWJDR62lJB+1XOG4gO8JI/H30dv8p7ytvKTEl1oZLyfeu6pge
ff8cfP4Dk8SHr8Lu7pgCSoROFFFAjUWADU3+dbhAAS6+9UvBCXq+7208QllcGB6j
yw7IcNwT6BjfE+Q57L0jRGwyo6ta7A==
=wq1E
-----END PGP SIGNATURE-----

--Sig_/zZ9fv/sepfCIMY1u4ciB8+2--

