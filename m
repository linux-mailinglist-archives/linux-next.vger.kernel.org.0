Return-Path: <linux-next+bounces-9131-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7635CC77304
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 04:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 7DF3B2AFEA
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 03:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999BF277023;
	Fri, 21 Nov 2025 03:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gK280KZx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613B51A2630;
	Fri, 21 Nov 2025 03:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763697051; cv=none; b=DWYX0YHsVIUvthsUum6A45XaSbLi6tkwG3DQM0MY4a/t+EJnpPrrwdboC12KR3HDVtSD/5TXYwjUyDM6FiZupOlkoLe69D/aoAEnfdQUH1aMD4qCkU0+WAMzxfQeX/7ujgUJoMWMb/C8K9/FPUEJ8+aaRrmyhOZeoTQDPQGuPZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763697051; c=relaxed/simple;
	bh=XxlsCaHV21gWFiDFx92Uj5SckHJd0yGsAEc/Uy3KR3g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sak0NoT97NwniILZ1uTGa7dZZiMoS5n9Vsni53jNUO5S1JPIqXXxlAgYhCU09d1das5UMliBGigwKg1hkZaWrzVGvoDAiIBFQ3CuvZF3fSGgj1O7PbhkupFlklwz3jB8EOmOJWu0w7Xm38kYC9aLcOhj7VmVbkhj9uUximB1nVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gK280KZx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763697044;
	bh=UBN2okOhdJ/6Z6Bn3/86judmcImrEDiLqhSu9XG73+A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gK280KZxj+n8i/Em4i3yJ78NtYFAJH4KHmH4ezzaMpiu+xXAOSx/eiybS0nQsEciw
	 R9W4iU5zfi9dSphqr1/aBqg5dRzgvdEuUx5EBwrvdb9Bk9FzCM78ier4ffW7pZ9VNb
	 /9ghe21FEqHR7W2PLAikubhi++aon0HlZeU+NQUyqyMzAMCtvM1ceHjJ4YUePJaZeK
	 zHfQkrtTozKHqVegWyPzTxyPiUFTNz9OjTAKIn6BB1xEZl3G/LdBWVixoQNONoGvmL
	 6DfVw/q5xSRdh0dwKezPIIYq96Ih2c9TjNTTwX4iJKmIp7ge4JxMIgmYxQ3c0KzgeR
	 MVeARVYhlcr5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCLpq6y0qz4wGl;
	Fri, 21 Nov 2025 14:50:43 +1100 (AEDT)
Date: Fri, 21 Nov 2025 14:50:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the reset tree
Message-ID: <20251121145042.3cef6e7a@canb.auug.org.au>
In-Reply-To: <20251121111534.7cdbfe5c@canb.auug.org.au>
References: <20251121111534.7cdbfe5c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lR7+Gpo0fSGFMBlLu.zAthm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lR7+Gpo0fSGFMBlLu.zAthm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 21 Nov 2025 11:15:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the reset tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/platform/x86/intel/chtwc_int33fe.c:80:12: error: 'struct software=
_node_ref_args' has no member named 'node'; did you mean 'swnode'?
>    80 |         { .node =3D NULL },
>       |            ^~~~
>       |            swnode
> drivers/platform/x86/intel/chtwc_int33fe.c: In function 'cht_int33fe_remo=
ve_nodes':
> drivers/platform/x86/intel/chtwc_int33fe.c:193:33: error: 'struct softwar=
e_node_ref_args' has no member named 'node'; did you mean 'swnode'?
>   193 |         if (fusb302_mux_refs[0].node) {
>       |                                 ^~~~
>       |                                 swnode
> drivers/platform/x86/intel/chtwc_int33fe.c:194:76: error: 'struct softwar=
e_node_ref_args' has no member named 'node'; did you mean 'swnode'?
>   194 |                 fwnode_handle_put(software_node_fwnode(fusb302_mu=
x_refs[0].node));
>       |                                                                  =
          ^~~~
>       |                                                                  =
          swnode
> drivers/platform/x86/intel/chtwc_int33fe.c:195:37: error: 'struct softwar=
e_node_ref_args' has no member named 'node'; did you mean 'swnode'?
>   195 |                 fusb302_mux_refs[0].node =3D NULL;
>       |                                     ^~~~
>       |                                     swnode
> drivers/platform/x86/intel/chtwc_int33fe.c: In function 'cht_int33fe_add_=
nodes':
> drivers/platform/x86/intel/chtwc_int33fe.c:225:29: error: 'struct softwar=
e_node_ref_args' has no member named 'node'; did you mean 'swnode'?
>   225 |         fusb302_mux_refs[0].node =3D mux_ref_node;
>       |                             ^~~~
>       |                             swnode
>=20
> Caused by commit
>=20
>   d7cdbbc93c56 ("software node: allow referencing firmware nodes")
>=20
> I have used the reset tree from next-20251120 for today.

This same commit is also in the gpio-brgl tree, so I have used that
tree from next-20251120 as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/lR7+Gpo0fSGFMBlLu.zAthm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkf4ZIACgkQAVBC80lX
0GzF+gf/fY1iAKGRapZqJjfSaYfxYch0bWtFPk2tmovfRhYsY+A8pe8YyNQ3G67i
RkY/cWapuFuGBVSvSHWIa9/9k0ltWmKUQ5Kuw7hNrc/t13SJJgTQEveEjTJa33ph
InarC7BKpZcLWQ6jmg68Gjy5gOF5Xe9kJndrgsmS0qVnVryxJjXhayABsvDmlaWw
UNSgMB1Kf6pmEuocvFM2zTry5Fp5pbO8r7JNXlzg9hL4r003YmA2e0zSiiuk/mRt
8fqVGQXVhwiMW5FZa5o4/1ipP/DHxBIMRQ8643RYtZGEXWl7Zui74w6b7mUEbmg5
ePJSshIHwKIdC0/+zTVfTc1r9mtDmA==
=Ef2G
-----END PGP SIGNATURE-----

--Sig_/lR7+Gpo0fSGFMBlLu.zAthm--

