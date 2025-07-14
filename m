Return-Path: <linux-next+bounces-7530-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A6EB049CE
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 23:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754E13B9B4C
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 21:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A987E25DAFF;
	Mon, 14 Jul 2025 21:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V4IgjAH8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6155C54262;
	Mon, 14 Jul 2025 21:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752530325; cv=none; b=tHmiXaPHeJwi+3EgEgqfzZj/N2bX8FjmsfDO1BCFeVDgxj3XNSsmjtZdiTMbvt9H2kI63ThkTHFljm0wtmDktOYfAg2WqVObk2jj3fkZ1xr0nsM5TdkDwO5JhbrFb5KMU3mlvcxvd0h3nADrY+2WlIxdIJR4pdqiYef3c/PAURI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752530325; c=relaxed/simple;
	bh=AJng7KBLVbKwxGZDkhantsutNf9Oui3k22yskrOPwiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a4kn3hdnPypwY6mWIDocu9NS+kFksw5cm9abSDGlgumrduoK0R3gkYQCFIn5863CzGNbXe960b2FM874XXBkPTPecP+lRBOI6e86SgAHBoiKwEkljAr6T0Wxopz+uk6ZjffqJtzM8cDBmLzlvhFATGBfcjojgAFJdyEYfWGeLHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=V4IgjAH8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752530216;
	bh=qYcK6ItlzFbFOYA5ubGOlH7nTmPQndmOiPTEWHdc1z0=;
	h=Date:From:To:Cc:Subject:From;
	b=V4IgjAH8X6k49fZYwWhnHtcJN1ZcdHD1UqGdB5zbMzmuh6Vz/TcAVyAbBYXcmHqxl
	 d+HZLKG6NyjfgDb72NfrzsK5mtJwrtH7l6EOGIEnfVq1JMe38iXmu3Farc074BShRo
	 ztuBn9T6rlW3pgYnYdYRNQJl2xfDnmM0RSr9jdEf4HHpxO5j6wOGpuDk2+11qtuVAy
	 2mKRxJibJDnR2ZioiNRivueVOT9VKUymqEQcYmQgvEI83+Z9aMP3O7nSVRM+EDWFDM
	 GKyHfAhhS5K4uaBlyGu1gAUgJh5+cPS1JFrrDj1biZRx2uO+CU2EJkP5GBnfbN1Dni
	 6tCot4BZ5tueQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgx480vJ9z4w2Q;
	Tue, 15 Jul 2025 07:56:56 +1000 (AEST)
Date: Tue, 15 Jul 2025 07:58:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Trond Myklebust <trondmy@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the nfs tree
Message-ID: <20250715075840.319506f1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YL0=w9KfEVorgKYjVRqK9Wv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YL0=w9KfEVorgKYjVRqK9Wv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  66843cd7622c ("NFS: remove unused pnfs_ld_data field from struct nfs_serv=
er")
  7665e5928005 ("NFS: remove unused time_delta field from struct nfs_server=
")
  747ee5683b9b ("NFS: remove unused wpages field from struct nfs_server")
  8eb52d5f0c1e ("pnfs: add pnfs_ds_connect trace point")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/YL0=w9KfEVorgKYjVRqK9Wv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh1fZAACgkQAVBC80lX
0Gwh8Af9Faqnb0n2PC28BfToK1xMymkBALaTs2zt4ZEUP/hGjyzCP3aRSCuV3fjp
FJPSFcd17Z1Ti5Os77Vc9u4uHA66vz9ZeUSXSXP+AmiX8TfRUCAkHck8xYFnLVr1
gcHCx7t3sqfbuENO3i1DoJyP9/yBXd/cUxLVqDxElKCc35XHdhNwgWtJiScAjvZS
Wj4SCXaxJf5VXETJdYsANV6x8WRtF4Q6xn/kAeMoD3bDKjWmmLcofyCUNF+NqQIP
qA8AV1l2I+kA2ZEEoI9oKJeY+Ljyqtgs9M2EGRXVavFY8msZmcwtwHO91jYz1pIB
lIABHGFJU4vh7DPyPN2Mn4pmSfq6oA==
=8L7x
-----END PGP SIGNATURE-----

--Sig_/YL0=w9KfEVorgKYjVRqK9Wv--

