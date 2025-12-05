Return-Path: <linux-next+bounces-9351-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4259CA5FD2
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 04:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B476314EFD4
	for <lists+linux-next@lfdr.de>; Fri,  5 Dec 2025 03:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9D917A316;
	Fri,  5 Dec 2025 03:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JSRjFdJE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3DB15665C;
	Fri,  5 Dec 2025 03:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764904839; cv=none; b=o0T9GKdDxV9ntYsSqC4wIUhjTDibP1CgO3wq8+YXQdhF9Qgm1lYpuZWHrTJ1Uq9HjYhVmCp6RnpvaLvh1UDTLUus7xa2pcoQaF80b321qMQCxvQmaYl6QotcHyaaDu52KMudULmFDZcUehgJm3PhkrhfzwFyaZOCnHDb17bbnC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764904839; c=relaxed/simple;
	bh=szLzFG/3xll4Xcsw7hD5DhHi+T/8PB+ub81SvYikL/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qooRCoTwntT2+huEloFxhQeYBaWBMhEQi2Tp/aPpD2xnT7Cj5YjvS7rDU0JdfRsK8iJIr3vdOjE2NvUPhsHIKxRTpmROQ4a+/QmVF+4WmifnN6JiaRqSZBs1JntjZCUTD8MoYPGTq6Ehu1zHML7amXuiV/CWg2bPvgMaohSVACw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JSRjFdJE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764904833;
	bh=Ueumt9DM5ce1fDugpMNFO+RArZUjPXZORBdiEyKNDPs=;
	h=Date:From:To:Cc:Subject:From;
	b=JSRjFdJEUqACrRZIEfTZiuHVyiFMIX8A9YcSs77O+sAcon1FByQ0QuuyP3f37i/l+
	 9ZY7OGMXeJFUAszF9v0zJMAGBi0a8F7jtdSI84LFDLuq9YV20wXZJNcaJq8NXsr6gX
	 YQaBEueb0UlO2krbp9KCRBaUEYmprE5/dG2H9UeJ75rN133+cE2YFeMfiCGWyOYAVx
	 seZZEwuESeFuPR05QbRmQtfs2LgOTLluOsbZbMV4Tztks7/iJA1zLfgOVuu4afCr7n
	 ZdmFp/AM3JcjNqSTLGYWBQ21Av6ehXeZMZPs5UvJB++hwiCzU2TMyG5+NcrQ6caGeK
	 NKkMg3hYulCLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMxTX6Y4yz4wGv;
	Fri, 05 Dec 2025 14:20:32 +1100 (AEDT)
Date: Fri, 5 Dec 2025 14:20:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Tamir
 Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the driver-core tree with Linus' tree
Message-ID: <20251205142031.7404c49d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QHyfpxFSI+QfTSLviklkUcY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QHyfpxFSI+QfTSLviklkUcY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  rust/kernel/debugfs/traits.rs

between commits:

  f74cf399e02e ("rust: debugfs: Replace the usage of Rust native atomics")
  3f0dd5fad9ac ("rust: debugfs: use `kernel::fmt`")

from Linus' tree and commits:

  9c804d9cf2db ("rust: debugfs: support for binary large objects")
  a9fca8a7b2c5 ("rust: debugfs: support blobs from smart pointers")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/QHyfpxFSI+QfTSLviklkUcY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyT38ACgkQAVBC80lX
0GxlsQf/eJoyGZ4vS16W14ogg06NSWw0vlpkf2denyuCFeCIzWokt2FBnyV2vzNH
WaqI4OQ58r+TM2kgzBvlFtkV+xmWukhBLMsQJ9R+UYo7aOY4NPebQwII+9FIcfwD
TPRgkjE3ICXTV7pidCXclC6LQWvcR4tgXSfm3X2KPZKsiLgQaQwCY+ixc9JBcMhW
jGExAe8dIWLrDwOGrr5KoE0f6iDWerdET4x4AOJK9wrUlQxPMSmeJkNHyJi46YAq
cAHKSciuzLSQqF2qgErqmM+xveVr7oKLryNXcSgp5pKDEsiN7SiUTgWH3uzlgkfv
65Sh1SUo5VxoL/+yvBj0ezCvHLZInA==
=CFZN
-----END PGP SIGNATURE-----

--Sig_/QHyfpxFSI+QfTSLviklkUcY--

