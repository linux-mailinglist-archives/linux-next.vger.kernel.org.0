Return-Path: <linux-next+bounces-2783-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89791ECC7
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 03:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1896C1F21C7B
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 01:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2190B8F4E;
	Tue,  2 Jul 2024 01:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="esvr3f/7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA08BFC;
	Tue,  2 Jul 2024 01:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719884601; cv=none; b=RcgvsB5eeRyc4OJmT3qX/wjYXz/U2eweifzQM/MFY+8KKvLvBGE2kUbqPzWAQf3VaFR6+7R8QIVLj9d3aM3UtZ0xdXY7f9X4moAcDXCYcaQwdLKRNb6x7jegpGnIfmXbNVB3akpLnqQeYmdcBtMxMtaF4m6mgQHNuvdtuhKOjls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719884601; c=relaxed/simple;
	bh=aoPiI/KCw8ZYQ+EiNnWknG1EiOBnkYltsodd008VqX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WXpX7QGyyXkgdU3XA4dkoBS5K4IhrnHrke0+x+NY1v1Sep8YMnzKEGF5vhO/vRrQkmd2rmOG51INBYAI1Lvrl5BwizXsjjV13HxjyVz+QrJ1FFD8jq4T82Zxh+NIhhJ3td9v3w1RoCxbKbYpQnv+usXngAhkgzGqUn9/PyhWojQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=esvr3f/7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719884597;
	bh=vXMYu7bQHpE9hlxtss9XH7J0+vE2VrJPMiFUDJ9/O5M=;
	h=Date:From:To:Cc:Subject:From;
	b=esvr3f/7KBWY9RkxOqzboOdOeyCmTj+oKGzOpvuGcJ5juVG6NcFLVQJtrLVt3vho3
	 CUviTHruLbm3bUn4Wov45K4IV/hPyxJUwQMuBW2u2N3b0DWg4LTPeNW0gV8aU8ezcq
	 3APg1qC03wuff4eypGa0mRc+zyzYWuPMBf/oRtW264heB0LYfViKMi80JnpKRmYU3D
	 eZ2EzaX3AXnFUXHcjcluWTHXde1SksR/TqnKm7Nv9kZbBx6wJ66WadNbNrslGZyWZm
	 wYnKt82eiA4jV8jtvi61MeKsGm6XWAi5aC9GSfzaWZoph2/QuSol+QXsNnF7Dr7QIh
	 +3G9QWJ4UM2lQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WClzl4wZJz4wcr;
	Tue,  2 Jul 2024 11:43:15 +1000 (AEST)
Date: Tue, 2 Jul 2024 11:43:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Luiz Augusto von Dentz
 <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the net tree
Message-ID: <20240702114314.6bea5fe4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XxHDJP42Z/tEGn2=KGyv0jo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XxHDJP42Z/tEGn2=KGyv0jo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/hci_core.c

between commit:

  f1a8f402f13f ("Bluetooth: L2CAP: Fix deadlock")

from the net tree and commits:

  6851d11d389c ("Bluetooth: Fix double free in hci_req_sync_complete")
  7b256038ca7c ("Bluetooth: Fix usage of __hci_cmd_sync_status")

from the bluetooth tree.

I fixed it up (I basically used the latter where they conflicted) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/XxHDJP42Z/tEGn2=KGyv0jo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaDWzIACgkQAVBC80lX
0GzWDggAntpqccb5xUNZz7Z36NHCgF3sFWLffiRVHIus7SaByFdVyNmw1jcO9KT3
zxvEb3UrqKfN3EKEpM6MiZhNGPQndjh11p6LoeaxIFt6QHmyD7Qbzi6YVzglzZNa
IqqBJzehNTMmK5GNWhkoF76nufYQNC0XrmqOn9xloOuYqk5zqo1Y7pXtcGIHD+Rh
Sig3MxUIIo1yeJLp5LrjsgxAsd1tnXi0hwZjc6oVdyF1ABFGN9WAXeOwm/5Gf32q
Xyl4yZkBtYrWFlzWNeOfDZtr6uiarQoqUz2ZGwfhFq3aZcrurce3Aa/gROXbS3Lw
vsxedMCvgwRhXE4ZkqaTvi2APBA2Rg==
=hief
-----END PGP SIGNATURE-----

--Sig_/XxHDJP42Z/tEGn2=KGyv0jo--

