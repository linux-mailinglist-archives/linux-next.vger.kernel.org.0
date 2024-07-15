Return-Path: <linux-next+bounces-3009-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5B8930E6A
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 09:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C4CD1C210C8
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 07:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CADE282FA;
	Mon, 15 Jul 2024 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U/hasQGb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D58B4C9A;
	Mon, 15 Jul 2024 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721026997; cv=none; b=hbWk7YN2ws+jSU2MENejXbYaP17400RBGRGV2Kg/uN9Ky4+C7pXW6Dw4Q90qyHvr9d1T0pEl18XRKb4qyXdTxKrIFJMWpNmSlmdfu0bwXqzkKVFSoXCKcTM+Zrna20iqjV9lRNH/lh/fo9zi7FCTuc4aY/TC4ksQwMhSjaiDSdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721026997; c=relaxed/simple;
	bh=KiJ0PQk2Kiwops9BcEqG1Vdq7eiCWMbjOH+siiqF7A0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qdOvwalrlS7EPBphhPNNht/Sm6RTqB86r1PBUekhHKq7ih2XX8jLjkMQ4ibQ7rp23ANeKCCPt9zcg0riQzMmWY2LIvitAc0gctIywlGk4f4kVKYHTlakD8tIpxdBEfTdJwej8i/GiOkJAluJEpSUXu8JpxDMeCwaecPRpS/XJIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U/hasQGb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721026990;
	bh=/wfDyRO+UtrSRuL0l6escmQClj3slsCAAteOJ1i+fAs=;
	h=Date:From:To:Cc:Subject:From;
	b=U/hasQGbmhLiiPPCduKSnxbui2PuB7z9cIej0oBLD9e2Qx8kYRMWjAn63oz6dRaPl
	 smOyJFy6YEm8pSH5DchIcXq7l8Jw5CFAGaae02O3fEvG42CVGiYRvxDHERvtuxNEtg
	 fgBp+ot8yAqwDnJvHBnAw5swweJA2OLMl4B325Z/EKw66/IHYXkRPMho798jecs+Rc
	 JCTM2qCtBy/m9cvOTsfnsd682gCGJRjBkq905V3i3SEZ9gAIzeqev6EM116uCIzg9P
	 klUqgfmle5H8Elc12YXVbwtUjNmHOJffHlNT2i8Ig2EXzNYfjpSpuYZ1X9KYJ8onEg
	 Vd3uAF7it34nw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMtSs3ztFz4wb2;
	Mon, 15 Jul 2024 17:03:09 +1000 (AEST)
Date: Mon, 15 Jul 2024 17:03:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Patil
 Rajesh Reddy <Patil.Reddy@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drivers-x86 tree
Message-ID: <20240715170308.029c367f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HHhhpusmJX7vbbU+/2tvGt2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HHhhpusmJX7vbbU+/2tvGt2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/admin-guide/index.rst:75: WARNING: toctree contains reference=
 to nonexisting document 'admin-guide/pmf'

Introduced by commit

  2fd66f7d3b0d ("platform/x86/amd/pmf: Remove update system state document")

--=20
Cheers,
Stephen Rothwell

--Sig_/HHhhpusmJX7vbbU+/2tvGt2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUyawACgkQAVBC80lX
0GzGjQgAgEIjAeIVD/png8GaVUCo5to+TC5rMkksVKwS+Z5hakYdldahjSPIlA69
TFOL8Mx6RffGFZY7HNPPhQ/zP0nju+wguYBzz2Vdgn2j5SaeyK7LVahfaPHX7/uL
gYsRiGZiZahF6tcvLnn8c+YIHPwnlNNgiWArhC5ugXno7kpCS59qyr97Wqu9ZSBr
2e3S1CwFDIb5ITU1g5YDxwAACAg3CIY8dcLZ9H5lkGhKGBRM3Rp7bKCTzVaO8v69
9gl+OkNu7q1FKOBZw80lu2e0M6Q1ir6ef8T1wH/4RE6XQXlsdfLt7YOyJqq2tIMx
8IpaWb1XRHjQmNE+qF47sHgaVaYAvw==
=xbOw
-----END PGP SIGNATURE-----

--Sig_/HHhhpusmJX7vbbU+/2tvGt2--

