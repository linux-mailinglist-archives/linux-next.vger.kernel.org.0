Return-Path: <linux-next+bounces-7692-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983F9B0E663
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 00:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 476EC3B8FB1
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 22:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1062877E8;
	Tue, 22 Jul 2025 22:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EHTibmcp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E24926A0FD;
	Tue, 22 Jul 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753223135; cv=none; b=ofjOVqj6WuRUsL8JZsjdnC9070fdGg2kD1EB7VTUK7l23U6ljeIPm+mmoKoKJyKTK9XIqy7riG+xk1SSS8MrcGe0ZdDQiqQSULZekFIY6IHJTMh4e1Y2A0lODsREzrjhMSSs9D+2be9Ltl4aM0Ot9v30KUOoD/OaiPyZHGRyxG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753223135; c=relaxed/simple;
	bh=QA+8Ul0XKkfiVIdSd3iCDgTk4q3hDNT5m1xUjumrgD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fYuCa/QgKiXkLr/xMKgxQ5WHx2KwMdDTfdX/rsxPuFdXqBaBuuDxYM/y9U6h4sIwpGj9jVPrxBdwtJ8wy2S9PusI8aaZhVLtbXWsXLz4uSaThiMHE8UpO4T2JuKPcHoWBJ4tyxx7MsbBpaDwatq2YSLySUYGYYu1o+7BgCUPT08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EHTibmcp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753222965;
	bh=Ct4LHIoK4jMUZEbprcTPdhuEbh2QXr6A2F7FmlF9nhA=;
	h=Date:From:To:Cc:Subject:From;
	b=EHTibmcpEGexpIHleeeHNENs7wAU/rUw4F3Ql2n5YFWVn9TkWhITv0Cp6Qcj3lpf5
	 h6AzSzGrEzo1/2QSxL8ByR18NkBrK2IepZIds6+M4hQZlmZrXvEb3you60jpOFfPav
	 Nu9zvThGi7Okk8FMeNJGfg6AH36Pa2wXo/0F0MIigfzuPjbKX4If1dSA5nC4VCVKVv
	 ihRrjziDkwfbghpTuMTtjyykXm/icMMG5vzbxO3tQ4oOaWApUi8w3TlmOr+kcXpb4/
	 C0TDLS1DgxscY2McWeA8Tbmm9lm/HJYuuIztdIX+crnqijKEukHI7DQYHE2gyU0DWC
	 zojMmrK6aZBDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmsGF2nFyz4w2D;
	Wed, 23 Jul 2025 08:22:44 +1000 (AEST)
Date: Wed, 23 Jul 2025 08:25:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20250723082527.31bafc56@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tx57dIAk6MugSyohkUUcM2H";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tx57dIAk6MugSyohkUUcM2H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  12702f0c3834 ("soc: fsl: qe: convert set_multiple() to returning an integ=
er")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/tx57dIAk6MugSyohkUUcM2H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAD9cACgkQAVBC80lX
0GyZagf/ZHWj/491scqAW16aHlUBK2aPSwSWUZDSZxDs4+hqMRlSB6+dG0kE3VGO
ijxACYqCOLDBM9qFpeffJD+Bn6rJrVRM3nQpT1Mo+zMTBPAL3pzrH48Im0SSa3pK
1AnNd/wU946BmiCi/rnd4kC9PNS1piOcMKUA0Y7pNnclp+ymvB3s1LjPZRGp3SQG
ORXaZfSw833dUgcr6ZH6iPSbpb0KcFcQb/1OeOrn+qRuMiIDEiMt1hFC1wXH8qcU
svMk/oGYhiCv94X/x48nmH4n7fXR0ZM3m8sJO+Gt9FQvaxpBZsxfKUOMYkDLthl6
h0YX0RGajt1lZA5brN2PvtAk9511FA==
=OJIz
-----END PGP SIGNATURE-----

--Sig_/tx57dIAk6MugSyohkUUcM2H--

