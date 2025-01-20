Return-Path: <linux-next+bounces-5262-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0931A1682A
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 09:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C882C3A115F
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 08:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8817319259D;
	Mon, 20 Jan 2025 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oOpmmnvc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36079154433;
	Mon, 20 Jan 2025 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737361513; cv=none; b=XGJO6WGxX/WuRhWInlDyLXdCFvKd2fUgPuqG5raqbuUK6DCwkrB6q19IbglTdmSRSayBB+bHJFJDN2ykVOEIGTzR2vPXj4qhe36DhIYK64WljK+yK3VXvITs/wUHXYdkJsvqEw/0F9/lry4N42EoKj+KWdYY5YYTb3mVvCslIVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737361513; c=relaxed/simple;
	bh=EBEolD8z8Bk0Fgckb6IMmJe1ztyw9qe5fZ1x81YUjs8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TB/lrqEL9S5QLOZ9mRYb6TItUR/D+TFxHmGSLUFs6ujUB8yqBtSyapKtEY+n9nOEDDZEAqt/24l9aqhmS7DXhYEkfABUx07X0Q+E7Jo7sDEAF2eSh4/MEOlxSGLZXxW1X/L8ugAmAzJ12+kWwgcXMyk8xaNglVqOTUIjxwN0sDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oOpmmnvc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737361497;
	bh=5H896g++sN3zgFTuYBe1iMlbE5GmXYNu0VnUMpFXkIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oOpmmnvcCLQ4qdmJDOsuoNVxWzB2gcBlRzBacHwdj4U1PimeNLjx0YAu2IZM711bJ
	 iJ7A0g4BFyFt641toXDKR3gOOn5v+F3+irnb/LvaTWcdhVJxXGYamA1AfAJbyKMBXx
	 s97w6wzTtV6ZcW721Fd07rik7zNCgaJ5olZj9fcM2ztB6aNj/WTkr86GaVozLQh3p5
	 DLy0SIOs5D+JU210wIggPu6XdfKnnFwSVl8YDFlG57tsSyXg1N6Fv3qdQQdR2PPoU2
	 mUq08SnfpKihbsevvfVPkV+011dhXGNMiGNwXbzao1x+XQCGiAIe3x9+env9ubfELa
	 jV9ehT3XIz4rA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yc3L11Y89z4wxm;
	Mon, 20 Jan 2025 19:24:57 +1100 (AEDT)
Date: Mon, 20 Jan 2025 19:25:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20250120192504.4a1965a0@canb.auug.org.au>
In-Reply-To: <20250114164812.2bfb505a@canb.auug.org.au>
References: <20241213152724.589b38d8@canb.auug.org.au>
	<20241219173235.6600d08a@canb.auug.org.au>
	<20250114164812.2bfb505a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OYdovQpGQ5OuIBVTrljChlB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OYdovQpGQ5OuIBVTrljChlB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Jan 2025 16:48:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 19 Dec 2024 17:32:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Fri, 13 Dec 2024 15:27:24 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > After merging the vfs-brauner tree, today's linux-next build (powerpc
> > > allyesconfig) produced these warnings:
> > >=20
> > > samples/vfs/test-list-all-mounts.c: In function 'main':
> > > samples/vfs/test-list-all-mounts.c:175:58: warning: format '%llu' exp=
ects argument of type 'long long unsigned int', but argument 3 has type '__=
u64' {aka 'long unsigned int'} [-Wformat=3D]
> > >   175 |         printf("Listing %u mounts for mount namespace %llu\n",
> > >       |                                                       ~~~^
> > >       |                                                          |
> > >       |                                                          long=
 long unsigned int
> > >       |                                                       %lu
> > >   176 |                info.nr_mounts, info.mnt_ns_id);
> > >       |                                ~~~~~~~~~~~~~~            =20
> > >       |                                    |
> > >       |                                    __u64 {aka long unsigned i=
nt}
> > > samples/vfs/test-list-all-mounts.c:186:83: warning: format '%llu' exp=
ects argument of type 'long long unsigned int', but argument 3 has type '__=
u64' {aka 'long unsigned int'} [-Wformat=3D]
> > >   186 |                         printf("Finished listing %u mounts fo=
r mount namespace %llu\n\n",
> > >       |                                                              =
                  ~~~^
> > >       |                                                              =
                     |
> > >       |                                                              =
                     long long unsigned int
> > >       |                                                              =
                  %lu
> > >   187 |                                info.nr_mounts, info.mnt_ns_id=
);
> > >       |                                                ~~~~~~~~~~~~~~=
                     =20
> > >       |                                                    |
> > >       |                                                    __u64 {aka=
 long unsigned int}
