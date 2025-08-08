Return-Path: <linux-next+bounces-7870-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70302B1DFF3
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 02:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C3FE1AA1F6D
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 00:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9D6320F;
	Fri,  8 Aug 2025 00:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mAHbnh5+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC4D645;
	Fri,  8 Aug 2025 00:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754613213; cv=none; b=NCbdhpJLM7vem4r6VazXwxEmJAJC7wfhT2ntBidyenndsK/nCDgxWe6R/90KrUUwIan5MsQWicl0zA345zqW6df3K6ChnDfpM6c7ocNSKbZTtr8/NuQhQ1+3JtMlBW469pFpcufGLvIng2RE50bufCZ4byrd/Jlw429UfybaSWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754613213; c=relaxed/simple;
	bh=mn9S2PZM3RptPXvkB5BcFO+v5Fgw8g2XCTAZDCSVfO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jQf6YfB8DhQUfwxQcZ44lTNWL5BTdUvFvC3bAdZXDBgnjHr3zcokurR4vZYVWPnC5VYxzcSHCSdl7lhS+vDpwoJr4H8AFJrf/iaE8YPY5yHkvMV2+mkhJiwliF9j+we+sOspE58/NmlRfH+5r1XxPktgOBxA/Ut8rU7IqWEfMoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mAHbnh5+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754613204;
	bh=6lQ8aIPD8+gsycBvB6j/x1EuMLfjRsG1yevtDuQqcNs=;
	h=Date:From:To:Cc:Subject:From;
	b=mAHbnh5+uKm8Lc4AsNXfmG0o0yH2o+ZFgQuVu5ULGIAnX/IVEyoo17Phng0EuDj6F
	 l2nONm2dGxfovWB1eLgj5dCKdWsykSIA1UKZ/mUe9kGJsi8BSQBFW6s8z144xYWWqq
	 VpHGrhCTniHrjzKyh80IpIN/sZJxdae5QWf0uTQeh1HIOLQEKZfntTzetglGJ3w4qI
	 pED4yAJSAGwciBsJ8Co2tZBeJd+bAeeLYnl2k6B0vY+mACSaZ0K5DM69TMI3/zWX8j
	 emn43qS5QS5xocdXVDW63pCYsxI9fTsO5Br0fiJlyWDFzW5v5dbsxKl+Xnorkk72iK
	 ZxzX4Wf4lhq5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bylPZ6hmGz4wbp;
	Fri,  8 Aug 2025 10:33:22 +1000 (AEST)
Date: Fri, 8 Aug 2025 10:33:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, Anup Patel
 <apatel@ventanamicro.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20250808103321.49fdf504@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l+_oaGtb/b15xpRr+OMOJ_v";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l+_oaGtb/b15xpRr+OMOJ_v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  drivers/clk/Makefile

between commit:

  6486341721a2 ("clk: rp1: Add support for clocks provided by RP1")

from Linus' tree and commit:

  f10b3b886a26 ("clk: Add clock driver for the RISC-V RPMI clock service gr=
oup")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/clk/Makefile
index 18ed29cfdc11,48866e429a40..000000000000
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@@ -85,7 -84,7 +85,8 @@@ obj-$(CONFIG_CLK_LS1028A_PLLDIG)	+=3D clk
  obj-$(CONFIG_COMMON_CLK_PWM)		+=3D clk-pwm.o
  obj-$(CONFIG_CLK_QORIQ)			+=3D clk-qoriq.o
  obj-$(CONFIG_COMMON_CLK_RK808)		+=3D clk-rk808.o
 +obj-$(CONFIG_COMMON_CLK_RP1)            +=3D clk-rp1.o
+ obj-$(CONFIG_COMMON_CLK_RPMI)		+=3D clk-rpmi.o
  obj-$(CONFIG_COMMON_CLK_HI655X)		+=3D clk-hi655x.o
  obj-$(CONFIG_COMMON_CLK_S2MPS11)	+=3D clk-s2mps11.o
  obj-$(CONFIG_COMMON_CLK_SCMI)           +=3D clk-scmi.o

--Sig_/l+_oaGtb/b15xpRr+OMOJ_v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiVRdEACgkQAVBC80lX
0GyjBAf/dXz8H0uoaCcDuvn3sbZZBQeq/VzYvEj5Xjkg+F198zZwLPBw6GAF9zw3
DuP8Y6lUOeyIBrSKs9ex4MVc5wjifdEbGlimrAUeEBCJbWY35G7lPmPe7Syq8OuZ
DdnfE1jculLrBrYEV3fjEim0iVCVyf1HTAIj9okOARJ4pUA1+W7BV2MkKj5qsJwE
lpGBaoQiT0Jx+iP6WGqCP2l8XYqicKX72ROvHHJxhLm6O91hAq8TzFRM+qbZAibY
MxE9PfgcApmjHWkkUPjtYLziVFfYS6+e4bDd6ynlBFaO5yFrmvXag/VBYc7dyXM6
GWjsfU1QT39w/whL0FXRzS8PjHNeig==
=Haka
-----END PGP SIGNATURE-----

--Sig_/l+_oaGtb/b15xpRr+OMOJ_v--

