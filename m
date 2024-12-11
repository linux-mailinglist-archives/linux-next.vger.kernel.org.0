Return-Path: <linux-next+bounces-4938-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BF19EC360
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 04:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8FD31889BCC
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 03:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B6320C496;
	Wed, 11 Dec 2024 03:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Cfv38t8t"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8732B6F073;
	Wed, 11 Dec 2024 03:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733888271; cv=none; b=Q88UZCH7PJ6JxIQLgUgI+kLCIrDBccd8NLb8Gkoi+H5lKNMSo6m69ssAC1MK+9uF2/6daPnTDLyaIRAogw5PnKvSlnKiOHDGSmrzmXYtVw3J6u6LmJfPovyQUF0pTyrK1C2YV1s3bebcXrO7VtEJvGixzQprdHLIUn/MXJv/A18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733888271; c=relaxed/simple;
	bh=pvFWXE2hs8lq6/Mc9l8s9asR9Zm9++I8EfFfWcC/TYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rCh/pytwcJOAhWcTKhkeqh0zPBUw/tNC6bD7uSoWfFXWEu7+0rtjkX6CFzJvQynZBdLJHjrjlGcDj4Yc0/02xRPP4ODNyHfb7QkOM736w02xaYd30A9lDUEdxDgRQciy0RzziEd2PSzc1WE3N5os2BdPA6nX9P6DhfMfYIx16JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Cfv38t8t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733888254;
	bh=lZMIngKSzjN1JhQCXEwcUiLV6SSg33k3Md8+L29HuLM=;
	h=Date:From:To:Cc:Subject:From;
	b=Cfv38t8tDE1kApDGXFc0klXPtm9IIJRWgO+V3i3Fhp61UFHEHgIFIJQpBon70sPfV
	 iK/kvGI+1NavbemPOYfq2cU5P7AXByF6Zq4NuMMKbnwQ23Ws8n0ZGFfvSwDkEtlkL6
	 6W4L9wweagPd4k++GWXrEfTBFVbXaLuF7EvI3f9mEUq3RhjT4bjzPYe/OB8aHjjZom
	 BbSRRItPnFbFYNSsUHqcoLiuoRy7TObTo8yiEmAMYE5OAorwxXSk5P09lqV7zK52zp
	 XjeTFT0fw8+KXNbnu15g7+NAv3JMwYD0Q37xM0Ul4axgDZrFp4H/00kUtxK6mXB2R5
	 M9l5AcdxJXtYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y7Lrt3sY5z4wcy;
	Wed, 11 Dec 2024 14:37:34 +1100 (AEDT)
Date: Wed, 11 Dec 2024 14:37:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20241211143701.5cfc95a7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d4/.Rsteb0gN8Z+Hdsz_+pu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/d4/.Rsteb0gN8Z+Hdsz_+pu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (powerpc
allyesconfig) produced these warnings:

samples/vfs/mountinfo.c: In function 'show_propagation':
samples/vfs/mountinfo.c:104:36: warning: format '%llu' expects argument of =
type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long u=
nsigned int'} [-Wformat=3D]
  104 |                 printf(" shared:%llu", sm->mnt_peer_group);
      |                                 ~~~^   ~~~~~~~~~~~~~~~~~~
      |                                    |     |
      |                                    |     __u64 {aka long unsigned i=
nt}
      |                                    long long unsigned int
      |                                 %lu
samples/vfs/mountinfo.c:106:36: warning: format '%llu' expects argument of =
type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long u=
nsigned int'} [-Wformat=3D]
  106 |                 printf(" master:%llu", sm->mnt_master);
      |                                 ~~~^   ~~~~~~~~~~~~~~
      |                                    |     |
      |                                    |     __u64 {aka long unsigned i=
nt}
      |                                    long long unsigned int
      |                                 %lu
samples/vfs/mountinfo.c:108:52: warning: format '%llu' expects argument of =
type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long u=
nsigned int'} [-Wformat=3D]
  108 |                         printf(" propagate_from:%llu", sm->propagat=
e_from);
      |                                                 ~~~^   ~~~~~~~~~~~~=
~~~~~~
      |                                                    |     |
      |                                                    |     __u64 {aka=
 long unsigned int}
      |                                                    long long unsign=
ed int
      |                                                 %lu
samples/vfs/mountinfo.c: In function 'dump_mountinfo':
samples/vfs/mountinfo.c:144:42: warning: format '%llx' expects argument of =
type 'long long unsigned int', but argument 4 has type '__u64' {aka 'long u=
nsigned int'} [-Wformat=3D]
  144 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, bu=
f->mnt_parent_id);
      |                                       ~~~^                       ~~=
~~~~~~~~~~~~~~~~
      |                                          |                         =
 |
      |                                          long long unsigned int    =
 __u64 {aka long unsigned int}
      |                                       %lx

Introduced by commits

  0c8f746452aa ("samples: add a mountinfo program to demonstrate statmount(=
)/listmount()")
  ee8c840a4a35 ("samples: fix missing nodiratime option and handle propagat=
e_from correctly")

I am not sure why these warnings only turned up today.

--=20
Cheers,
Stephen Rothwell

--Sig_/d4/.Rsteb0gN8Z+Hdsz_+pu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdZCN0ACgkQAVBC80lX
0GwQrwf/SRsuluApeAMe2MeyRuXdBrS6iU/EH1SrXR0vtb3WzFSGExp76PtRjTsL
jh7gDutKaDveX2WPVDbI0//+TMAjjn7vhtgeeLUF4zs0F+2VrJW3ZyIyO4i1ODZA
zdZLhQo7MVDMKz+h6bbWYAPUVw/XyF1FSSNwgCwMXp6OEDq31B1KPM4Mgld8vyHl
Wj61Ppe/So4GBOw2M3hEeCe/OuJJt92cMa4pVkxpXxminjsdpPLjGcWPO3M61NNo
fnaJE5o6GE2KttlkblfXGHS97J7+M4EK91+FdZigXZTDrq7GLJ5sp63mqD0HwkKh
g81V38rCzozLuBUFXVC5TIVZXHKoTw==
=HUcr
-----END PGP SIGNATURE-----

--Sig_/d4/.Rsteb0gN8Z+Hdsz_+pu--

