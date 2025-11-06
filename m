Return-Path: <linux-next+bounces-8867-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA1FC39024
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 04:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 618043B4611
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 03:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBA017C21E;
	Thu,  6 Nov 2025 03:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZcGop6ib"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8DB245021;
	Thu,  6 Nov 2025 03:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762400371; cv=none; b=nVJZ++Bx2S8dKTE4vJa/94CSbQe7xUlax0avQajjdLy9ttmV+yTPf/72njLXp8DQ39IiqgqjKpkAs/V8CvvS0VVnevtEpG99whIZL1WVjBtwTWZm8ivTKw3rGMUPbSyodKwVmz+Trol7S7ZJGjdTVTKT42JVKHsqjMxaJK+6EYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762400371; c=relaxed/simple;
	bh=uId4/CpFQDxbInOhqD/8T+14Me5d4KVh9+CGvd42pfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cFzMzOc9tSSyWEdR0ip2AVJQEPkaXtgJp7b6D2dmsI2pU/XHkTowQT5ZNQjWObs+hwTDzFk1idX1Wrpbt5P+3THlhxA3lEPJ6X049IPEjBhmSsB1QFHlR9y1tZWkQOIreKe0mseuCLg5iimUsflHktJ8eKIpcyBz+Jl0t/z++rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZcGop6ib; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762400367;
	bh=cYiOB+odVFEERlhCxFAMJvt8dekYarit9FeXZzblRjc=;
	h=Date:From:To:Cc:Subject:From;
	b=ZcGop6ibIObqAzSUoN6Qvx8gwQUGsu0GRHIC1ChRN7L2gsRipVZUFT2udKdWYqCd2
	 sZWKTSx6Qra4AodKyTprtxu/w6MKxBj5pqfqbHajQZG3jE8me1vKPZwAKted/YQL7c
	 dlOWiHzWMUx+t7xXVLIh2dLKBMQiZCHjWNPmLuXZ5vNggMftQjGtwLEFooRqi+/2G9
	 S36yD5abt+wsEeXjQRmB7yK9dNZuTH+nnJQpODGXPFjG9r51CwfjfzWD7PKtSkDS3g
	 r9Ag54XMKFvKZNTQfj+YUa9DsbTI0jdyO7L5NJ7LpaJSqOAsyPjGo2Rgio0nOFI9vE
	 x/qbf4Z7S9xFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27Gk5lndz4wM2;
	Thu, 06 Nov 2025 14:39:26 +1100 (AEDT)
Date: Thu, 6 Nov 2025 14:39:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Joerg
 Roedel <joerg.roedel@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iommu tree
Message-ID: <20251106143925.578e411b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=hp=1mclBtCcsszdGnww6Wk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=hp=1mclBtCcsszdGnww6Wk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommu tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/driver-api/generic_pt.rst:32: WARNING: Literal block expected=
; none found. [docutils]

Introduced by commit

  ab0b572847ac ("genpt: Add Documentation/ files")

--=20
Cheers,
Stephen Rothwell

--Sig_/=hp=1mclBtCcsszdGnww6Wk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMGG0ACgkQAVBC80lX
0GwMJAf/aIpJ783uUxo2i6owZd+BHwOaSKN2pRNe/DX6HUmioWEbHyHHys07vR/w
H1jYXcoxPeCJ6sbcH5zu1zbnAwtfl20gAlxvX52DkOb6k0UVeCxr3CDAKzQoOKmw
NynvcLR0B8VzXjbUmoi1PxCnv0weHhnw3+5IdRH2acPDxxpDCmVouGU1KQnN2YAg
YvlqFeR4uC24VfL2Pbvmzd6MHNXPPma4f+/KoZ3NWSOlzRKI8hiyhk73RWgob3eN
aQD93eplP4Xobu9sa4uCb38LH20MZ89oW3PmB90NKdCE//TLpFuca73jIBmMS+Ii
8npX7IYb4dwlpaapEsPa6NbMRGEA8Q==
=pLds
-----END PGP SIGNATURE-----

--Sig_/=hp=1mclBtCcsszdGnww6Wk--

