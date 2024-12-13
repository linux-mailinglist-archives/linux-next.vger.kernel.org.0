Return-Path: <linux-next+bounces-4950-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D059F03CE
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2024 05:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9561161932
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2024 04:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CB417E00B;
	Fri, 13 Dec 2024 04:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ufnDTbeV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2490117BB1C;
	Fri, 13 Dec 2024 04:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734064058; cv=none; b=BzPYFCDsDA3cm7+ogj9DjTzoSMDpuJmZH7FAT6UEY5/Yr+bVx0GlU0Tfw/TOrdFriUZY3iV1IELo7AWGb5qsvnA/PRdT92ao9WrmsHY0uMb0Usf2xb63ih8QbhVFjQ7YBFUp5Eg514PgbJ7R3/3WYKK/HsM2NX2WtBnfBSvoEac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734064058; c=relaxed/simple;
	bh=P9FzMgsDNQiQEqla+I1NYutIjf+OxA/eBuMn6E73Izc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bBKV4sYaQ4f/iT3gfie3XqUsAOEJUZTQ8j+T9Fpc1j12A57Xc9QYEGtlEagdEj8uDiNOHSWTdda6jI0Mp9jl64XjLDAjBAc6OHMuu30rDplOt9Na5aKclApq2t7Sx6y7bSFHC/kir36BDerGML6B/VVDTd1QrroIdPbvS3t24A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ufnDTbeV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734064041;
	bh=R4RS9aXN/qd4Iqna0ELG7oO770bnVedPhpvlCvqDjp4=;
	h=Date:From:To:Cc:Subject:From;
	b=ufnDTbeVF/nLjBNmAK+FXcGouslF3GwwpyCIDJqoz3VTJasIITRhcZzGZXWlZG3ne
	 uArWwlf0EpaTVBv384IJaaKM7p6lEL0GQyFqy+pSdghoH05q219lTcFUO3QJJd6tkb
	 LLX9nc6jOGBtRSS3O4NSxTgXNPnVGrWcPhqWrIGnws99pSKuYuwwpxuIwDgTrQaDso
	 bcSOZNdqJ6MGvAQ0qVokUu6l+Vo+bBytm18DPCDnZW78ZwkJzuk3+MXC3zPZiFn7G4
	 QuSqLr79wLPw1cyrdspDbs7YeH5SCluOl4zYCM15BTYjysRZASWLPvxiLeGdrLMAJP
	 qRCiiQO/1Fgmg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y8bsP558Hz4wvd;
	Fri, 13 Dec 2024 15:27:21 +1100 (AEDT)
Date: Fri, 13 Dec 2024 15:27:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20241213152724.589b38d8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XD0S6oure0LJke5yfnfmvEt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XD0S6oure0LJke5yfnfmvEt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (powerpc
allyesconfig) produced these warnings:

samples/vfs/test-list-all-mounts.c: In function 'main':
samples/vfs/test-list-all-mounts.c:175:58: warning: format '%llu' expects a=
rgument of type 'long long unsigned int', but argument 3 has type '__u64' {=
aka 'long unsigned int'} [-Wformat=3D]
  175 |         printf("Listing %u mounts for mount namespace %llu\n",
      |                                                       ~~~^
      |                                                          |
      |                                                          long long =
unsigned int
      |                                                       %lu
  176 |                info.nr_mounts, info.mnt_ns_id);
      |                                ~~~~~~~~~~~~~~            =20
      |                                    |
      |                                    __u64 {aka long unsigned int}
