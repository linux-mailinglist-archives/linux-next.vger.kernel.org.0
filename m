Return-Path: <linux-next+bounces-8186-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FA6B43264
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 08:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C04D2567DEF
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 06:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89121265CA2;
	Thu,  4 Sep 2025 06:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I+xNl/gz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F53013E898;
	Thu,  4 Sep 2025 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756967398; cv=none; b=RS554By1XSZ9Tvl4DH7W8Vp9lAKYPe1DS+8eiPhF2vwFCFSNaM114TFAVUsALs1ff8ZiZjYwitWGFCB3WSNmIuTZHgeL953roa6ggQ2UM/+R8/k1suO+0Ergwguyu3jBm5SacqilSl9nVrfpSJZM/C/xPK+kptdwPqBcfOt/iBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756967398; c=relaxed/simple;
	bh=4czrmzMSLDZz9viX00RqnyuaxWvciCiyNyWN2NZMdaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CLQWRD5Ar5CT2bENRLhuG2biUqtrt/e8inQlUoQv+Lg6y9jYo/ZGf2btQDtYfyztp+nxajrdrXAr25rtIG+B6tUFxKVSY8LK0nLCDSujhBDsbKVwHIOQySZ23eyiY7n0zNeuA9V9+Zk9xjh4yJUKg2Jh/uZ8b0h0sGCn2crI8sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I+xNl/gz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756967393;
	bh=/IfI4aUxxzPIGU6x5F6FwaHaumw0fBrBLP2BK0P5mUs=;
	h=Date:From:To:Cc:Subject:From;
	b=I+xNl/gzG53KeIwqo7yHwLWPpfu/HX5lSMM565R3U6XmuVbf8pbnIoCtr4tJO94SE
	 25giOPSKQbT/fmgNoKH8DQrE1RTHSg00qR/RpVKy8I1UWApS94tEnGcVfr/HPN9z0J
	 9rk7uHejOr6sVplLWRRrQGhy1k9+Bad/26QO3RWLmDDRet76XsjVMTFNwtZTKgOMeD
	 3ehVVJ8q7KRuzo0y4xyq2hF625CeypMzXkUGnfvKBbe1x/chlheBZi+7L9hStQvg8+
	 7hvUSKjE1Lmy4uBuvWR8vlKvmceCZip+LfLhASaM11YetyQ3vCh6BBa5rI/nhYXoFN
	 jWDTu2SZkUSpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cHV2S4b27z4wB1;
	Thu,  4 Sep 2025 16:29:52 +1000 (AEST)
Date: Thu, 4 Sep 2025 16:29:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@Oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: linux-next: manual merge of the slab tree with the mm-unstable tree
Message-ID: <20250904162951.365fa2ea@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oYqV1IYTlMqEE7LTHPXVo=s";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oYqV1IYTlMqEE7LTHPXVo=s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the slab tree got a conflict in:

  tools/testing/vma/vma_internal.h

between commit:

  da018ebb7157 ("tools/testing/vma: clean up stubs in vma_internal.h")

from the mm-unstable tree and commits:

  cbb6a30df135 ("tools/testing/vma: Implement vm_refcnt reset")
  6602bcbdfbad ("tools/testing: Add support for changes to slab for sheaves=
")

from the slab tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/oYqV1IYTlMqEE7LTHPXVo=s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi5Md8ACgkQAVBC80lX
0GxnwwgAgR6n+0Q9X971emDrVe74htmI9fO2fdhmHeTDOwNSJdgAYFJOIgQuRq3f
KsX/vGNLPOyVW2pYQFvFvwOfjD3NfE+sYloBrxzrKvtjz5mrUb6CZlICDMkax8M6
+D/OI0rfBsqDZFn+JWTmYX+oYS05Tcihf/pwT23wQeQZXKZU2hyGXImwdJ0RzIrm
FhvqIUaMDNCvKZ70TNWHBGC5Yf7gHXYZuYg6vOGtFK7U85X+wTtNqNonYPGmUjt/
R9WWkwccVkzhBtYP4pgKfkn6Lj/pHtgdlUi/qiIZaQPdAKSKjzctOyQSSK1ux4iK
9Z60rrQB2ZzD3kPdrcR7aZkFZX3Uow==
=MxWw
-----END PGP SIGNATURE-----

--Sig_/oYqV1IYTlMqEE7LTHPXVo=s--

