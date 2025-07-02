Return-Path: <linux-next+bounces-7302-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAADAF0963
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 05:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A9071C07C62
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 03:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567FD1B424F;
	Wed,  2 Jul 2025 03:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ElBZTiMO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B2A53A7;
	Wed,  2 Jul 2025 03:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428066; cv=none; b=RP3XwVYwd1M0v/bV4LWJXm87Pp1Oyy3tkxzl0P0U6ozGdnzcHZueAGchyCINlsnwONRm/Y8S+qbA6rE0jkTpBcK7MB0rredWwBXSLjoqibHuDeKqESsxXewtumrim1Mt5geNeg4ru+USPOyMAKpP81W+KpFisRSqJ51MQz+5qQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428066; c=relaxed/simple;
	bh=LdU+dkzBEIs4oLJIEJx9BpM3DaT7vcvhC5QlwuEqWnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nq5u+NviY7jGpg59/tIzmeUlc0yb+fYy+daX5DKSjaE/kz9PITC8LLNLlKn3e21VGH+fL68Vtoea5EtA21iu7rL0u7aWZnH4eHLBIxnAl2KiZxBgT03N+1XLAHqA8ymZXwfb9phJEbNDeeUQHECkjgzVpODhAia0NPzVFBN/OQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ElBZTiMO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751428040;
	bh=gsfJdj3kOKMDjWKfERPOp0hcr5b+XQgzYS5upU8W+h8=;
	h=Date:From:To:Cc:Subject:From;
	b=ElBZTiMOVoMnamuiFf4Miw8glTslPuip1ttCZ38/jioejW9PVbLNLuV+nnrAvHgRs
	 AW19/JedVMmbwCCiuLULPcddBukfTcKR3MlmPtg9/t8Qj5JwGO8PJO9cRAw2iAnfZg
	 jedC+NHXbHkmMr7au+xd9Jubn/942XonmCS3PlVz8su2AMbuXCgo6SF+zXM3Uit51f
	 VgweiyThltphLicxiGWQWKzue8JNnpW4sMuxmftMzxbMVdNYk/guzJcwk7LuTQoVer
	 WaS2ezgJtysFJMFHGhCMBYal1PhW7olCIXIMq+oxiv5Xos7+w5We2HscXAb1zJTTak
	 pR3IOR/Q01eHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bX5SR74Tfz4wbR;
	Wed,  2 Jul 2025 13:47:19 +1000 (AEST)
Date: Wed, 2 Jul 2025 13:47:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the input tree
Message-ID: <20250702134732.55fe8f91@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+JXXZLsHOVWQIs9S3vKHdfK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+JXXZLsHOVWQIs9S3vKHdfK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the input tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/input/input.c: In function 'input_bits_to_string':
drivers/input/input.c:1007:13: error: implicit declaration of function 'in_=
compat_syscall' [-Wimplicit-function-declaration]
 1007 |         if (in_compat_syscall()) {
      |             ^~~~~~~~~~~~~~~~~

Presumably caused by commit

  de7dd46319bb ("Input: stop including input-compat.h")

I have used the input tree from next-20250701 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/+JXXZLsHOVWQIs9S3vKHdfK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhkq9QACgkQAVBC80lX
0Gy3HAf8C0Xm+s8M22J7febzW9AHhijolBPsHmRGnDWIoXyNbGbls8h1mfide0AI
nihY+jDqslzabZIbRzQND6JMwN+RCJ1t1eR5hzmIR3nCwgzZXv5x/Hhgc/Tuobwg
0FI2+n+yrLBqX/Hud/D98lwDK2NrFpA8YWJetG4ZJMT5muxH64ztHrYcYBriip9W
QdvzG75idN2S4FSedOc/LJ3KnYskl/sVUv4kcxMmYajBSjtlSa+mhyS56d9j9NbT
BXZETVClD3QEJ0wE8JrcHpB20xewHCGQCl3Su7e87p78Q3rRWHULGBZVkwIxfT11
6WhwiT/KpqSaRhoRHfcikz7i+z3fUQ==
=1ekD
-----END PGP SIGNATURE-----

--Sig_/+JXXZLsHOVWQIs9S3vKHdfK--

