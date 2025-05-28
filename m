Return-Path: <linux-next+bounces-6964-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB20AC7295
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 23:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5487717B5BD
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 21:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF7421883E;
	Wed, 28 May 2025 21:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U/wGcFHH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6266AD3;
	Wed, 28 May 2025 21:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748466664; cv=none; b=fc7/Gj18QktBjKL1W2ktLq3VqGsjJai+9UQrxiRN7gCNAjYQRh7eM6QtYuPAeu68BZLYzCvyXnakmIitctqFbFnge58JfovTqzVqcbGBYtVf5EVzwTLp4lUWMfoiJnarwuz1omBopD0I0rKkzRpX0aiRNihuhJ1m2N0MtKbgHys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748466664; c=relaxed/simple;
	bh=gT/dev74+/pWOOvJ1OFMcY0gnXKyWT6fdZv53jUrGto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YIXEkR6zYNv2MrJZdq7HY0BPoOV5bXumndM9irKULA5q39yMkvOO+ASadln6k1Fqgw9kugeRa1rtQY88wlN614dslmqYvBiFknacqfi17izCcAujqOuaRK4IIVQwNxI6S+DqJCZIunEzXV0jkBgzHFWrST1M4JnnDjEAyHCUcmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U/wGcFHH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748466656;
	bh=9n7aevo7Av0U2DTH7TTU+2VbyX8vvoCaadoxKjMwy9M=;
	h=Date:From:To:Cc:Subject:From;
	b=U/wGcFHH8lB8nlToetj9H59mJre6L7x9hllqNYvNNqE971FeId2/B90yjCxaqArhR
	 esnmWjZaRiKBItxK++8Mqm59nutf7fd+8cYWsdB6nTxYJHtfv3DYimc+atEuwD3sEm
	 Xe0BYKcGQmQX10aBPXuP/S2mArkJcdM5e0RJrAmf1dU09ybAdNowzblM5gNzSs6vDB
	 FOupJ5PuFrcK9Xckf/hwUntnx6CzKodccdxUkKPI4fSFByDL4t3jOHC/avd0DH6cm/
	 yXG+rSKNqdzmaw4yL0t5wlsdxNckaya4M3VBjdupmHahS8eAZqlbjprJNahZyYwvHY
	 jloukC0iiUvJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b72Gm3VpYz4x8Y;
	Thu, 29 May 2025 07:10:56 +1000 (AEST)
Date: Thu, 29 May 2025 07:10:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the btrfs-fixes tree
Message-ID: <20250529071009.72d9e8c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JG.S1Odn4Za7HmEuJ3tYzO9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JG.S1Odn4Za7HmEuJ3tYzO9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  4db7384ce55c ("btrfs: don't drop a reference if btrfs_check_write_meta_po=
inter() fails")

This is commit

  b83825a8f56a ("btrfs: don't drop a reference if btrfs_check_write_meta_po=
inter() fails")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/JG.S1Odn4Za7HmEuJ3tYzO9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg3e7EACgkQAVBC80lX
0GzoUQf8CgOrHA3D1pDeiJyrcHFV5RsJ7mF1nyS3wfj5R0HdD2F/ge5qLAtZ4/Zm
GeQjVoaC554Oju9g/BSaytn83/Yc8Tc/MbapM3WPtgNDH2b/fciivvZexM5ep0q/
+sTGSrZ9YnG8D8Iu5Xt1XhnhZSzYbytKLFcDqPKgI8JuCbkAQyjG3WTTYfUSFlEj
Q9ke0gIbjXJ2GjwxsI+fil+XaSVGhCNcNxgySCHaqFKeBd8Sv5hdwEuMfqG7n96o
uR1zbOh6L4CZHWGsqWQhvEdNI8C3GCxV3chRon8i5fBE+YBxx+86k93DzLtNinbG
Mh79imygIvnywWSjeEEfsKBOEYCVJg==
=THS4
-----END PGP SIGNATURE-----

--Sig_/JG.S1Odn4Za7HmEuJ3tYzO9--

