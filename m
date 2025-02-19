Return-Path: <linux-next+bounces-5492-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E3BA3B07A
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 05:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B314616A62E
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 04:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF1D1AC42B;
	Wed, 19 Feb 2025 04:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HGp0Wb9i"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090F19AD89;
	Wed, 19 Feb 2025 04:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739940743; cv=none; b=LRENrfVsHwWnIf+5Duq32q/fah1Fa3KqL/1MXFJN8Do5PKNL0HWn3Q4FZfHz6dOyb6+uA7TAKOrZp4WbO0a2/aezu5zznIHEi7MNsv/XBHbc1cLA+VEx8mcakA7F0pQ7n8oYucypO9+FiCiLZ6a2+ERAZcXjet3B/qrbCDYUleI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739940743; c=relaxed/simple;
	bh=YSfN6hCXtUpwOadsANbH/yLK72rbl+zzC1MR0KNgMOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OzdPp4TP+G++fqQxrTJvv2Int/P/fqenVklvRCfk+TbNpcaXnE5C9MjYKS7auyvgo4wlAHjb5oPaN66qXoUz5W228djASgOMVwOk4b/8Lstzp9yp3ffyxdgEi7I3X2LfZrhdcAwR2jNja2zQr6trIkdSujDSRtovTBFnUdH81ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HGp0Wb9i; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739940735;
	bh=3+iU7EKoX/5Rk4/IeFtgoM5sUCK2YoGoITIMcv+fEY4=;
	h=Date:From:To:Cc:Subject:From;
	b=HGp0Wb9iPZJ39IBiDYnTl+ci8j4eK5TKkqFfxPseAaqdPo8R0/uY4I11rNjv0/rIh
	 kSKg2zanR7M1yfYiSorPeVZpnPZF/Wvt1i6g+Pp5zl0FBXFS+jgIO1ql0QqDj8R0DT
	 bwlGeGERfbAHrwbnVZuFMwhTYzTeYj58kRO+FnwHbnmZkzEt/8z0Wg/eO05/P/GbfL
	 YGBniM6BsqCm3rlcBEI1U2zYkXxpAHvCODBmBttq0y6+AJG6Tf5ie+kdIOvDBKkEeK
	 RVYuwpIQp3Smw4behBlpS9tWBMzoIxwPnWQCubYoRNsq47jShD3MpPO6Bxe9+TOpbZ
	 abwQt2pMnn5dg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YyPBl383Rz4wcr;
	Wed, 19 Feb 2025 15:52:15 +1100 (AEDT)
Date: Wed, 19 Feb 2025 15:52:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20250219155214.1661ce53@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/76=95djz/ART0IKxNG4pDLL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/76=95djz/ART0IKxNG4pDLL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (i386 defconfig)
failed like this:

arch/x86/kernel/cpu/mce/severity.c: In function 'error_context':
arch/x86/kernel/cpu/mce/severity.c:305:22: error: implicit declaration of f=
unction 'FIELD_GET' [-Wimplicit-function-declaration]
  305 |         fixup_type =3D FIELD_GET(EX_DATA_TYPE_MASK, e->data);
      |                      ^~~~~~~~~

Caused by commit

  599382062e7b ("x86/mce: add EX_TYPE_EFAULT_REG as in-kernel recovery cont=
ext to fix copy-from-user operations regression")

from the mm-unstable branch of the mm tree.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/76=95djz/ART0IKxNG4pDLL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme1Y34ACgkQAVBC80lX
0GxAGwf/dgCch+KvutSgP6qZ5jVqAMmipfOD1PtJbMxrlh1vSfSFYtHD9TJjomQO
eead77a20J0rgs4BImAvOTAQln83WiO+y3nId40BYqf58cu5hFbCk7kdnjr2Zskc
EeYcyq7Gj9UDidoniWHhAQjUGkTn4gV/nyyhlvM669A8kkpoy6KzZCH6Zdb6WeNt
PwoAMNPLf94DaqUgnrjxvZMlgBScMaYuzQQ/JCyYGq5m6rpfP963Hd+CoUL5Mkr8
x4Li8SdS4iKTe4TzDMf50PPUUn0if3Gof2MN1Zpphl44Zo/WV+PHsL44a2K/UZcX
iywHt59pH2k0vSkISrmTcpMtOC57pw==
=XCO/
-----END PGP SIGNATURE-----

--Sig_/76=95djz/ART0IKxNG4pDLL--

