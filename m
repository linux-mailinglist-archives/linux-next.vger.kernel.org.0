Return-Path: <linux-next+bounces-4826-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 588399D4520
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2024 01:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D6BD282D33
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2024 00:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437A8230985;
	Thu, 21 Nov 2024 00:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CbGPCrn4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BFF230980;
	Thu, 21 Nov 2024 00:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732150410; cv=none; b=DvIo+awJNPcrSYWDh0ih1Tv0h3ylFI4OI3J3H+Elai0E8C+n+jXSihsEzRYc3Ggw5KP+NBQx9jpCB5Xe8luRqqQG8WcJTz5B76QeXvHScsrf8MTpAG+mih5ken4o0E1jqrEZ6XAYsQ2lbfT/3fW8o3F/6c2re+L0jTIN6qYowtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732150410; c=relaxed/simple;
	bh=QH63q3LPfT12S8/eAj3OT5nAZXwFbhvQGB58xRdgnKk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nz0Ks0tP295anCOFnlOH+fX0cAWRFH16IbxfngEOohG3rIMqz2X5hNhndhYihKXuvSWasGZydumFvvRF0hpVRy4AjlEDRMMVp1hAHMzIvsF6kCc5pP6k+uUmjRQLY/gQLrW/bR0Pm2HwLOU2pzjlqnjKQLxBbXN4fDh53IxBp54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CbGPCrn4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732150398;
	bh=oHTbb3mtfNEel7hDftU95Omx0o0JvV4hbLuDk0nw9Wg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CbGPCrn4nXCEnJdS/YH2Pzc/MGrpQ4bePMYBSaTv7u/97shuHy9iwvleqSVr9FYIt
	 6SvCknLrcSbp6OG5T0RRkmLMbkUdP6OX42YEQAc+F8T/+Poln6K5HUFQYJWCewnTNF
	 AC1HzUX0c44BUOQHDyjzhnvkFpZVXRa0oY95mU8lVsRCRSBqmRNdnb2l2FzE3qs12Q
	 4eCNynDJRRlWxf3yOuLRHmusYimirosv43MnrqmZquK/Wgr0X6p+S1/mx0oM3T9LJp
	 ibkn4ZsTgGoeSCrm9/eOleBYGQk7rFV73jq3uguLJUdbuKDaWBlbBohGg4Fxd1JPYO
	 UrvQUJ7qoIDMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xv08Y1s70z4wcZ;
	Thu, 21 Nov 2024 11:53:17 +1100 (AEDT)
Date: Thu, 21 Nov 2024 11:53:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Han Shen <shenhan@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rong Xu <xur@google.com>
Subject: Re: linux-next: manual merge of the tip tree with the kbuild tree
Message-ID: <20241121115319.0285b0a5@canb.auug.org.au>
In-Reply-To: <20241112130136.52ffc457@canb.auug.org.au>
References: <20241112130136.52ffc457@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H1/bf69mEV==Ydre5dq1r+O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H1/bf69mEV==Ydre5dq1r+O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 12 Nov 2024 13:01:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   tools/objtool/check.c
>=20
> between commits:
>=20
>   315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
>   0dcc2d106615 ("kbuild: Add Propeller configuration for kernel build")
>=20
> from the kbuild tree and commit:
>=20
>   d5173f753750 ("objtool: Exclude __tracepoints data from ENDBR checks")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc tools/objtool/check.c
> index 05a0fb4a3d1a,f7586f82b967..000000000000
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@@ -4557,8 -4573,7 +4573,9 @@@ static int validate_ibt(struct objtool_
>   		    !strcmp(sec->name, "__jump_table")			||
>   		    !strcmp(sec->name, "__mcount_loc")			||
>   		    !strcmp(sec->name, ".kcfi_traps")			||
>  +		    !strcmp(sec->name, ".llvm.call-graph-profile")	||
>  +		    !strcmp(sec->name, ".llvm_bb_addr_map")		||
> + 		    !strcmp(sec->name, "__tracepoints")			||
>   		    strstr(sec->name, "__patchable_function_entries"))
>   			continue;
>  =20

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/H1/bf69mEV==Ydre5dq1r+O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc+hH8ACgkQAVBC80lX
0Gzu9QgAmLlKXT771H7AxFTKUUgUX5i1ZJ7+eOPh542mOQ1HsCQXT2YnlzTvnCcT
knK6+cLir5EvMfRZOSFbKJLXmSHrvg95bVP9EyjNZAFhGTUfBOabFug5HqXoJgpq
Asy/lLR9u+W5+CKS4BYzuF3I9oszurG0mWNL48mdSqdva/geHZVSVzGEcegylBGI
mQj83GiReZgL7N8jcP9nvflAPqLyoChssk7wKbY80iSyQ9XSxWAEAg8N7GnGQYRp
QWFmCe5Kd8/irRJwrkewcgWVGbbH4MpZ6R6YKXEtYdwxla3KOrzNO1YKMvW07bNI
sOgCgNtjqFSb8ioVydtA1Iri6+8N5A==
=8s2u
-----END PGP SIGNATURE-----

--Sig_/H1/bf69mEV==Ydre5dq1r+O--

