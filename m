Return-Path: <linux-next+bounces-2456-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49F8FA6BC
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 02:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 693A5B24895
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 00:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC214C6B;
	Tue,  4 Jun 2024 00:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OGxfCwuH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE26B441D;
	Tue,  4 Jun 2024 00:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717459363; cv=none; b=B67X83kY3XY5o25jIf5lC1b0OWyF6NxwHAkajpwkJ6x6wY6tncvgaiTNdlVPMB8cueFmGXEbofd4VCBjUPuJBhq6ZqHK0SzOargViv46ue8ydS9b9CVdh2+j8oeXqlH11AFAmw93DrtP+kunGDVJQmEeKd2GVfClQCw2FarrHAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717459363; c=relaxed/simple;
	bh=aLunMNTt5lH5FqBRFl4O/fuhjwC2BTsbyebkuyXFTm4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l4e3OnxPp5wOmlMp6hy9IKaHFKfap7peOvm8xtSa7o5l7lzZAT37AcZK3Y61rFHf7K3Hn0wpMmQJrIVrYHuJ9kErVdevGrKrBo44FCvz80PMP08XUKEM7LhXIsOgj8c0KBwfSzxu+ssSuroAIhaE4jQG0WwaKlvH8yZ3u2gcFok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OGxfCwuH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717459353;
	bh=bCFagXrRCEE0MItoRSIDIVyE4IOW9yE5PXYk68yv53s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OGxfCwuH1usYsjdjeam50BnHVnrmQpsZJqdH1b9CHNQXD+dxtxjI+MPES9mT18VGY
	 HwdC1hsF+1iTohBWVDtv4dW9n3+Z484gyAlNsclFhHMZqWUtcjDQcBE9OxamJOQrJ8
	 6zohNQWfOdQnfOgwwbtq3XfB4kyuXxjpsZvr2SlUyQ/AHA/rOs6xM5OLijnptZwT8L
	 wezqZJLzIqxiul1nB3sD2f17/0YDBN1SmZv9eO9MRe64HElr+jwgeI5kFhbEUjESZg
	 YzidyReZsmMLNwfZ7VHgQ4NUAggOe6a+aW1Rc7yLImmdNTTDX0rDgxqPECiZ/rR6Px
	 jX8kzIZPy0SJA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VtW4S3gvsz4wyf;
	Tue,  4 Jun 2024 10:02:31 +1000 (AEST)
Date: Tue, 4 Jun 2024 10:02:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240604100207.226f3ac3@canb.auug.org.au>
In-Reply-To: <20240531152223.25591c8e@canb.auug.org.au>
References: <20240531152223.25591c8e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.hfJQ/wOPe2dUoHzTBC6aTG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.hfJQ/wOPe2dUoHzTBC6aTG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 31 May 2024 15:22:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the net-next tree, today's linux-next build (x86_64
> modules_install after an x86_64 allmodconfig build) failed like this:
>=20
> depmod: ERROR: Cycle detected: rvu_nicpf -> otx2_devlink -> rvu_nicpf
> depmod: ERROR: Cycle detected: rvu_nicpf -> otx2_dcbnl -> rvu_nicpf
> depmod: ERROR: Cycle detected: otx2_ptp
> depmod: ERROR: Cycle detected: ptp
> depmod: ERROR: Found 3 modules in dependency cycles!
>=20
> Caused by commit
>=20
>   727c94c9539a ("ethernet: octeontx2: avoid linking objects into multiple=
 modules")
>=20
> I have reverted that commit for today.

Any fix for this yet?

--=20
Cheers,
Stephen Rothwell

--Sig_/.hfJQ/wOPe2dUoHzTBC6aTG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZeWX8ACgkQAVBC80lX
0GzDigf+I8NO4neDuZhWM/HXtN4YI2MLiloAq7zjo/tiI2vZNbVpwMiCUIQNaty+
+YOfZGNRNm0H/CIs0daXNDj29KiELChqyXA5MDCq2Ij/hdw4XFdcv+l7d+0gOHWo
Vmla7nUoIhfeRZZoepjdTAvD4VHfeRnKdmf4fXJOFNrHNPy06+vuyAx7PzgHGKjP
1c3n7YBzyZHNELYZtvJ7QWUE7CLl5SWWRiJLimIFbZpCqy3a2PoCkqLhhiNyD27A
x2zyf0zMeRC+5C8zYkcvaBCWGv9vCi58HrpbVE/QeneIcS9BDH161yI+8E+DtHzi
yyRhaGLIbEIhMUOtVhv4LItFq4Wi4g==
=uzIa
-----END PGP SIGNATURE-----

--Sig_/.hfJQ/wOPe2dUoHzTBC6aTG--

