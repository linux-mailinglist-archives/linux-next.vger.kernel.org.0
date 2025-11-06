Return-Path: <linux-next+bounces-8865-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2639C39006
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 04:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A05993BA5DD
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 03:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82767E0E8;
	Thu,  6 Nov 2025 03:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qBcpUvAT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7C82C0265;
	Thu,  6 Nov 2025 03:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399979; cv=none; b=eS1ohiF/L9uGNEHLmfpSeZ4fmUlTmCVLBDjcJFRgl200H5Tnf3ZeCpooO9VSczkVTwZYpCNtUjHNQx6B8VzC7/VjPnKIRHXvPULeAleCkyf/cSMhsFdkFq+8I1CgesOJNQdA0v1z2dPCjwVeaS5BW0f7kO6koBsgIzWOtSKxmwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399979; c=relaxed/simple;
	bh=RH1ijha1MrDHYJctdTAb0EvYl03aoxyabxxSyFsflTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jtx/hnLVue48II9EbBEG0lgCa7yBy56XLC/0Fy5WaHzb+7O90f4rImlq28+3QEHSkdpvoe125d+es4Cl9XU4A7/NyNjrRhvz38FOs8nXrnTM1KEwgPPwTV/5Oo2uV063vepohQAvvGEWA8jlDttQ+0SlU8ii0TAWMn1dbOxuMJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qBcpUvAT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762399972;
	bh=yPp+FKxVYAXZY5MHLnaeDhoOLp/SX3bq3GOz87rKi4A=;
	h=Date:From:To:Cc:Subject:From;
	b=qBcpUvAT07M/HUsItGuNJ92m3k519E0s7y/bTr7HZo4fAl+wFET44l3KgNwlJb19X
	 sSBJJKrni2lVFcscFAZSLl/rBS5k8GzeGuG87Dhx1QhfMhOG07WH5NYN0vQA9AbQht
	 EdZM3CeFu24Xjya7fex2ZICdn0rn6II8YV4fAutd3h4xJro3jqxo5Nhlm3sJ/7K+EO
	 3knvFTcpKhEcVE9xILGdxkJ9crInybGdG8UFNflJwcHEa2Qedcbn1WJBrgm6arFOkp
	 yg0uvg5jynMpnwKekifuApB9jep1/rWf4qtAEpDb0Z8lFyUaBXN0Vv3hBeAZcAB4kR
	 r9O1lyVi54hYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27782NN3z4w0q;
	Thu, 06 Nov 2025 14:32:52 +1100 (AEDT)
Date: Thu, 6 Nov 2025 14:32:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20251106143251.43f92fc7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BNdfGA5oOB3L3rjssvLB4q0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BNdfGA5oOB3L3rjssvLB4q0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In Linus' tree today's linux-next build (htmldocs) produced this warning:

WARNING: /home/sfr/kernels/next/next/include/linux/ethtool.h:495 This comme=
nt starts with '/**', but isn't a kernel-doc comment. Refer Documentation/d=
oc-guide/kernel-doc.rst
 * IEEE 802.3ck/df defines 16 bins for FEC histogram plus one more for

Introduced by commit

  cc2f08129925 ("ethtool: add FEC bins histogram report")

"make htmldocs" was not reporting all the warnings for some time.
That has now been fixed and this warning showed up.

--=20
Cheers,
Stephen Rothwell

--Sig_/BNdfGA5oOB3L3rjssvLB4q0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMFuMACgkQAVBC80lX
0Gy5QggAhEfzqos+HHTkoew5KLfWkl4zJxGFl/hbbwx+subnvGCUXd25y0/awcoO
zhyAleW6itIYEjtDqzBdl46D5kswX11WtLBG+46qMUDr+GgPxW4/rk4VWFdHotKt
T/hlf/qW9BhwevM/2SgD9fb0JGx90TL0lhZ6L39vXZ2dZzuCh1zDQkwIjanGUtJ4
WBG1/4nUxafSU0/UoNPS656ivNYPMJ4WTRLFXmrujb2mfshyhxBo5/170LkU2tRq
W/uf146T32u1qPRi/s0dKmcSdzlHjYeRQe6zwcfEHgNNVNYtqdzhCSMV8gKkNys7
53LI3lcKIoxNKCEA7PlOx2dr4s5reA==
=vRiZ
-----END PGP SIGNATURE-----

--Sig_/BNdfGA5oOB3L3rjssvLB4q0--

