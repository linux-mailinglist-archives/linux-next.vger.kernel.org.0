Return-Path: <linux-next+bounces-373-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 753CC8107CA
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 02:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F9521F212FD
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 01:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93196EB8;
	Wed, 13 Dec 2023 01:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DxJM33ES"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DD1B7;
	Tue, 12 Dec 2023 17:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702431784;
	bh=kJaU2JTGNOSsbFtXofZUd1U0Nbf9C/FQpjhmSxjoQss=;
	h=Date:From:To:Cc:Subject:From;
	b=DxJM33ESLL/bxPYx7rOpgAAWenCpSfGRD1HDyTZfmRNQWNaNWkzqfoIC9oX3pi22U
	 LMkU7ORwXNuKySICRXVCBrFek4KcKabFr2nu8haiEDXgnnt5X55+UqK4HFwmeJJ/8J
	 qaSPP95bQ8f349gvhHYu3VMfFvscQ3bspNfLJ90uGNYHHgY3/RNcOiPR3He0PPQCqI
	 DvgPaZQYrf7rpFVTMdiTry6OQ0Ei3p58ebV1430+QK3gB11apHcXXashANgZonKREx
	 gvyr4aywZqi4sli36D3j7YOIJNp20QvtYM++vMGnUoXp98Xgdl93cilo6DDE38YFxq
	 DCNy/c06yrYMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SqdXl6PpPz4wdC;
	Wed, 13 Dec 2023 12:43:03 +1100 (AEDT)
Date: Wed, 13 Dec 2023 12:43:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <jroedel@suse.de>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iommu tree with the mm-nonmm-stable
 tree
Message-ID: <20231213124302.2a6281af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fBm6b//CFPRkuNN2Ov+FvBG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fBm6b//CFPRkuNN2Ov+FvBG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommu tree got a conflict in:

  arch/Kconfig

between commits:

  0eb5085c3874 ("arch: remove ARCH_TASK_STRUCT_ON_STACK")
  3888750e21cc ("arch: remove ARCH_TASK_STRUCT_ALLOCATOR")

from the mm-nonmm-stable tree and commit:

  8f23f5dba6b4 ("iommu: Change kconfig around IOMMU_SVA")

from the iommu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/Kconfig
index bfcc7c2dc039,3e49f862670e..000000000000
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@@ -301,8 -301,22 +301,13 @@@ config ARCH_HAS_DMA_CLEAR_UNCACHE
  config ARCH_HAS_CPU_FINALIZE_INIT
  	bool
 =20
+ # The architecture has a per-task state that includes the mm's PASID
+ config ARCH_HAS_CPU_PASID
+ 	bool
+ 	select IOMMU_MM_DATA
+=20
 -# Select if arch init_task must go in the __init_task_data section
 -config ARCH_TASK_STRUCT_ON_STACK
 -	bool
 -
 -# Select if arch has its private alloc_task_struct() function
 -config ARCH_TASK_STRUCT_ALLOCATOR
 -	bool
 -
  config HAVE_ARCH_THREAD_STRUCT_WHITELIST
  	bool
 -	depends on !ARCH_TASK_STRUCT_ALLOCATOR
  	help
  	  An architecture should select this to provide hardened usercopy
  	  knowledge about what region of the thread_struct should be

--Sig_/fBm6b//CFPRkuNN2Ov+FvBG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV5DCYACgkQAVBC80lX
0Gww9Af/UGMcvjfqSRAZwOdSvyH21px/hWPgXvYKq6RIPdV8fG22tLyfQnVUrKUd
r5LV6Pj+KL+UGu++xIAmBjVxQ4ySXmEWiqBGnh2qjOLa/6xjc74B2H5Eq/QmdDwl
SDWyyZn1KRW0hAWmJ5MpVHlrSVtsvR9v12DlDlUegPbb1mZ2Qsc2PY8Fa5ahrB/k
IJdCGYAGcDC9/l7tbTBUBzd5HVhesjlbeN3C9zTWBDzx6vkVFQr3iNDStwUC1AL6
4T9X92AEknMjPbQayo2Qckqs9oRiPqU9gTtDEcv2kjK8znE1WQZ5CUR/u/+u5Kg9
RkSIvP9+aPIw1nDoVVxJ4f14y3+Eew==
=jFGo
-----END PGP SIGNATURE-----

--Sig_/fBm6b//CFPRkuNN2Ov+FvBG--

