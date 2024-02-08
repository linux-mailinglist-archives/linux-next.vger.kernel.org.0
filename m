Return-Path: <linux-next+bounces-1071-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF0C84D90B
	for <lists+linux-next@lfdr.de>; Thu,  8 Feb 2024 04:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B946B2142A
	for <lists+linux-next@lfdr.de>; Thu,  8 Feb 2024 03:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46E51EB51;
	Thu,  8 Feb 2024 03:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EzLCrRSN"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC121EB36;
	Thu,  8 Feb 2024 03:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707363746; cv=none; b=KMApJzeLL5Hz9ALd/U8NoiVyG5OKVDo+2CcuM8nTfxsfvoKvTzphyt7VfED5lyV9M9Qwoa7zMFYd0ob/XmDfeu/RI5ZOxGte31i1Ko+VzxrMp1RQHbKK2CKihTA9PnF/8se30rhEI9bb7Ol5U1tLfJQArxbJRsE7xcB8aVVmRx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707363746; c=relaxed/simple;
	bh=qrdKBQDUnkGSa/+zMEimSjyGnwY5+Se+w3OhghHx4NM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B+EmI2AREWZEePbhd5L0ToR1fAP1nhhE8UMu/IHd3mnuJuFQgl0VhoutDa073jFYTAj1N2b4fNCpi+KsHHwfpci2aik9HAObx6j1AGzLf6a6n23gNjXKVoGBp1NTPtu4lU83ztzlyNDDnULakXvh42ijL7LnZyw2oM6zOCOlx04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EzLCrRSN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1707363741;
	bh=nEzGCMQ6ri3v3t2uvyfy5c7ulw8BQ57MVRlDjVRxidQ=;
	h=Date:From:To:Cc:Subject:From;
	b=EzLCrRSNx+UEtrMsm+N8u6sZlTbk26L1Rc3ORcamylLb3WA0lK1KeqOmCH4jlbP3V
	 lCmzO3FmJxVqBl9lXs/19JjUCDa/WE4lViio4bMmEof4ojRgZbPT9chp1tk+zMZDA0
	 mCEzsF/RLdyZgBx81C7w5+v9nTTacfbGIw33nED1yuCfJJx6CTtkPOnbLkyDCVVdER
	 aeP7kndW8bZMN8dGjZNlufJp99JYEMTVaHR2n1DGlWZChsErfr+/mUs4x50TjrAfYP
	 xoH1s3g1Yod9ZPhUj/3U0eim5g9zBUomW6FtcHWSYYybeALYP51ChcX3vMWtCMn037
	 osGV5Edq7HsgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TVjV442gMz4wbk;
	Thu,  8 Feb 2024 14:42:20 +1100 (AEDT)
Date: Thu, 8 Feb 2024 14:42:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: "J. corwin Coburn" <corwin@hurlbutnet.net>, Matthew Sakai
 <msakai@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the device-mapper tree
Message-ID: <20240208144218.09346f4d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7P863dA3ykIq0WXDxyOaWuI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7P863dA3ykIq0WXDxyOaWuI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/admin-guide/device-mapper/vdo.rst: WARNING: document isn't in=
cluded in any toctree
Documentation/admin-guide/device-mapper/vdo-design.rst: WARNING: document i=
sn't included in any toctree

Introduced by commit

  7903d6d10204 ("dm: add documentation for dm-vdo target")

--=20
Cheers,
Stephen Rothwell

--Sig_/7P863dA3ykIq0WXDxyOaWuI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXETZoACgkQAVBC80lX
0Gw+Vgf/ZZCXO+g6B75gBiRBLvUNp5xJtvxtUaniJ8yip6HcfIYF4CT32GGxJJIO
/d32/0YSArHA17bqc362T/fVYZGvnTBK5m5XEPOisOQL6od7oJbmy/NBHLgh5qVg
VQffoAdNIWSovz+FsHkUArviHikkmqx1KdAT7/1hisOWNdN4snK1lkxJWGMJwU+L
kz+KfnsSHrDhYVPExZKai/CE4WCyurSVjVblBANnlu4RLOosXkfZUPPE/2hx4gLv
4E8Uvpn8rxWGTQHlBy9ybKod7hzoT9On2tw8IWvzcOsNYkgfUlnBIaSLjrYts8C7
QRBh3DQ1nlXcXqGbvGLsdKhu+UByog==
=NM+D
-----END PGP SIGNATURE-----

--Sig_/7P863dA3ykIq0WXDxyOaWuI--

