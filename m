Return-Path: <linux-next+bounces-6157-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B168DA7B5AE
	for <lists+linux-next@lfdr.de>; Fri,  4 Apr 2025 04:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F127178AB3
	for <lists+linux-next@lfdr.de>; Fri,  4 Apr 2025 02:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC5F18AFC;
	Fri,  4 Apr 2025 02:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OedX3mTF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D962101F2;
	Fri,  4 Apr 2025 02:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743732873; cv=none; b=IhOKVW1UcrAoQ6WvFJoRYUYmX7o+GrV76FOJQ0ztQfgsxZdRsuGU1wJweHPfFr9VVIunn/m3zbFBHCWywuH3x+Lo9h+ADl6MMl3wrPhbBmYLC53wjUpUO1SP2uY2o7OE/3qsDGLM5kI9XbC3a78WVGN6jEvPyXOpRVtzKIs9280=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743732873; c=relaxed/simple;
	bh=2mKI4z0Frpa/qqVDML5zmeU/xtwfMz9uvtsjOQyq8zw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aIv+mcbzj1r0IanHQ5qrlYlgZkSd2fUmL4mXcaib+xmcW8jKx4s7HWDJeo3k/vsgyXvmYYDOkRP/R3ekZTs5f3qHXH3qCz2kcHjpPmUDU0BnKB0ZTXE9KWsCGZiMPF638DYptQ8Rrdd/oPrWTNjj1C6iS6YxYe8CK0fv3Vd1fBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OedX3mTF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743732864;
	bh=yOkKZpKjbKRIZVJGVJx+YXfUxsP1mjuF5AFHyYEONZ0=;
	h=Date:From:To:Cc:Subject:From;
	b=OedX3mTFqn2vvmelxD1YtYFOOvZLEnjmD1iHmK9VWa2QiQx45DObPGh+zuGdQoMIY
	 jjj7i+8znpEC+l3OQWnOcb2C8WsjxfOLYUd6YeFBFFN7JnaKrGjVN985UfPsqlhLB9
	 631msn83urYuJwgoWsB39iEwtUHEhchTgXlQZilpGg5LLeEC+9rBZf4aO8lW2ceetp
	 N18L2K1Wu/ItrhrxMfgx4XxCm0v59ZDcLNOVpFR+Cv/B+6WLMJa1Cy5KcL9DXnq2f6
	 cVfGFBSqqHwYK0NM7MbSBG6swcY2NFs+YDUSquXDdxvtPADtbOVxT8nXC5uhSsIACN
	 zPHph357fcMjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZTMcJ1s9gz4x4d;
	Fri,  4 Apr 2025 13:14:23 +1100 (AEDT)
Date: Fri, 4 Apr 2025 13:14:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Zhiquan Li <zhiquan1.li@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20250404131422.405a5652@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YrRQ5xbSCBCy8Hzr3BM4ozU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YrRQ5xbSCBCy8Hzr3BM4ozU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/kdump/vmcoreinfo.rst:335: WARNING: Title underlin=
e too short.

PAGE_BUDDY_MAPCOUNT_VALUE(~PG_buddy)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_offlin=
e)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_unaccepted)
---------------------------------------------------------------------------=
-- [docutils]

Introduced by commit

  77b3dbad6b01 ("crash: export PAGE_UNACCEPTED_MAPCOUNT_VALUE to vmcoreinfo=
")

in the mm-nonmm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YrRQ5xbSCBCy8Hzr3BM4ozU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfvQH4ACgkQAVBC80lX
0GxGLgf/aYsDB43tD+/kwrHuMcDyeYEf9mYxQJ3QOgOf8bexfvxgxMxKXPtNpOUp
X1/oRa3ybMCeXLN6d9YqDUPKOCwOEEgh0QnEovOXMZHsNZgRjFvbR//xiqrUHwWJ
u0lo/XsLpWcHjdeQ1CtoMc9pJMr6yoPdf6a1krReV0Fum/81I1mb2jwfNM6xcFcg
h9jm7OSpFaAIqmJjmbVtvAhgAK4TTTqQMn/yLOFyCGZV2pVp9jVUSgxr89czPcxI
GWs/KyRIV2jFZuYr9kFSwhaGovbXKe687Kbi2W9ceky7hdX5qHGsgivV/+ATkAsy
6QBhrC4m/afDtXwIczEVf+OQ1tndBQ==
=0erW
-----END PGP SIGNATURE-----

--Sig_/YrRQ5xbSCBCy8Hzr3BM4ozU--

