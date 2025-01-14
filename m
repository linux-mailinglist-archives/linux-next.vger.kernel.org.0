Return-Path: <linux-next+bounces-5195-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E95E7A1008D
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 06:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A5587A22AA
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 05:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D871B0429;
	Tue, 14 Jan 2025 05:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LoSoKjTB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBC41D555;
	Tue, 14 Jan 2025 05:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736833698; cv=none; b=SnMBkQRDnqANJ0PXK6OB4MwjocBdqLSjJ10R7t5UQlIiqEMXCFGqALfIr5h5eK1bkQlNrBmwVrpVP9fDmi+tQXvrWSBKvt8KUoTtL8iiLpw9MGN8azlASreD9BC/xf1M9XKJkqxQkGhoi3hobPOmeTHEt+4/PbAnTUg8LCUj0Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736833698; c=relaxed/simple;
	bh=MOQtQjhGSysYCiU1t0Mq73UL1aenejWn5rP0YeX4BmE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6OIz0bTusjIjDRPME086yTjn6yKBHaV/f1zTtYgENQBlmdDmkMzObGtfI2slmnBFAIkKLYdFZiDGL2eMLjIEcDkOQTzLkdWuP/IaBRt0D63t/JBFv1ZsfUBl4Rb8qL0gCJRq3s9+P9LhlcVZNM29NkGoQ3nxaSIIhOBAaluAug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LoSoKjTB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736833686;
	bh=NjP6TecvezQnHCM3tahnHdx2Yh7qYWPRF7I8ArRC+xg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LoSoKjTBTmpvtnsFi6deoEGkvafBgatNNXkWT/Ob8Trmbh2gvWtCxkfP1kJHLWVcI
	 RWIoNmPHuJlMpCndxh+l+0k6Wqysnu3FkPcIPYnfpVtXt69S/icIwUSEmMkWZ+ha08
	 F6K7Vo6UR0DmqyaWx+KPE73mx/MklBVJ0jwP/+eEbbIxwvMkkWmDZJFI2lnJ08covS
	 5PSc3Hxg0yNo2YFQJumkPIpENvhqlHkyviQHyr+WTDLogeqgaAFpM4060WXF/FG6l1
	 U4jd1b7PgmYXHccuvB7zsj9q2P+D2Iku7m4vw+TqpYR3RPowEEnDAk0t7gnaeoXMcw
	 T33eKwk/3Rhyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXJ7p3PJKz4wvb;
	Tue, 14 Jan 2025 16:48:06 +1100 (AEDT)
Date: Tue, 14 Jan 2025 16:48:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20250114164812.2bfb505a@canb.auug.org.au>
In-Reply-To: <20241219173235.6600d08a@canb.auug.org.au>
References: <20241213152724.589b38d8@canb.auug.org.au>
	<20241219173235.6600d08a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OzFdvUjK/UaF1tZZGtT6U6F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OzFdvUjK/UaF1tZZGtT6U6F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 19 Dec 2024 17:32:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 13 Dec 2024 15:27:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the vfs-brauner tree, today's linux-next build (powerpc
> > allyesconfig) produced these warnings:
> >=20
> > samples/vfs/test-list-all-mounts.c: In function 'main':
> > samples/vfs/test-list-all-mounts.c:175:58: warning: format '%llu' expec=
ts argument of type 'long long unsigned int', but argument 3 has type '__u6=
4' {aka 'long unsigned int'} [-Wformat=3D]
> >   175 |         printf("Listing %u mounts for mount namespace %llu\n",
> >       |                                                       ~~~^
> >       |                                                          |
> >       |                                                          long l=
ong unsigned int
> >       |                                                       %lu
> >   176 |                info.nr_mounts, info.mnt_ns_id);
> >       |                                ~~~~~~~~~~~~~~            =20
> >       |                                    |
> >       |                                    __u64 {aka long unsigned int}
> > samples/vfs/test-list-all-mounts.c:186:83: warning: format '%llu' expec=
ts argument of type 'long long unsigned int', but argument 3 has type '__u6=
4' {aka 'long unsigned int'} [-Wformat=3D]
> >   186 |                         printf("Finished listing %u mounts for =
mount namespace %llu\n\n",
> >       |                                                                =
                ~~~^
> >       |                                                                =
                   |
> >       |                                                                =
                   long long unsigned int
> >       |                                                                =
                %lu
> >   187 |                                info.nr_mounts, info.mnt_ns_id);
> >       |                                                ~~~~~~~~~~~~~~  =
                   =20
