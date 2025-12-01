Return-Path: <linux-next+bounces-9283-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB134C958A5
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 02:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 671373A191C
	for <lists+linux-next@lfdr.de>; Mon,  1 Dec 2025 01:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0347841C63;
	Mon,  1 Dec 2025 01:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IQJr62MA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456462556E;
	Mon,  1 Dec 2025 01:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764553847; cv=none; b=OtJYUwiuSRmiCEoh60N5YPPa/62ag6uVCEYp/y1gzdVDG3CqX3nCnPxLlyk1XxP3nfyWzHao30AuhI3kHVjVAujc4rA+LAxYdhVfPyoPL4D6fJokntcfVz5UQXm1iNGqu6n9Fcaqrzj3QpCJXvdjtouTv/8ZY+wgL7mBCC2eOeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764553847; c=relaxed/simple;
	bh=Mif9Zigil0AW0ISu+I3m4lXjaIK8Gp9K8Oqtor2+gdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sAhn8j0+UekIICbjNDGlVB+hskdRUQ7Tn/zeTpapfMKc+PSmuPoqZFSvfHAOSbop/WVXBxlA5WLhNdeRQGz6yibSntt+AOAYb5K9L7FWpoe1PxKcn/n5xdwYZk+88ODylqD6Vledww/yOEXlUwd7tcW8ZyxzJkNzkDv3dcaL9EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IQJr62MA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764553842;
	bh=c5b7i/0zjKjtksGby5AtXKUL0HZrrLI0LZuOWbgHG5Y=;
	h=Date:From:To:Cc:Subject:From;
	b=IQJr62MAqZ631mND6v7X485ghnjztbryXR2m7XnE0749B3l95g5REvIWJexD9D/mp
	 SF3rv9e2g6J4j1tJMD0gNMEyeevcJPGBL8CbqGzDGbWsyxyDD82zvqlnk9dsgw1pMx
	 GeoYn6gk5+bBhTXlLP+O/0NOZLx5jS9bFw7F+ye8zqV/GvWMqXlsO9xtS+GaZD1lFc
	 RMy1kVVXy5COR4amz6CYPzvfnsHkp4kGaLN4IXyJ4RN+o4OtuxGx2Y8Lv/6itqAQHQ
	 6HnDlCUNEF18fi22tlzV7iJulqU3yuUrUwVWgRpvdZyLlSwC0cxiFkCPwFFntiSWEI
	 QcRkUXPKx+a8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKRgh2K6sz4w0L;
	Mon, 01 Dec 2025 12:50:40 +1100 (AEDT)
Date: Mon, 1 Dec 2025 12:50:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>,
 <sathyanarayanan.kuppuswamy@linux.intel.com>, <yilun.xu@intel.com>,
 <sameo@rivosinc.com>, <aik@amd.com>, <suzuki.poulose@arm.com>,
 <steven.price@arm.com>, <lukas@wunner.de>, Sean Christopherson
 <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Tom Lendacky
 <thomas.lendacky@amd.com>
Subject: linux-next: manual merge of the devsec-tsm tree with the kvm-x86
 tree
Message-ID: <20251201125039.36b9f37d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/niL=hMrEl741L_UMjloUSLB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/niL=hMrEl741L_UMjloUSLB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devsec-tsm tree got a conflict in:

  include/linux/psp-sev.h

between commit:

  c9434e64e8b4 ("crypto: ccp - Add an API to return the supported SEV-SNP p=
olicy bits")

from the kvm-x86 tree and commit:

  d65a2856e8b2 ("crypto: ccp: Enable SEV-TIO feature in the PSP when suppor=
ted")

from the devsec-tsm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/psp-sev.h
index abcdee256c65,cce864dbf281..000000000000
--- a/include/linux/psp-sev.h
+++ b/include/linux/psp-sev.h
@@@ -882,10 -857,8 +890,11 @@@ struct snp_feature_info=20
  	u32 edx;
  } __packed;
 =20
 -#define SNP_CIPHER_TEXT_HIDING_SUPPORTED	BIT(3)
+ #define SNP_SEV_TIO_SUPPORTED			BIT(1) /* EBX */
 +#define SNP_RAPL_DISABLE_SUPPORTED		BIT(2)
 +#define SNP_CIPHER_TEXT_HIDING_SUPPORTED	BIT(3)
 +#define SNP_AES_256_XTS_POLICY_SUPPORTED	BIT(4)
 +#define SNP_CXL_ALLOW_POLICY_SUPPORTED		BIT(5)
 =20
  #ifdef CONFIG_CRYPTO_DEV_SP_PSP
 =20

--Sig_/niL=hMrEl741L_UMjloUSLB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmks9G8ACgkQAVBC80lX
0Gz1KAf9Gy/4vPz1E+UB3/E0X3ctVWcucFm5SQpTqXLNwrC/z44E13brGKYof9cX
OX4bZ5hWzAGunegLpmx+da/Ff6G8Ep2uT2ygz/kbK9Pa9ft7wO1dFVcqDJxcRs1L
eXdle3x/zphEcGD98UDAZkZLVpO9mwd60EqqChuYlOGOc9tpOOxCXXxdhKh+mkHM
sgJHrNP9DCePzTf6v4lQNF41GbhYkIhZiE1qix39458G8wDQiyLpLt+jQg/nPFcF
QLL1xFi35wlKsmYKgoC6nX/o7Uh3sVRGUNJhKNurFa9go97GyKTKbAWsRcOVsCD0
LRlF1bGDXXlyUujWq+lVNvGGL1BnWw==
=En+O
-----END PGP SIGNATURE-----

--Sig_/niL=hMrEl741L_UMjloUSLB--

