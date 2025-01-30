Return-Path: <linux-next+bounces-5347-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C29D1A23630
	for <lists+linux-next@lfdr.de>; Thu, 30 Jan 2025 22:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BA341671A5
	for <lists+linux-next@lfdr.de>; Thu, 30 Jan 2025 21:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0A91EF09C;
	Thu, 30 Jan 2025 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XjHy2oBF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8680B1AC884;
	Thu, 30 Jan 2025 21:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738270833; cv=none; b=bvCXt/hGjFMDpk41eFikojz2g1SQZCeUQbk/oA5JWWHXF4VJXYnxVgKdDIHePollXsxmZkZdF/EKze8T/LO2gxaoOTJSswOgiCBvTXt/R3SJ8ZqttSirXIGnGHatEfbwr9n7kawlVM2zppHJSa8IxFVA5otYNSSIGGDDjyIzoNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738270833; c=relaxed/simple;
	bh=TNEtc1jrbCHuAJHUce56kQqMzIaAJpWYj/R++z6UrrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NqxtdrI1VzpxA8MvRZj9G5qlr2/BE/IBvnMSlJBeuX8/mC6k8NSZg+MwMWcFcPXI5UfoxN3y3a+uvGPDN5gT+8VrjOoFZJz2KKbsA3T8PBSwVAO+fnxgFmn69IoiksEzA4uUoVqfTZ5v2bp1NjUbe79OQ5/x0qJa48xFdyYYIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XjHy2oBF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738270816;
	bh=p5TAPcLc2Lf7hL3HfcChxzt2rpLORS3bOGQnvKMTigM=;
	h=Date:From:To:Cc:Subject:From;
	b=XjHy2oBFgFigd+jGQ64G6/BM0CyBYXWNTSRLPat/+c54uubqJ+uOtq06YCXXaieaM
	 Oz4chDfq/yfqRccjY/9Ennyc5FluRA7Ox2LRI25NQ51uhn5/Rqo2SgImwPEYP//0CW
	 1QmQ+VKfS2oUWbowK5NRY0tJSUTSlNS4WugWx+UkCdDuhNHcHHHZx0LJhcQC0m2+qw
	 O+zPCi3EPf7N93Mxu8YN/fcbVismuBDUwvvXEr813Vh4VDjqP68IjTLWxqwRldfAEA
	 fKF/iYFAE1wP+lREDiw1zK/HReEKhUtFGGhGr0BOieiK92YCn2Zm9jLPSv+PQmAOAL
	 r9AI2v5el5OKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YkWcw6CJFz4wj1;
	Fri, 31 Jan 2025 08:00:16 +1100 (AEDT)
Date: Fri, 31 Jan 2025 08:00:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the kvms390 tree
Message-ID: <20250131080025.7ebf51ed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HIO.+T3skBDQvz6wP_ruDai";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HIO.+T3skBDQvz6wP_ruDai
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  369e597e8c13 ("KVM: s390: vsie: stop using "struct page" for vsie page")
  86b532e981e3 ("KVM: s390: vsie: stop messing with page refcount")
  a8fc2ecfa04a ("KVM: s390: vsie: stop using page->index")
  a7dbb38e6560 ("KVM: s390: vsie: fix some corner-cases when grabbing vsie =
pages")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/HIO.+T3skBDQvz6wP_ruDai
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeb6GkACgkQAVBC80lX
0GwhNgf/VxuXKu58EhGWv0LWFQ4ln38HVCndldKPsl3faBbeJERZ560hoH7sd9Mz
I7TyWpLAyU9SCHFKt1hrOP33PQgtWzgf56Mpa01MGWW7W4nQw+KsMglngz0miJdc
shrrA1rYTTwPv4fv5byLpHYa500FSQ0WnMo62VPpP3KTaM+wHi/1Xi1XLNjEdw6N
lU27OsBFzLtCudOVHWxm0oV3aHam/fXSVYhdzQJGMJfD9AhtLcVog+gDYmY5wQI1
3iucb8I9EEGlGd3UzaMC2T+zR6in2QsPcIQ+gjnWLYMRxRtTVAWqVWTqByryVun8
L9hSFLqdx36I7lhFbOn9y9OB3rodPw==
=X84h
-----END PGP SIGNATURE-----

--Sig_/HIO.+T3skBDQvz6wP_ruDai--

