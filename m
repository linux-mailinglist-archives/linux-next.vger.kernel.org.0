Return-Path: <linux-next+bounces-4998-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CFD9F74DC
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 07:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D45C81890917
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 06:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F8B21661C;
	Thu, 19 Dec 2024 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aOrXx3SI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C217216611;
	Thu, 19 Dec 2024 06:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734589922; cv=none; b=WCXCRnsbm7pTM6hrwg/43JN9sv3qTMZE4IDcXW8Gl7PhW8Rl31D9hQJhDQ5ORl0h6/l8ImEOK+I9WBvsODPGfNIYEpqE46QM9znqRutpv4lRBs5UQq5ujATRjbLhCwTf8yviMLVAQ4ajwo+pFnZO8bFNG1u+6B3H2c9tSMryHXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734589922; c=relaxed/simple;
	bh=Y5DHOf/WIte2ah7FPTyLmbb9rHG21EHEWIhKCbOvn3g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gaeTq2XFiuqY39d/zC7roL/skB00cPOBSnooUZUPRa2N8Pqm6JEygaEHCvZR5kj5fvnCqpTy1jhbV+30mi88as3a2fdZrOfbjViDuyy7S8YxsdK/uoEqRWuUi/rg5poNQQVLMJb35exQ77xmjqPmy8OYX1JuCMGB8uZaogECgeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aOrXx3SI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734589911;
	bh=yqLzFLMQ8fzCboiv/kuPYFASX0oWO9DgwvIApLivifY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aOrXx3SIlzMaIqmMdmofOV6ttjjPtH9AoCmhGWoFz4h8yJXtQXcg3Da4lJ47ot1ph
	 d+NrZsL1GLPCIZ8IeF8uU2ezgnDoMCZW0IVDv2wpM9+Nab3W2a6qrIXrrMz7ejziQ1
	 XLGLMSOHApA77Zki/VQw4t0vsc6bT6efwTTfgC0Fce+gAMl131iMpUvIt+KauLK850
	 BPBOJNCTzbwHgRCwcpc0wpWLlRqm5j0w17A17zuAbdpQBc44MJigOdiEspNQkItGZI
	 nzWQ0QeDl2yueqCTIUaaCSBB+98sYa2zPF8ZCoGPV8TKDu7wjYMG1UVgdfv9/y2l4V
	 p7ygtvFiNFSJA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDLLH63Cwz4wcj;
	Thu, 19 Dec 2024 17:31:51 +1100 (AEDT)
Date: Thu, 19 Dec 2024 17:31:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20241219173156.7dce2f07@canb.auug.org.au>
In-Reply-To: <20241211143701.5cfc95a7@canb.auug.org.au>
References: <20241211143701.5cfc95a7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CXgsg=B5ORQpw17fMugynVV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CXgsg=B5ORQpw17fMugynVV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Dec 2024 14:37:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the vfs-brauner tree, today's linux-next build (powerpc
> allyesconfig) produced these warnings:
>=20
> samples/vfs/mountinfo.c: In function 'show_propagation':
> samples/vfs/mountinfo.c:104:36: warning: format '%llu' expects argument o=
f type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
>   104 |                 printf(" shared:%llu", sm->mnt_peer_group);
>       |                                 ~~~^   ~~~~~~~~~~~~~~~~~~
>       |                                    |     |
>       |                                    |     __u64 {aka long unsigned=
 int}
>       |                                    long long unsigned int
>       |                                 %lu
> samples/vfs/mountinfo.c:106:36: warning: format '%llu' expects argument o=
f type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
>   106 |                 printf(" master:%llu", sm->mnt_master);
>       |                                 ~~~^   ~~~~~~~~~~~~~~
>       |                                    |     |
>       |                                    |     __u64 {aka long unsigned=
 int}
>       |                                    long long unsigned int
>       |                                 %lu
> samples/vfs/mountinfo.c:108:52: warning: format '%llu' expects argument o=
f type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
>   108 |                         printf(" propagate_from:%llu", sm->propag=
ate_from);
>       |                                                 ~~~^   ~~~~~~~~~~=
~~~~~~~~
>       |                                                    |     |
>       |                                                    |     __u64 {a=
ka long unsigned int}
>       |                                                    long long unsi=
gned int
>       |                                                 %lu
> samples/vfs/mountinfo.c: In function 'dump_mountinfo':
> samples/vfs/mountinfo.c:144:42: warning: format '%llx' expects argument o=
f type 'long long unsigned int', but argument 4 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
>   144 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, =
buf->mnt_parent_id);
>       |                                       ~~~^                       =
~~~~~~~~~~~~~~~~~~
>       |                                          |                       =
   |
>       |                                          long long unsigned int  =
   __u64 {aka long unsigned int}
>       |                                       %lx
>=20
> Introduced by commits
>=20
>   0c8f746452aa ("samples: add a mountinfo program to demonstrate statmoun=
t()/listmount()")
>   ee8c840a4a35 ("samples: fix missing nodiratime option and handle propag=
ate_from correctly")
>=20
> I am not sure why these warnings only turned up today.

I am still seeing these warnings.
--=20
Cheers,
Stephen Rothwell

--Sig_/CXgsg=B5ORQpw17fMugynVV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdjvdwACgkQAVBC80lX
0Gy0hAgAh+hJS/LC7dxAMBmwv3xoBywLCV5ltPHVumXKcB/fJtcFwGujGWb6aUrh
Ro3ANBU4iXqOKST/qn1Ws4zQGFK8+mH1HRLQ9o/emCBDbLiQmSXB4HxpTH7854L/
MtCzZ342HPrfPaE5iC5QrmecVWs48U1UW37Ktr1QTMBxh26CxeHHZgNTvD5XQlDD
mvuR32OnYoQ2d2ZMrJIekNWQLkWuMEZpZJnutExn6IYX3E5DOaJwc5Un1uEyx5k9
RGoOfI7/+EGTSBs8+QqTI/9oSwHqiKUT+hWWTdrVeiRdPOviWpsaqocfg3iZ5m4N
8lBKO9U2MFPy8VxdkcJkChrJ6ev0VQ==
=5tnr
-----END PGP SIGNATURE-----

--Sig_/CXgsg=B5ORQpw17fMugynVV--

