Return-Path: <linux-next+bounces-5539-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA33A41485
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 05:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B063E16DFE4
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 04:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BBE1A9B34;
	Mon, 24 Feb 2025 04:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="vGSikM4h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB51A2390;
	Mon, 24 Feb 2025 04:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740372624; cv=none; b=friBfs+Yrax2pGD23hmeXiwr8JrjUf1ocwCuszzx3pDOlnAd2DLEknMO81RKjuREDYvxilSoL76JS12pUu5RX/6WpjIoMiBR5PIxm/NtE7lQ0oAMrv6YKSkaMGsnA/yqAl6P9VKll0zHrK8vJxAKApvpC+iG+O3i83kFFQd51ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740372624; c=relaxed/simple;
	bh=mmUzIxh1cUl+4nJdh+0j7egLcB6mqf0XezusnETgYAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kl2qHgq+XSqGc8wShbgL89w9R3xBDMSHteLKL2e7cL/+gY4ipM9ffZuUPI5LHUcaAgsY+cJKGzHpJ8k8ebv/K4OjIkTUXA13Bdd6IgddfQoFs6f6FvjUQQUFIp3JipP7wVjrzNVI6VDDmzXTYvjHwkgf8rPAZyWYSHc+G6k6ths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=vGSikM4h; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740372617;
	bh=u5oOLtRfJIP3pCX7m6VF5yBanM4X1Qng8UQjSjLeujE=;
	h=Date:From:To:Cc:Subject:From;
	b=vGSikM4h3v1C+Qhk0L3ZtVnFxybKBiqGh0iPKv83Z1yD8xo9ASqsEt9GobOylqhSC
	 zMI9Ii+tWGt3AUbMg6PsRzT55ykL76dRZnLoZDiMDx4kEFEfAJG+brIIuW3gYln74r
	 kAUbWYWGvS8NUHEsNNlpKXKzZK5siVV0KPbql/VG9ovc1udc1a04CQumxsldrGundq
	 qGt2Y2VblK+8vdbw2sYqiDnUsqtt5V0ekJvpTN8XAmKGw4Zp429+sdsXKz5hiH21vo
	 cTZlr07Ha/lcPCjDpRDm1MuyYIiBG5MmGslbUF0IDjUgnZY6Ew6fvBtqCstKXgvaJi
	 aALnuf1uFoBCw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1Sw86cPtz4wcD;
	Mon, 24 Feb 2025 15:50:16 +1100 (AEDT)
Date: Mon, 24 Feb 2025 15:50:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the tty tree
Message-ID: <20250224155015.7790ed0f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W7PR84v=jM0Mhxyp4A0Vvr.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W7PR84v=jM0Mhxyp4A0Vvr.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the tip tree as different commits
(but the same patches):

  a2d1afe65a15 ("serial: xilinx_uartps: Use helper function hrtimer_update_=
function()")
  d2fa8e52cf91 ("serial: xilinx_uartps: Switch to use hrtimer_setup()")
  7ba2facc3f91 ("serial: sh-sci: Switch to use hrtimer_setup()")
  afa51660033c ("serial: imx: Switch to use hrtimer_setup()")
  8cb44188b986 ("serial: amba-pl011: Switch to use hrtimer_setup()")
  d45545c32904 ("serial: 8250: Switch to use hrtimer_setup()")

These are commits

  eee00df8e1f1 ("serial: xilinx_uartps: Use helper function hrtimer_update_=
function()")
  0852ca41ce1c ("serial: xilinx_uartps: Switch to use hrtimer_setup()")
  4e1214969603 ("serial: sh-sci: Switch to use hrtimer_setup()")
  721c5bf65a1d ("serial: imx: Switch to use hrtimer_setup()")
  c5f0fa1622f6 ("serial: amba-pl011: Switch to use hrtimer_setup()")
  6bf9bb76b3af ("serial: 8250: Switch to use hrtimer_setup()")

in the tip tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/W7PR84v=jM0Mhxyp4A0Vvr.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme7+ocACgkQAVBC80lX
0Gyc0wgAnD114BHPo16wdZ3fUcC8Z//BfqVa9g3ugHktrZG/dqrMwV0+/PP7yIm0
o+QOhKz6Z6iA25WCudlKNMu2fgeiYeWGOOTXUxva2Nuax2jp7TEE15EygDLyMUjg
hbdZ4xIcOnYgQBiOFhChT6k/dk25B4Hr6QKmVE7ztujvsvFEiT5kjxb8Nroa2Pm8
KnD7qgnG9kU0RgzZXvSV4EDIo1pMYx1U/U/Gv69YDwEdbxkcX55Y4bDF3XJnAcOB
74FuxcYDxcVbyEVaHrJplmmJ2g5O1JlJHj372e8wsyC9MTwTJybc/akvjfnENtXj
uydR0TGYkZuVgW+hYUx17Kug24G3ZQ==
=pnq6
-----END PGP SIGNATURE-----

--Sig_/W7PR84v=jM0Mhxyp4A0Vvr.--

