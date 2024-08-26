Return-Path: <linux-next+bounces-3416-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50F95E832
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 08:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 201EAB20BDE
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 06:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9F880038;
	Mon, 26 Aug 2024 06:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HXmqvlCU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CCF374C3;
	Mon, 26 Aug 2024 06:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724652075; cv=none; b=JA8+uS31SAB7N+JjEoAWQmpm38PHpk8YHAfQzwYMmIoqj75VA7HVw031R6FmzVxuGMrpLnHzQH2WbyodpBzSpSBvS9mtF1pxHe1bFpNKtT3jt9YCDhOas+x7foPnZAnXSs2Zdzg5aBJp7FDf7iL/oroRQbuPoVUySJ3MxrJNwXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724652075; c=relaxed/simple;
	bh=xm/0ljIY2dEJkscMcgTFut9jN9RIx8riUitENXBb6Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mkcVxYBbzczeqwCMSfGk4m5SEkjDAGXvsMrT2xMh9LCgZk12KQNgAKKfLguNc3V9NiEGF0SdCRii5dwBOPPMPTJpT/d4Vtc5wLL2rwgj6kb+hrg/ZzwxAQYMxKC9NDg+vhGEieBuFk9JsEdtR78CzEw/LJ5dsdnw1W8lS4f8r8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HXmqvlCU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724652070;
	bh=qepQQwBNH4v4/xuscOtqVGuwOtBATLrA418zEGyGD5E=;
	h=Date:From:To:Cc:Subject:From;
	b=HXmqvlCUeDUp7Vc13pbf5+lR2e87rt69RNXD939SKDUJ1hAIu9TaX6JI8TK7/2yZZ
	 ypQVrT9Gz6Vjbbuo+Be5o2GhFy08rqtWQoUn4u8Ky5u8OInR84dSLmXIFSbbmOzTRE
	 YHEw2qsH28ITLgxC6UOlAv/skleQtYiJ1mx/sqNvM5mx5xn3+mwEttSCbVvvRj9cBT
	 k/3w+n/MurfRaaQm79SM0LBb8fz8fuwSvBoP/vteypmCbcuFd8xPyDLSy0UDpMFx2B
	 ifhM0cMfY70WRl+2spsBT4eaTr18C4dAnU+jXkVKtqKSqfyyuMjzd3ylpUan0Ua2F3
	 hD4KxWADZo6gQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wsg5x5N8Qz4x82;
	Mon, 26 Aug 2024 16:01:09 +1000 (AEST)
Date: Mon, 26 Aug 2024 16:01:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Pankaj Raghav
 <p.raghav@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240826160109.12d97220@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u.V+TDPbAEAFT=0f87Jve_z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/u.V+TDPbAEAFT=0f87Jve_z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/pagemap.h:480: warning: Function parameter or struct member '=
index' not described in 'mapping_align_index'

Introduced by commit

  c104d25f8c49 ("filemap: allocate mapping_min_order folios in the page cac=
he")

--=20
Cheers,
Stephen Rothwell

--Sig_/u.V+TDPbAEAFT=0f87Jve_z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbMGiUACgkQAVBC80lX
0GxS8Af5ARlZhGA4XyesnNCr08Fesij5G+Pm4GNeSaI6hqL4bds5QtluYXGjUcxl
BAcDGFqZHlxkBznRknxaU0BttW8NJ4eNzYeEU8BUewuZnFML4d8wEAjhVt6gKX2f
1PK2XeYXkhiAgFSWsZIKj2L+0lrjW3qY7FVvAHTwLoIHtFCzeTc67grLRySjnymv
GvekN6rHAnT10J8wVV2yQ0qiIwMfL3w7IGUs1/SCTyicdZnpk9PyQGdcMNPefpkF
+wQyPYf5g/nejRXi64Z9dgh2uKJ6gJu2a+FkI46R77lg6cgcaqkU6JXgj3ProwRz
p9Lu5tp911qHzpnpbw0hMYSA74Meng==
=+1v0
-----END PGP SIGNATURE-----

--Sig_/u.V+TDPbAEAFT=0f87Jve_z--

