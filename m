Return-Path: <linux-next+bounces-6981-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8253AC83F9
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 00:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D42EF1BA27C3
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 22:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD64021D3EE;
	Thu, 29 May 2025 22:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U6unvo/a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D9521CC79;
	Thu, 29 May 2025 22:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748557077; cv=none; b=dZbfK2G7boczqIlItetul4OjwGfkeGLv4jwredhTgYYYUfJ3xmJR1RZ6aI08emSEKyhGRoTtisOgbTYt+iqimXMLtyfxFKHTEbgFkTX9Un6JBY2HYkWX0eMHGWZpdc6xFYDgkeuTJLw1hbPnb4vuo4Txzvin4ThPOM0LEtQMBuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748557077; c=relaxed/simple;
	bh=eCb65l6WyYmtcG2ufKsK2zUASEpB++zpltr/sV99QzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pVYYHMDaTHQyyy09zKBsgcqd1ItxO3N9clKtZ85t5enc+7iXRU6PSCL58A7rdOP0za4lX3eaLX1ETzqccLXw/9bTusUKbDc58vyGyi2fuR+wn43L16l3OUjFsP4k2aI6a2zzw398tRTinJplU1Q305iu50BPOQbhywiImq4WPIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U6unvo/a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748557069;
	bh=fgl7aYkqz2gFxF5X+0tXXLK/+XUQFvkaG0q31Wh3e2s=;
	h=Date:From:To:Cc:Subject:From;
	b=U6unvo/awMvu+MPLKLToR5Zh87hHptNoaau2aYtBg3QnOeETWOUAMnphmjTY4r07j
	 rg3COvW/Y7P143a3KUqIHAoxPCtcwwyxlYbQdOCFrtWccw5wGdXAF5U08N3kOrmROK
	 rTozwguHHpQrTSXVd/LdB0YmMR95NsUs7IC/r3n/6xjKGsZYKQNl4P5ShTNbmYv3k6
	 Kf1w50jax3onBEM3hlyxTgZkMeQ5QcI1ku2bjxw0x26vsbji+VUxAxDruI2ruDCFY8
	 wU7ThHq8yCzqmR+GMMMklVSdfQaHI6f/Uvtl9PjUeR07/o2esJ/HDL6xj3baN/4Acd
	 +ecLNFJ845h+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b7gjT1TFSz4xTP;
	Fri, 30 May 2025 08:17:49 +1000 (AEST)
Date: Fri, 30 May 2025 08:17:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vhost tree
Message-ID: <20250530081747.3e7001e8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jVnJdpVWBEK33A1CzMXx/Tz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jVnJdpVWBEK33A1CzMXx/Tz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  360dd4a012cd ("virtio: reject shm region if length is zero")
  80f98fca05a0 ("virtio_rtc: Add RTC class driver")
  33c11e0cfd5e ("virtio_rtc: Add Arm Generic Timer cross-timestamping")
  0e631f6a7995 ("virtio_rtc: Add PTP clocks")
  4934cfb4dc7f ("virtio_rtc: Add module and driver core")
  27db566b6c5f ("vringh: use bvec_kmap_local")
  c472a51c48ee ("vhost: vringh: Use matching allocation type in resize_iove=
c()")
  c118346b92c5 ("virtio-pci: Fix result size returned for the admin command=
 completion")
  306acea221ea ("vdpa/octeon_ep: Control PCI dev enabling manually")

These are commits

  206cc44588f7 ("virtio: reject shm region if length is zero")
  9d4f22fd563e ("virtio_rtc: Add RTC class driver")
  e2ef16757bbe ("virtio_rtc: Add Arm Generic Timer cross-timestamping")
  9a17125a18f9 ("virtio_rtc: Add PTP clocks")
  0623c7592768 ("virtio_rtc: Add module and driver core")
  169294a14b3f ("vringh: use bvec_kmap_local")
  8b3f9967b1fd ("vhost: vringh: Use matching allocation type in resize_iove=
c()")
  9ef41ebf787f ("virtio-pci: Fix result size returned for the admin command=
 completion")
  eec812774d30 ("vdpa/octeon_ep: Control PCI dev enabling manually")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/jVnJdpVWBEK33A1CzMXx/Tz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg43QsACgkQAVBC80lX
0Gx2bQf+JF07Zdkj59DHTVNUyctUjf6kBPzUfIItORJJ1ta0gJ9G0K6cXP2grXkD
KEj3Eg+hh00abf7S/d7B0eBK1utaYe7xG3YBZV8uf1O1Y6HSJO0JfbZk0bNzZrUx
uTO4rzS/fF2R+OfKcp9UR8jAL+HrTRHSQUatxGO61kPiatfONLZlDCC03+iRP1j6
yZtiukyMM8In0x3KnUs9upHTxzAkhDXhMvewhdnsWxNXeP9F/+Z5aQ64lN1t2QVF
1JVW92JPH90JG4YouKN2JsxC/uaJB9vbIgeYkVdX4oLaL/TmB1GTbCFBhvg44ad8
3tTjKPnCVsaO2I89KGOy8vcUZQ6E3w==
=xZUD
-----END PGP SIGNATURE-----

--Sig_/jVnJdpVWBEK33A1CzMXx/Tz--

