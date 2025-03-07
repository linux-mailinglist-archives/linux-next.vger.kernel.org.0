Return-Path: <linux-next+bounces-5678-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB43A55C3E
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 01:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 154EF3B0087
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 00:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC943596D;
	Fri,  7 Mar 2025 00:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ge9rrhyd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E127DA73;
	Fri,  7 Mar 2025 00:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741308636; cv=none; b=D5DM4uGEk4TAHz78m0pftARFVcdQDBoI55gNxVme1/lR3zXdh4zrnjM/AW4ysbrrxBgfGgO9kLmfFTA9g6YYLnyiTNc0E1UBEFhkIJai2sNif6c0/q1K3l7GQugVOEG26dYz9JSKVLFB5FPy2/Qkdbm033hQ+t5Mr6J4BdwI6Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741308636; c=relaxed/simple;
	bh=L5TetQ9G1kpTgYnET8zHMfwSbg+e/3rxaOeiCRb1+gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I3+mg3XoHHlTvdrQrXjBOOpkLaugunFGCJO6UvytUO0Adi/ZODjg6u8SVFsioq9C5dBfPAL/mJf6/t/dAPmhgP266bu0G3iIOZoJHZQtgwdSqfKmdImaz5FacmNUumnGtawkucAtcJDQIt1HKbYfURmxCeTinlzCwvPnVgB+/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ge9rrhyd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741308629;
	bh=oRoi6aTjgsf/sHTJh6pAvoMEA42sJA1B4doitLRIb9E=;
	h=Date:From:To:Cc:Subject:From;
	b=Ge9rrhydo/meujsOKiyvcXj/rd+AILQ8fwfwElwHciLn5hLZvYd+zDZTsJslhvKEs
	 p/LMe14h+WW5yJy4EdgEIiWtep3z77wEBQ8XNCizrBMvsBO9pt+H3ziCmyA4lUzZlu
	 z2C/xB293a4YvPQPS/8OpYbgYItuyZfXHsyliE3i6L+HsEMzOGOlnAjHR74JGK0ony
	 jCdnddi1NMe34IuxN/IPdDpz/tpKCWdZMECvwGRMWCWetUJzKJJ4t+WOoQ8cckgwTL
	 MB0mug27jftzKQw35NPIrZSLc78pHV4dAJciAjIf7rzBbp63x8U5ZMojpeQur8fxUb
	 OttzWQi8iclMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z874N6dPnz4wyh;
	Fri,  7 Mar 2025 11:50:28 +1100 (AEDT)
Date: Fri, 7 Mar 2025 11:50:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Johan Korsnes <johan.korsnes@remarkable.no>, Kristian Krohn
 <kristian.krohn@remarkable.no>, Loic Poulain <loic.poulain@linaro.org>,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Neeraj Sanjay Kale
 <neeraj.sanjaykale@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failures after merge of the bluetooth tree
Message-ID: <20250307115027.2549e196@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rNKcIrlzS2j56k/sHkfQ7UE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rNKcIrlzS2j56k/sHkfQ7UE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bluetooth tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/bluetooth/btnxpuart.c:21:
drivers/bluetooth/btnxpuart.c: In function 'nxp_set_bdaddr':
drivers/bluetooth/btnxpuart.c:1322:36: error: 'skb' undeclared (first use i=
n this function)
 1322 |                            PTR_ERR(skb));
      |                                    ^~~
include/net/bluetooth/bluetooth.h:264:52: note: in definition of macro 'BT_=
ERR'
  264 | #define BT_ERR(fmt, ...)        bt_err(fmt "\n", ##__VA_ARGS__)
      |                                                    ^~~~~~~~~~~
drivers/bluetooth/btnxpuart.c:1321:17: note: in expansion of macro 'bt_dev_=
err'
 1321 |                 bt_dev_err(hdev, "Reset before setting local-bd-add=
r failed (%ld)",
      |                 ^~~~~~~~~~
drivers/bluetooth/btnxpuart.c:1322:36: note: each undeclared identifier is =
reported only once for each function it appears in
 1322 |                            PTR_ERR(skb));
      |                                    ^~~
include/net/bluetooth/bluetooth.h:264:52: note: in definition of macro 'BT_=
ERR'
  264 | #define BT_ERR(fmt, ...)        bt_err(fmt "\n", ##__VA_ARGS__)
      |                                                    ^~~~~~~~~~~
drivers/bluetooth/btnxpuart.c:1321:17: note: in expansion of macro 'bt_dev_=
err'
 1321 |                 bt_dev_err(hdev, "Reset before setting local-bd-add=
r failed (%ld)",
      |                 ^~~~~~~~~~
drivers/bluetooth/btnxpuart.c: In function 'nxp_serdev_probe':
drivers/bluetooth/btnxpuart.c:1724:15: error: 'struct hci_dev' has no membe=
r named 'cmd_timeout'; did you mean 'cmd_timer'?
 1724 |         hdev->cmd_timeout =3D nxp_cmd_timeout;
      |               ^~~~~~~~~~~
      |               cmd_timer
drivers/bluetooth/btnxpuart.c:1673:18: error: unused variable 'ba' [-Werror=
=3Dunused-variable]
 1673 |         bdaddr_t ba =3D {0};
      |                  ^~
cc1: all warnings being treated as errors

Caused by commits

  b21ae0e8b437 ("Bluetooth: btnxpuart: Add support for HCI coredump feature=
")
  228c506481ea ("Bluetooth: btnxpuart: Add support to set BD address")

I have used the bluetooth tree from next-20250306 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/rNKcIrlzS2j56k/sHkfQ7UE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKQtMACgkQAVBC80lX
0Gw4Swf/SKaFooB/RLgt4NDNOLPb3f9IyhQz9m00RBVfXzeNb7U6qg2Ldw9EbHgs
78TPf6sB13zKOct1L7Akx7QSs5XPm5J4ERKGQGMdChEuieAkp/8gDgo4ibQfx/YN
bhGudEBGVY+2m4A+khMjtyDWVwfSmFIB0z+cwRiIg1bkf3MdFJfxViuM4knSVeGC
bGKZ05Q+Cd5w7dfrtck0t3CGt+WP0vsdcSSKPBJtMxi7XWFkx79ubIu08dJ5qo5Q
5hyPPwnDaKuVKjL0bYdl7IPQgxk89T0QapKIz5SS6OaFHTGVaF/Ewak8zhI+/4b/
L7kDE1JPfjPBINPax7mDAm0mIkVy0w==
=TQFR
-----END PGP SIGNATURE-----

--Sig_/rNKcIrlzS2j56k/sHkfQ7UE--

