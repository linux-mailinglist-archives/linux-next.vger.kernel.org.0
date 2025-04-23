Return-Path: <linux-next+bounces-6347-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B9BA97BAE
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 02:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2C92189170E
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 00:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C037253F3A;
	Wed, 23 Apr 2025 00:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YIRUNDY/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C541F6679;
	Wed, 23 Apr 2025 00:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745368347; cv=none; b=n2Y2yVopOMz+iDpnOzWvOI3GU77uACSPgrYYCZDf/RhWEC3dDP33TE9p8San73PsitL4MGY7EzozNfkuQsy07CNcH+pdeStRZeWCT4p50VB6sxOv0Nzy6ONDfOQvAPKf6ML9fqYLmQwRGd1LuCV4grh8K3ZstrCx/uTfDiSd3Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745368347; c=relaxed/simple;
	bh=XQCyn8ocFK8z5nmU9bKGp4a87D5nosmzUFeI++J+pIs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AdGp3na8pMSb43fT1W++ZtA+4WdThLw+TJYf8HGUMcufYUrCfXCd1AKDPQ9OMdCVV4D/gf2wOChcooaUyjKylUXmqm0DsjgiHPH407hmUO3JpQyVYSY14yQtFao3o/YTkEycPLGMGr+gHp61FoEmucnqvNRfRAU9Vnah6Rr3HyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YIRUNDY/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745368340;
	bh=7Mu1fq/IB1qTiVkFifyN55a8gm4qCLeG0LyImlBhkH4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YIRUNDY/vFb9BfeQhup9hcEbTa4r8zIPmOYIdmCav+mGHNhsC3i9R2r8sXXHtQMEV
	 mXFO7e+HEvY7x2eKsqVXdSQgjJaTv6DG2Sk4FO0daNzBM4gLy05rX1ZRqJx0v4ZkN9
	 EcOUEHnf0Htt8xmotAxdKNyJqTM1TKOhwoOJNW7UfckpgDKQblv+gBCjfjxBxbvG48
	 WJB3tDI4bgPRHkbziTQ39d56jDzUTM+k8B50FECo/fywxx8d+17g218WR+i139IW74
	 KD1JZoGyV4t6pShxms40ZCTPxgU5GMGL7SBSPxDY/ZJIERqNlPcDryr3BzV9ZTp3mL
	 /cDpvFCVskgBA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zj0Rm2QH7z4wnp;
	Wed, 23 Apr 2025 10:32:20 +1000 (AEST)
Date: Wed, 23 Apr 2025 10:32:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the btrfs tree
Message-ID: <20250423103219.445081ec@canb.auug.org.au>
In-Reply-To: <20250423082924.0304a186@canb.auug.org.au>
References: <20250423082924.0304a186@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tx2lAelr/Lx8SQ.fAzTUpUy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tx2lAelr/Lx8SQ.fAzTUpUy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 23 Apr 2025 08:29:24 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
>=20
>   0343f88be454 ("btrfs: subpage: access correct object when reading bitma=
p start in subpage_calc_start_bit()")
>   308a921d5c45 ("btrfs: zoned: return EIO on RAID1 block group write poin=
ter mismatch")
>   39b4c6395e2a ("btrfs: fix invalid inode pointer after failure to create=
 reloc inode")
>   4853650cc31d ("btrfs: fix the ASSERT() inside GET_SUBPAGE_BITMAP()")
>   4a50116e0850 ("btrfs: tree-checker: adjust error code for header level =
check")
>   53dda1b821c4 ("btrfs: avoid page_lockend underflow in btrfs_punch_hole_=
lock_range()")

The above duplication is causing an unnecessary conflict.

>   5605a0903ce1 ("btrfs: zoned: skip reporting zone for new block group")
>   982446a056f3 ("block: introduce zone capacity helper")

--=20
Cheers,
Stephen Rothwell

--Sig_/tx2lAelr/Lx8SQ.fAzTUpUy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgINRMACgkQAVBC80lX
0GzdnggAlRxB77MmUzoh3IwnRV39BieSb4jNM5EyuVUjk2umt4DawFaST0X0QXpy
u5VJnDieL1gD2PXT8Aoazfi+sq9xRRHj/yArnUCWA32Z2QGwDkbXGRQMg+AarB6j
L312eGeFGd2PA/gDqiwv+/6agZcTQ8SRW63qA+7xXpAQJasBDuyZwUDlPi9WAZ+0
h9UKv4sJPLcAixj33aZsxl2AOvA7Cezj+1j1zz/pJR08rlbeXpX727FjvlkAF3LI
HyGdxQRw2zFjuNqiIi+EoY5RowSqZWkkx8KvnYqJ9dQrYkD5vh09O8eznzF0F+++
8Ex2SQsALpn2Ht9Z5sOu1US+7xfSrw==
=3TNj
-----END PGP SIGNATURE-----

--Sig_/tx2lAelr/Lx8SQ.fAzTUpUy--

