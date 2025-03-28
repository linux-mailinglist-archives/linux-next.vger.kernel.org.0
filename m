Return-Path: <linux-next+bounces-6054-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0936A742FB
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 05:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6668B17883F
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 04:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A411D554;
	Fri, 28 Mar 2025 04:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jnpzymAv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715C04A21;
	Fri, 28 Mar 2025 04:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743135591; cv=none; b=Npi2zoN83e7+jcXTNsZNg6sDgdGGu05oTTKU8+8pL7mxyoCC+1MPjpC3Myr7PGD1CF5kxsgs2Rrdr74TosVVnWv++W/gjoGeBenOaus8FW7UvaEsDBHpRct0TKFUWvnplLG2TGAIxO1r/8TnomdvwVbQaRCvS8d10WifsdByVNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743135591; c=relaxed/simple;
	bh=CX8hHtZC3zHqhzfOkrbwnsalwwY4TaonL3D5GHpHHqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SvKISxkLBHO3Yiv7j+NznTYkyL4jAMDkKwySwWlsD/otO5njQ52DuuPMavwK1aIjaGT3lN4KVEiePdihkjXTg/IUtqpUIT7vt7/mjNnmsUKwZ6KScbkoSYbNyoWvrNMsCvzPJCH2hnlwnKPSDapRBS1XKOFbCFfsILedCbHX4Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jnpzymAv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743135584;
	bh=1JI8Spr8CQJwiv/5zUbjBL/c6fAB1sqcE9kasiVrFP4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jnpzymAv1zAA0RWvb91quB+H+w3pYz1u+Sk3y4FjosfTjwqwQlnBkbPffP/iBFpn/
	 tyUK+2MnYG6l6Zxv8W5d6Yw/rCzNgaJf5CMFE4YglDxJZeRQyvAQX0BxHn6ZParBwZ
	 nuPEwuimk0eEzaTAZIA0ts9y/6N1DbO2Q292dD1rCbCUAxidj6jJuo4yJtA4cA3bUh
	 lGqyPrBvNpX2q1ECH7Nkc8iHNKMhvS0Zuqi8RahKvGBg5xLluuBJLxmq5EAcGjan4P
	 9vMR5Em0kNGdLu1DqPNJw1fudx1tuf5QY80hnWp3EgU01DYUG6edINd/wHUo0JB5jq
	 szsfPUiVCJh5A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZP6k74mgmz4x2c;
	Fri, 28 Mar 2025 15:19:43 +1100 (AEDT)
Date: Fri, 28 Mar 2025 15:19:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the xen-tip tree
Message-ID: <20250328151942.4f7010c0@canb.auug.org.au>
In-Reply-To: <20250326090310.4f162838@canb.auug.org.au>
References: <20250326090310.4f162838@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VaLoMydcT4kXtExIf_CvhVI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VaLoMydcT4kXtExIf_CvhVI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, 26 Mar 2025 09:03:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
>=20
>   d9f2164238d8 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain f=
lag")
>   cae5129fccb1 ("PCI: vmd: Disable MSI remapping bypass under Xen")
>=20
> These are commits
>=20
>   c3164d2e0d18 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain f=
lag")
>   6c4d5aadf5df ("PCI: vmd: Disable MSI remapping bypass under Xen")
>=20
> in Linus' tree.

This is now causing an unnecessary conflict.

--=20
Cheers,
Stephen Rothwell

--Sig_/VaLoMydcT4kXtExIf_CvhVI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfmI14ACgkQAVBC80lX
0Gzh/Af9FOi+c8QohCH1jPO+K+gzuS9jsyRS/J5hUklhzkTeytANSpuw+zJSBLzX
QlxsbuMb7jmDQMRSZZzVT12rOirCjiUheNFWv+zW3Tu6BfUaIzLWmM3+fA9QIVef
mfvZZxKhsY7WTCM90A4s0bPYMbT34GpNFL2NKkODmtxHzr+y0rEzCYPByhuceyaL
ID7dpaXk9yMDiyqu+0ngRUV4D4Yihns/f5aqnePlI9vRUxU9fdqqZZTeahU9YEvl
DbBKy42zaBWxn/m6FpND3y1XmMEEPsAIGK/howEm9d4vfPb6K6utCbkDURhApB+9
JH0+nKQglk9ZowFvG86GBX1ljWfGHQ==
=EJ1Z
-----END PGP SIGNATURE-----

--Sig_/VaLoMydcT4kXtExIf_CvhVI--

