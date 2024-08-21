Return-Path: <linux-next+bounces-3389-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3372495A7DF
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 00:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60D751C218F3
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 22:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EE917C22E;
	Wed, 21 Aug 2024 22:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PrEG9tt7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB3017BB07;
	Wed, 21 Aug 2024 22:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724280088; cv=none; b=a7kY5Ss0p4lgqrua0jOWxRkXXsEobtXrJOpXJafpBgTWiSjjfnJQtuo1mtnACH1RYKqFFBt21pcxXcBF9Jt4k8r+Jsp6tyOx1DafAwZgDnOG/zUorIHKV4AiI2r1X5ZUPJDawUErDo7vOKv0n+kEfUo8CO382XNzQtI98T1QY44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724280088; c=relaxed/simple;
	bh=dpScO8StZyLl2n3uhDg+2zAxSGgvkwDoBO064zBpX/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RZUETJnVOS8G+PzjUdCI1rnR420XOSjLxx1hcPSPpXIEV6psTgjU2Tx+aExKt79fHmFo5y9dG44dRDzIe/rAD01L0WUPLWPLsL07aj1Gw53AQ/DXr1F7BfSCI9p6vho2yY9UYN73XoMSHyOabFUJj5A1S4QtEBq2KRl5dWiSo+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PrEG9tt7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724280080;
	bh=RDv5CvG9iedAsNtlr+mHPYxgxNBCmvoNwkPe5zP1Nes=;
	h=Date:From:To:Cc:Subject:From;
	b=PrEG9tt7g2vX/mUi1FA9Aatlo0bC3aiwdXtM391sdcDeFzwL/+Of3barEI/TbIpbV
	 iUyU+vyMantlqlhk/sv+9ivPjJXtG/QjUr9gdktv+vorJcOKfTD8pf3A0WM7Syg0Zo
	 zUt29xeLIurghdQeyN/nGpBfBCxRnUDwm63o9my3mAZxLQyHvXr93kwuG4nicORuRX
	 //AYu28sVlsthFEupMMhQ3fHAyv7OVjf63gl34aZzB7V6ZlQMAD9gcL1rH5rmxUv5D
	 ca3F1mHh3BE/uNOyy2rpwWcOdim14UjOsFNHBYg692PkJJVd6V/nhZknOTAadfTKvN
	 1VBdR1c1Umw8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wq1XJ0zCNz4wj1;
	Thu, 22 Aug 2024 08:41:20 +1000 (AEST)
Date: Thu, 22 Aug 2024 08:41:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the hid tree
Message-ID: <20240822084119.5b2e1962@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6/EGhvV+h//U8qMAJu13OAv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6/EGhvV+h//U8qMAJu13OAv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ec4989dea73e ("Revert "HID: hidraw: add HIDIOCREVOKE ioctl"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well ...

--=20
Cheers,
Stephen Rothwell

--Sig_/6/EGhvV+h//U8qMAJu13OAv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbGbQ8ACgkQAVBC80lX
0GyQegf9HLX6K065ZIXmfR6OTqmnEC5G464fY0o+4uW14AMreVXMSRhl4Z+0BVuL
zwKma9VVpt/p8Psa1Deka2xlpOybQzWVAVhE7uz/p8QlUD36YjkSWmoF02n88LAY
/XQFSjwnptwboqLHOKDG9GnJF99+zZARmR72ylw6RZ804EgqMZBN7yBMzPnRnJ17
Pwoneh3G5r+2UrnUNq1R4QpP0wxnnyBBiXM1RQ+SRNdA4fAYHIIGPZJu4+gcuvaG
6swNCie3iGyKKYqqWixdCHgC8OzmyBwfWGl1pm7LCVGHlVYaQnVyiPu7GrTBE8t4
+5x/tY76eE5bXntAFWmQdfBRh2H1Kg==
=grMO
-----END PGP SIGNATURE-----

--Sig_/6/EGhvV+h//U8qMAJu13OAv--

