Return-Path: <linux-next+bounces-5711-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0D8A5B583
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 01:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43AA23ADE73
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 00:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735381DE3B1;
	Tue, 11 Mar 2025 00:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mh+hyh4D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B952B9CD;
	Tue, 11 Mar 2025 00:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741654688; cv=none; b=q3LLr2yXNGb53wGiMbPYN+k038cptQCVIPwpHj2XE4+PXOWCDO3CXeGvIDIzFxdlZvrsTa0Qq9906PBgamr23Iz3ywYNlMULQGiS6z/2CVrtT5kbm9o5bVQ7K18hawaqyCJ43UCEFWaKIaY0YTZkKXxBXaJUgIdgkPGpIFY6Hco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741654688; c=relaxed/simple;
	bh=yrwlOhq+ZRcjiXGImE8uhCgFDpxCiuS1JASxcgvaR/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DQKmYMlFDgWh0sUUzQ7GwXxatoQ0gjvKGgHqGNriob3cUzRZBmihPQ0YIYGac85HBBX3sbIyFL0qslfiVcSgUru0Ea9lTQRh3Qf0KqUc3RA5NvnfOiu9Ex9GdjHEDnpqCQr+fgN4nXqciH+SQq4A1bez2u5fbNFlU5vUSmd7Q6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mh+hyh4D; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741654680;
	bh=Tr8Re72/EpoDmlqgqK+IWGfFqUbG5OiC/9Y0ptmLfX4=;
	h=Date:From:To:Cc:Subject:From;
	b=mh+hyh4DA1FK3VIMRM3Eit2rGw93paimh2wvfKs3vv90GqPDH9X1gvrk5XYdNQ6SM
	 os7GV/GJgv172g2UYvr36Awlutyrxdbn4YYiJ5npgN3ZTCIcfNToYMJLwx5M1a+CFA
	 RbcUqGKfRqlWXogH+FVMjFn3L2HgIgi90Cny1rsha7GIll+oDDKBpuDHXnt/ZmEeeY
	 qBdF9T8kW9aUlO0bcjXb+wKHO1pJjIg+vweTycL5/jQ/PeXjDkioRp9dQSlIh5N6ll
	 2T+2GYup4VxTWPkoQmze2f7+KNrKbHry91Mo8NEaIDVVm7SvzPwkKWwndScZY0F5rx
	 nkmwHGOlnq/kQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBb3D3V47z4x3p;
	Tue, 11 Mar 2025 11:57:59 +1100 (AEDT)
Date: Tue, 11 Mar 2025 11:57:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Taehee Yoo <ap420073@gmail.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20250311115758.17a1d414@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xh.a4=HiB=xr7=J45lWXPTJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xh.a4=HiB=xr7=J45lWXPTJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  tools/testing/selftests/drivers/net/ping.py

between commit:

  75cc19c8ff89 ("selftests: drv-net: add xdp cases for ping.py")

from the net tree and commit:

  de94e8697405 ("selftests: drv-net: store addresses in dict indexed by ipv=
er")

from the net-next tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/drivers/net/ping.py
index 93f4b411b378,17dc11e9b6dd..000000000000
--- a/tools/testing/selftests/drivers/net/ping.py
+++ b/tools/testing/selftests/drivers/net/ping.py
@@@ -1,34 -1,27 +1,34 @@@
  #!/usr/bin/env python3
  # SPDX-License-Identifier: GPL-2.0
 =20
 +import os
 +import random, string, time
  from lib.py import ksft_run, ksft_exit
 -from lib.py import ksft_eq
 -from lib.py import NetDrvEpEnv
 +from lib.py import ksft_eq, KsftSkipEx, KsftFailEx
 +from lib.py import EthtoolFamily, NetDrvEpEnv
  from lib.py import bkg, cmd, wait_port_listen, rand_port
 +from lib.py import ethtool, ip
 =20
 +remote_ifname=3D""
 +no_sleep=3DFalse
 =20
 -def test_v4(cfg) -> None:
 +def _test_v4(cfg) -> None:
-     cfg.require_v4()
+     cfg.require_ipver("4")
 =20
-     cmd(f"ping -c 1 -W0.5 {cfg.remote_v4}")
-     cmd(f"ping -c 1 -W0.5 {cfg.v4}", host=3Dcfg.remote)
-     cmd(f"ping -s 65000 -c 1 -W0.5 {cfg.remote_v4}")
-     cmd(f"ping -s 65000 -c 1 -W0.5 {cfg.v4}", host=3Dcfg.remote)
+     cmd("ping -c 1 -W0.5 " + cfg.remote_addr_v["4"])
+     cmd("ping -c 1 -W0.5 " + cfg.addr_v["4"], host=3Dcfg.remote)
++    cmd("ping -s 65000 -c 1 -W0.5 " + cfg.remote_addr_v["4"])
++    cmd("ping -s 65000 -c 1 -W0.5 " + cfg.addr_v["4"], host=3Dcfg.remote)
 =20
 -
 -def test_v6(cfg) -> None:
 +def _test_v6(cfg) -> None:
-     cfg.require_v6()
+     cfg.require_ipver("6")
 =20
-     cmd(f"ping -c 1 -W5 {cfg.remote_v6}")
-     cmd(f"ping -c 1 -W5 {cfg.v6}", host=3Dcfg.remote)
-     cmd(f"ping -s 65000 -c 1 -W0.5 {cfg.remote_v6}")
-     cmd(f"ping -s 65000 -c 1 -W0.5 {cfg.v6}", host=3Dcfg.remote)
 -    cmd("ping -c 1 -W0.5 " + cfg.remote_addr_v["6"])
 -    cmd("ping -c 1 -W0.5 " + cfg.addr_v["6"], host=3Dcfg.remote)
++    cmd("ping -c 1 -W5 " + cfg.remote_addr_v["6"])
++    cmd("ping -c 1 -W5 " + cfg.addr_v["6"], host=3Dcfg.remote)
++    cmd("ping -s 65000 -c 1 -W0.5 " + cfg.remote_addr_v["6"])
++    cmd("ping -s 65000 -c 1 -W0.5 " + cfg.addr_v["6"], host=3Dcfg.remote)
 =20
 -
 -def test_tcp(cfg) -> None:
 +def _test_tcp(cfg) -> None:
      cfg.require_cmd("socat", remote=3DTrue)
 =20
      port =3D rand_port()

--Sig_/Xh.a4=HiB=xr7=J45lWXPTJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPipYACgkQAVBC80lX
0GzWDggAgM42FnvaOpoJ/dMw/49iAJyBuTmdXODYwnTgLOX7sjE9/4Gja8wozXH9
ZpapqpQSzMi+9vb8ga/femxMuHxjXLF4yDnjqVsZrOInVL+PpjfWr8XiIYrIITHC
POTYopCU8SMLLrmHMwceH8mjbkZv7yfaqAhtsoI4uo+YRfcZivgtIEse4KF9xHpl
eGtsVxdBv1T3fGVnIemjSVd9M6LrtKexX+x8PF9RIk+JUSnWgt2BeiJbaDiSNM0T
057k1akAFXYrM2JN5O8AvwwANUfV1Bte2kKmH/O8Lb48DWEu7c/Jz2rDBeIPaIhD
GNwuT7QaFeqpnL0HZwr4yEY03rNRKA==
=WhCx
-----END PGP SIGNATURE-----

--Sig_/Xh.a4=HiB=xr7=J45lWXPTJ--

