Return-Path: <linux-next+bounces-9162-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 792EBC7EB3B
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 01:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7532F4E14FA
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 00:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83001DF970;
	Mon, 24 Nov 2025 00:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NLJe3ySN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA7A1DE4E1;
	Mon, 24 Nov 2025 00:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944778; cv=none; b=AkL/4PulO0/AZRdC0mRiddVSgfIJ9joDAxasVWmUc8o5bU0AgjFOiP2zZ5P7lntUNEqLv3jcxm4yVpTBE7/JklhNzBRlJQ6oTQkwT+m+rIctFl9ceas/++df2OiYVbZAlOaLoHVNtaqZBzDG77WRGJdwtfanmtcd60GnePdaLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944778; c=relaxed/simple;
	bh=wilejoFyyd5UlD6L3dm6t83Wg8gHx2o17aYCN5KSb4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J+Y2P6sMf92sN7dVSSN9hiSO9F5uWaUeq9WIo+B+byG8ZDY3IQnl9xhRSN+fw1UIozsMVfbHskcYQ90pfB3vUD287XVrhI4beCJYWNcEKlc6IckGc+NrDjJ6DvY7oi2nOSLlRqN0/Cbgo8tDGVwBDMQ3QANsFKbnxJT9FNhmmdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NLJe3ySN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763944773;
	bh=jMTcAFISPU7usXreciXxBNWTEBUNdkLp1Da5jLDYWMA=;
	h=Date:From:To:Cc:Subject:From;
	b=NLJe3ySN1yWBJcXi5c5xzhuGNMSopaSMhlZpxjBRqPpVhk8UFvArCxh5DCNVWoe+X
	 8F3qW0/l44VkuHzDBN6LwPijrc+PaqD7dW3hrOBU72i2jiGCS7kwrjXeNzIwXi5WkS
	 mq2aElBFoB9GVytS8OXvaRlfwZWuOnsvHLRVaJdECq3pjT6+R3+0/MdirLrn1B2KzA
	 spj3o0mU6eVrgrUs4Os76n2dLZz5FRPs78JTrPOw8VGIB1wgaCamh1uBdo2zWIRVX8
	 Mytp1D1klNvjzoZiNj3hQaFr7TOdPiJT9fyWiM1bRd+xTm7vXNi6Fr+YRw+v/f9Ibj
	 271vV69fh82lQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dF6Qr39jzz4w9q;
	Mon, 24 Nov 2025 11:39:31 +1100 (AEDT)
Date: Mon, 24 Nov 2025 11:39:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the arm-soc tree
Message-ID: <20251124113931.73a15189@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tqI1rdLfkgIyZScRNZczUzR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tqI1rdLfkgIyZScRNZczUzR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm64 tree as a different commit
(but the same patch):

  04392a1e8145 ("arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT")

This is commit

  a086f211a3b1 ("arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT")

in the arm64 tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/tqI1rdLfkgIyZScRNZczUzR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkjqUMACgkQAVBC80lX
0GyXwgf+L1ck01Cf7UeVQEzv7vYWXSHlq6PrUUoJRlBd2FiVWup/XlZMmvlxiXRW
wsArQB8nl6VbDJUySLfXWDHlZPAlut8NPI/zVEtnjIOXfsJFvyiXw5Ik5smOub04
Ptp07EwLEfqdDGW0t3i4CYgrRFtxCwIeEG5HQlxBsITblvDTMvoNxnbKZdxPSQ3E
rFvjOxYf+PHdHjy0TH/7RojOL+FBnnaX5By75KyqReIM/GXM0p0JXSMiV95yBLzI
UUbEthnb9rak38qTT3RAngqCSWhjTE5hqitJK8KF+MCtS68WGdFIjMwgXPoDI1Mb
fEN++EGi1DusbTq/k/m1NiFq/9BW6g==
=HLY8
-----END PGP SIGNATURE-----

--Sig_/tqI1rdLfkgIyZScRNZczUzR--

