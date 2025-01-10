Return-Path: <linux-next+bounces-5127-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D9FA08437
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 01:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375E43A2BE6
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 00:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7D529CE7;
	Fri, 10 Jan 2025 00:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P+znGcDz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E17EEB5;
	Fri, 10 Jan 2025 00:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736470643; cv=none; b=TIIRcT2jFh/iv9AghMQgOfABJFVnnq/INn0R8wyeHLALeZhj+c19KzCQmO8YQaasiNiDoiDW626VeTEo/m62QiRVB3WDFSoqhNcCwz0We7SBphZo6JcU2ba2uSPogbaO2f4Nzg9mAt2I+v9drJowEHGeZnDXVwlaI/IpzNYChVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736470643; c=relaxed/simple;
	bh=RFfN2U87eByk7hef7nl2QfqHXTtmbNqJRiZS0z4RzM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sWlHozfMuOsIQyvmtCtsNg+IB0vYCD5bL8fH6stdc0TvG0FXa9pwWKkNVBCFuUrt8rge6aedlRVXp7igo5kR1fWxngZecB7azVa6vGN+bIV2G75azyG5Avdk4lnp6dXxFgmSvZzwtQP/Uk49G7FqbDzYWXUEKWj7dWTXVrP6UY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P+znGcDz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736470630;
	bh=NnfTK9CZ3ZwPkR+QAovE71e5flveJ29lRRrT/fqgnQ4=;
	h=Date:From:To:Cc:Subject:From;
	b=P+znGcDz0NunjA7n+rBlncdoVnvZ6HYruRAFysU+/Hg/PI51FS9aQBIu+GbB9c3OM
	 TLNqiqxyMC1f5aOL2YHfl8u5gu7IXhYYPk7oqNr0lmpzDinTwuuYJpPqU2qdXr4LA0
	 Fg5W58x8loIi+0pJ1i1YdY4uhrRJWunebctIrLcbAsXCb24VUHDa8uBxAJCzqsoxnb
	 2SH9AeOhSin0qyzwevNIte1pCxVSqhMkC2yuDGnXv+ng4FuzERzVVijsUSOUnyCMAP
	 H8XZXpg9ff0uYoOMubNhNzMHUZGgZYXM1rHLsxOgJCrOzaI5QMzlRS1vfr0aq0vBVs
	 7KdkhQBoBAB2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTjsy1G01z4w2R;
	Fri, 10 Jan 2025 11:57:09 +1100 (AEDT)
Date: Fri, 10 Jan 2025 11:57:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Charles Han <hanchunchao@inspur.com>, Luiz Augusto von Dentz
 <luiz.von.dentz@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bluetooth tree
Message-ID: <20250110115716.2baf8622@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KWfMV.lD/svhlfVYmn.aoqy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KWfMV.lD/svhlfVYmn.aoqy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bluetooth tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/bluetooth/btbcm.c: In function 'btbcm_get_board_name':
drivers/bluetooth/btbcm.c:557:24: error: returning 'int' from a function wi=
th return type 'const char *' makes pointer from integer without a cast [-W=
int-conversion]
  557 |                 return -ENOMEM;
      |                        ^

Caused by commit

  52d2af107592 ("Bluetooth: btbcm: Fix NULL deref in btbcm_get_board_name()=
")

I have used the bluetooth tree from next-20250109 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/KWfMV.lD/svhlfVYmn.aoqy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeAcGwACgkQAVBC80lX
0Gys9Qf/RFCGGo5Vu5LoHIuD/pNrjMV9LHJMnRTrvshokTcZl4StXMvyekYbSNrF
z7vZx1geC0GZSi+fr2aCKFLt2LsvlfZmIjEXp21ufDaUoiOvJM3Xx0h9l3ra7H++
xMJOoDY39yo4WuOUbuYbHHZsRhfrbZdG4LmEFdwFKqfM4kt/Xiys772MefA2qm5K
hqMpNj7iD0hHVjNXOcLwKr6nAoCpeZ8RUpsl5yt9iGgOD9YTcmk5GlRPtYmcCzYa
gwMtW0iPj6MnpfGIPXi4ff8C5I/ktHpA3bNRSjNjYk0o0zj4GXwTNW7bOEt6/013
w29Z0/6sGenDOcW1Id+8zzG8aeXlvA==
=jHpx
-----END PGP SIGNATURE-----

--Sig_/KWfMV.lD/svhlfVYmn.aoqy--

