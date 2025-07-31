Return-Path: <linux-next+bounces-7784-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E606EB169D0
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 03:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED2345A2BE7
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 01:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E922D1EB39;
	Thu, 31 Jul 2025 01:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c6KlL8SR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408CA2905;
	Thu, 31 Jul 2025 01:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753923780; cv=none; b=fCiuN5q919QhUFR62viK2BoG/TaHAX/jbOctHyiFTEtB2ink/q8A7tz0UQzGEix9KJNuXtat1S3sb+nZJLLpKIiyWAHSMRE5ThdVDJfyxHjOzKBwsFTTrVpSLETS7SInS81lCeh6LBWS6C1QfleBfQ0F4yvP1XDJfl+Dv5do2xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753923780; c=relaxed/simple;
	bh=bZBUcItEaQM/TPrWISxoAxTVTYE7MYJlVRGggoKnYxA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PfB4jWJ0ny+KqwN5r1CoO7pbkrk7Pw4XExNqa0AEeLUN8T2+Q8tyuzo86Tk1gkCs7ynanlM887+3Z77jb6yyq3wlcASpQP6P4dDNm4gYzSIqOu0EJX+s/U1KcNn0PnmrRDzWDbm7zSZ4wtGbTONTk0cT/BFLse5y3ncdNY8GivE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c6KlL8SR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753923549;
	bh=9pGhEypb96zgM1nItgUqtyUfMR5NW76c9zjeKcjmYuk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c6KlL8SRIqZOEQte/ZOeee8XNIucIqX+hSfnfpyvkOuodQiJPaydMBDTvCk0mOPlq
	 9kZb6YYqaFcTXjq9uGaCEXDWJ8svQV2FvRe8PSGDAl0bSgsyn0zWggSXHxnEKKoXaW
	 zgZJPhyPQsUFYAawi6LTqbO5LMb9MECDywoCfdNLTx003mr/PHiO/QJkWes8WsqotG
	 h7J8mY9OvrVMwy4T/ZtkCadZ3xqruXk2qQjLvnoiGQ/gBF2s1wnemj8ERexSsPUd04
	 KjvX6Nbk+XXZupaIdGvaWurEUkVnuF994RkovF1XhTi7IFeMBDQQem4fZWyfIZDO0m
	 pYFW7EIUezWDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsrM03620z4x6q;
	Thu, 31 Jul 2025 10:59:08 +1000 (AEST)
Date: Thu, 31 Jul 2025 11:02:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>
Cc: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1?=
 =?UTF-8?B?aA==?= <thomas.weissschuh@linutronix.de>
Subject: Re: linux-next: manual merge of the sysctl tree with the modules
 tree
Message-ID: <20250731110249.646be7ac@canb.auug.org.au>
In-Reply-To: <20250714175916.774e6d79@canb.auug.org.au>
References: <20250714175916.774e6d79@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S/F_dUaJOHydsVciebU+gla";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/S/F_dUaJOHydsVciebU+gla
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 14 Jul 2025 17:59:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the sysctl tree got a conflict in:
>=20
>   include/linux/module.h
>=20
> between commits:
>=20
>   6633d3a45a8c ("module: move 'struct module_use' to internal.h")
>   a55842991352 ("module: make structure definitions always visible")
>=20
> from the modules tree and commit:
>=20
>   6bb37af62634 ("module: Move modprobe_path and modules_disabled ctl_tabl=
es into the module subsys")
>=20
> from the sysctl tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc include/linux/module.h
> index 3b665cb0cabe,e93cdb92ad92..000000000000
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@@ -584,17 -608,6 +584,16 @@@ struct module=20
>   #define MODULE_ARCH_INIT {}
>   #endif
>  =20
>  +#ifdef CONFIG_MODULES
>  +
> - extern int modules_disabled; /* for sysctl */
>  +/* Get/put a kernel symbol (calls must be symmetric) */
>  +void *__symbol_get(const char *symbol);
>  +void *__symbol_get_gpl(const char *symbol);
>  +#define symbol_get(x)	({ \
>  +	static const char __notrim[] \
>  +		__used __section(".no_trim_symbol") =3D __stringify(x); \
>  +	(typeof(&x))(__symbol_get(__stringify(x))); })
>  +
>   #ifndef HAVE_ARCH_KALLSYMS_SYMBOL_VALUE
>   static inline unsigned long kallsyms_symbol_value(const Elf_Sym *sym)
>   {

This is now a conflict between the modules tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/S/F_dUaJOHydsVciebU+gla
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiKwLkACgkQAVBC80lX
0GzcQQf+KlTR7TBgGLlw7+oHbsEndr0Z4cWyIWMzzfPHUk2fIiDihqxt74Z4coSG
S17+sTsr9NKFWR+/3zq/KbScpRc50SwQ0Y+bG5DuoKo/BbaJzdOEA7nxuM2nRZzk
FlB9lM+pkj3wxfapTjy/8dQu85GnhzRY0oqSs1fL8KCChvb2hE88vBIjjoiDFTHj
K3rdXbMZB4HXeebIqyZkKdTdNlPl6FbPsGg0cfVTUrArU/GhdUGcD8rARD76fr28
DZJoZh3UyBtFg6UgWiX9B7X5GZBIP1PWkRy4nk0F4cQZPJz+BH2H/5734KJAhne9
tiFXp4135yFPqq2Vdat6AbbMV9/roA==
=oWe4
-----END PGP SIGNATURE-----

--Sig_/S/F_dUaJOHydsVciebU+gla--

