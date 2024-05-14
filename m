Return-Path: <linux-next+bounces-2292-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E618C4B8D
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 05:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 664AA1C20BC8
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 03:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7ADBA45;
	Tue, 14 May 2024 03:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ddUAlTN3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A68B67F;
	Tue, 14 May 2024 03:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715658170; cv=none; b=u5h2LnD1EjREzzaKRUxnFKEz4YQZnnkeVFW7H73292iSNO2CRtNAwEy2HAubKHk4jOj6kylDEWWk01ImUalO32MxnZ+NC+VoouREuyZUSroJZgNCltJuO/a4y7w9z1rYNHf/H6Yx+wUBcWnoYQoAZSt+w9vaEbS39cPpLlPTKKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715658170; c=relaxed/simple;
	bh=+N2dL+YQrx/rmjRjt17nfNnslIzOOYhDNxldJ4vvVjA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2dntEB0aBG9UbbtPoKuenUw7lqPGi0xeV8mgjbtb+9/AfPuTHfkw/OLvNsFhj1k5S3fnuuRBKHIlWV9eopNsxGOqCSIsXmvSdNNGOcn/jpE6v0wX8JQNssTPhq/aq3U3w3w7ea0ut2PfUtJLg0LVt/lcbeq78S4o1cCe/ZRzJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ddUAlTN3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715658158;
	bh=wwytIdt49Q2rSSoLbmsZa8lu/cl2WqdAFMAM6paEd7M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ddUAlTN3Tftw+oYTP9pYtS63QWQv4GRzEp3m9zK0z2V1pu65QTe94EDja4g69tZmJ
	 m4KQqL0fkraS23+Mly9RNNHmf7pG5jFAxSwagm0UDwVfbHB+WXLl4AcVofmGFMQWxP
	 EaZbYXTGRPqDSSmNMDIoUG9WEPo/M1odUWcMXkbQWjs+v7KN2Hq/fR9a4cCpowWSNZ
	 HiiFsmn4mTYKtqEIe6a2/UOYZws7dU4qK9KaXY+OLbPkAKME6R4YKnMwZ8X8y83nPI
	 ZoOQCBKCgdEinyFcH8UKLS76S0GTGX8fJTIWGe/iVVEaPwN7Yq4QzypGNRqH06IUul
	 1v0vJRBPp7qow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vdhy64Chtz4wc3;
	Tue, 14 May 2024 13:42:38 +1000 (AEST)
Date: Tue, 14 May 2024 13:42:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Subject: Re: linux-next: manual merge of the rcu tree with the modules tree
Message-ID: <20240514134234.5d9f033f@canb.auug.org.au>
In-Reply-To: <20240424134551.44531979@canb.auug.org.au>
References: <20240424134551.44531979@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q2UE10_YxcKYRCT4MmR.d0l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/q2UE10_YxcKYRCT4MmR.d0l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 24 Apr 2024 13:45:51 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rcu tree got a conflict in:
>=20
>   arch/Kconfig
>=20
> between commit:
>=20
>   3f26835b6c72 ("kprobes: remove dependency on CONFIG_MODULES")
>=20
> from the modules tree and commit:
>=20
>   900da4d2a57c ("arch: Select new NEED_TASKS_RCU Kconfig option")
>=20
> from the rcu tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc arch/Kconfig
> index 0ce4df5afd95,93d5010dfc92..000000000000
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@@ -52,10 -52,10 +52,10 @@@ config GENERIC_ENTR
>  =20
>   config KPROBES
>   	bool "Kprobes"
>  -	depends on MODULES
>   	depends on HAVE_KPROBES
>   	select KALLSYMS
>  +	select EXECMEM
> - 	select TASKS_RCU if PREEMPTION
> + 	select NEED_TASKS_RCU
>   	help
>   	  Kprobes allows you to trap at almost any kernel address and
>   	  execute a callback function.  register_kprobe() establishes

This is now a conflict between the modules tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/q2UE10_YxcKYRCT4MmR.d0l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZC3aoACgkQAVBC80lX
0GyJ5Af/VhbBJc4muWXEw2wSQ8F7vJ3Zhqonb/TsXNCMyNjSRLKpvGvbEsC9RZS7
jFvZbuWtmnefihgWriN4Go6NN2UFgmiemHbYzDhuhWU/AttH8ny6g+eucqkiHMJg
EdqzGjxgPnnRO+VUSeuOPP98HQmxre6Fbi6MI9+QCR6a2Lt9nQUPlS5xRq+ZtmGa
8W0h7J2jX1tDgayBnOESMO7q4Nz+/mB5r27rBE/T2uoWiwc2Mqh81mHanlw96KKA
nE3yJW7D2WKkUyN0ITCxmBPECuc0Kz4iQIj0VBC257+s6Uvt24qLGeenRX34pZG2
wZq3SIn0twik5RP54VF10okoiJD9ZA==
=5sZ8
-----END PGP SIGNATURE-----

--Sig_/q2UE10_YxcKYRCT4MmR.d0l--

