Return-Path: <linux-next+bounces-5693-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA62A56355
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 10:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E681918929D1
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 09:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601521E1E0B;
	Fri,  7 Mar 2025 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p1kn++Yd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7AA1E1DE4;
	Fri,  7 Mar 2025 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741338843; cv=none; b=ta1jnt6KkFJBgCRBcyTzMR4olFYevea+GlG3noA5b2pTACR6DQxMVPEnioQqbQp7RpkzG83MRu2DAdYRS66tn76qCf81eaRVUSt2pOCpA6zjBdxOiIoMi9NODjbaw0vxy2+jcJLT6qRl16AA2v80mSWINOC5mk7u7HIrNQV8VyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741338843; c=relaxed/simple;
	bh=XnfD/fgaKHp4bHctWFBxLHFfm2qKdG7lN9jizt6AxJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jnZnAD5CdpIkazuDZioFdbwlmVD458WrXxFcp+nqTtN2UmJClu4Tk6fbkUpJwDrTJCpDb7tS21JVWKf3njSqqR/vfYj8Vkbw2okYri3Cz+5m//RYfvMjdBsxF654lC5GeV8g2y9oEHR9dNZQyE8FNuEfFCzthjKFwZ4qmpu8rA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p1kn++Yd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741338838;
	bh=9V+c8HMb5gavgSqK4bYoddJxssyev/HY6YhUMEZ1k8c=;
	h=Date:From:To:Cc:Subject:From;
	b=p1kn++Yd0og9oN/d4MscBLd5gh04SN+FcgAcyUmDFlBfu47R9Ri5Ut44gD9x85/QT
	 hWKNkCsr4vTZ78v5LaulJD8MOXBJ7Dv9laFSZk8csMauGGHEQ+6tBBD9M4sci3rCQb
	 NHBW38HN78HcFbo+ydGr4DsjKNJJheL8M24UaTClW/KHoW0Seb0/aRB3ccKd1DDuPM
	 EUPEmTDIZcRxkzcD7D/qA5pSfVERkhN/IiRbxp66QvF240gqtj4PheS3R/G3LRDZA5
	 13nQkZQ845LB8Jbn8CAjXBGRjsk35IsLRDjksrAEv9VCGvznJfuJ31GPBwPXVMafZm
	 xU4/31PPxthzg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z8LFK4TxQz4wd0;
	Fri,  7 Mar 2025 20:13:57 +1100 (AEDT)
Date: Fri, 7 Mar 2025 20:13:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hmm tree
Message-ID: <20250307201356.70dbe333@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7RlGhzKsqPof9uWMFy6gMeY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7RlGhzKsqPof9uWMFy6gMeY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hmm tree, today's linux-next build (htmldocs) produced
this warning:

include/cxl/features.h:66: warning: Excess struct member 'num_features' des=
cription in 'cxl_features_state'
include/cxl/features.h:66: warning: Excess struct member 'ent' description =
in 'cxl_features_state'

Maybe introduced by commit

  a53a6004e7a5 ("cxl: Add FWCTL support to CXL")

Maybe the indentation in the comments is confusing?

--=20
Cheers,
Stephen Rothwell

--Sig_/7RlGhzKsqPof9uWMFy6gMeY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKuNQACgkQAVBC80lX
0GwqVgf/cCdQKlonOaVCtyB0Y/CYG2VBl2IUBXZ7XWM9p23PPD93R8ANae7SLLYG
YibINqy+10ILJbp3uQ5qEgBq+Sj1/Fi8ZhMx68SrkMzWjnjEj9OVEAX9V2zRrwT2
MNV5rl3KDcvu8E9rHrSSGU84CH22MiSUMFFJBqNfZfcCN0vH8+pWFGXHpX8+KvDR
3FYzqOkS6mftREh0k8e5SjWrDl5cVef105ckeBPFQL9NZ0IOE9dIPt0A9Qxc+zvn
vKL8KKkScteM3qWztdJ3EPjuM9LzxbqMAlS8nBMFBjJ0T9jzaj4X0DMZ1GXz3S0t
KYpUNBAES2gcWHnnuVDCXb/KaXty4g==
=WEx2
-----END PGP SIGNATURE-----

--Sig_/7RlGhzKsqPof9uWMFy6gMeY--

