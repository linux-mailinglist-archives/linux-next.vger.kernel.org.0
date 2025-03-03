Return-Path: <linux-next+bounces-5621-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F56A4B5C7
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 02:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0474188AF6E
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 01:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8367B7DA6D;
	Mon,  3 Mar 2025 01:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gkGxKfdR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF419800;
	Mon,  3 Mar 2025 01:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740965157; cv=none; b=u1r9bNZNO2TFn3Ia71txasYsTv4XfdQqQ7oa5Bv/Rn/muuOjJTqi/LseJXYwuoI5XbiBdcss52UStVCI4J1TJjCDD7IGolc4Y4H6baXzBRF/yOgNLknKIH6XP7Q63RUTjPSyyjOoNfeTFOQjbPoSmiKRmAvXasBW9UWYFD8JVtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740965157; c=relaxed/simple;
	bh=pDn0nfoPFi+rcKGLVXWlzZT7HodmxoToJQYKKN2rIBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iu4njq57t9WIX7j+RHz+3S0E9ka0TYcP5RiqnRfnkPQF4ovVL7TxuIiHFVzvuFtkxPSQ8zRhaevDMMUn2IxkcW4niTGovrMMFrV7quRSMZpIfui71LqTktmjvCL+w53moAzOZu4y64mKSju2m5fAdTHHrVqWnLc8b7oxDM0Xuuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gkGxKfdR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740965148;
	bh=ZcZw+w0gUtfInGkVS0gxsY3pe913GH+1aja+dUkq2o0=;
	h=Date:From:To:Cc:Subject:From;
	b=gkGxKfdRasRsp39s3TYozn2qrDIW2sW7XKMUIMIfiezgKa5OLoiutFnVC1/B2J4lY
	 FyLRdAwDxGTioOTq9I3JS0plj9ACeynHACncou6/1ka5mp0BNaKnCtVmZsNNk444AL
	 weULkskJ6ws/OWc7NvVBR6kTlTRNiN2heEpQXKi2q4AavW1nZslh5Wbmg6M4Mc9EfA
	 lwWvnYgTkKGk1UVB7zz/tvRqpVPdzFOJvvmxt6UaO58eOUzgYrTc61LKvid2+ZyK7+
	 0PTw+RwRgvbNABfdoTNl417ZRp/Vg1i9SnYajgFyLZPI5dY46OY1sh2WyrP1oznumk
	 yVeDEHmxNgoOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z5h2z5l85z4wbx;
	Mon,  3 Mar 2025 12:25:47 +1100 (AEDT)
Date: Mon, 3 Mar 2025 12:25:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250303122546.14c6d35d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/83ysIegDjzPP.D.t3Vq=Ef9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/83ysIegDjzPP.D.t3Vq=Ef9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  a4ce2f1cceba ("Bluetooth: Add check for mgmt_alloc_skb() in mgmt_device_c=
onnected()")
  62ee156d6b29 ("Bluetooth: Add check for mgmt_alloc_skb() in mgmt_remote_n=
ame()")
  02aa832d1403 ("bluetooth: btusb: Initialize .owner field of force_poll_sy=
nc_fops")

These are comits

  d8df010f72b8 ("Bluetooth: Add check for mgmt_alloc_skb() in mgmt_device_c=
onnected()")
  f2176a07e7b1 ("Bluetooth: Add check for mgmt_alloc_skb() in mgmt_remote_n=
ame()")
  cbf85b9cb80b ("bluetooth: btusb: Initialize .owner field of force_poll_sy=
nc_fops")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/83ysIegDjzPP.D.t3Vq=Ef9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfFBRoACgkQAVBC80lX
0GzX7wf/Va0qmSyzd8Dweq81NDO8t+dxa+nF0Ih/ZufZP6gfoN31oNLIKNiXBYFg
Z8XriHsWl+bI8cQcPRjCbV6dw6eg7n4NMFrXQl13hnu8BouK+9RFBsW1lJMoH4p4
hso/TLbHJ2LrN77oevepgu1fwChuPnsI5OF2p2mhN7rkFG/V5b2MpNRoz7PaBVng
ViZcg39yConVH7Pj7DuD/AhRcgFviBI4piGQ2yEbPHsRv8cVrdYIBv6LHS0uMG23
PRXMQrh7Tmpo5T9U0znl3ngt2mHeGsyya+TuYejSbOfCXiO45UrZ4j5Zj+DPZGbj
9HBnVMCeJgeQxfjpXv/xCPSL/pQSsA==
=/4k4
-----END PGP SIGNATURE-----

--Sig_/83ysIegDjzPP.D.t3Vq=Ef9--

