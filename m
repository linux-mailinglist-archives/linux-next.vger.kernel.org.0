Return-Path: <linux-next+bounces-2996-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F86930C41
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 02:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1580128139D
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 00:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206CC256D;
	Mon, 15 Jul 2024 00:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AuJk6Wh4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B27F6;
	Mon, 15 Jul 2024 00:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721004384; cv=none; b=OyhFvxf5yVseOHvhweXOnnOXQudySUBSjbo8syvmpChr7VJUcTko1rHfS6vzNUbKcvtOLhOq6GFXdUfN6BadI9nNpbfLkYojCSE3MqpVj8nyLM+1u5+h0rSmpKvLq5iGn919njGfheJzAL7wIasToFDaT1uJCKSgCTP9IGdbo4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721004384; c=relaxed/simple;
	bh=Uawk6NwbCVWWbjG1CT6gp1kTRD8avImKTFaSYhyTCiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nq8ElZLaclkXd469F9juKPUflRwRtjdLnOSVDjJZ+iqN2qRKW1uxyYWyZYFwXiUme2kN23D6p56JGiFkEJov/gXEPrvOYK5yDFRkTaW5yxOUzyMfV94fXMZcyT/xIfJY4LNHLQlhKzAYbmZOaAqoHhIvV1yQp6Jk2ppTQYOnGEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AuJk6Wh4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721004378;
	bh=SqOc/AUSA5PIpe7+Uxbh/LRA2tqkD3ISCiipjsQvKRU=;
	h=Date:From:To:Cc:Subject:From;
	b=AuJk6Wh4klRwI0CwaQirJ9A8njOZ+6MpoIBN8iR+OaQDUA6bTewB0uCokxfm8gsVm
	 FUDp/azP7NLEiI0E2uVRKHzdRCWc5q/bTHr7LZxdKhJJbvjcrEsAQutRn6Wpwnr7A9
	 XLJVnaPBQ01ajaoBujxLK5aSTYLf+DQ+AxeihhY3D7F5z00KRNV2bd3MJ+vZCJxWJt
	 R/hUR8NNXqtcmPrgFZOeN8uzccQSfHu7tbkfEcx9VDA61Y/Uozkh/HLwsXUma6gokQ
	 k3srffDV58WCWfb9uxPQ4NSZq8EBEL9nXYDejFeNbfaQpal/3h5YYlrhwT4Gn6b16K
	 rR+OaEEHdPGUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMk611Dtwz4w2Q;
	Mon, 15 Jul 2024 10:46:16 +1000 (AEST)
Date: Mon, 15 Jul 2024 10:46:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Richard Weinberger <richard@nod.at>
Cc: Ben Hutchings <ben.hutchings@mind.be>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ubifs tree
Message-ID: <20240715104616.6f445852@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VW=2goWFGkRuvAR7/9bRvlQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VW=2goWFGkRuvAR7/9bRvlQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ubifs tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: drivers/mtd/ubi/ubi: section mismatch in reference: ubi_i=
nit+0x1aa (section: .init.text) -> ubiblock_exit (section: .exit.text)

Introduced by commit

  72f3d3daddd7 ("mtd: ubi: Restore missing cleanup on ubi_init() failure pa=
th")

--=20
Cheers,
Stephen Rothwell

--Sig_/VW=2goWFGkRuvAR7/9bRvlQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUcVgACgkQAVBC80lX
0Gy7aQf+M0wI+km9+OHmvfkJ09ZMBPfEqjFjIWc8gnNf4ZPrXrwDKKdJjn4fnovX
bwuuoANCHBQkqcIzX/o66kSSohzye/putCUfcgroT9LjY8lu6HO1LwHLIvBJY4eP
abpQxLUj92uu23xL6ZemGxepPMR9PxRkfQbnKaHIT0VhBCCsBELThbTF1Iu9+3/d
Bl3SQGSAjRrUzuKbahxKa1TBoOIGpP9QiAO6NPh+CGwa5N75IpZgtlEM4NxG0yxk
lY7030Wdu6dZpHlmBTAHDASPSVKp6w3eLCIDO10C+9cYWzqhTV75lQcEA2SsYcpb
fIVPMeNrjxuxmgGz7xOYOYG4n9oneg==
=MPmy
-----END PGP SIGNATURE-----

--Sig_/VW=2goWFGkRuvAR7/9bRvlQ--

