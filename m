Return-Path: <linux-next+bounces-7714-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1D6B115E8
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 03:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 169E33A9900
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 01:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FA716CD33;
	Fri, 25 Jul 2025 01:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CLpekjQd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C6510FD;
	Fri, 25 Jul 2025 01:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753407423; cv=none; b=bPOjqSk/046wYRfAOiULehJFoxnkCpUaX5lCzPJ/R2scC2ZreD6g8qcYLnXW5b+aAgMvVpk9SC5PbFWfT32MFeTA87dOETQyVzy8IJJnHS4Tc4AIoYACIMGgVi6skVsnGtE57BmYX2azg4tXUijrcMSSrIlw3j5BJBXOVMQ1I+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753407423; c=relaxed/simple;
	bh=wJkVND+10YlWpTstBE21kLCQsMGwsf6l1FCro2Ud7tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZqsmzCYtu7CZOiw7zTNutxR+cPXidGjB5h+11jNKCxw3GNkP8EkRyWuVi3kH9pV8tHBnYC0XCXcDABovmTRlqsAbgeHQlWzvwPDHgAojEzcg+QRz2kB4N6KRWaTa//bHGaha5nOy0YYazG5rmsX13sSNE8nBhBHx1UKok9ilpaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CLpekjQd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753407240;
	bh=5lGcmBFggX2/EX7NgsPu4LHxPbIwASKRZb0cci8Zq9w=;
	h=Date:From:To:Cc:Subject:From;
	b=CLpekjQd1W72i4qVqOPtj9CZpUpiB+GIIe4khiErvWFACth4+Dwsn1G7dLOjFIydI
	 555cpJKI8YhT6SEl4nxsuQXwgSlb6v1ONfPpz0T4ZXym+yzrVOBwG2r0x00DkRYWnK
	 n+3cZ/DT1BdyJhDcxzwyT5x8PGgFgqXuE0g4CSe5eOCTj1lV2p/1mZmjhSnSBryrG0
	 7aYNvLVCcQ7UPr9QwUHoW5jtuNmCmvAStvy3rPSrOZrUqcKM9rmB3uCrqs/k8qEyA0
	 ORI6Zq6pjpulzNpdSGGBBgst/dZnUIuSgZRezDK5xvnEQ2v5sTqHhmU1xydavtX5Yq
	 yWU5D6qJazGrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bp9Pz64MXz4wcd;
	Fri, 25 Jul 2025 11:33:59 +1000 (AEST)
Date: Fri, 25 Jul 2025 11:36:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mfd tree
Message-ID: <20250725113657.039aa5ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s9uIwT4yh88XB24Cy90CIg6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s9uIwT4yh88XB24Cy90CIg6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  ba9ae011e837 ("soc: apple: rtkit: Make shmem_destroy optional")

This is commit

  0445eee835d6 ("soc: apple: rtkit: Make shmem_destroy optional")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/s9uIwT4yh88XB24Cy90CIg6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiC37kACgkQAVBC80lX
0Gxo2ggAm67G0A1bDKYr+0wPYyNOjmJ9fZKp+ORRa4LfurvNh7Z8Mbbe/G0tScKc
eTMAUA5pliV4g2ScJkJ5ZJYJJeGJtFZfc6Tt9/0Qe0YRwukiRY5ObD1tysR3lQ5n
D7lS3fJLwIVwbKUzIbY4GDNPjKlFPr1haU+XHsTNu/7reiF7IjcfIdRh/SR/sYXu
IqD6APc1s7pT5l25y6CUZc2iGalvoW7yj6HyGOdAsLb8SM5Kfs5+6rGrO9Tu/7XI
tjERtb+/K+mR58TEmNMpZB7BUfieYTLEy5v5ZEDmM3f3L36TcwJnVl8JSMhKIhlM
9TW1huaPvVjVQPXrVwdDBtKERO2VpQ==
=R0sU
-----END PGP SIGNATURE-----

--Sig_/s9uIwT4yh88XB24Cy90CIg6--

