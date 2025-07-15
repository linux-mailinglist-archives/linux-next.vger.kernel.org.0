Return-Path: <linux-next+bounces-7551-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 102A7B05557
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 10:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FC2C168183
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 08:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3B1255F24;
	Tue, 15 Jul 2025 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SOMGUlll"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F5C26FDB6;
	Tue, 15 Jul 2025 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569381; cv=none; b=DMMGz7hF+43Ywby0qJFj66jocBABA6oZzT9JSvLnwjD64FajCDQeRj8Nn9FvR1yoEMy7H58iJ5eLeOktvLss8xQIy4EH4zKZrxOJcK+UT8RnkCVTo6eWYF/885LyXxXLhaH+Zx9F/xN+UgdOkwOOnzM+rTlxWaiCh/nisHB0C6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569381; c=relaxed/simple;
	bh=OovqyhOZBMQBRekH5I2qhWpA/r97/H1msbQC8mXgpeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TW3Giv3fTRAvGVmh6Y0ssr6awQUWB16IojbeMCjNeE4VgVuu3RhPx3NlvOHsE2eVEm8UkwBrrlXc3emUw1p4Cr3cUbo7zKO5zZNeUba7IkcByfXjuRTOPiCJdk9ZMsm/X8dyuB2gHiVqAL3qXd2FH48m7eDIfdBgRxEFVUCp5SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SOMGUlll; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752569267;
	bh=nNx3xFc+Wf5+0zJefDdVLJrA3D5wIUENODiafxgtN54=;
	h=Date:From:To:Cc:Subject:From;
	b=SOMGUlllehzQUjV6rMLpINovXc09BktDyObAx4BMxMaoAmS1FKrR9GUtjIn4WA/O2
	 Eqmzu9qbnbSLu/nDmI+CwVvYjm7+bfaRsdHjly2UGFq3sJtURej7YKy+7PS5UOTIHV
	 ByxQ9mwIU6fgJkS/7fmk70d3q907ompqVYMs9rU1tkIFaXVOls6Elb4cjMKh1QIUNA
	 qK6JnfXOKsHS3bKggMj8wm85keXPGmS3EfHZ0mmGq/WwhW9LeS1BVIxAOi3GXtaGIk
	 U/HOkEk4LtwxmkMb3EVv8+oHvPe6bTlyvpzK/eLWK4PTgD+oFjc1NUwJxEZ4H9Fuu5
	 bQ6s1qpZhcuXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhCW70Zhmz4w2H;
	Tue, 15 Jul 2025 18:47:47 +1000 (AEST)
Date: Tue, 15 Jul 2025 18:49:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Robert Richter <rrichter@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cxl tree
Message-ID: <20250715184935.7e7c75c0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_eqo1+SPZHcbGk7jj8bSzDu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_eqo1+SPZHcbGk7jj8bSzDu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cxl tree, today's linux-next build (htmldocs) failed
like this:

drivers/cxl/cxl.h:443: warning: Function parameter or struct member 'cache_=
size' not described in 'cxl_root_decoder'

Caused by commit

  8d41af0d378d ("cxl: Remove core/acpi.c and cxl core dependency on ACPI")

--=20
Cheers,
Stephen Rothwell

--Sig_/_eqo1+SPZHcbGk7jj8bSzDu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh2Fh8ACgkQAVBC80lX
0GybuAf/eDHUb7yl34lbZsofSeLuFfiFSztqhoZWz7q2ipyUWpgqTUXTIA1CwMXB
7W48KfbA0kvaTMyBJf/juWUtzEgHJjXl3ailnQyoC/GmoRh2pWgK44Kxdg7PQEyt
5NqVgMUaOjBJG484gf45pkxx5/V7xmVdZkLeieKXcXAiOi2cJsWZekt2clYYsHEQ
wLYAJXB1uGr+BZBIDBl/SijG6Voj9vvJxuTy4xBI8WljUzGe8+sOdp2lED427zkw
DAfodJMB1faTkLolSjwIXHHbR0GbxJQ2uP67DwzfKpdl73qSZeruyPBy4anH3Qns
L15lPHKuVvFVXxxEzFZxCiAX41HOIw==
=IT52
-----END PGP SIGNATURE-----

--Sig_/_eqo1+SPZHcbGk7jj8bSzDu--

