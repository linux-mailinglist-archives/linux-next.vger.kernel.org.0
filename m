Return-Path: <linux-next+bounces-8749-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0E5C175F3
	for <lists+linux-next@lfdr.de>; Wed, 29 Oct 2025 00:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C1A54ECB0D
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 23:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECDA2D879F;
	Tue, 28 Oct 2025 23:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YCEFK++S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E562C11F8;
	Tue, 28 Oct 2025 23:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761694322; cv=none; b=MuF7oCkx0unmwnnO9cVYrRv99StmgQUNWaGw05XvK+ibFccciITSx011sPIz8De0NjNl90F9Qm5X51bhcAQTsJoZcWzdjLSsk4IGdggoCCYIcXzAtLEWEmFALcNrddwWBJrQpYqd4eHPnFKcSoJOTStztkww9/IOW8VphjLJDc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761694322; c=relaxed/simple;
	bh=rrxdEK3zklSMFvDYZivyauS9uVjMixfmshBaIfUi658=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YU4fCvNp3RXH0XBi/RQcPMnUhjVajU8w5Hn7+UibGzuBIMPvODxyBYEbdVkxhR0D+o86KmeVqJbL5A9rXbnWY6aOVxVGvkI7QT5sNsBmHMVV7HIRNHKCLGdciV6WTP9b51VRH5bT7Cf7bOQbPRGwC9xBFb7OVKUdI1czcMcwddw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YCEFK++S; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761694309;
	bh=9oxKf0xIS7NgmTGHRkeO6kos4vHi3eRdmL6GLJhfGSI=;
	h=Date:From:To:Cc:Subject:From;
	b=YCEFK++SPyN0GfWt8AhsWUoehsVdB0D6XUiZkp73VyccYo2kvg7xusqvvEgDeF3ZB
	 TuuBZgK4WHZ0xpDhgKyhXGz48RXGlX+h+EMo3/WA3CETXBnjoOftIewLSANZ4qp4lm
	 TvaqJcH8xAL7z30Ie3u545t4b3sN5KDaKSCGPtVqGVIiphYKxYxujC3O4VWeG/zUAP
	 daw5jG51F4eDnpiLvIZlGd53Wh/FjntbExDBsAfUx4Hvr8mLp5Hg1Qc/ojCTq5oooy
	 PCLKzKnS9eqU/ByiuH7/BMNu5VwvuFm/Aqe1xL2mtYs32G5pf9PoM59eJb5jLBebOV
	 hWy03LK3BhaPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cx68h35jDz4w2J;
	Wed, 29 Oct 2025 10:31:48 +1100 (AEDT)
Date: Wed, 29 Oct 2025 10:31:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20251029103126.09f7a0b5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kHq=_CYXjV2SrAcQ_4eWbHs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kHq=_CYXjV2SrAcQ_4eWbHs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  af8a2b99fd1f ("Bluetooth: rfcomm: fix modem control handling")
  bb0fa9ba1b4e ("Bluetooth: hci_core: Fix tracking of periodic advertisemen=
t")
  0951b54da343 ("Bluetooth: hci_conn: Fix connection cleanup with BIG with =
2 or more BIS")
  fd3d4dcf8011 ("Bluetooth: fix corruption in h4_recv_buf() after cleanup")
  4a2c3d95555c ("Bluetooth: btintel_pcie: Fix event packet loss issue")
  7c9758eb4225 ("Bluetooth: ISO: Fix another instance of dst_type handling")
  25efbde409cf ("Revert "Bluetooth: L2CAP: convert timeouts to secs_to_jiff=
ies()"")
  a1515d234916 ("Bluetooth: MGMT: fix crash in set_mesh_sync and set_mesh_c=
omplete")
  dec2a3cbf1b0 ("Bluetooth: HCI: Fix tracking of advertisement set/instance=
 0x00")
  a43180760a46 ("Bluetooth: btmtksdio: Add pmctrl handling for BT closed st=
ate during reset")
  cbab91a21da9 ("Bluetooth: ISO: Fix BIS connection dst_type handling")
  e3c6d41cd59d ("Bluetooth: hci_sync: fix race in hci_cmd_sync_dequeue_once=
")

These are commits

  91d35ec9b395 ("Bluetooth: rfcomm: fix modem control handling")
  751463ceefc3 ("Bluetooth: hci_core: Fix tracking of periodic advertisemen=
t")
  857eb0fabc38 ("Bluetooth: hci_conn: Fix connection cleanup with BIG with =
2 or more BIS")
  b489556a856d ("Bluetooth: fix corruption in h4_recv_buf() after cleanup")
  057b6ca59612 ("Bluetooth: btintel_pcie: Fix event packet loss issue")
  c403da5e98b0 ("Bluetooth: ISO: Fix another instance of dst_type handling")
  76e20da0bd00 ("Revert "Bluetooth: L2CAP: convert timeouts to secs_to_jiff=
ies()"")
  e8785404de06 ("Bluetooth: MGMT: fix crash in set_mesh_sync and set_mesh_c=
omplete")
  0d92808024b4 ("Bluetooth: HCI: Fix tracking of advertisement set/instance=
 0x00")
  77343b8b4f87 ("Bluetooth: btmtksdio: Add pmctrl handling for BT closed st=
ate during reset")
  f0c200a4a537 ("Bluetooth: ISO: Fix BIS connection dst_type handling")
  09b0cd1297b4 ("Bluetooth: hci_sync: fix race in hci_cmd_sync_dequeue_once=
")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/kHq=_CYXjV2SrAcQ_4eWbHs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkBUk4ACgkQAVBC80lX
0GzggggAkHkd88wMCaOeNbWKTpssM7cXI7O0pcoBm95KZDbbG3UiI3SaDJO1wuVA
wUpNQBJphpfIAY/P005AzNta4pSF6nVRan98NDjwsWJEjHOJ2CF8T5o69m7iEdXC
d3Cnh+TCN2iA0vja/M2CkEN3YdytmVy4nXZFwdWPZQy/ksj7rLM2l5zFsurh2OpJ
WyBB8wts5vha4mogGP9XHa9IXKzwBTmihYU0Z3j3AqU+xKEh3Vuxn+77YV2VB8tA
w2N//cheiE3IWTNI28GD7HtDeoDwj+ElSI6vFvLJKh3y63onXY/di0cg4Zup1PYr
YoNWQHn5usmUya7w0wMCGV/2pjnRgw==
=H85Q
-----END PGP SIGNATURE-----

--Sig_/kHq=_CYXjV2SrAcQ_4eWbHs--

