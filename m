Return-Path: <linux-next+bounces-5445-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF11A35607
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 06:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 999A3188E274
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 05:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9067716DC28;
	Fri, 14 Feb 2025 05:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r0VQsCrl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E01519AA;
	Fri, 14 Feb 2025 05:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739509837; cv=none; b=Ag+3aav6/7FTAbbrbuBoK4fsAPRExzkGMv9lm77s4bUb8cqyh4XDuOpCDLHpgFaUYqmsgDLlyqRHf8Qm/CXrru1B8IfdJbMHH5vrF0mvcYT7Oax7RB/gt9egh/wmotUBa3RfJ8NGgWCUug2vDKl9uwmpsMe7iMs0HLOURbyEJ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739509837; c=relaxed/simple;
	bh=LBVQbJqCKoTnQCMAkfeFflqYhqyXsuOqiytkT4FKTME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AwKtG3qdoOLcXxH7ILi8siQzejWh9f1AoWdHrwMEUMNfkCKe3Fmm0wXAIhBUNiv7W82W2JytKW3HuIPInU4lPMddbjBpDZqrLx9adVCXZTBSqLuacXL1x1nd5iuDM64HK5WBGolJGczrI5NbAonRkPhnkCyygYDrpcs10XOforM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=r0VQsCrl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739509833;
	bh=TU9MibKIcP2JEIRA4JJ52B9Np0nLr4f2S80eJ2L9MaI=;
	h=Date:From:To:Cc:Subject:From;
	b=r0VQsCrlXNINBaBXZbgsvFiKfIWbPoilmPi5ojcBBR3PPDZHPyJcX2wlhimgCoVRy
	 6bcMLvUpyqKhKReRgF+KlSZH7Y1C8IRLXq4EDIKgeRmtaRyT4JMGUGcAF9X/CPZjaS
	 3j4dF4FHPOjDR2uPF3dn/R3RejtDxwML93uum0kH8THj5V0RcxDIYbMzEuJygxrgbP
	 z6VJXlMqD9KHrRSnVIoL0IEoDRdRDepjNzTNTIjOb8IA8DcIIlLW5jzvAfNSbXi5bl
	 EhFFHhVv5DK93JEwtrrqBQ5jQUoXG499YOLqje0FiW6xtnw4DMFgplZqdjWNWeCzmQ
	 skSZs/Flo7HiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YvKr90cLdz4x4t;
	Fri, 14 Feb 2025 16:10:32 +1100 (AEDT)
Date: Fri, 14 Feb 2025 16:10:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the jc_docs tree
Message-ID: <20250214161032.1ef4902e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SVszTqMOUG2S5RTsJw4By6f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SVszTqMOUG2S5RTsJw4By6f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the risc-v-fixes tree as a different
commit (but the same patch):

  b48e0f696b71 ("Documentation: riscv: Remove KPROBES_ON_FTRACE")

This is commit

  ccc71244f95c ("Documentation: riscv: Remove KPROBES_ON_FTRACE")

in the risc-v-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/SVszTqMOUG2S5RTsJw4By6f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeu0EgACgkQAVBC80lX
0GzMpwf/aba3Dhg45+cBXXo6kQe5I9I2XgAjJf9ssd9utjczLznXohMDRBsq6WdJ
I2VaWvqNwZYtDNnH5LOfruUVrvuZxQkekeScdO8MIxxv/UIwXhtXSG0YFMQf7zWH
hO3ezP1AHmgb45Yc/LZ/cgpkzFYTgZ/nBiHCsBK9ZjvDR0hqTuu/djj60MIr1KtW
AC+uAP9uO58934DJqZu/k8e05dXCj59Ah0PC2sm+G03qh4cdBSrpYQ4Mx2tmqY/V
d6H6u5EweQeDJfweUwbqQBfzQCgwCLCZmsztWhMHsO3jfRkuUn2ENMgGZ0dSr2mq
dFAhaPFuxJCImOOlw8fbceuBKrr6mg==
=6JNa
-----END PGP SIGNATURE-----

--Sig_/SVszTqMOUG2S5RTsJw4By6f--

