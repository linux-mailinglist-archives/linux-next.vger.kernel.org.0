Return-Path: <linux-next+bounces-7965-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1E9B295F1
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 02:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D9934E585E
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 00:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA6C1E570D;
	Mon, 18 Aug 2025 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ELlkNW0T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07661EF092;
	Mon, 18 Aug 2025 00:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755478283; cv=none; b=K9NnN9IkEdm4kKhcQ5lHFol4DkX2EjE0QPSm0/H54oLLgxXtVqxMnIivtssS4/pN5YDmtbcCrspJPR7FD72cVF3MVgdsTCVylNpEQMdOTOvn818liuocQd5pQlYeoN2qv9zxDzkZPnpAfuNe4zXKFdaObBFAsXW3vqpa4YUvmek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755478283; c=relaxed/simple;
	bh=HRDV7d/PaCaH4Hi8NGvoS4QDvqvAaxN1e4OXjFRTlpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lMtlLTA8zfrfW4Z3VF1Fx/bdqa2Q9XirU54hMA98Um9mwpezGwJVx4H9bPorOGCdCjaKHMbw/VuF/EGlPtv9gfA7KT8wlM3zlI+z7NUgGOnArzmdP3BQgibUlKKMbUWG1CaQd19RrSQn18/mpi8nt7UxEKYfmsrM278Wktk2cb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ELlkNW0T; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755478276;
	bh=zMn+PHO2tsa0PDDuAHWDh8cMSU5uEaOH8EZoPoM1DWA=;
	h=Date:From:To:Cc:Subject:From;
	b=ELlkNW0Towd2VRpOzXrju9ngXkqgGs44fejxqrnlIXXiit2+MYW6nEwd1c7xLJY43
	 Xx9CGwxR6RLkghW33CRtSISK9YarSBor7TQiRehDnpGdr5fXviiTZYhLexR1zPeCsu
	 OSmSdTsdhXme81ipdlfcrEs1565q0oSymLr5f6Loa58MIZMqksEmQFYRLVT4k7plNG
	 MwaPev/xCFrxNxv5GRpoVNIOTg8e17qp+COCN2PDTYmwFLyNfgpmVxHUHpWEsvCs0/
	 wXLboWAIV5FYDV0kd3opxZjJuXXNaq/VCW/aw12FuPSM/hx4Zwlwox6vf44e8a4jJT
	 rF+zdoO+w3oMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4vKc49CTz4wbn;
	Mon, 18 Aug 2025 10:51:16 +1000 (AEST)
Date: Mon, 18 Aug 2025 10:51:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250818105115.2adf8ef8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8scfY5joeHAvvN/z5DHENta";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8scfY5joeHAvvN/z5DHENta
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  3ae443de7edf ("Bluetooth: hci_core: Fix not accounting for BIS/CIS/PA lin=
ks separately")
  3f9a516852b6 ("Bluetooth: btnxpuart: Uses threaded IRQ for host wakeup ha=
ndling")
  8477821d5f12 ("Bluetooth: hci_conn: do return error from hci_enhanced_set=
up_sync()")
  ad2f0c8792ef ("Bluetooth: hci_event: fix MTU for BN =3D=3D 0 in CIS Estab=
lished")
  3e383124ce63 ("Bluetooth: hci_sync: Prevent unintended PA sync when SID i=
s 0xFF")
  c244fc08ac4e ("Bluetooth: hci_core: Fix using ll_privacy_capable for curr=
ent settings")
  3ca23aaba210 ("Bluetooth: hci_core: Fix using {cis,bis}_capable for curre=
nt settings")
  5ecd1fbdacce ("Bluetooth: btmtk: Fix wait_on_bit_timeout interruption dur=
ing shutdown")
  9c533991fe15 ("Bluetooth: hci_conn: Fix not cleaning up Broadcaster/Broad=
cast Source")
  b69b1f91b84d ("Bluetooth: hci_conn: Fix running bis_cleanup for hci_conn-=
>type PA_LINK")
  408410a0a0cb ("Bluetooth: ISO: Fix getname not returning broadcast fields=
")
  dc996aa11328 ("Bluetooth: hci_sync: Fix scan state after PA Sync has been=
 established")
  fdbb50f1b26d ("Bluetooth: hci_sync: Avoid adding default advertising on s=
tartup")

These are commits

  9d4b01a0bf8d ("Bluetooth: hci_core: Fix not accounting for BIS/CIS/PA lin=
ks separately")
  e489317d2fd9 ("Bluetooth: btnxpuart: Uses threaded IRQ for host wakeup ha=
ndling")
  0eaf7c7e85da ("Bluetooth: hci_conn: do return error from hci_enhanced_set=
up_sync()")
  0b3725dbf61b ("Bluetooth: hci_event: fix MTU for BN =3D=3D 0 in CIS Estab=
lished")
  4d19cd228bbe ("Bluetooth: hci_sync: Prevent unintended PA sync when SID i=
s 0xFF")
  3dcf7175f2c0 ("Bluetooth: hci_core: Fix using ll_privacy_capable for curr=
ent settings")
  709788b154ca ("Bluetooth: hci_core: Fix using {cis,bis}_capable for curre=
nt settings")
  099799fa9b76 ("Bluetooth: btmtk: Fix wait_on_bit_timeout interruption dur=
ing shutdown")
  3ba486c5f3ce ("Bluetooth: hci_conn: Fix not cleaning up Broadcaster/Broad=
cast Source")
  d36349ea73d8 ("Bluetooth: hci_conn: Fix running bis_cleanup for hci_conn-=
>type PA_LINK")
  aee29c18a38d ("Bluetooth: ISO: Fix getname not returning broadcast fields=
")
  ca88be1a2725 ("Bluetooth: hci_sync: Fix scan state after PA Sync has been=
 established")
  de5d7d3f27dd ("Bluetooth: hci_sync: Avoid adding default advertising on s=
tartup")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/8scfY5joeHAvvN/z5DHENta
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiieQMACgkQAVBC80lX
0GwbVgf/SoF0vEYiiFCZC9vrml+u1Oe7F+WuBXK081OWrZfCJl9THWAHQT0Owa2Q
R5Zkjb2ZymIu4lSOIzkKCxU/KTtyWrDvhx1qQe0iS1+HnKQ5xWHMnVxbvyjOwiE+
WDMyxel1vdkWsgKlkxz53giHVzYBZi+06ti/PCUg3CfGd9kNTZEe1os1D0ggznA/
6HI6v6fbhB5emGBlbPCkh3nZWyAZnted/g+Mfq1nE6II4sQeOM8ZEPhw6IqF8DCq
mDr8s1+AMetahY8DkJAJNyt/Q5vUx8DKLn7a2i5W9TuKLX1jfyh5uIe2l+cwnip2
WyG2/Ezp23iD74QuLEUk18MAn+KLVA==
=41M/
-----END PGP SIGNATURE-----

--Sig_/8scfY5joeHAvvN/z5DHENta--