> >       |                                                    |
> >       |                                                    __u64 {aka l=
ong unsigned int}
> > samples/vfs/test-list-all-mounts.c:199:74: warning: format '%llu' expec=
ts argument of type 'long long unsigned int', but argument 3 has type '__u6=
4' {aka 'long unsigned int'} [-Wformat=3D]
> >   199 |                         printf("Listing %u mounts for mount nam=
espace %llu\n",
> >       |                                                                =
       ~~~^
> >       |                                                                =
          |
> >       |                                                                =
          long long unsigned int
> >       |                                                                =
       %lu
> >   200 |                                info.nr_mounts, info.mnt_ns_id);
> >       |                                                ~~~~~~~~~~~~~~  =
          =20
> >       |                                                    |
> >       |                                                    __u64 {aka l=
ong unsigned int}
> > samples/vfs/test-list-all-mounts.c:218:64: warning: format '%llu' expec=
ts argument of type 'long long unsigned int', but argument 2 has type '__u6=
4' {aka 'long unsigned int'} [-Wformat=3D]
> >   218 |                                 printf("Failed to statmount(%ll=
u) in mount namespace(%llu)\n",
> >       |                                                             ~~~^
> >       |                                                                |
> >       |                                                                =
long long unsigned int
> >       |                                                             %lu
> >   219 |                                        last_mnt_id, info.mnt_ns=
_id);
> >       |                                        ~~~~~~~~~~~             =
=20
> >       |                                        |
> >       |                                        __u64 {aka long unsigned=
 int}
> > samples/vfs/test-list-all-mounts.c:218:89: warning: format '%llu' expec=
ts argument of type 'long long unsigned int', but argument 3 has type '__u6=
4' {aka 'long unsigned int'} [-Wformat=3D]
> >   218 |                                 printf("Failed to statmount(%ll=
u) in mount namespace(%llu)\n",
> >       |                                                                =
                      ~~~^
> >       |                                                                =
                         |
> >       |                                                                =
                         long long unsigned int
> >       |                                                                =
                      %lu
> >   219 |                                        last_mnt_id, info.mnt_ns=
_id);
> >       |                                                     ~~~~~~~~~~~=
~~~                      =20
> >       |                                                         |
> >       |                                                         __u64 {=
aka long unsigned int}
> > samples/vfs/test-list-all-mounts.c:223:47: warning: format '%llu' expec=
ts argument of type 'long long unsigned int', but argument 2 has type '__u6=
4' {aka 'long unsigned int'} [-Wformat=3D]
> >   223 |                         printf("mnt_id:\t\t%llu\nmnt_parent_id:=
\t%llu\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n\n",
> >       |                                            ~~~^
> >       |                                               |
> >       |                                               long long unsigne=
d int
> >       |                                            %lu
> >   224 |                                stmnt->mnt_id,
> >       |                                ~~~~~~~~~~~~~  =20
> >       |                                     |
> >       |                                     __u64 {aka long unsigned in=
t}
> > samples/vfs/test-list-all-mounts.c:223:69: warning: format '%llu' expec=
ts argument of type 'long long unsigned int', but argument 3 has type '__u6=
4' {aka 'long unsigned int'} [-Wformat=3D]
> >   223 |                         printf("mnt_id:\t\t%llu\nmnt_parent_id:=
\t%llu\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n\n",
> >       |                                                                =
  ~~~^
> >       |                                                                =
     |
> >       |                                                                =
     long long unsigned int
> >       |                                                                =
  %lu
> >   224 |                                stmnt->mnt_id,
> >   225 |                                stmnt->mnt_parent_id,
> >       |                                ~~~~~~~~~~~~~~~~~~~~            =
     =20
> >       |                                     |
> >       |                                     __u64 {aka long unsigned in=
t}
> >=20
> > Introduced by commit
> >=20
> >   7b1da09dc088 ("samples: add test-list-all-mounts") =20
>=20
> I am still seeing these warnings.

Still there ...
--=20
Cheers,
Stephen Rothwell

--Sig_/OzFdvUjK/UaF1tZZGtT6U6F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeF+pwACgkQAVBC80lX
0GwhUwf/VxcAI7Y7HAEzaPFwenECmLrjXV02xrc1WNJYXCb8XtxfDxN5X28s0qKv
zjzJDuQdF0X9BPfp1zfGnZf1nWS78J6Hju1aRT/I8GCv/EzRuppjMO8xbDFnohfA
5tUATJQimiH5UX6psQdq3TurvAJ4XfrukdKxOAq8o8/ydo2bHAuEVpBen70BTsug
mOEhtZm0RhAbvsl3D0KNAGV2a96wUzRbh/8AGodW4y0UEqZKXunySf+QngfQArV9
Ry9YT/MMm6mR2qvDDE/9E5jvVuISWsOAVZ2pZ6S3LLjY13gMNEyCrNXTXmEWbVy3
gWRECkdb8mY0XcBf9MkNZUSInnOwxw==
=SvIM
-----END PGP SIGNATURE-----

--Sig_/OzFdvUjK/UaF1tZZGtT6U6F--

