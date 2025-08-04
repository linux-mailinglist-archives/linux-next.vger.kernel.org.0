Return-Path: <linux-next+bounces-7839-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84821B19CEF
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 09:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BA2D1895B11
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 07:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38521D61AA;
	Mon,  4 Aug 2025 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZPlcf2Z"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA209B672;
	Mon,  4 Aug 2025 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754293788; cv=none; b=YY2kcvvnfJeUVJN7W6PcCXOAM8pFIJDPSkoBJsE3wiazusXZvg6pvWTx9QO5q2E0iJ78lzpWSS2WmQqSKU1ViJPYNzjejIdRdHFDaqFdMLyOv6Dd17YCQ1+ZnsvbN6nA7znd9ZBTYmQoa/+8pfOWSSmiNA+EbjKfR74TH29rXbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754293788; c=relaxed/simple;
	bh=xhI5j3ZBhKzcSpKZJqfid+QDbWfkd+wO8f5fPd60PfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Py+uOlLZwnlthc3neLvLuImrEis1rLJPIPorIdX0Dvt/0JzF8wlG919O8vzOh0x9ZdX0m/lMQdER3xvqc0ou3ZaD8x3iNFWLqjQUTNTL1xLAvILXp4n/o4wnvvsra/rYPWgDUdkcAYI6CwkZslTESLv1GXzaJvg7/rjfXgRutYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZPlcf2Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C585DC4CEE7;
	Mon,  4 Aug 2025 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754293788;
	bh=xhI5j3ZBhKzcSpKZJqfid+QDbWfkd+wO8f5fPd60PfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZPlcf2Z95b9xZuXbb52if/f9mrLWZt0fbstj3bcL8YoC+XMkctyO4Q8UTP9Bc6/g
	 yipvU13VjJPoArXQ+rS6Z7/MN1eA9zBVOvcdFTt1Ou7QF4YMyu6z4L1tVTB4sFUuVB
	 hYaYMTu6Z1k6RmlJFujJtKdENfvMc3+G2LXZcz6aWROnnh75bK76thE0pClVm6GYyR
	 4VIzYQzJVQXsw/K6sjV1Pz1dNhBrNTk39GZhBTk66f/uFZ8/QwTx7imO/Q777fwe5K
	 RhUKu6JnseFd5oxs5Me07Xgu+pdhyuJ2xnEOlKqNjghxP5kbWvjnaD+ftnLq7R47SU
	 fFUxsSZgkBIrQ==
Date: Mon, 4 Aug 2025 09:49:43 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: linux-next: manual merge of the sysctl tree with the modules tree
Message-ID: <uxgymmpzccvm7d5aydj5ozs7qdnqrpg7ta77uu43bqq3epcwiw@w57gyleopugp>
References: <20250714175916.774e6d79@canb.auug.org.au>
 <20250731110249.646be7ac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f2molvwlvnzrwba4"
Content-Disposition: inline
In-Reply-To: <20250731110249.646be7ac@canb.auug.org.au>


--f2molvwlvnzrwba4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 11:02:49AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Mon, 14 Jul 2025 17:59:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
=2E..
> >=20
> > diff --cc include/linux/module.h
> > index 3b665cb0cabe,e93cdb92ad92..000000000000
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@@ -584,17 -608,6 +584,16 @@@ struct module=20
> >   #define MODULE_ARCH_INIT {}
> >   #endif
> >  =20
> >  +#ifdef CONFIG_MODULES
> >  +
> > - extern int modules_disabled; /* for sysctl */
> >  +/* Get/put a kernel symbol (calls must be symmetric) */
> >  +void *__symbol_get(const char *symbol);
> >  +void *__symbol_get_gpl(const char *symbol);
> >  +#define symbol_get(x)	({ \
> >  +	static const char __notrim[] \
> >  +		__used __section(".no_trim_symbol") =3D __stringify(x); \
> >  +	(typeof(&x))(__symbol_get(__stringify(x))); })
> >  +
> >   #ifndef HAVE_ARCH_KALLSYMS_SYMBOL_VALUE
> >   static inline unsigned long kallsyms_symbol_value(const Elf_Sym *sym)
> >   {
>=20
> This is now a conflict between the modules tree and Linus' tree.

That makes sense. The sysctl PR was merged at the end of July. It should
be fixed in the same way as described in this thread. @Daniel: Ping me
if you need any feedback from my part.

Best

--=20

Joel Granados

--f2molvwlvnzrwba4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmiQZhYACgkQupfNUreW
QU/2jgv/dqlsLZvUbCMc7h24t/2ShKsXJ84FMEvGQQdR9y5rR3MnvNJ/CkjJRJdX
0S3+6tVsnC/uGZXyZyo5aibH3NBQRpk/nFlsQaA3e+E3AlaoclXrp8rHbLc8YQDt
MQKAwSV317iSh+DblLLDIKJRw//OGwcnylWpTkUK/d7R/rCXGIxI1fdQqkz8hXDQ
QnorJcEwFnJs/3DldgYaz1egar0eeCI74HlqM+b9hCRqRRfGCN6u2n984GKVGgGQ
ssIxXKOoFbhp+u1BdLSpzWTSpRCY+Ng+dU6RdeX/ODURxvmu3HTw2ayZi/pjQI3s
OzLGjfd9rtyRgM+dNeNXlf/Bn3P/akiTvQzMa8Itr6ECMhWFoXSQfWDkGQ+0yaYH
wUwzVvK1xhP4GwDx36Cfaq6ums7Qbv13MiiJ50u5hDQi7DG2l6zoVjb46rlUQ/qc
8kKvUk8VAG7wGEBEXTMrMCzRZTnfzW10DarUSlh9r0Yjuv0KX+j0LoRzRcw3Thg0
gKue7iqW
=d05s
-----END PGP SIGNATURE-----

--f2molvwlvnzrwba4--

