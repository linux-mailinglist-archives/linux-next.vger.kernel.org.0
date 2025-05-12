Return-Path: <linux-next+bounces-6675-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A15AB2DBB
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 05:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E9987A1766
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 03:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403D41DE3A0;
	Mon, 12 May 2025 03:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mJQukD6B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB200C2F2;
	Mon, 12 May 2025 03:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747019312; cv=none; b=qZcziJXzdfEbNt4GKAHSHeIQ2GSnbSzuUgmaU/AOBh/VOPoBlZgiikZfjnq/6xvfwfeswI8lSA9fn6QyngKyqd81pFDg162o+fmzesjGkG9wc7UzLYz1xfm/MuipEi9MmKJwjohUtXMWbMxWwUvKAqh8Ym+suK1n8os6f6xdaqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747019312; c=relaxed/simple;
	bh=/m7+JksJgDW9fDOVA/yR8pXJJRTjt/kalAXyqQLz9KM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PHV0LYZ0C4Q62yT1h3IOy3RG8SlEr8GUcowe3ODNPACw56L6TDGc4325FVcU31pBFNU3/pYcV6BNtbLwqrtcGOKLkiqXws7LqNfNd6/pJBT7erU1qtolMyMmyi/mUeFXHGDcxke+zeHUvT6WT2p0/PhpsaFceyI/mz9hCRH/vN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mJQukD6B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747019307;
	bh=eWv+WWcB58IoipYSMca/vHFJARo4+XwufrJbtjLHzSs=;
	h=Date:From:To:Cc:Subject:From;
	b=mJQukD6Bqi2zFLhdBe2P3xsqnuzufOCSL1dqBCAGcNU9Ha/gB1XuS+Dfrlamb/t98
	 mPolap73f6vh+mNguNA7X1wHDmu1X6++TjwrL34rlPpoO1lKEVB1LXyr6Hjk3Evw/2
	 a+aP5g33mXaOnNv4GVqaVyl9WctZNBKenHhGfLYmDrkbt3CS2lXZdmLm7KX6Q7MJKW
	 bTMzD9r6IPYvtSnaj6kZC9tjTw/+lM16sQBU+TcKpoo8nGHCLF/NNF0Fz9zQncuknr
	 6W7M1NpkOTUcmyzOppPL/KJrNJO7BLmiTUsj5kHMOz51ThNphYrizsaMBw4W1185NY
	 TGEiv45IPC+3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zwl1715Yqz4wcr;
	Mon, 12 May 2025 13:08:27 +1000 (AEST)
Date: Mon, 12 May 2025 13:08:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the v4l-dvb tree
Message-ID: <20250512130826.15663130@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c.0.=sCVaXjvQ_C6aVDC0o2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/c.0.=sCVaXjvQ_C6aVDC0o2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  5bc68bd3826e ("media: dt-bindings: Document Tegra186 and Tegra194 cec")

This is commit

  0d4d6e699a4a ("media: dt-bindings: Document Tegra186 and Tegra194 cec")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/c.0.=sCVaXjvQ_C6aVDC0o2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghZioACgkQAVBC80lX
0Gxnkgf/aDsUyER62janqItBRyVDLsETlTNihGVzQX82H6UMpZQEHFIE4/6zuOyG
blxp4VmajHKllb8wyOpij94nnr88ag8KSO0vf6Z6uJE8OMo4cnndqkbWU6cvcciu
Wuma75rS3Vje8Q8YBSbCcjdKxqnKOrbwButMV24lRAejfoYmo0cmyN264X5hdvne
asDr9XBTwDKXkwpJ+hc8WQMF4EbqeGvm8NTtjKeMk7Xhn+PFgw6KhQDKuAfS8HB8
l/HQN2S8MIMONMjbDnw91QiVQKIfUDdXgCe8qqUNLXyZp80mqzKOj2BjfHI318w6
AsAuZysoMOx23wnFdbJI9hcPKhPBQg==
=1Hd9
-----END PGP SIGNATURE-----

--Sig_/c.0.=sCVaXjvQ_C6aVDC0o2--

