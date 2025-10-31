Return-Path: <linux-next+bounces-8766-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C5C22C5A
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 01:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5601E34A74E
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 00:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B9F86352;
	Fri, 31 Oct 2025 00:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hE+0Q19+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533767262A;
	Fri, 31 Oct 2025 00:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761869729; cv=none; b=UnCskqK/kMTY+ktrJq/u9MntX3jiq0zFvOv2smKrSB5WxGFIc048hW06G+Q9xmny2+QbNAu0IZEtpVbvTT2HvMnEF6/IolUEh6tzNMLbcosKTYxW4td6i6/xAs+ebxbQZ5bH78rzZgEjtDj0E4Rg2gIKoxJPic0Nmsb7pHaFKSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761869729; c=relaxed/simple;
	bh=0hTiIqTSjld9kHehdAyq7BzjbFtvLXAH5RszgX4jNzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Gd6GlojtFLU8pFcqREZWFsMJJnSGPdyzOiciXjArnBe5C0DAIHDT9bI8mrexRmIV8pm7en7lQazO32wT2kvie3sbe8qZQK1q8jMJlUjziUjwTyIfKj3Y8fBuy+TmTUB7Zn6kbYBmXqMpbsM9ZKulyB18Dw1vgvq6yDjHoADedQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hE+0Q19+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761869716;
	bh=0hTiIqTSjld9kHehdAyq7BzjbFtvLXAH5RszgX4jNzE=;
	h=Date:From:To:Cc:Subject:From;
	b=hE+0Q19+Ki3GAKaJesc6gfV6Y8JXAb2E+3O6/QdAMwmM3O8ZvdHdQmRBnaaM2bf2h
	 UkC28BXlKAgEzeyBLSyGuWGdOpwqjwkuFp2UaVLJD9zZr0ZKZigA/dCwndKFYsQnlP
	 ckVeD055zStPMjcEe0OISnfKTTdn9qgOCHXDivgOp/9r58ukVNkPoRd+LRVBqOxti8
	 JzWbMgQX+ZRC77wlLqv/Ty3Nao2kmbgvA0n7pvoVAXXiEiEtZMp1UZbPWQ7mbozn2Q
	 +lubF1Fzd2dFq5uJenMmaQrOTYRVdtcXzdU3+CcD6X70CUYcIfGL/g40r/Muj3ly/o
	 KSULWlYo3ezPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cyM1v59Spz4wD7;
	Fri, 31 Oct 2025 11:15:15 +1100 (AEDT)
Date: Fri, 31 Oct 2025 11:15:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: new objtool warnings
Message-ID: <20251031111515.09c9a4ed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P_BwQS.ai+5sipj7_caTBNq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P_BwQS.ai+5sipj7_caTBNq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

My x86_64 allmodconfig builds started producing these warnings today:

vmlinux.o: warning: objtool: user_exc_vmm_communication+0x15a: call to __ka=
san_check_read() leaves .noinstr.text section
vmlinux.o: warning: objtool: exc_debug_user+0x182: call to __kasan_check_re=
ad() leaves .noinstr.text section
vmlinux.o: warning: objtool: exc_int3+0x123: call to __kasan_check_read() l=
eaves .noinstr.text section
vmlinux.o: warning: objtool: noist_exc_machine_check+0x17a: call to __kasan=
_check_read() leaves .noinstr.text section
vmlinux.o: warning: objtool: fred_exc_machine_check+0x17e: call to __kasan_=
check_read() leaves .noinstr.text section

I can't easily tell what caused this change, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/P_BwQS.ai+5sipj7_caTBNq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkD/5MACgkQAVBC80lX
0GyuRwf/VG8CSmqTkLrsp05ckREMWeUE66P66s+f+oqYeUrpiiSNJ31bofYZEWt2
peJelx310jw18RqdGhYYcqPdsaxfsy9V8PBlrK1hUOL9Sa1aOQjal6QgeALrXFVJ
ze/rf7CQiOWufbXNgqQIbHb9/YMnWVQvrHEaj43Q4U7MeoZ7hml7o8C8h/4sNIpW
sywAe1kbwA47EDNWh1vEbn25P1mkXYk80FGQy+oAROkn00w/VSkIQHwkbBwKW+hL
A+3BfVMYadqVZRa/+VYLWUZIqOf4pc1QOCKkWd75dg93+XB7a/0kpNzrcFXcamgK
qwWtBPRGPD7i66uwHJ2PVDnWx9KFCA==
=3HWb
-----END PGP SIGNATURE-----

--Sig_/P_BwQS.ai+5sipj7_caTBNq--

