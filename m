Return-Path: <linux-next+bounces-6528-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F4AA9E4F
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 23:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40B8E3A1CBE
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 21:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668762741B9;
	Mon,  5 May 2025 21:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Gmk+PpCl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C5207A25;
	Mon,  5 May 2025 21:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481380; cv=none; b=Y67sHXhyrTW5UJWeU/LDyNMtmUo5fH58rSL52/qMWudYTD0mp9AYw/NIuR4aJXfTifUxtvIUc4QjaEU6glpqXAuN/D2nddMWmowg+qBoh1FQdmhGHM1xK5l9RYhTWYhfIjFJ6f4mYW/592xMOXDCcxv3UGb8B/lIdBeJwNh0+B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481380; c=relaxed/simple;
	bh=5DQRiMbqOlbNLqDsV7G1/knRAM2sWBKLUyVgqn3zpBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RFa6MWRbVzfhg9YM/APEObJDUwHi2DkEcfYO+vYETZCRa6Fo14AtafKOBZaayxSu8wIGqDwi0I2VcjL1GKoXeNQnJuus58On2kZDCgu8P30vBew2YZoXq5u0YciXB5ts4LaHpZVzx+MwMPMV/rqE3ptDHRXF4ApF6HTdzm59x/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Gmk+PpCl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746481371;
	bh=QYjGLIWEwz2N9pWVJYFxaupWDDBj9r6QlnGZAXoaanM=;
	h=Date:From:To:Cc:Subject:From;
	b=Gmk+PpCluhoEn8tK8mLwjk4d/XsjAprdrzu1oQ5ulD665dGAv2tCI8eQyWDiJRddS
	 AIntapSDhZio5EIg8aNvybjB7fB48t87Xa7BTZSmBwr0W0gVW2expW8bNqgEveriJ8
	 P0ti5j5I0+KKehUftbZZpYAakH/92Vb2tKDiyjdhQjGiB2hmhPw9uIxttfI3my7Hzn
	 Kcp3Rof6ertZLZI0D0rD8dlW/laogQF64HpMUUSMRi8jvlyRipt9rsATaj6Y+RyFel
	 BzQs4tUAXfeAicreoxC5R6f4ZMjKTDvPWk6j06dSFCGE2KWFKPpl945W72Kge9mHRb
	 Wl5Vd59WqwYwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zrw4C1Bgxz4wbr;
	Tue,  6 May 2025 07:42:50 +1000 (AEST)
Date: Tue, 6 May 2025 07:42:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Johannes
 Berg <johannes@sipsolutions.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the iwlwifi-next tree
Message-ID: <20250506074250.506755af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gAWsFch9eJ1eKfP1E/khmNm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gAWsFch9eJ1eKfP1E/khmNm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the iwlwifi tree as different commits
(but the same patches):

  eabceff21b2b ("wifi: iwlwifi: mld: fix BAID validity check")
  e213f0470edf ("wifi: iwlwifi: back off on continuous errors")

These are commits

  60d418e85404 ("wifi: iwlwifi: mld: fix BAID validity check")
  d49437a6afc7 ("wifi: iwlwifi: back off on continuous errors")

in the iwlwifi tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/gAWsFch9eJ1eKfP1E/khmNm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZMNoACgkQAVBC80lX
0GzjUwgAotC8X1bAx1xm2b3x63/iLRT6qCq6irJS1GvUTStaxWAIH3HJ4w21h6hm
3n2GcrWiUvdraj/DuQ6TsrCUPpmjlcFmn8AEG3cpEHs/CJ1ztKXq5VGOI02qPYQZ
zvYuGGIv30GFkxL6Jr5bc00XM10kBlj8ywR0/0NWlg48yEMqLrIw4AdQ7mDym67r
uvsrnMVlmhkjiGT4ZYOdqLf9ABxCNboU2w1TvZODg8AoIkTtSTsZCSEDlCsLx2Wa
8wY17bGpbMb2I3XhJUJlMbH53uRTAEOQFQRlNOUlnNSRBdak9tkrWctoN00boWHI
7DaZkXSiHNQWBEBpDh8vb5xo6u7JAw==
=+cYn
-----END PGP SIGNATURE-----

--Sig_/gAWsFch9eJ1eKfP1E/khmNm--

