Return-Path: <linux-next+bounces-8982-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 061DFC5B52D
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 05:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBD7B3AC43D
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 04:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56BB2877C3;
	Fri, 14 Nov 2025 04:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WIoJjmL2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D257E0E4;
	Fri, 14 Nov 2025 04:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763094835; cv=none; b=mY6mmfehWCAeVFHvp0crQjKwiM5gwMIBy1rlfH7v8qwdQ2PbilLBWQAW4QSNaw98fbv6x63/DV/acBTT8Reugq8M1R6JeaX/qkY34gHgiIp7RGZqzhYfJv5Vf/aXal8TULpGqVb/D1Ev73zMXyZyKxDmVU2aNBHsp8JSkMqYM0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763094835; c=relaxed/simple;
	bh=uLPwwPfpkczoRSRykX7c8+2r539J1XhFHuFR5VH21jU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SUpAoJTHSFnyzTzGOWFT1/IA7XbPMb2WGpK5hc1y+t3Q+O4KfJfAgqHvg4tTNI5iLNk5QzS97mt0irktpEo8RaBxIc0nKfa2GVnf/haO35NXcD1sPqSJSznlCfgdiOVqEkjOSNw9rA5qC0vwg/1ZPhcEJ6gwUkxicvJMbZR92Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WIoJjmL2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763094828;
	bh=sf3ILPzAZ7TwKtNlPtc03LGWWBa1RWqCUedC+aFLctE=;
	h=Date:From:To:Cc:Subject:From;
	b=WIoJjmL2Z9WOVWzBbjU30uZsFRgDWuIrGvIoM3O+CRPdOXENEYvm6AXjOv91VeRY4
	 /SSgExfV+c98uN+Q1cBLLKcuxvFqvxbur8lr2uIRdcbQlNEwvc8QatvRsR7YALPvaW
	 090PaSLn6jHhB31UCp60inMrt8ChMGBWJsNMzDz9qRNgvKVZAk4Ank9g6JEXy66DkS
	 YhoSmWHUjxwV39gTTkBqPCpuqrUZQdlMEWyftwn8ivZXH4loT4+HH/zCpnQDEq6tBK
	 v4mj9pqaKCP1kABd6sHH/8MNk4eMIInbXC6/8xMzXwiZ1y43OpRejSVjwupSjIaWa8
	 C+OxtU7ISFnOg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d745m27R1z4w9V;
	Fri, 14 Nov 2025 15:33:48 +1100 (AEDT)
Date: Fri, 14 Nov 2025 15:33:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the char-misc tree
Message-ID: <20251114153347.16001109@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZmUr2.aiYZJglp4HXHLwoCk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZmUr2.aiYZJglp4HXHLwoCk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (htmldocs)
produced these warnings:

WARNING: drivers/firmware/stratix10-svc.c:58 This comment starts with '/**'=
, but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.=
rst
 * Total number of transaction IDs, which is a combination of
WARNING: drivers/firmware/stratix10-svc.c:302 This comment starts with '/**=
', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc=
.rst
 * svc_mem_lock protects access to the svc_data_mem list for

Introduced by commits

  bcb9f4f07061 ("firmware: stratix10-svc: Add support for async communicati=
on")
  85f96cbbbc67 ("firmware: stratix10-svc: Add mutex in stratix10 memory man=
agement")

--=20
Cheers,
Stephen Rothwell

--Sig_/ZmUr2.aiYZJglp4HXHLwoCk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWsSsACgkQAVBC80lX
0GxW7gf/bDODqP0ZafljYmluoihUHutV5TVXSSP+Z1jd2Sn+OFR1y1JprOgcHGTt
LFpf3aVAZER3ToRKYE2FC3M2w76beNP2OROVhDHVwfSAi80KjAVyZT56CGQIbRkX
y9rSFkxTb7cZIbzVojHUs3MpsMM+iWFfiO57AbEuYAMPJOkiSO+BdGowzj7elYCV
PH6zmADuDSjuHdQSvM/smdlhCoOrydvSINBHDfCEF7kD5fbhP14IDztKMo77uyVE
EOpP4bix+MTZxELtXw1bkGLOzEiRhIA7l80tk7/AVpNaEvfpsa/GDXTrg2/VHdYF
QB0bQmumd5lmKEG8BMUQV3krPS/u1g==
=iyn/
-----END PGP SIGNATURE-----

--Sig_/ZmUr2.aiYZJglp4HXHLwoCk--

