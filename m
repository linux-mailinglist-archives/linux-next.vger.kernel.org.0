Return-Path: <linux-next+bounces-194-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90707802843
	for <lists+linux-next@lfdr.de>; Sun,  3 Dec 2023 23:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF0101C2085C
	for <lists+linux-next@lfdr.de>; Sun,  3 Dec 2023 22:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F089B199D1;
	Sun,  3 Dec 2023 22:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bZo8CNMy"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D550D5;
	Sun,  3 Dec 2023 14:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701640901;
	bh=QUYS3ppv6cxfBZw2ZXgXJZfQC0y3kCb+aeStjrd7suU=;
	h=Date:From:To:Cc:Subject:From;
	b=bZo8CNMy+PK6BTSu9e2tjac9fdt/lgzycemTPEqbu62ERQWJFLVmkmBG9izG7953s
	 xDqrPewhyXVpgJEYFj52JN2zbQVhvNhU3nz4rtnobPrFJVwXnY+G2NzrVFHcBobUeZ
	 WgvoXevG4eMmTX4g4WqBGj79ycRgAk9+DP8P4XEebHXUmI32p89FlE8ACjpeJb0NMh
	 5hHX3b2faEPk4HoTkTqzAmYViYqlfz7xfcXvdJtcv+shqWzTbmyljrSHY9JXyXjqd5
	 h4l2VXEt73xsWe4knTDHCA+nCk/gDAaJLMR7excaGtOZfjkBVD4gZgdQGsEEfMDxDS
	 kmwpzJckIMLDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sk13S1HV2z4xhb;
	Mon,  4 Dec 2023 09:01:40 +1100 (AEDT)
Date: Mon, 4 Dec 2023 09:01:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Lukas Schauer <lukas@schauer.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20231204090139.03f0ddcc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/md9Yw=rHslp/HvRxS1SKFwH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/md9Yw=rHslp/HvRxS1SKFwH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  348806de39e0 ("pipe: wakeup wr_wait after setting max_usage")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/md9Yw=rHslp/HvRxS1SKFwH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVs+sMACgkQAVBC80lX
0GwNvwf+Or+UDzwcy8FgyJom+UP84O2juJs5SkUAKaYOMqSpdqB9bBo+EnSXiVpk
rVBMfrOn9UMdF4iaYbxBUrVe50GNfCuUoDpm9xRXCbdWb+3s/OD1Frr69sauZ4yD
9Mj8T9EPXMpYhiB2uVfOgom+91X1w136HcRSZ/YH2jUyPTjyZAakF+Ja+wIc7cC8
bGdiavhxKxdgBA/m1pvtiLI7PSPl7whcGiGR81b0kZp0MxVqvGM1rziMiD8N8oSF
5z3qamOvW1Ndq+XXQVmCXnCmGm4QchYx6NEtUL+DZUitWaP3oWXxoDtqapmnuC1E
0w9IEJgHxws2w+MI/Z++53vJDMQm8Q==
=oa+K
-----END PGP SIGNATURE-----

--Sig_/md9Yw=rHslp/HvRxS1SKFwH--

