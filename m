Return-Path: <linux-next+bounces-3436-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BBC95FF56
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 04:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9D641C202F1
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 02:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F96B17597;
	Tue, 27 Aug 2024 02:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oXrfrh84"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA9417543;
	Tue, 27 Aug 2024 02:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724727051; cv=none; b=Hp5lHbUij+y0HMr3KileXwXw3oFL/diKZ/vc4WmiYlLV0zyLRqFNoyf7mxITJ47igJdmwoL4KiC/1d9+nkD4e/9tmLKXjg9QaIsq5zlV1mNIs2kF14cxfbW1CKkeZ7Kh4dZfNhRq3VArVz5AVQ1dnC2sBlNc7LN0B5oji+Iiktc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724727051; c=relaxed/simple;
	bh=I/M4SonmI2UXiiKnCYTbxmBfDK3ArplvFubXSuzTiDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n8CdXAUzZ94Zqd1ytISUn+Ctzht1fnuEkn5sgH2jLhadhaZpAvsvlspRfpxEiV70RYSi2yssuHStpUyPRhbymfcJPeimXf/hrmhZ7ewY0Zy+hpxOp1DBRXgj4kxY0Uo2qCoCUWVR3uW2kkKzS8w+QKnTt41ND8iQoL3dEQSZ6L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oXrfrh84; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724727044;
	bh=dGowBQ5kI1Hh9+u+DLmSVthYF28sCUgMr3KU8i/jV4Y=;
	h=Date:From:To:Cc:Subject:From;
	b=oXrfrh84cH/K4hS3SwU/x4TqJJAbsqcBx8QbLFiYJQxnwLj2d+3OtE3b0AGeGsX2v
	 O6vB2cUFcYzwVzQ2O00F31rhvrkDbNgOfVudRLIFeTA32QcibXKTccaxD8Z0L1YEw+
	 TP/nm3HxS8oO2Kds7lFL62bxXJhvEhKwo+AEOSrgGmZxNmS9lw3HmIHb0vl8CGBhtW
	 GZ+3DCmPS8oIenfruukFM7nPt7T/qXD5ebNYCTSRWg0B75VhNhdyiSy1dny1UhUt+R
	 2T1WgHkWVqwu3bAvzH9SICZuZQ5rSTI+cS0Dj5nH4EY1uHCnOY5i+f3FwdYQlpsEdg
	 QNbETJMostW8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtBqm0ML6z4w2N;
	Tue, 27 Aug 2024 12:50:43 +1000 (AEST)
Date: Tue, 27 Aug 2024 12:50:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20240827125043.57ac444c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DfD2oeKKOpv.W6JPHQ1TQ_E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DfD2oeKKOpv.W6JPHQ1TQ_E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:


Caused by commit

  6c70d79f363c ("genirq: Get rid of global lock in irq_do_set_affinity()")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/DfD2oeKKOpv.W6JPHQ1TQ_E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbNPwMACgkQAVBC80lX
0GyGQQf/ZIH4y33bFkUUhndGFI/goXVe+AgyroSyjyCif5bhONnTOpYP+2oOU9rd
WZVzhZSG0VuMOU54tWiPqBA8gvFJCmxj9zTO8PZ6qKXEvthCAPEqarCHDuhsZTQP
LWD6BVdxdJfTJSIQ23U0ATjr4haKjgkaM1CKH4CoHefgcqNG86J6Bj3F0gxHjuHK
iJvtaMg5xKvMwQ+Fuzykn+gXBaLXB2Vs7hhNrEn1pASew9JAHQBT2ZurYK24idpb
VMPqpqiKnkAfbL5aaH1wlf9zPHabbic2BJ0J4lqexvR7X78C6jCbfJyodG26WpLG
5nLcxQAz1kLtW03Khri9AhvhYW+4PQ==
=5wB/
-----END PGP SIGNATURE-----

--Sig_/DfD2oeKKOpv.W6JPHQ1TQ_E--

