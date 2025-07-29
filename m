Return-Path: <linux-next+bounces-7740-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D579DB1475C
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 07:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1902C17BEE9
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 05:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D2A1F181F;
	Tue, 29 Jul 2025 05:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ao3vXmdY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6F51581EE;
	Tue, 29 Jul 2025 05:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753765249; cv=none; b=S86yO+8eUuZZ8p9YO+trIp1fP7YHC7hmLcWBrnWpSff7cE6n/rvq9aApnC3P9hCHjG6L3YrYipaPvvMwZFBVy7AqG+tVTk0hANRZvIFdHpoDdZ8IJajKO3oAtvPURp50IOOuJbGYGEm2rj+kCWaSMl9LiDf1iq3Oceq/Wi6bZf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753765249; c=relaxed/simple;
	bh=TTpfk4KsF3m9PG/TlGd3walgX8f8MA59W5qQ9NM9FBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DIUqouwKBTYwmX/h6OhPhEGjrSxpw6Ib5evg1Obmg2vQuV/upOcWwAPSn8ieY+gtN5KMbfjxUhols7Mw9Fk0LaQQ3S7SwgZmzg1kLwn6Q8HWHJ9RaYwY96tQ2qB6X9wA1MLijMosdQUUuyD9HAGFJfFvnY8DAC8S1L1lBGakayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ao3vXmdY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753765035;
	bh=wSCXxiSq/vIcRqnR23+raiaYERqVjtsS2EZrtY0sDsc=;
	h=Date:From:To:Cc:Subject:From;
	b=ao3vXmdYNfIUJixve+8j2HmGlWXH0AfRHm+wkvtLUH0mzl4XWli/BJHLX2sX+H6Ug
	 j1eY7An2sjKgkIudxrs8Zmz7wH+DNffP1Eez8ES8p+CXM0CXhY/DJy50XCVmc7TCxD
	 6FgCyY2365ez8QWIQ6SaRHgPP4u7rHotjAnJCiagpMqwwNaGd9d37JflT7PDkVpqc2
	 7WDVwn+z6k8bs60GehJrXbs0NB6F3g0YWNh0xE4GHVZqg8MTG7X/pqIxN9x5+U8EnA
	 ww8UGsbPZWNC/EDx24gJxNKPAYEIbvJOZtBhS3u0gxGJbdYUcCX8geydQNkyx4Y7m5
	 2UE57Fz9ftH0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brjkg3mt0z4wbd;
	Tue, 29 Jul 2025 14:57:15 +1000 (AEST)
Date: Tue, 29 Jul 2025 15:00:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-nonmm-unstable tree
Message-ID: <20250729150042.77832045@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m4M2kWq1RvIn2Wymz=oPA9K";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/m4M2kWq1RvIn2Wymz=oPA9K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(x86_64 allmodconfig) produced this warning:

WARNING: modpost: vmlinux: section mismatch in reference: kho_test_restore+=
0x16c (section: .text.unlikely) -> kho_test_restore_data.isra.0 (section: .=
init.text)

Introduced by commit

  c2d288f7ab13 ("kho: add test for kexec handover")

--=20
Cheers,
Stephen Rothwell

--Sig_/m4M2kWq1RvIn2Wymz=oPA9K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIVXoACgkQAVBC80lX
0GyS+QgApmoBM+z5h+OwB/PKI0BOrtfzWW9YpJyMWAqhpr6EYXL0OcHSqIqwwk6L
zZ5ywQbWo5XSsY3KuNxgnLvrb3aGM1pVHzsVoQJu29Evt4rLgrMjVVV0ATIs/1QN
pxu42oWMwIJQZ7HoIxTgh07OecKhWwqiJ1Dmhv3gP2QccESVsTLSJ+lAvCGGd30S
YZ+SzdslqtL9UCf64e1iTpCCtWAlO8hVx3+l81JS6/8wegJLpIROpbiMS+9/El33
/Kg4TrziUxoUUHzdpIxPLPHmGPkPRpKfM0lW4OFtQdnF4o14kB7UOkyTW8H9GBeM
fQ1bcLz9ge+uNgGfWNwHz31LuMHEbQ==
=LIrx
-----END PGP SIGNATURE-----

--Sig_/m4M2kWq1RvIn2Wymz=oPA9K--

