Return-Path: <linux-next+bounces-6873-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4FABEB65
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 07:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C51D37B1059
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 05:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2784F221573;
	Wed, 21 May 2025 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kiQ0wI4h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F621A9B23;
	Wed, 21 May 2025 05:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806171; cv=none; b=agqzV8+qtNsUPjn0SaA+wnXbfznBXhGw5HqZ62/1NqBu4jtkwJ/JuaAl4z6/di1PELe5erV0/ATXX+cMH4M6OpQkicJoMZQ58YGqH/VuPAav/JyCpy5+Cx+TONsLE70PA+PRbXqbVkgIiRIbXKe/mj8IJADZKHkeLpVHOYhOElA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806171; c=relaxed/simple;
	bh=bfHK6tVkYsTsQf+l5J/IzgcORWn1682W2UW01xz2M08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X3GHhV+Ex/oI8DYM5G4SMaE9myvHBbSWE+zPIP5C13fb60mu3eav1MUG6cUohtScVExQaHIetSo8mjByfDWkSAxpX78vBvCEFVRnNTOhHXG6PbgyCe9A+mpirM/J9wLSarQKfqxlXfNhC7bIQS9HkR0SSTbnXeXTtOzYWRyCyRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kiQ0wI4h; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747806162;
	bh=SvpdY8EkyNmtwUbnxZfC+JBBw/CTNoWRvsweydvqOGg=;
	h=Date:From:To:Cc:Subject:From;
	b=kiQ0wI4h3D1SuUhEu+Qrm2prhGT9q+CUGtHRHHzyT7AWqox8QaGRG9MkueRoxSuah
	 +XxGALN0hGOwc7uh1JHNke0Kpz8BlX0EpMYJUz41foYVa/Mh08ACNFilPsOwb0TWiH
	 KkBd75z30Si0GN/ZyatEywcI9YXln7M2umusv6UirliHVdemdbjEGqbC5ZLYlj9YMv
	 KIz1r9+45a26HIXl6iQVhkj5rQJq1nouaVnxPU1804GUR8SeNHuMVhrP4SN9AcW7gN
	 ETRWX+H2v0nlTJwTn8+k9db8a1iTYvX9tXMfp3bWudQ3bL72TLeKYP9p16ZL3IRW81
	 FZXFSxtzEXm9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2L0y1BRgz4x3J;
	Wed, 21 May 2025 15:42:41 +1000 (AEST)
Date: Wed, 21 May 2025 15:42:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mmc tree
Message-ID: <20250521154240.4aacf1b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/icK4Qe=OJAPihsqXNZSeu_6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/icK4Qe=OJAPihsqXNZSeu_6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mmc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/mmc/host/sunxi-mmc.c: In function 'sunxi_mmc_probe':
drivers/mmc/host/sunxi-mmc.c:1391:38: error: stray '`' in program
 1391 |                                      `"Failed to allocate DMA descr=
iptor mem\n");
      |                                      ^

Caused by commit

  15252b7ff0b3 ("mmc: sunxi: Use devm_mmc_alloc_host() helper")

I have used the mmc tree from next-20250516 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/icK4Qe=OJAPihsqXNZSeu_6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtZ9EACgkQAVBC80lX
0Gz10wf/RJccDH7Elq4rXEcbD5SL81WPFcMYTJUeYTpGXIayfvccsNBXlAArqsvi
xnMBLKhtv4CvM+7D1mLZUqPXVZ6stdAiTxmy6nxroqd1GFG7sGfTQIke68daK6w7
IKsOYSXroY/Wmx+FIXRxRZwbRns7Xby2sitM3l+O5eQI/KTpsZBhr3gDtEeMfhkN
70Z9mju3b4VhrwaGbpEFNc+AURhe3WgzDKZZ6U7W/hUU4YLINI3xiq3drJeUpvwh
VS36n+AAJa5zoOP4DdyhQoHCdDwKe9DEL8A9ZWAkzFayip2///vOdyqyUxUmmRCB
RUB3fbAtZLGdKFlzzGnOc5+pVTIk1w==
=pCB7
-----END PGP SIGNATURE-----

--Sig_/icK4Qe=OJAPihsqXNZSeu_6--