> > > samples/vfs/test-list-all-mounts.c:199:74: warning: format '%llu' exp=
ects argument of type 'long long unsigned int', but argument 3 has type '__=
u64' {aka 'long unsigned int'} [-Wformat=3D]
> > >   199 |                         printf("Listing %u mounts for mount n=
amespace %llu\n",
> > >       |                                                              =
         ~~~^
> > >       |                                                              =
            |
> > >       |                                                              =
            long long unsigned int
> > >       |                                                              =
         %lu
> > >   200 |                                info.nr_mounts, info.mnt_ns_id=
);
> > >       |                                                ~~~~~~~~~~~~~~=
            =20
> > >       |                                                    |
> > >       |                                                    __u64 {aka=
 long unsigned int}
> > > samples/vfs/test-list-all-mounts.c:218:64: warning: format '%llu' exp=
ects argument of type 'long long unsigned int', but argument 2 has type '__=
u64' {aka 'long unsigned int'} [-Wformat=3D]
> > >   218 |                                 printf("Failed to statmount(%=
llu) in mount namespace(%llu)\n",
> > >       |                                                             ~=
~~^
> > >       |                                                              =
  |
> > >       |                                                              =
  long long unsigned int
> > >       |                                                             %=
lu
> > >   219 |                                        last_mnt_id, info.mnt_=
ns_id);
> > >       |                                        ~~~~~~~~~~~           =
  =20
> > >       |                                        |
> > >       |                                        __u64 {aka long unsign=
ed int}
> > > samples/vfs/test-list-all-mounts.c:218:89: warning: format '%llu' exp=
ects argument of type 'long long unsigned int', but argument 3 has type '__=
u64' {aka 'long unsigned int'} [-Wformat=3D]
> > >   218 |                                 printf("Failed to statmount(%=
llu) in mount namespace(%llu)\n",
> > >       |                                                              =
                        ~~~^
> > >       |                                                              =
                           |
> > >       |                                                              =
                           long long unsigned int
> > >       |                                                              =
                        %lu
> > >   219 |                                        last_mnt_id, info.mnt_=
ns_id);
> > >       |                                                     ~~~~~~~~~=
~~~~~                      =20
> > >       |                                                         |
> > >       |                                                         __u64=
 {aka long unsigned int}
> > > samples/vfs/test-list-all-mounts.c:223:47: warning: format '%llu' exp=
ects argument of type 'long long unsigned int', but argument 2 has type '__=
u64' {aka 'long unsigned int'} [-Wformat=3D]
> > >   223 |                         printf("mnt_id:\t\t%llu\nmnt_parent_i=
d:\t%llu\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n\n",
> > >       |                                            ~~~^
> > >       |                                               |
> > >       |                                               long long unsig=
ned int
> > >       |                                            %lu
> > >   224 |                                stmnt->mnt_id,
> > >       |                                ~~~~~~~~~~~~~  =20
> > >       |                                     |
> > >       |                                     __u64 {aka long unsigned =
int}
> > > samples/vfs/test-list-all-mounts.c:223:69: warning: format '%llu' exp=
ects argument of type 'long long unsigned int', but argument 3 has type '__=
u64' {aka 'long unsigned int'} [-Wformat=3D]
> > >   223 |                         printf("mnt_id:\t\t%llu\nmnt_parent_i=
d:\t%llu\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n\n",
> > >       |                                                              =
    ~~~^
> > >       |                                                              =
       |
> > >       |                                                              =
       long long unsigned int
> > >       |                                                              =
    %lu
> > >   224 |                                stmnt->mnt_id,
> > >   225 |                                stmnt->mnt_parent_id,
> > >       |                                ~~~~~~~~~~~~~~~~~~~~          =
       =20
> > >       |                                     |
> > >       |                                     __u64 {aka long unsigned =
int}
> > >=20
> > > Introduced by commit
> > >=20
> > >   7b1da09dc088 ("samples: add test-list-all-mounts")   =20
> >=20
> > I am still seeing these warnings. =20
>=20
> Still there ...

Ping?

Please fix this.
--=20
Cheers,
Stephen Rothwell

--Sig_/OYdovQpGQ5OuIBVTrljChlB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeOCGAACgkQAVBC80lX
0Gzwogf/RY7XiBlKo+ZCmnFCNpJ8EcrVZQ2yoKfgOc3hDPVAe/v1lzDXlfqOL40S
rOSNzLQyA1Q8k4qpgrshdnkCjr78VCmuBSO7KPV3imfBSxervBn07ocVBkitZiBT
Txm7dST5yqeLyzWNGdaRGK60lu4Ad3Z2I+a2Vw9Ztp2LA64ZeKgpJtYLPEx0x2o1
ikI7M72DtkAFUUI6ixNhROIjnc3ADHffgvn/cZ2rSj9zFLBhQZotw0vt2vZur396
o886UFfpVSGUCsB1zzYpjWzk4C26c+EzBr2l6QI+nITJ1DTRoYbH1V6FsODe1pL6
/46DbnohpN4LSRUNx9RmTCBsif6smg==
=9u8n
-----END PGP SIGNATURE-----

--Sig_/OYdovQpGQ5OuIBVTrljChlB--

