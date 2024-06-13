Return-Path: <linux-next+bounces-2532-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B218905FD4
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 02:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D43D1C20DC4
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 00:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEE38BF7;
	Thu, 13 Jun 2024 00:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hh3Sp4U/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692118BEC;
	Thu, 13 Jun 2024 00:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718239899; cv=none; b=sXfCfzhdoqkcyQeFf+gXV8OZak36UrtwlyTgd/901o3lGlyrYBZsUuWoLEefSPmKY2MpjhQpsVXbdWjq+Oj3K5xeolSnludUVIDEDa9wx1vK3zg6cDlGvpwDOJfLMJqp6h5QKALU4U0+R5FzEblWulayRmTXGP/nTxYRUTcIBUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718239899; c=relaxed/simple;
	bh=fqEKlFUuwqPY3rWw2XTFHLXzzpYuxOrB1FH6Wxzq0Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uwJ4RWu5+LimKgJ5/0eq8q6f4nLd8ois6vT8ggAuRYAhT6/qxTJk0Sz2SuHqQ8KBQA7GkvhGoIKDBv6+8Isca64F7fCxcu9NrqAM1TbqNIpIe7doSLcrVAgx9ChBGnlLXGu26GGXgdwhK+nhRsjwK79gZCgFtqXg3opxjS8GWOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hh3Sp4U/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718239895;
	bh=4wFh32GZAp5AYRnxU06zpTL+iEdr63DB7oikJKI46eo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hh3Sp4U/h0FAnIRKWZKW4rmAWjUquVTkT4VaGGoXMLPtRoYPRNtmHepSPKbch8i34
	 ztjrgxb6GfVe9iFFOQaDL+Te+8vmj3iDvU4XDyWEkmyUz9qr8bFlPhQBYciJZWmDr/
	 +zoMBhZ3IHf5p6x9PXXMafWXyoehQCTbTXoMYfeud/MVBaTjVjbXCTNwvBpDa1AnpK
	 0ZBDaBC4ZBRoIkWuQIB1Tzd0N4W7gVcwrsbn1419VBczETQN9Ugz72/c7Y+i8d1NLt
	 YpJpHfcPYjOsPlBSY1K0hpRJPdBDsP+/rnXELEkpXFBl1viHh4jGCnPMMxeObRowRp
	 nw/2Di0WBIBlQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W03kv3J5sz4wc8;
	Thu, 13 Jun 2024 10:51:35 +1000 (AEST)
Date: Thu, 13 Jun 2024 10:51:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20240613105134.60017c65@canb.auug.org.au>
In-Reply-To: <20240613104837.346519cc@canb.auug.org.au>
References: <20240613104837.346519cc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e.=+TyY7iOeQjPbS=o1xSwO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e.=+TyY7iOeQjPbS=o1xSwO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 13 Jun 2024 10:48:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in Linus Torvalds' tree as different
                                    ^^^^^^^^^^^^^^^
I meant the mm tree, obviously.

> commits (but the same patch):
>=20
>   08ce6f724ce9 ("proc: Remove usage of the deprecated ida_simple_xx() API=
")
>=20
> This is commit
>=20
>   d92c9986e4db ("proc: remove usage of the deprecated ida_simple_xx() API=
")
>=20
> in the mm-nonmm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/e.=+TyY7iOeQjPbS=o1xSwO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZqQpYACgkQAVBC80lX
0GyraAf/ZK535iI50XdYztWu4Xlskl+6/MfRuaJLIg/v4yDig1ZQKM+6xQ5DYBVa
YrzGpHsBEEceB9guAkJcQqmwwaezCyjnVb8onlk5o98SADWoi6amHAbZHCKIHoQC
G4/YU8uv+0YLDxi/0TSOEDxmWfIepeFZ3Vr2evIh5Nd2eEMMJUS/LS77I/0/ojDh
EQE/oT1jaPZQ+0faCeugj8g5sObxAn+phYxTuflcpFt/FbwsYWYY5C8+k1CB2SG/
h/9otfdmiBwGoz4bLibHTbzZz9s7rKkuJErSKxavu82kkaH9SwaqZNhMJaY1MKef
Fji15mex9/DO2FK+8eGxX+AWRFBS+w==
=3qBA
-----END PGP SIGNATURE-----

--Sig_/e.=+TyY7iOeQjPbS=o1xSwO--

