Return-Path: <linux-next+bounces-5441-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B01A351CD
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 00:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 544B416D210
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 22:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54792753F0;
	Thu, 13 Feb 2025 22:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gFqmlEOy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04322753E4;
	Thu, 13 Feb 2025 22:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739487511; cv=none; b=TS2Vzln3DmK05WXLsObLGvh4mwD3dbmXhoCPXguvxglrsNxyo/ualUlIIXdo4BUaKmVvOm2vMPTg9ru+FoiCppIpkBJfr6VvNLJdTSEDqDkufytvEmsECmPBJIPDoPB+NYJgtkHznfjom4FI9ypg3C15Uh8mJeQqdhu7zDkpO/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739487511; c=relaxed/simple;
	bh=pl5eDlWA6ePF7cc4Q0QQtxNqWR9ncyFEtPSRdm1YD8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GNFZ0N7DM6NOP7fZ7+S7YWDSbgsEvRX4ag6nqocS9VEcNPSGB8/2x/xB8deRXUgRxVsNnuEihjeJHwMOUoG0M6NzHbUSv53NyLNaOTwlSA3ZpE/iCzJh1kt302k4J628SeRNNq5R/27LXGlPjZ8zV5wXO8o5Ltvy3j/4RQvaN7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gFqmlEOy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739487504;
	bh=VmZXBAO1YU4VOG5/2bPJFI2vkGDrBFcYFL3VSKWh1jY=;
	h=Date:From:To:Cc:Subject:From;
	b=gFqmlEOyw+0s0SKzuvC79mxpKccTQBq+uyuV8RanCb7inni3/wMd/NXAx4muKUrVE
	 hmBwsGf/LWl1MjyDlco7ZEg0yep8OnwzRUKUc8Xyq2Bqs2w3dEFKBWOV/L2YYM4k7X
	 1/3m7kVYi2mgqDqsm2BU+LKSqxhbmRdlIZN035dCcFL6QKP6DsxXoHUNJG84IFMtll
	 7pwvFzebcR9eY91s2tXas7d1BK9htUkDnBMsj6yrFhIYt0SwTcJD2YNAvEqXftjZj5
	 I7ENPY9Wibs7gs67jq6/kOto4eYec6c9gtNqLVSt2EWG/Nh4z8xcEuyL8Y7rtaIxoC
	 0h2fGFqyi8s4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yv9Zm0WmYz4x2J;
	Fri, 14 Feb 2025 09:58:23 +1100 (AEDT)
Date: Fri, 14 Feb 2025 09:58:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ext4 tree
Message-ID: <20250214095823.2fdf796f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7sC=F_=hi+Q17s8aZejg+69";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7sC=F_=hi+Q17s8aZejg+69
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ext4 tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from fs/ext4/namei.c:28:
fs/ext4/namei.c: In function '__ext4_find_entry':
include/linux/fs.h:1258:12: error: 'struct super_block' has no member named=
 's_encoding_flags'
 1258 |         (sb->s_encoding_flags & SB_ENC_NO_COMPAT_FALLBACK_FL)
      |            ^~
fs/ext4/namei.c:1602:27: note: in expansion of macro 'sb_no_casefold_compat=
_fallback'
 1602 |                 else if (!sb_no_casefold_compat_fallback(dir->i_sb)=
 &&
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  ab00acfcfc62 ("ext4: introduce linear search for dentries")

# CONFIG_UNICODE is not set

I have used the ext4 tree from next-20250213 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/7sC=F_=hi+Q17s8aZejg+69
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeueQ8ACgkQAVBC80lX
0Gx9EAf7Bz24LLyg8t0LOiN8GeDVj5swQ3JY2NGe/xhyNBbq1ykJri24fDczwcqP
x4r8WsmNRrZb6RvOj4Of3dmvnRNpjhprs+qp5Wd5hYCBu7hze3Or+vCmef6Wp43D
H05RnQdtIbb9BKJZiNwbqtP6Ac3SHrP2l3yHWk4rXHfoPH5Ks5YIkVUOvzXnDW4x
1boJDi2Z4MsixAhwfu/JIIcyRwHLwyr+vLLcEMCiuDOaJ+JM5hm/s3N67M0yE0o+
PGFEYRDEA3urPHylwT180kmEWU1yi7iI9UywcEmmm3qRVwCVppRs32+EbkyORv3/
dKdsKcSp3XCJgFzzHZbo0YXT9m/hKw==
=CyeF
-----END PGP SIGNATURE-----

--Sig_/7sC=F_=hi+Q17s8aZejg+69--

