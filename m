Return-Path: <linux-next+bounces-7659-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 810AFB0C1B2
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 12:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBD5C7A66D6
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 10:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F36F28B50E;
	Mon, 21 Jul 2025 10:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9/cjrNy"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483B423D2B0;
	Mon, 21 Jul 2025 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095026; cv=none; b=PAgeFu72OULgu3vX2EnUkAanSenXyo8i0jEUJ8KVpqbfUmdP9f50oZm8lzRQvFwc+bWmIel7CMgkSFVMNQs8X9KfHKZGIQ2uU4OB28Wq+0Rz5+55uAm7047DubeSbcPlJKiWVpKKNOezJ9XVkIySjuCYQ2o78hiPqdOIGPuHBMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095026; c=relaxed/simple;
	bh=onGFZim3lvFYEMgjnTNJo18OJEid4csvgDAY27bEggI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAjtxbjicOKOMVpI+zlUQjp8H1Ogk2WkeBL1K63VL1LwPR5p7AgRCEfAWaCMX7NJecCCdZFTP2DVH7A/0U/qXOGIwG9Zth8xQz3IHZhZnU6vYp8qhAWJ4hCRkA+wpTzJSZ4QWEvHQAbnSmpNd0Nh1lfYD3GIy5tz3YGgm9kXWlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9/cjrNy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CFFC4CEED;
	Mon, 21 Jul 2025 10:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753095025;
	bh=onGFZim3lvFYEMgjnTNJo18OJEid4csvgDAY27bEggI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9/cjrNyaOU5639XvlV8oBeWVUKtLXAgWse4Wc+RdD0rcjUCFKatORLI6uYXeLq0a
	 MofbFFS2bjMEZNhe4xyLLBroCkp2dpDpSOs0qYXDjOXEL0y9GcZtc9myrn1zBruhHt
	 159asAsOpS+vm4RsCsennBh5APtqVxhLq3BZ5z4sHlNLDRqCA6kzmTyLt360wriJ61
	 /EhGKrpXvzfoZLjz4fWcYOXJltJe37gh65jZgSUKYteM+bHmM8hRRU/phbmS3nwHSt
	 V1+R69+Y+nZm2v3lbKWlBzaJnAARcApzKkU32rG5YCGCj8vWeieQOzm5WWm/D0dbhV
	 BNi9aT5Eeq3Bg==
Date: Mon, 21 Jul 2025 12:49:23 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: linux-next: manual merge of the sysctl tree with the modules tree
Message-ID: <fq34gunpe6exbyoeowpxvuctslfgwvs45e3zrp32bhy24xbcty@lyty6vaso6g4>
References: <20250714175916.774e6d79@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6xetms5twnjnfi36"
Content-Disposition: inline
In-Reply-To: <20250714175916.774e6d79@canb.auug.org.au>


--6xetms5twnjnfi36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 05:59:16PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
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
Quickly reviewed this with Daniel Gomez <da.gomez@samsung.com> one of
the modules maintainers and this solution is the correct one.

Best


>=20
> --=20
> Cheers,
> Stephen Rothwell
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



--=20

Joel Granados

--6xetms5twnjnfi36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmh+GyEACgkQupfNUreW
QU+Bjgv9GwmTCrP7wYOZF9BIpumy6dsRFxwAE+MkP6IAORTlHUOd9wz18L9fHlYy
nxs7NM85vqQGoJqegOr0sTOQ2CJUkJQZW7pfmeDGSj6jsQCN/0FeO719srZ/2Fwp
bbqRyiwdl9ytJA61mzu3XpFY6jJykaiJ32jlide3Wc1+CLWnZuRN2ngK9ozA8ooW
K5Djsw50/fd9TvbgmRNU+XPVXVxW/UVovADirr95uLrNhjb2cLWI4tAZOtDUNUHq
bEbsU8E60FHldg6EXdEBfoe+Yt+ZEr+NuVF8d1ODzxr2Rpk7u4ZpH8I5d+ljtLIR
EsTKkkRbKAFCYorcaaHY/w9vPtqJDhAabYTYTk6WKXarw94ayrQSfmwkytwXuFR4
VhMYf+sFcqZovhr9T4O1ong/e6lbgkYZDhRhthQrHbtOSDJ67cK6eElez5pCYPOl
2bwvdKHcgbGiphHa6gZ8UbYywa+T2lXM5Rx1HH3vY/ZCZdPSIUanZfvsIUQQsSqk
ntRgIFLO
=2sD/
-----END PGP SIGNATURE-----

--6xetms5twnjnfi36--

