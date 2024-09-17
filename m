Return-Path: <linux-next+bounces-3891-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066497AC87
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 10:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D3D61F22E19
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 08:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057A27DA91;
	Tue, 17 Sep 2024 08:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r6HT0/ry"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390DD12F399;
	Tue, 17 Sep 2024 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726560134; cv=none; b=aJSgDby6g4LrCmTzKlMFXfyiTrRL3rBML+a7WH4wEGHCMrkhavIk+on6e6bjI+3eKyFQE6s6hRF2fTM5vdPuMPbs/cI1l1hS0I5Q1b1ihPOZ4Pa09sG6kqMLhLS/qxRuCT5WccTf2DcixFnzbfYVfgLhXwlKkWBxtyx7Qr0MQ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726560134; c=relaxed/simple;
	bh=ESBg/RwXEIF18IhmT97V59aOMlXtn5mQkWw6ywjoOKA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fFg9xYbCJjUqyobi6gUJHdipklLMT2nxzsLLETJJIDy1nJMYwJJErom0+0qY800g2nDtIkpSirm05Uv686u728lNsDKvoOgGz4mJ5Ek7kY0CA+MexQlXoDb2sILaTVuzL+Z0Xx/FnzknJbJzAb5LclooEZ++JNDMVByPs26tuhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=r6HT0/ry; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726560128;
	bh=9Zs5rC6LYBPELuXcpw4Ezx66lMlbhg+66YXN2cd6eKo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r6HT0/ryNJePs7T1/FV0IIVrzv+7elw8Lc8IxLu+Bh0tFGF+6y8ddDzxneunCxyND
	 8gy0LLPbQpZG035TgsnD19P3xIFVuXfUSAEpiJOYlOrkzPbiibeSYo48hYg+Z+nzPU
	 Emu22ZeFWb5xsNQfIhIVDhZRnVqv5l6r+nj7TjTYuTj9CEM43lW+GC0AVyO/KLjuJ+
	 mZ0V33Vj6hvBZysIDUJ/tYsAOOfBuG/IP0tBfYfa8S6bf25pmapf2yg7YCRYnbl6Kg
	 cZv4m4Tf6Hcv+cUNzlQD3kkQeJwoarZQn7cOEZaAbyiPpQMmca6p7G7p6+lnXFdgIj
	 /bm5x15+kTBhg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7DlM69pkz4x8X;
	Tue, 17 Sep 2024 18:02:07 +1000 (AEST)
Date: Tue, 17 Sep 2024 18:02:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paul Moore
 <paul@paul-moore.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the security tree with the mm tree
Message-ID: <20240917180207.1f68637c@canb.auug.org.au>
In-Reply-To: <Zuk06cfmaOT5fltF@tiehlicka>
References: <20240911142822.7c65e02e@canb.auug.org.au>
	<20240917093048.71949a8f@canb.auug.org.au>
	<Zuk06cfmaOT5fltF@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KVEd/WIycsNfDgRwmGL9htV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KVEd/WIycsNfDgRwmGL9htV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Tue, 17 Sep 2024 09:51:05 +0200 Michal Hocko <mhocko@suse.com> wrote:
>
> On Tue 17-09-24 09:30:48, Stephen Rothwell wrote:
> >=20
> > On Wed, 11 Sep 2024 14:28:22 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > Today's linux-next merge of the security tree got conflicts in:
> > >=20
> > >   include/linux/lsm_hooks.h
> > >   security/security.c
> > >=20
> > > between commit:
> > >=20
> > >   3346ada04cf5 ("bcachefs: do not use PF_MEMALLOC_NORECLAIM")
> > >=20
> > > from the mm-unstable branch of the mm tree and commit:
> > >=20
> > >   711f5c5ce6c2 ("lsm: cleanup lsm_hooks.h")
> > >=20
> > > from the security tree.
> > >=20
> > > I fixed it up (I used the latter version ofinclude/linux/lsm_hooks.h
> > > and see below) and can carry the fix as necessary. This is now fixed =
as
> > > far as linux-next is concerned, but any non trivial conflicts should =
be
> > > mentioned to your upstream maintainer when your tree is submitted for
> > > merging.  You may also want to consider cooperating with the maintain=
er
> > > of the conflicting tree to minimise any particularly complex conflict=
s.
> > >=20
> > > --=20
> > > Cheers,
> > > Stephen Rothwell
> > >=20
> > > diff --cc security/security.c
> > > index 3581262da5ee,4564a0a1e4ef..000000000000
> > > --- a/security/security.c
> > > +++ b/security/security.c
> > > @@@ -660,7 -745,7 +745,7 @@@ static int lsm_file_alloc(struct file *
> > >    *
> > >    * Returns 0, or -ENOMEM if memory can't be allocated.
> > >    */
> > > - int lsm_inode_alloc(struct inode *inode, gfp_t gfp)
> > >  -static int lsm_inode_alloc(struct inode *inode)
> > > ++static int lsm_inode_alloc(struct inode *inode, gfp_t gfp)
> > >   {
> > >   	if (!lsm_inode_cache) {
> > >   		inode->i_security =3D NULL; =20
> >=20
> > This is now a conflict between the mm tree and Linus' tree. =20
>=20
> Andrew said he would drop the mm patches and I will resubmit when merge
> window closes.

Yeah, I normally drop the unstable parts of the mm tree during the merge
window, so I will do that from tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/KVEd/WIycsNfDgRwmGL9htV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbpN38ACgkQAVBC80lX
0GzsgQf+MLS9yqbDMD8Yc75RSEFXCnAKhHBxaRnHj6OMHpII3nmDaOUEnKis2/0H
eF3xYNWTfWBAmrvF9dQwbLMyAScrFIMHhKH9oL/vUrcv9xz+3LsBvRkMm3sCrf0G
HJl3T1jyv5t5g2udaoulolZTgmnRKaEI98mDsI/NBlz8pxrfG2+m0QOI5+f5BXI3
qzfrBqUSgw3/Ap90GjKI/jV5mvz5qDesbRLHo2b8i92xl4ZTDeq2pA1nQYzX/b2B
KvgOwTxfwlnZR+cV5bb6q8z5sTFxWH6T3jQmHSzzMbrii0jWl+CXSTLmiPAMDDob
f5ssCZpmSVUFjG4hGoooJeZCPEVEYw==
=A8tJ
-----END PGP SIGNATURE-----

--Sig_/KVEd/WIycsNfDgRwmGL9htV--

