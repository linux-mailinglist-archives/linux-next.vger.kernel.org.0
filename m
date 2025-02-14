Return-Path: <linux-next+bounces-5443-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492FEA355AE
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 05:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7FF16A6CE
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 04:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16B817C7C4;
	Fri, 14 Feb 2025 04:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qquM9zI6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEA8126C1E;
	Fri, 14 Feb 2025 04:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739506849; cv=none; b=gttGWPTAc/WklbHAHzOfJJrqtUagPgOmTiPDTjbpdObQPPSnnFVmagjnDUk3pk29nk54yJdTAXzML4QKXhdm1UH7imk9v6ehjwlPlFZN+n6Hc09qhOm4PHnoy4j1ZBP0bg7+GZZ8YCU2m6/AvpBM0uD9VBFAtgzITKmvhcdC10c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739506849; c=relaxed/simple;
	bh=hMhgsqP+SlSecgQuccfb6JJbDROZbX+/PbUvlEGjQrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EdEUjrjaz6rtNTQgHbdCuDH7Dps++hb6bTWi+sRDvYzutThLB7Eq8Rd5kli/Rx2PmyrOYnr1jWqHJpztDyx7MopN8CU5Fr35DKVDjajdEAUbgPR4od8RXJ6iLCDYfP5KfEuquUa+ZwjAmbtECsVPb9v8xbgrj4r1G7m+KU4KtB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qquM9zI6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739506838;
	bh=9/ssZ65URliQZPEzMieUPiGLV3VY7oLuhzmM2zZ4t9c=;
	h=Date:From:To:Cc:Subject:From;
	b=qquM9zI6soaWlRkGeKP7Dv77AaULe3angPnvXR09CIHf1DzQ4NfLZszdRu2cHfQ8I
	 Qn8WIEynoXZFuiDUg2ejjOxTe0+uMVDtMMfnuCloCiTQcL3D07TKe15HgxaUhvmZJ5
	 +PT+yILClSRR8/61Q3szshIK2Eg4LkShHU4RtwDKmjDXqbvmq12QXfP0XDvIdNfVbC
	 sBDxGFzNhOVSRWkdAfuQAqkN9ZhiElAgKerjvjhW2iGZEMnBMZ0gQBjukzvE+DM+j5
	 N0o5VzqCK9m5CHX2n7mUfXAi0g/syobGZYqosmWT3wqM9tv1LzwB/FbsWyzt1JgsoP
	 HWZg2NrVq/Buw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YvJkY6zh6z4wc4;
	Fri, 14 Feb 2025 15:20:37 +1100 (AEDT)
Date: Fri, 14 Feb 2025 15:20:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the perf tree
Message-ID: <20250214152037.19c2622d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8Yr4DTxe2PHVV3hCQs0VcWo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8Yr4DTxe2PHVV3hCQs0VcWo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the perf tree, today's linux-next build (native powerpc
perf) failed like this:

arch/powerpc/tests/dwarf-unwind.c: In function 'test__arch_unwind_sample':
arch/powerpc/tests/dwarf-unwind.c:48:34: error: initialization of 'struct r=
egs_dump *' from incompatible pointer type 'struct regs_dump **' [-Wincompa=
tible-pointer-types]
   48 |         struct regs_dump *regs =3D &sample->user_regs;
      |                                  ^
arch/powerpc/util/unwind-libdw.c: In function 'libdw__arch_set_initial_regi=
sters':
arch/powerpc/util/unwind-libdw.c:19:39: error: initialization of 'struct re=
gs_dump *' from incompatible pointer type 'struct regs_dump **' [-Wincompat=
ible-pointer-types]
   19 |         struct regs_dump *user_regs =3D &ui->sample->user_regs;
      |                                       ^

Caused by commit

  dc6d2bc2d893 ("perf sample: Make user_regs and intr_regs optional")

I have used the perf tree from next-20250213 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/8Yr4DTxe2PHVV3hCQs0VcWo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeuxJUACgkQAVBC80lX
0GyIPQf9HBGxt1ngj3Prbhmo2hpMX82eTYmd4rDMsjv5Qs29/FNZgiFMcmWm2/iw
/IFt9j10ic0Joso+WwQ3AwnPzvkm7SxVxkWcj3yOLZNjlf2aSN38NYg+Hj2MdcHs
e1R4m7AaxAOjvwFPr/Pn3h0dLbsLaeNmqscQsK/lgGI6h0rhpntwlWfAIfjdrerb
OH2O9hJwVfmeky9VJuIWNWCPMOUMlLLsG5T4yXcM4olZLYxvVyHdJWTnGjNrhgqu
7YKS+m7VC+xPP/mHk/mUD+xY/IA8AHPadNYVZvOVfirgwtGO9866p7XRRduVYy2e
aJUyM3GY284hudNE3j/Hv3l1Vhjahw==
=i201
-----END PGP SIGNATURE-----

--Sig_/8Yr4DTxe2PHVV3hCQs0VcWo--

