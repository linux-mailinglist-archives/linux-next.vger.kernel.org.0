Return-Path: <linux-next+bounces-4994-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBBC9F6FFE
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 23:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17C951893710
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 22:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B88218B46A;
	Wed, 18 Dec 2024 22:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZRJ5OaYe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4B31957FC;
	Wed, 18 Dec 2024 22:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734560789; cv=none; b=GdCa0Cv4Ya/4S06n2G3LN7yV6lbRrFAgnu9YlH9dGxQA27Rkf8bnowm/mFekeZdoEuAeJviaK3BUhF2oXHpnF/ZepcLmFK4qVBpT4zzy3vDRZKQ4lr0CNJ4knrUx1zOdZ8Fpp76Rdk1AZgtyM2S2Y+WqG5f29oMsBEPZOxY7jVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734560789; c=relaxed/simple;
	bh=G5NPtv5Nd952g/TiKQ65OoytHh982dcv20v1yLEzmZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DF9HteDY+JQl/jKQCmhnl1BJp9DMBM09yXICAZzPunEHGku2GHeZ7j8EZdfcPv3MS62Rp0bGQkxvMwRNGpBlIEEUO9/ZvewgQDc4SWlzkCJ+7N07B78oHZdSqv707q7MejS1tc3dkEdqC6Z27XitXztZOtp70uwCWBzZ6iJqy5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZRJ5OaYe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734560776;
	bh=HQx5fXOQkn/mkbyjnHx0HBWWiBDyCFTlC0YUuxxnNjM=;
	h=Date:From:To:Cc:Subject:From;
	b=ZRJ5OaYeV4dz0y4yIEe9oCqGsgjDe2yAF8ng9SR/iQan8i2aiP8PaavwsWAL0zOXz
	 rDVgbddH6aGeezDqc6qbf2shQsbq+V9gkCoGahqCotQsfk9VSC64JZPqFHzJo4XzUH
	 WYFKRbQfOXSuPtFfCc7kBAbNu5kEkKpoXoaDv+myT1oPnHpG8jXBCxzcrXd57uYImI
	 U1DK3FYGcmSLvW4wQSROexyOo3L0dH0mGDiCejPh51bhXTwjHtdx0CXbob9lhLmI9G
	 T/RxEbRWTh3+WIoKnnJuYbJxr1hNsyZLNGgdrakv38sGiWUbfGcAm4eJpA6jHVC/jJ
	 JowCBt53ZnsIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YD7Yz6ShVz4wcr;
	Thu, 19 Dec 2024 09:26:15 +1100 (AEDT)
Date: Thu, 19 Dec 2024 09:26:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20241219092620.11bf346d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tbEaNey_+VDXxgkB9/z5t7/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tbEaNey_+VDXxgkB9/z5t7/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  0edf8424f406 ("btrfs: split bios to the fs sector size boundary")
  196fd52bb48f ("btrfs: fix improper generation check in snapshot delete")
  6d3a586d9ffb ("btrfs: use bio_is_zone_append() in the completion handler")
  73b9262e811c ("btrfs: tree-checker: reject inline extent items with 0 ref=
 count")
  821892498c29 ("btrfs: fix improper generation check in snapshot delete")
  888ecc4df068 ("btrfs: split bios to the fs sector size boundary")
  a68169ad8f47 ("btrfs: use bio_is_zone_append() in the completion handler")
  d7b708b11510 ("btrfs: tree-checker: reject inline extent items with 0 ref=
 count")

--=20
Cheers,
Stephen Rothwell

--Sig_/tbEaNey_+VDXxgkB9/z5t7/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdjTAwACgkQAVBC80lX
0GwO7wf/cMHOjo5PAp/CffIoeNwLX4w8J+Me6GNu5DbP4irjh2NEuxPS2JYekeMq
BvVw8HI21o7XDBGl6wLxO6qLug/Ivx5ilzNBBl69fC2rpKxSj1aSkviRecXkPzQp
LXFtVZoaMd7h23EOU6x4PW19WodX7RFEQd9ksUDbHhmyXLZMI4keSG64lo+R8GJH
2lt6h1pOMzSw6OVOsf/ZVackkKuII72NrZC4ZUnPpDsnYKL8LrIUVcH0j1Bot6LG
Cr/gbAARNrkRSVu7kACLQZrNwdMnHU5GDHyIZqKG0pK0rbcNrEKSkcACDH3lbmoT
vE8U0tFIaguLmzUBKSULvGumcHwrUA==
=k8zy
-----END PGP SIGNATURE-----

--Sig_/tbEaNey_+VDXxgkB9/z5t7/--

