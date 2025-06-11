Return-Path: <linux-next+bounces-7134-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F03AD4A05
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 06:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 401287A419A
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 04:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F360A1FDA94;
	Wed, 11 Jun 2025 04:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QgHIVjR1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8791779B8;
	Wed, 11 Jun 2025 04:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749615855; cv=none; b=btucIItyCgnozT2E4M4TdUjPvi58QZ4k3NxwOzSp8rro6Zha64qX+mk+o2sI4GZrhad8Mm7vu1wGpeGQLoXML7cdd2+Xp6k/NutOGmLeBXuMfWEwXhVKSTC5HILjJcTEZRcf0T5ofiSIEQT39VVDUcprCTyOO7RV4DJW94w+AAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749615855; c=relaxed/simple;
	bh=WiLolohheJunzLOWrT/uKOTdo3IwPO0v9wUqvC6oI2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oD7YcJRwQXwynP3X2hGIfCJkiHm++Q8TB/8/skveNCgXL+/Yl4AU0Mvf3DYkiXkB/QJUoS2msa8tInqZOdD/QkT8ILiYYihZdJS8MMODSshDpkm8UrOEfNoJ1s8+flAeft/4RsCKmEPpwqI36523Hws5VWoHJUGr8ECpJ0A/zkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QgHIVjR1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749615850;
	bh=ptzmFD6VoBFqKTsbKMsJmli1kGbupzSWz0iKsBuY/IQ=;
	h=Date:From:To:Cc:Subject:From;
	b=QgHIVjR1Cll0a5vd5Yeg/pjRypZOebYjzU/QnsqcXURoyPP3EwAjkUB+Z5FuPiZOI
	 9gV8l8ulYntVZsQgEmcoLofegUpFw+zeZZYH9hBWowv+A7CpF1oMXF3qWOgPxrw0Wm
	 YkEAKKiGDItLuc0T1qBWWo7quHRShi6nZ5Z6m4m0BV0K+1sptuv41iKTRG0QeQjYWA
	 M6bq9tdw8yjDPwnnA0oZZVUgSwgKu0T1D+nSezmDQhHIpdPJ535bM6LRhQjI31ilLB
	 fJ4nwnGR9Lya6oFTfxoKMHzsHjuwZQq+ifOJ5+bNdV4yK4GeqpTD1ALmtLWU1WujOH
	 a/sgmuXjh2bDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bHCGd728Cz4wy6;
	Wed, 11 Jun 2025 14:24:09 +1000 (AEST)
Date: Wed, 11 Jun 2025 14:24:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Cc: Even Xu <even.xu@intel.com>, Jiri Kosina <jkosina@suse.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hid tree
Message-ID: <20250611142409.7d4683b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L+yomTRgBt=gic4ofSJ=rcJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L+yomTRgBt=gic4ofSJ=rcJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hid tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/hid/intel-thc-hid.rst:200: ERROR: Unexpected indentation. [do=
cutils]

Introduced by commit

  45e92a093099 ("HID: Intel-thc-hid: Intel-thc: Introduce max input size co=
ntrol")

--=20
Cheers,
Stephen Rothwell

--Sig_/L+yomTRgBt=gic4ofSJ=rcJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhJBOkACgkQAVBC80lX
0GxSBwf/Uu+4tmvrV2CvReF81JeEaDqpxLtq2m2C/jwkDyKc0+8j30GBE7SJfQC6
E4vwuy6lEprE3usgZmAb6eij96qPPNxwUOjnJ37h2Z96TelYwiE6AqHkaaknLFwa
PfbIRGqoP91CloyIKvt9tEPwrtA9g2RQu3iSIgQ8s7tqFPM1yCNGI5b6L1DTlLXo
18mUoU9w/0euqwiZORlajYzibRz7mCCKNCPGOf5WIr6sysNarFV8Q4QsfyMHIqdM
2crSOcBazTkUbi5n/gzhjnK5NQJRQdTBwn5GdwEN56yIpqNQhTeCGIMUu/eFlsdj
M/p/EwEVNsvHHVQ/tM2+oljVnInIgQ==
=cN9H
-----END PGP SIGNATURE-----

--Sig_/L+yomTRgBt=gic4ofSJ=rcJ--

