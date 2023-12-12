Return-Path: <linux-next+bounces-369-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C669B80FB09
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 00:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 615D8B20E49
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 23:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BA564709;
	Tue, 12 Dec 2023 23:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lz82nX2R"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D938A94;
	Tue, 12 Dec 2023 15:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702422573;
	bh=ReJYNCwEh7uJ5zxLU9iEyda4Z/if8JiHPAdQK0Jn6nA=;
	h=Date:From:To:Cc:Subject:From;
	b=lz82nX2RpePoauBh/lmHoWlp1WjGwXQ4ErOtMes3OFAuDQKPavWjxE+9/b0n5tlv8
	 NJqUfLFOTmKdn8n9p1FowxURtXgrVh6zGP3Q4tAj6x8INsvJ1YL1qDGIs9LGDo2o0B
	 eZuyIp/Ehl7wJGuAfoObcAi0U/1QrSDwe1A49ViM4GSAr/AlgF6LHa1YHpVCqERsmL
	 uhRiJsy06jx/N2YNSa7DMYl0/+HmdB/sh6O64MJ5p4h3sftJUVZjC327z8Y9EzRac0
	 mgLxAD1TdwFasA6bwaT18YicJKcbzL8rP+/8VmxNb/UNfY2bNUK+UgKjyQdMTfzTah
	 BHPJulD0FeDqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SqZ7d2rs9z4wc1;
	Wed, 13 Dec 2023 10:09:32 +1100 (AEDT)
Date: Wed, 13 Dec 2023 10:09:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the arm-perf tree
Message-ID: <20231213100931.12d9d85e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IkgUYuGrLs8sX_KIjnBEk_k";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IkgUYuGrLs8sX_KIjnBEk_k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-perf tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/perf/arm_dmc620_pmu.c:26:
include/linux/perf/arm_pmu.h:15:10: fatal error: asm/cputype.h: No such fil=
e or directory
   15 | #include <asm/cputype.h>
      |          ^~~~~~~~~~~~~~~

I can't easily tell what caused this - possibly commit

  a5f4ca68f348 ("perf/arm_dmc620: Remove duplicate format attribute #define=
s")

I have used the arm-perf and arm64 trees from next-20231212 for today
(since the arm64 tree merged the arm-perf tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/IkgUYuGrLs8sX_KIjnBEk_k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV46CsACgkQAVBC80lX
0GyA4gf/YUfqnBKLjOpmG+pY650Q1TdOxh/nRIm+NoKPyujpXyQWu9S9RWaAu07o
+tc08MsS3vg5HISapO4VLs2dpy5gwdwbIuFc4EBzjBNrt5ltYUBobKueIqe9Tbj8
rfBSXD/S8iSh80VwX1tpdn7bZ7b0BnImjy9bX5KRVRmmlwMCkpnuxPbnPm2+gXdQ
rnM00sQJiZE4ZLAdQvdTygJHgyWs1fBvAVV8fIfORBJC3EuFCZIMaUahSiGq++iz
uI7nfuTVtk6Ee4hqB9MgRDMYwW9prXdnQ0XKFxB0rmWBiqaUVs6mGkkAm0HKPpII
V+ccqvtDUXWDGy3hIGnYULDv6kaZjQ==
=9PR1
-----END PGP SIGNATURE-----

--Sig_/IkgUYuGrLs8sX_KIjnBEk_k--

