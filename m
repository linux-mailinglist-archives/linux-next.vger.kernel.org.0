Return-Path: <linux-next+bounces-2723-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402491D4B3
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B04372812EF
	for <lists+linux-next@lfdr.de>; Sun, 30 Jun 2024 23:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DE3482CD;
	Sun, 30 Jun 2024 23:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hR11CryC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3345C18;
	Sun, 30 Jun 2024 23:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719789206; cv=none; b=kVP/I8MP0JcjUbNYUEOICATR5xEgRDfssxc0b0UgcEzlIlnnrQEwtvEglzTQvaT6MiuLRECagP9aCF0pYa+wiem1+/4ywYFMbvZc2wvQV0DHIbNQ7DYRBLJ2e9LMG0Sy+AQuZN+8zNDrCu6o6G+UnEwBUUeCzgVAtb8qikxDClo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719789206; c=relaxed/simple;
	bh=ow9/o4J+zNAWeek9LRewxjZfmCWMdWv3jDtcYLukOgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BZuI8A/0/DpPpIMN3s/z3tbF4MoN+WA1iP3WKgGxz9sB9AvHeMj3E5gfbcc7Zfi9w6jUYefhErdxK8BT/kUJDRHkiH7VMrX7OqZiee+HEibxx8wm9DJaY4joB4itY/2m7PnTKFoASpvDDSWXiuWq2et2ZWokgY343AVvOYDb+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hR11CryC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719789202;
	bh=H3ylW75ywBZpvBfiwqIKlo0G7iXhT9583ozZWRz6Kx0=;
	h=Date:From:To:Cc:Subject:From;
	b=hR11CryCA1NhstBMIE0TA68sf545XONrX1bdbDBlSdCbxHRXrOmZHcw7Zmi0opCYI
	 juLXKQWcSYwZL9r5/BiFdUJwsKu67oQK8j28hYFKbMbfLf9zL6bG2YxH5T8JTHGiWh
	 hJOFOTktDdsx8+hOY97bxNOxFuQU1pSlNIs7vqkBo7f0JWRvLCBfiOFtAsosVLzOQK
	 ElK5n8tiYiH/C4WGU4zEVKojwEp3sVRwfcp0iONqq+KEpw9ZtMo63e3X8OEccGIOd9
	 s0XRqtw3DOLxLdgzgcbyhXD+HQat6ag3P6UT0Ory/yoss9VGxGkINhxKCt6dLkLfps
	 cEvPmK4sOwDYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC4jF4lldz4w2Q;
	Mon,  1 Jul 2024 09:13:21 +1000 (AEST)
Date: Mon, 1 Jul 2024 09:13:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Niklas Cassel <cassel@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pci tree
Message-ID: <20240701091320.64ea6091@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OOsv69WPvI9yo7KzM2Zn4RH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OOsv69WPvI9yo7KzM2Zn4RH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  aaf840725904 ("PCI: dw-rockchip: Depend on PCI_ENDPOINT if building endpo=
int mode support")

Fixes tag

  Fixes: 9b2ba393b3a6 ("PCI: dw-rockchip: Add endpoint mode support")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 728538f5e806 ("PCI: dw-rockchip: Add endpoint mode support")

--=20
Cheers,
Stephen Rothwell

--Sig_/OOsv69WPvI9yo7KzM2Zn4RH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaB5pAACgkQAVBC80lX
0GxJEAf+JF5qj8jK40iqMeRT3hWwoYgz6gvYr9OUSeCZfKt/GQuhxfvtG2ZgLXS8
OlSQr4ac9t7v5D/Yo/j+xFse1IlEsbZZT5B+4TBQFrupwBGUo4R/xVwdYlNtCYIC
sLuRztLWDbjBm/6piKV0KcN70tkg76BIKv3JApHLYbY3jhhZWwS8Afsbgf6jRv1X
MELg2U/JWKxhoB+kyxpk0Z+YuPKbkTpKGmQ+05o5GU2oMKuwhq55+RomvDBJEJkX
2L/KSm9alETe1Kj+WuzqrgfWmJG+ecYsa8iuGS+2JSmFGYQUSAfFTEJjMIVHEEpj
W5Yb7on6xy7S0w69sBXNecV2ug2ZKA==
=APTJ
-----END PGP SIGNATURE-----

--Sig_/OOsv69WPvI9yo7KzM2Zn4RH--

