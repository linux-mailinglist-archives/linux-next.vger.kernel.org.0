Return-Path: <linux-next+bounces-8856-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4DEC384F8
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 00:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 493D63AFA14
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 23:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1427D2F4A15;
	Wed,  5 Nov 2025 23:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="haKiSD0a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EB02F3C3F;
	Wed,  5 Nov 2025 23:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762384384; cv=none; b=bD0k6G6fPJS7XpcvrpRL1aerECkx/9yUU1LkLOa0blB5om1mn78UyIf+U4MCcKsyVLmzKe4Otkd6RMHVS6X3rbA+cx9dd5CHAOO/DEZXaWFQxpFkrTvczTGmvYBflGfVHWXa5Fn0yC1Ox2260WQVBL4O/pVVc6lhw2ymDPpaJd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762384384; c=relaxed/simple;
	bh=CYCyx7+IoTNwLcX0N10CwykrB08ufBCSnSDFtNz0ZfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nAkBHdkS8wRpu2l83E0MAeRTuwcKlcALLNr/2gNlVq2HdIHzYhGQd+kQr/M2OIs8dDyhTa1SqeoZ7Z1iYN9HezI+Hc/Wp+mihaXkSGGrKkr0X4x3Q/6NIfU4skL2vKZMRc7rUaJZYHjyhKJCAo4yOtefbo91091Yj0MfmHuHqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=haKiSD0a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762384378;
	bh=ubLi4qQHJIlRWm4qfwp60A01n/+A25xMHh8v3kUngDc=;
	h=Date:From:To:Cc:Subject:From;
	b=haKiSD0afbk+GFFEb50K3qJsyGp//NvtIhZILnqHrT1Ka0jSrBvfvjdQRa1RUBvht
	 InWj7t6vkqNtP9R62Sajjdlw8CDczsBgtZf0BEGz66HORra0uC23e5VNdPBxKI6S5p
	 S1+3GuS7TSer8RggmWZOLAk19o2zhmc5/A8Vdish/ZEg3lN40wu2xT4u5neYPc+8Sk
	 yIFlwpx4YXNwJy0Z6bc6gHD1j/CxR6yk1rM93gaQcD2UQmwKVgaz5T2zPFUtou5Z0F
	 WrEf9UxFxp74dQkoZx8AdjnQSSGtaBAnxFQ7g5Out1rm3CdN/G49oGKyCedhL5/5N3
	 s+d9YW4Sc5Kxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d21MG3fqdz4w1h;
	Thu, 06 Nov 2025 10:12:58 +1100 (AEDT)
Date: Thu, 6 Nov 2025 10:12:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the exfat tree
Message-ID: <20251106101257.6e9b46f5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l40CI9h_AZ+y7K=5L1qJBAR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l40CI9h_AZ+y7K=5L1qJBAR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the vfs-brauner-fixes tree as a different
commit (but the same patch):

  772a65ec60d5 ("exfat: check return value of sb_min_blocksize in exfat_rea=
d_boot_sector")

This is commit

  f2c1f631630e ("exfat: check return value of sb_min_blocksize in exfat_rea=
d_boot_sector")

in the vfs-brauner-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/l40CI9h_AZ+y7K=5L1qJBAR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkL2fkACgkQAVBC80lX
0Gz/VAf/a9+AD1a8I46/ach4DL4Va8HAu6Yi5A8Q4JpOkEK6JEVvvOIkt5w9xCJU
6rMRVqUpHX2fWx1MiMK10pE/6nlbMpEYQwbRWnB+9xAzGl9PAz/uSOQfWN5fFkp5
1wA6Y/NBo1fNgL3KO4fLLCmWZWJExxaqrEJKLOjfrxhAMvQAHtDD/6n+CXSjpYtU
U6uOPaVYGJDGcqTVkoyDyVSLjoo9Qjo5hGqqonepZcnBFhffVdAsRl6pldBgTVZr
QwKSXQWaT2R8Qx+QeFmDmmrLg7EfDYZ2ItGQgcsg5YJpRTzLgDubirm+DDKPE4nN
ZNh1qyGGKDvsAKiTFjSyQNjsk/HsTw==
=zZYc
-----END PGP SIGNATURE-----

--Sig_/l40CI9h_AZ+y7K=5L1qJBAR--

