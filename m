Return-Path: <linux-next+bounces-5691-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48372A562FF
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 09:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8188F16D518
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 08:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DFF1DE2A9;
	Fri,  7 Mar 2025 08:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qM9dvOR4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4CF1DC99A;
	Fri,  7 Mar 2025 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741337567; cv=none; b=RMUm561TqLh/0Z4tp0BJZCAw8bUlii+UZwHzUalJ7aMaojxqZStzvsGyBMkASPQnX2ISsxYewRFBFwySQ5ONDY7JHFgmr4fhrPAg7fpxt7ScVTIRjV91BLPxIFouGwgexMw8m9HcttsKjrqzPqkgZZPw+fg8V/uGjafMqvuXrWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741337567; c=relaxed/simple;
	bh=pQVjEYDihDWzunWDVZQfgamt0Ju8gmV5ZiHJoHoMQSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sQuM+gao+nARN3g8G2PjzaV1dpt9hVi6JtZ7+l1FfPhEAmCicNpPxN26+ddGNI32Z9Uq+NpVMuLpbVbcOSPUSrt57ERuvVV3ESa4MWk+g/bLtgZyPBfnAiNDJrXXFip6LqjXpEOJ94nBM62Dhmvz2Ng2Dgy8odG/Axcicc8JYNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qM9dvOR4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741337560;
	bh=8KYe0K5/EUIGx7MDzEiip76aGLNfwpMg4hefbcVgJQg=;
	h=Date:From:To:Cc:Subject:From;
	b=qM9dvOR4FQPDx2K814xhsb33PP973kWfQ5KARNj1efPbVc9eAlmRWoHLmEZ73l3Ii
	 hGWRyR+lQUFwakfGfafr461miSUX4ug3weBvO14GX2u1MFOV+TbH2dt1hZJ8ymNyo6
	 acX/5SsMRPhxlsnZ+tBMPaNDUyhY8+2xe1Wb/wvoJE1qxd8tvGo1ZBdUajfqvBN9NV
	 QeVgEtDCF3SAnz+YYL6YuhzHQxa1dhGQ7B0elTpOXgXnFt0rbioLaLKX3oJL94LN1f
	 J8gM8Dishth4nqKedzW6Q3Sx8FBbZlZpclT+plIneMe1M6dJGdSRiR3wPytugTC0gE
	 NImzZ0ytjHAgg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z8Kmm1jv3z4wgp;
	Fri,  7 Mar 2025 19:52:40 +1100 (AEDT)
Date: Fri, 7 Mar 2025 19:52:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-xe tree
Message-ID: <20250307195239.57abcd2d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P7qf_0ryaazJlc3CUq5mX8J";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P7qf_0ryaazJlc3CUq5mX8J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-xe tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/rfc/gpusvm.rst:73: ERROR: Error in "kernel-doc" directive:
invalid option data: duplicate option "doc".

.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
   :doc: Overview
   :doc: Locking
   :doc: Migrataion
   :doc: Partial Unmapping of Ranges
   :doc: Examples [docutils]

Introduced by commit

  45f5a1efac90 ("drm/doc: gpusvm: Add GPU SVM documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/P7qf_0ryaazJlc3CUq5mX8J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKs9cACgkQAVBC80lX
0GxqXAf+Kh3IaRtFZepughoZOQm1LGWdVQJJ0Z9JBz9IuZOKpSts2cIuvRnDAD4g
Y8eRh9xgXOozIqM0KsQ7WQIMw7keMI+iPTde60pho2XzMJ0jHm3LVfj5+QMN7F6N
ipK9tEO5YrXmp3zRBb27ZLEHxOKvt5SNW8iYUmWYSTz7TeHB+wUvAvawSdaxgHy8
+cyh+WhuS5EB/OoJVv8P6q0t6TOQjoPbyX8l9G2nyeQS8d+QiyT0jWff7y9SJu6q
fzn8xwkQXhdbSvXKhFV4HT+T7KjQoGKNQ/loGRDu2kc4FQ0GRpzt5eZs5U/mfFuC
8DL4SX47DgMZ5gnr22QJ3JrJ0N8Epw==
=IPQu
-----END PGP SIGNATURE-----

--Sig_/P7qf_0ryaazJlc3CUq5mX8J--

