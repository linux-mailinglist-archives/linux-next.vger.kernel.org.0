Return-Path: <linux-next+bounces-6297-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB3A959CA
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 01:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 633A63B6BBB
	for <lists+linux-next@lfdr.de>; Mon, 21 Apr 2025 23:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194541EB1AF;
	Mon, 21 Apr 2025 23:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UF55SmXn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4573F1C6FF4;
	Mon, 21 Apr 2025 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745278594; cv=none; b=fLbEnmGsjP3GBEUa3u9tonHoorJVZOtnlw1Tl5E3fweaItsAJ8MuJeFF/T5hEkHbl27eMfntATdhaxjA19hehcJUYb5phEM8HBGdo824yseCg2xHuJcUXYaHArkZYXwEB1dLDK37+vhfAWe+30Qg19s582Biyv3wR1t/HrxxIx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745278594; c=relaxed/simple;
	bh=TC+iHRNC/e/g8qU0H19C5Kzi1JpcAK9VYIPWil/kw00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L/bQTw0iD34YdKTVFAbhJ5N/gsISf8Yj2u2OXpiyY+IvpGWUicGS5a8oJodf7igb+cGWyEryYroLG6v4TYmuXucT/4NOTZZ9CZtq/vekzUlTMsBkIZbC6fxoFSi2J8UGaBI4WPViA2V83gtwu0K2ycqLzX/S7XPWlxGqW389zkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UF55SmXn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745278588;
	bh=s2ouJvkPo667q6C7rOz4LJom1srBMTmC2AFW2c0o/Eo=;
	h=Date:From:To:Cc:Subject:From;
	b=UF55SmXn7rEsRFhwXHX98sUxq1G4zlKtXddaYtLseCCc4SCP775X9W1uOuxcApK4a
	 7og4uQ6kfGExLmosf99UkqmLKr2/rIdxOA+vcwbfEN7kHelkdeHC+cXs/y8xc8Ws75
	 kb9clCx7Fr4o3TmqAQ/9h4ppctMEvWPtN1BZ2lVlqvNqVIBarO9POIMSTaVPhFB/CY
	 Oeg2HoSrvg73HhKJlyS9vC80KtlF5xZVGOISaR/CiPeh+Z5PFc0GQXMpGYN6wWAdyr
	 xRJ8x2sjghvxyksJN+GHmCg1k0//fYGSQZ2w8oR9+oA7XJ6jpsvRd3YDZWfkVql0Sn
	 AJLFSxKIqMHTQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhMFm1dqZz4x3S;
	Tue, 22 Apr 2025 09:36:28 +1000 (AEST)
Date: Tue, 22 Apr 2025 09:36:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Automatic Promotion <dal_dtn@amd.com>, Taimur Hassan
 <Syed.Hassan@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the amdgpu tree
Message-ID: <20250422093627.5ad3fcc2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HWr=1t.U2J4sTDALR/0UMe2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HWr=1t.U2J4sTDALR/0UMe2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6debd5ed5869 ("drm/amd/display: Promote DC to 3.2.329")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/HWr=1t.U2J4sTDALR/0UMe2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgG1nsACgkQAVBC80lX
0Gxfagf9EFXSxamy2Tx8MGoVVE1gaQC+VrWmQsvuZWuqXW2MRE6oev88BwyU+fLL
VKlS5gHB/4+pXgcVZAwRbQapFwnTDZRO4RgGwjuIFHnJcerBfCKel8Wp37peMXEQ
dSlYo/GlChocgs6gy/gyydbm9i8M1lZJMrDlzEBN6z3Z6OiCfqAUXQAPk6v6YhD7
z/f3zpn6VU+aqAX4RIJEMR5f+xM/Oz2cZnltHWP46xmzs6hnlEERudOyFbZ6TdKj
509x4Wuo0NcqWnOkxKYNxXiMHH+8vX68gqjw6qzrzGRwb265xqvcKBwNiiMYrafh
QTYp8kBAM5yKzLlyJGhSJaG+Q5D7yw==
=+w49
-----END PGP SIGNATURE-----

--Sig_/HWr=1t.U2J4sTDALR/0UMe2--

