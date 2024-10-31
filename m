Return-Path: <linux-next+bounces-4565-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 713EF9B8618
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 23:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18EE61F22764
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 22:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1461CCEE8;
	Thu, 31 Oct 2024 22:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HQlnb6E9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F1B13AD32;
	Thu, 31 Oct 2024 22:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730413557; cv=none; b=f23LQ5zZlnqOfD86ybyexB95P8vZwiXuGRrBaYwa7Jbi02N5t5SfMyHEx3Ya+pzYTj9bIuec8UDtTXiZJfbaV10Wi0khyomYpD93LQn8UTHw0CgaOhPdTTUy92bkdASv1G0cKqfAlm2/OoJcTq3bXe1UDMvSBpC6AiFXjQ2PlNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730413557; c=relaxed/simple;
	bh=Edgn3uzmQj3T04kGffe6LSYj3UgReeBWA4oD76xWHV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EgRL5Rja3HjnedRujl5yApKub4Woy8c0qxCi30okapwmWL7wdl6s2dpDhv1xMdQODV1fExatV/xR8YvPagR+VHQwNrtUYuebCh/4FonpmcqNHEUmSWLqsGKc//vTFg5hlqSfnJmGlhYxR1z0ID9/f4bkJH+cWKVyktBTh5Tpjgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HQlnb6E9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730413547;
	bh=1m5thijPAFBISTp2cS01L4aO6FWEpOPAlcrxPLcyTLs=;
	h=Date:From:To:Cc:Subject:From;
	b=HQlnb6E9LwZiVtRzZG4l86cVlzdAPPsVZ/rtpBpCEmHpfIerApQpxdEKHrZa3A6zq
	 nHBEdP9WoFOqu9TNSQOraWwBfM5Wyf4RlKp7uJJGBeLocJsd9yM78rrkOCGyXdV7FG
	 UkUtOIkIb2G7/flTUvike71YtmcnNhmHagx/IXGeDBw7lULWUcbUe163ENNPw+YPeg
	 6pTIvWxrmeiaI0IEH94S1CECooOxD5QRmAHzHXKj3OoB0LrGNdGubEgfOA/FEq+aA3
	 lATBJtBiNI3tvU1mQjec1x7OdMIA5qd8AYs2RnaASQbkBPjWA+4dOAMc6qERYmr9eg
	 zlbmeLSx7UnIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xfdqb2vZzz4wcs;
	Fri,  1 Nov 2024 09:25:47 +1100 (AEDT)
Date: Fri, 1 Nov 2024 09:25:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20241101092548.4b8f284e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HDupZ7kzPfSVSzYDb0fGurS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HDupZ7kzPfSVSzYDb0fGurS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  0490aee1d4f6 ("btrfs: fix defrag not merging contiguous extents due to me=
rged extent maps")
  c84084eedf71 ("btrfs: fix extent map merging not happening for adjacent e=
xtents")

These are commits

  77b0d113eec4 ("btrfs: fix defrag not merging contiguous extents due to me=
rged extent maps")
  a0f062539085 ("btrfs: fix extent map merging not happening for adjacent e=
xtents")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/HDupZ7kzPfSVSzYDb0fGurS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmckA+wACgkQAVBC80lX
0Gw+hwf/SZ6p5wST91UkiBxT7v3iiX2HK2G19qjTBrhtGcJHD6o35Uyb1VFDHdxr
P0W7OBVV94i163dVPvhUZfYJ/aNuONXWy46h6sJpXUl9rIrjCGzvMBJS1zJ69WSo
jlAGx2IhcdV5EgXOJxyObNx+tH/1/kWEDHY33295HE53Ndg9mTluJHr2Nw8MzaZf
oCqKhdMxp5l7Csv7dQwH6T52ZiHvuA+RoDABUWN8hX4HlX1veuuhcxyGvy8Jj+5z
HOVaZJTQswKE7dO/EbLAZYtud1TEteWisT7tCPAnLQ7fJbubgTJb5VSPvsddMZVG
7/QiXM6wC+rmiFa3mHQs5efXMFPCVw==
=q1jC
-----END PGP SIGNATURE-----

--Sig_/HDupZ7kzPfSVSzYDb0fGurS--

