Return-Path: <linux-next+bounces-2958-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 985BD92F544
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 07:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85F3D1C21780
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 05:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F8013B2BF;
	Fri, 12 Jul 2024 05:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="K3OHIhU7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81CC13A86D;
	Fri, 12 Jul 2024 05:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720763933; cv=none; b=Jy8SMwfbPOCQYPsPzT+15GHaoJ0wMRpMOTvQQ/khFnMeb0ujOhrdCAJgLEPbqpYd9+TjsV0h1mKhdDo5By/+0t6Y4BCiqfEHVQzriOlnyx6bEJ76vtMD6cO3ubjZCMEc9X2MaZR28HikmCqtR/OwipQnRAN4iJe3GxtortK0Ivk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720763933; c=relaxed/simple;
	bh=lAxaCBrzhRlkFX9SSx0qkLYqR7+Wzdcd6us4sOF/HRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E5HmVufI1AwUr0C0/kQO597bWfaoGP/8UFCK4FJal4YwzeoQhoRfbDN63nQm1lEEk4hI6eOXA7a5y+dRqE2IY0AP4Qt7zoRC1Ag8i51QhY4LhhcVH/uWh7VY2FJgFm46KScrps8hNRMTgSbdTzpi79GiE+lCpHrccfanQcbpZr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=K3OHIhU7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720763923;
	bh=f4oChVHotZcLPWAj4I3MpuIu4/cNsZms0INNC0g2sLk=;
	h=Date:From:To:Cc:Subject:From;
	b=K3OHIhU7r17c9GLRQKB8JmdrlrdQTqcHtW+BM0+AMDQWFnXqYIVU0WRZopxoO7GAa
	 arNBSY7HTcFyOpwMdoqkhX0si5dXWAMr50s0L04mmgi8FAxD5WENuHrq5Cr6VBi0a8
	 P0CwsYKmfh8y6rabY6cqeR6orNdKRdnOJduY1RKC1c8b64I/Jds04GP+Wxgxvv9wax
	 q7dHtuc+EvvgBJ6VUPcyyf/VNp0yLuVujL8YjESCrtdeel9m+VT4Ma1rtW2WX2LqYs
	 ZcEtWWaGwIUJ2oplw0HqVMR9jB04a2g5bB2lp3kFY3K4puxQpe8/j6o89zaRly48WE
	 mS6s/iMIHj0Xw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WL19t5mDlz4wx5;
	Fri, 12 Jul 2024 15:58:42 +1000 (AEST)
Date: Fri, 12 Jul 2024 15:58:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Lu Baolu <baolu.lu@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the iommufd tree
Message-ID: <20240712155842.240a85e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/opC3uHI9ru4P2979A3A73rd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/opC3uHI9ru4P2979A3A73rd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommufd tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/container_of.h:5,
                 from include/linux/list.h:5,
                 from include/linux/wait.h:7,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:6,
                 from drivers/iommu/iommufd/fault.c:7:
drivers/iommu/iommufd/fault.c: In function 'iommufd_fault_fops_write':
drivers/iommu/iommufd/fault.c:308:57: error: comparison between 'enum iommu=
fd_page_response_code' and 'enum iommu_page_response_code' [-Werror=3Denum-=
compare]
  308 |                 static_assert(IOMMUFD_PAGE_RESP_SUCCESS =3D=3D
      |                                                         ^~
include/linux/build_bug.h:78:56: note: in definition of macro '__static_ass=
ert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
drivers/iommu/iommufd/fault.c:308:17: note: in expansion of macro 'static_a=
ssert'
  308 |                 static_assert(IOMMUFD_PAGE_RESP_SUCCESS =3D=3D
      |                 ^~~~~~~~~~~~~
drivers/iommu/iommufd/fault.c:310:57: error: comparison between 'enum iommu=
fd_page_response_code' and 'enum iommu_page_response_code' [-Werror=3Denum-=
compare]
  310 |                 static_assert(IOMMUFD_PAGE_RESP_INVALID =3D=3D
      |                                                         ^~
include/linux/build_bug.h:78:56: note: in definition of macro '__static_ass=
ert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
drivers/iommu/iommufd/fault.c:310:17: note: in expansion of macro 'static_a=
ssert'
  310 |                 static_assert(IOMMUFD_PAGE_RESP_INVALID =3D=3D
      |                 ^~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  c7a0991733cc ("iommufd: Add check on user response code")

I have used the iommufd tree from next-20240711 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/opC3uHI9ru4P2979A3A73rd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQxhIACgkQAVBC80lX
0GyKTQf/UBP3aXqEV6Tz1KZHVO/yT9juZ2zy9vXD/3jYno0s5fs+x3jNWefStPrN
toZRHc6524FvkwqHBdLIG4DPp3X7lHSa8sg3tdG9cDLdKOpx2hTvoYx4fXW8G+e4
vNQ3H/GBO10Q3wpg7M0z0/lIzsLBvJhfrmQoeW0EAtMg+SKOGjOfUOjwg5a9kXwy
DX7lD77eSJJouZX1JqnAWkxPpgQPK2+4PemV9EJA1Iz78RUZp1PMpWVWhbCVsCEc
cAQA0UcSzpXns9VWGBjwDidwyVGbiAplmfiWIDZawDbb7sCQ03Yn1nPvz8dsSOTs
a8bcljiY5biMLwkejtaf/9j0jWbwoA==
=VInl
-----END PGP SIGNATURE-----

--Sig_/opC3uHI9ru4P2979A3A73rd--