samples/vfs/test-list-all-mounts.c:186:83: warning: format '%llu' expects a=
rgument of type 'long long unsigned int', but argument 3 has type '__u64' {=
aka 'long unsigned int'} [-Wformat=3D]
  186 |                         printf("Finished listing %u mounts for moun=
t namespace %llu\n\n",
      |                                                                    =
            ~~~^
      |                                                                    =
               |
      |                                                                    =
               long long unsigned int
      |                                                                    =
            %lu
  187 |                                info.nr_mounts, info.mnt_ns_id);
      |                                                ~~~~~~~~~~~~~~      =
               =20
      |                                                    |
      |                                                    __u64 {aka long =
unsigned int}
samples/vfs/test-list-all-mounts.c:199:74: warning: format '%llu' expects a=
rgument of type 'long long unsigned int', but argument 3 has type '__u64' {=
aka 'long unsigned int'} [-Wformat=3D]
  199 |                         printf("Listing %u mounts for mount namespa=
ce %llu\n",
      |                                                                    =
   ~~~^
      |                                                                    =
      |
      |                                                                    =
      long long unsigned int
      |                                                                    =
   %lu
  200 |                                info.nr_mounts, info.mnt_ns_id);
      |                                                ~~~~~~~~~~~~~~      =
      =20
      |                                                    |
      |                                                    __u64 {aka long =
unsigned int}
samples/vfs/test-list-all-mounts.c:218:64: warning: format '%llu' expects a=
rgument of type 'long long unsigned int', but argument 2 has type '__u64' {=
aka 'long unsigned int'} [-Wformat=3D]
  218 |                                 printf("Failed to statmount(%llu) i=
n mount namespace(%llu)\n",
      |                                                             ~~~^
      |                                                                |
      |                                                                long=
 long unsigned int
      |                                                             %lu
  219 |                                        last_mnt_id, info.mnt_ns_id);
      |                                        ~~~~~~~~~~~             =20
      |                                        |
      |                                        __u64 {aka long unsigned int}
samples/vfs/test-list-all-mounts.c:218:89: warning: format '%llu' expects a=
rgument of type 'long long unsigned int', but argument 3 has type '__u64' {=
aka 'long unsigned int'} [-Wformat=3D]
  218 |                                 printf("Failed to statmount(%llu) i=
n mount namespace(%llu)\n",
      |                                                                    =
                  ~~~^
      |                                                                    =
                     |
      |                                                                    =
                     long long unsigned int
      |                                                                    =
                  %lu
  219 |                                        last_mnt_id, info.mnt_ns_id);
      |                                                     ~~~~~~~~~~~~~~ =
                     =20
      |                                                         |
      |                                                         __u64 {aka =
long unsigned int}
samples/vfs/test-list-all-mounts.c:223:47: warning: format '%llu' expects a=
rgument of type 'long long unsigned int', but argument 2 has type '__u64' {=
aka 'long unsigned int'} [-Wformat=3D]
  223 |                         printf("mnt_id:\t\t%llu\nmnt_parent_id:\t%l=
lu\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n\n",
      |                                            ~~~^
      |                                               |
      |                                               long long unsigned int
      |                                            %lu
  224 |                                stmnt->mnt_id,
      |                                ~~~~~~~~~~~~~  =20
      |                                     |
      |                                     __u64 {aka long unsigned int}
samples/vfs/test-list-all-mounts.c:223:69: warning: format '%llu' expects a=
rgument of type 'long long unsigned int', but argument 3 has type '__u64' {=
aka 'long unsigned int'} [-Wformat=3D]
  223 |                         printf("mnt_id:\t\t%llu\nmnt_parent_id:\t%l=
lu\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n\n",
      |                                                                  ~~=
~^
      |                                                                    =
 |
      |                                                                    =
 long long unsigned int
      |                                                                  %lu
  224 |                                stmnt->mnt_id,
  225 |                                stmnt->mnt_parent_id,
      |                                ~~~~~~~~~~~~~~~~~~~~                =
 =20
      |                                     |
      |                                     __u64 {aka long unsigned int}

Introduced by commit

  7b1da09dc088 ("samples: add test-list-all-mounts")

--=20
Cheers,
Stephen Rothwell

--Sig_/XD0S6oure0LJke5yfnfmvEt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdbt6wACgkQAVBC80lX
0Gx3WQf/U1sfweyHsMGdtQ+F98Je2wMo13zHhCeQLwyh1sjOzNIrXBMfH7hupe6A
3YY2864JbtmSBTplw9C3+JlHwCPov4rrGDNM+5Nid2Js01ElWWyYST0FB21mjxnO
rv19TOLdnlvSTEzi7F7Rw32yCwEMr8NTavQMKZX/NF65KXliERfxrdapcmjCGpZg
zd3RHy6jW19vkVdvu3MKxcnScHjh5glY9P6lYBj9U4p+HJc8HKAmr6fquM8zdReS
q8ZGEwNhRvlYW/IpzKRFoFLZL8xl9+Z6R5NhTG0OP75eFG5Nb7qf6Ao6jZ+IQAhK
H5NKN7d2Mitq5wc4PbOnrPmeGpxtMQ==
=lYg6
-----END PGP SIGNATURE-----

--Sig_/XD0S6oure0LJke5yfnfmvEt--

