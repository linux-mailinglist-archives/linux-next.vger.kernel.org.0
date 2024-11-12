Return-Path: <linux-next+bounces-4764-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E90019C660C
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 01:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D449B3A7F0
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 23:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2305C21CFAD;
	Tue, 12 Nov 2024 23:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ttXQQd9Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C712F21A6EE;
	Tue, 12 Nov 2024 23:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731455182; cv=none; b=huNckHp9OAHo5VykW3iHQfgf1IkwicfAriNFThUZl3QWEKvPWsz1L6HfHtayUAiU0mzTSSoRhIfoAFuh5LPqKGcbIFQ9b1899oxGoEqsH20q7APAOjh1nB/jA+PrLci/GVkXenT9LJU6fC5X5tW4ljoxOPCX1APj45emBzO6bw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731455182; c=relaxed/simple;
	bh=kBLWURAeeMkKPg9wzQSkzUW9PbaHqu+Dj3F4eqaYBic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MPS02mcA88Vc49aTI3GNto6F9KMLdzc6k6hcsG60OIV+NAvBSMZos01MChVvUyYicibDZZC8SpLfW/Vu7WXSbwiBsHqtUy/y24gayL4CLzIzXQyLekuOGHcO93oLiiuCfBzrNfHaMt8jp2CgrvqU87wKZNx2rs7GgiaPvDtd03I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ttXQQd9Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731455173;
	bh=7M4bQev/1h6U4Q88liz/TVbRGy6JgohEbl74Cl2TDy4=;
	h=Date:From:To:Cc:Subject:From;
	b=ttXQQd9QGUbsXVpKiXCRI2fICnMp9nhOlyPfBAUZhCo48C08c3sWjulnPdlHoHyNE
	 9jK9CcX69Ih9giN5dvzCI5QSInMLUDpr+90NFO6HDSWbAEnLe00npBf/+ByYmAC3Ov
	 dFE34NuyNL4O1Vts7D/z3gNB5PF1x8WBND1mqJKs0S7Snofb1C4JoP7p1eWNTZogCD
	 eqlBGnxcF4oPLcFUumYcXAvTtJNAqwh1aPH1B+nT3sbd2Hl6A0FcdAqdOaLvW+LW2j
	 1eA2hgT17dQDJLjhduRcLjhMkkD72F71LsjtSUk5WB74fVWwbHztxAq8+6tMkBwgPU
	 tRpxWAUnCcoAw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xp32r5zmGz4wbp;
	Wed, 13 Nov 2024 10:46:12 +1100 (AEDT)
Date: Wed, 13 Nov 2024 10:46:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Russell King <linux@armlinux.org.uk>
Cc: Melon Liu <melon1335@163.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the arm tree
Message-ID: <20241113104614.4093835f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SDyflfwT0U1GNSjMUuRhNRt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SDyflfwT0U1GNSjMUuRhNRt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/mm/ioremap.c: In function 'sync_vmalloc_pgds':
arch/arm/mm/ioremap.c:130:46: error: implicit declaration of function 'kasa=
n_mem_to_shadow'; did you mean 'kmsan_init_shadow'? [-Wimplicit-function-de=
claration]
  130 |                 sync_pgds(mm, (unsigned long)kasan_mem_to_shadow(
      |                                              ^~~~~~~~~~~~~~~~~~~
      |                                              kmsan_init_shadow

Caused by commit

  15c0b4cb0223 ("ARM: 9427/1: mm: Fix stack recursion caused by KASAN")

kasan_mem_to_shadow() is only defined when CONFIG_KASAN_GENERIC or
CONFIG_KASAN_SW_TAGS is set.

$ grep CONFIG_KASAN arm_multi_v7_defconfig/.config
# CONFIG_KASAN is not set

I have used the arm tree from next-20241112 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/SDyflfwT0U1GNSjMUuRhNRt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcz6MYACgkQAVBC80lX
0Gwq+Af9FcbnRq2asEMG7muIb3wRF7oPa+muzHNLs9ZA8b7AOWQp89btt6rmOQtM
GwkAnwlb/kA0+PWDg+vGns04uqCQvlXjL63Pappukv01avA22t8NWGCCCNIxJpCB
qO8nZjPXI5RT9Iucln4L/y1S/3K3Rcu1iXvJi2fh+Ic1VDw+fFTqVdUkc/YvE72y
KiuD0q0wYSrqPfTIfJCjRsZEk9aVsaxSBoWsAmcjqAATLfkJDd4FZFHX5bXQ77hS
+cAmKCnWsfT0NYYNP1/R8/CER03JTMJKRKZXQWuhvUbHwXVEXqIrCTNyCdaV9Dim
IGp5K86wm5xYgJSKUmqHDyJGnD9zvA==
=Hwra
-----END PGP SIGNATURE-----

--Sig_/SDyflfwT0U1GNSjMUuRhNRt--

