Return-Path: <linux-next+bounces-7298-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF4AF0825
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 03:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8AF81BC6819
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 01:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35763FB31;
	Wed,  2 Jul 2025 01:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iXCwWXhA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AF73C26
	for <linux-next@vger.kernel.org>; Wed,  2 Jul 2025 01:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420991; cv=none; b=hU5Yp9W0yf1RvFL0mhn/yqPpz5MmsSIbSEZy2CaJEn9E9XwIesaEHoMT+x54vTsQGuTTFjIgKtUoIYX0PY+HyZ5rOHLuFe0RcCkmgG3MmOVCnw3c01FlAX/FvzDR16E0p5tTlMmoY+QreIu7Sib8cls7qY5xAWdee8ByyiEZvXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420991; c=relaxed/simple;
	bh=bxrZd5VnIU8SsI2gQB6i1KOiatDFRjO9XGimY+470o0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lj8ze5rrJlaJGvE3NIjcs5LI1MfSltGlO14NfYLt0r7Bt6D9OF5xR8Vy659KcVoJggGdRJMAvV5LWZHDNcygJUYCjouas9AgOvFlPZp8R/zfIVlj+IdLXMi0OX6HTzD/rIQlxHUj81CDiJ3+QGdzDfnsWZjm3aNF5AYMe7IALrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iXCwWXhA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751420970;
	bh=VXy2MXucUAwAMgC5dNJmBFgEBpE/G+rOGr+3LXVk6aI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iXCwWXhAX7kvp+WmecSmDvMABSElLwxyLBGeKfv2dDg1Gcgpfj5hKrSnmws6ZLb1R
	 DABcqEU0X7HWj/7ljISDwX0L5ZCQnOGNdM3C9FjhbVREbzawRplseisvHGhBEEroBN
	 QJzxvUWj2UNlZns1FvY8CVwUs7vXTi8vvTWBAafQRd7qVQbJpILrKtllUu7jqeKJf9
	 7gNYgrYkn91JxlEENNexeNZ2ALl920WNEwNikaLvF8ZFhp57LIOzm9mxDbtptBT+N1
	 aWVBT2VI1buaPvqQXHxKdYIY/N2FR2/Yy9rcdxUbL5P3z8F8gqIQJgJMLAjVRbJBPn
	 lbHYYp+9BsI3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bX2rT6Qxqz4wcZ;
	Wed,  2 Jul 2025 11:49:29 +1000 (AEST)
Date: Wed, 2 Jul 2025 11:49:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-next@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: Add bmc/linux for-next to linux-next
Message-ID: <20250702114941.5bfe1e5a@canb.auug.org.au>
In-Reply-To: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
References: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/olnj4gvN==N6hy44f10+yNA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/olnj4gvN==N6hy44f10+yNA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 02 Jul 2025 11:01:54 +0930 Andrew Jeffery <andrew@codeconstruct.com=
.au> wrote:
>
> Could you add the following to linux-next?
>=20
>    Repo: https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
>    Branch: for-next
>=20
> This aligns with the recent patch to MAINTAINERS for the ASPEED tree:
>=20
> https://lore.kernel.org/all/20250702-bmc-tree-update-v1-1-c270cd8af0ab@co=
deconstruct.com.au/

So, does this replace the aspeed tree
(git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git branch
for-next)?  Or sit along side it?

Either way, who should be the contact(s) for this tree?

--=20
Cheers,
Stephen Rothwell

--Sig_/olnj4gvN==N6hy44f10+yNA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhkkDUACgkQAVBC80lX
0GxEeAf9GBf7tmaV5IVqLypKCi0Vd0YU0OiupwyekgLXR6FnI/jA2pB5AbHCe5mt
sKYyqctFxEMqPaS3x5GZXHMea/kJ899u+RbkhQNUwGHIf94SJfkhatNbvDveAZzD
LfQWG8VIwar6MCP/wH8LH4q10lMRaZPGHTf//iLr+rSPyhOKCTmXYEh3IhWa55ZF
pEQ7TeOyXnd0PZIKcTmpuq95fKJyV9UX5W08XXHC4crCLitT1mNA4ydgwwpS+eRk
WEr2keM3r/9RyShdN02dTkgzH2b/YJ8X1LjSMJyM/o3EjNbuv7+CcZQlgK8Flo4B
0Jf0++FNkD8ktwVo1JPp4Ir+815Cbw==
=pNgw
-----END PGP SIGNATURE-----

--Sig_/olnj4gvN==N6hy44f10+yNA--

