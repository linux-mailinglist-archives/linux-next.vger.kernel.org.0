Return-Path: <linux-next+bounces-3079-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB04A937189
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 02:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 806082823ED
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 00:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36792184D;
	Fri, 19 Jul 2024 00:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QPTwrNlv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E43137E;
	Fri, 19 Jul 2024 00:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721349272; cv=none; b=uhJuq867EiVv95nBl31HHrHL2LSBFAkPwGL5Jb/8ZZvqAjBP9bK05Zu9KGLbfE4/IyRs1c2Sm0dTVZBqKnpYBsFQUiCVQcvpxpof8eKIfvajLEBSkSQf269+6NWa4/18H3RPkAnMMD2z58EKoKHpakC9ffQA09ic55MFMJkFFfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721349272; c=relaxed/simple;
	bh=3SxXE4HFSO0/0SOh4LfwSIvI8WFx8Q7RhPzimFH+FgI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nhi1d7PmZWlEjh4lOJQLggz0Nf4JkR4AgLLxEiVv1sM/zhCsTu7Iy/uc1swc15sdPUfUqoNwkBqdxd1JaEnO2ofnGNuiJ2fcU1cizklt7BMg0g0orVgD+ogXXLDmnSFx0nsvkDpJ4m0lo/jlLILz3YvBEIHAVveHDoVl0I0sRQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QPTwrNlv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721349268;
	bh=Dof5LE+ZRBL4UrBDLuUMyNVbgDkBX89CmuVHF05QsFQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QPTwrNlvKHK/ZntFyh/Bx8tZud6QwVrlHWR97loMGvyynBVDu9n6RrzW4nvaw4rgx
	 CX5F0D4Kcb77ihYv4xQgRSzkbuJpwvbH117W0P9ILwQijRb15e5KFKYAFnVekmlJGY
	 vRgyHpcoLHzlQMgEY4zT0aS3o2VrtCwgC5Cwc+P6L9AT9RWUdaHfH27LddIzezAr5+
	 P2vgobW408sfK9KuYiexWBMcw7c1Syv0qg6Hj45hNrk8AuGPGD6lQERn9HR3DkYHQn
	 rqWr4YSsm5nPF1rT05HxLdx9vGKfl2yg0EYb2Fwe+qa1bGGZA5bqjz5hs1x4vBwBsP
	 9/T/1foH+Sf/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WQ9fW1dLmz4wbr;
	Fri, 19 Jul 2024 10:34:27 +1000 (AEST)
Date: Fri, 19 Jul 2024 10:34:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christian
 =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, Jiri Olsa
 <jolsa@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the
 vfs-brauner tree
Message-ID: <20240719103426.6ad00835@canb.auug.org.au>
In-Reply-To: <20240717132155.6ca2ce47@canb.auug.org.au>
References: <20240717132155.6ca2ce47@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ufV7G23Ejp5PAxb+Izpa=OH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ufV7G23Ejp5PAxb+Izpa=OH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 17 Jul 2024 13:21:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the ftrace tree got a conflict in:
>=20
>   arch/x86/entry/syscalls/syscall_64.tbl
>=20
> between commit:
>=20
>   e6873349f700 ("fs/xattr: add *at family syscalls")
>=20
> from the vfs-brauner tree and commits:
>=20
>   190fec72df4a ("uprobe: Wire up uretprobe system call")
>   63ded110979b ("uprobe: Change uretprobe syscall scope and number")
>=20
> from the ftrace tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> I also added this patch due to commit (no in Linus' tree)
>=20
>   4fe53bf2ba0a ("syscalls: add generic scripts/syscall.tbl")
>=20
> rom: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 17 Jul 2024 13:15:32 +1000
> Subject: [PATCH] fixup for "uprobe: Wire up uretprobe system call"
>=20
> and "uprobe: Change uretprobe syscall scope and number"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  scripts/syscall.tbl | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
> index 86b53c7a815b..c792b08e594d 100644
> --- a/scripts/syscall.tbl
> +++ b/scripts/syscall.tbl
> @@ -406,3 +406,4 @@
>  464	common	getxattrat			sys_getxattrat
>  465	common	listxattrat			sys_listxattrat
>  466	common	removexattrat			sys_removexattrat
> +467	common	uretprobe			sys_uretprobe
> --=20
> 2.43.0
>=20
> diff --cc arch/x86/entry/syscalls/syscall_64.tbl
> index 623d954f3afb,dabf1982de6d..000000000000
> --- a/arch/x86/entry/syscalls/syscall_64.tbl
> +++ b/arch/x86/entry/syscalls/syscall_64.tbl
> @@@ -385,10 -384,7 +385,11 @@@
>   460	common	lsm_set_self_attr	sys_lsm_set_self_attr
>   461	common	lsm_list_modules	sys_lsm_list_modules
>   462 	common  mseal			sys_mseal
>  +463	common	setxattrat		sys_setxattrat
>  +464	common	getxattrat		sys_getxattrat
>  +465	common	listxattrat		sys_listxattrat
>  +466	common	removexattrat		sys_removexattrat
> + 467	common	uretprobe		sys_uretprobe
>  =20
>   #
>   # Due to a historical design error, certain syscalls are numbered diffe=
rently

This is now a conflict between the vfs-brauner tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ufV7G23Ejp5PAxb+Izpa=OH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaZtJIACgkQAVBC80lX
0GxkIgf/RdUWnoZRaNvwI3XkNHJcqtvSYVowNqj/op7wE0R6EXAicIWUPAOMgmpf
JgEUmEehRq6J+RQmMBLnlRZ2er8/W4Tj8nvtfFYxeOjZJTjmul4wuz10OQRxZl/D
o1YWKN20w4QaNULO5OFfTPdEV2IfELkdKmm36bvurVViv34FogKLiFke1mi8NCHf
5sDwlygO4rD/Y/HKIGMUpMT0Lo8AOkA05TJAyvAme7MkpNPYw9M0ZVegx8QFB7ub
qqVR5MWA+MCncKHUjn119ZMXLUEs5NV46sRiOHGVlpjUx7E/O8CHQqsd9RP33aHT
VcgPHvKjIZHe7FheGHg6WUn23STGYQ==
=fz00
-----END PGP SIGNATURE-----

--Sig_/ufV7G23Ejp5PAxb+Izpa=OH--

