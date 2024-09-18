Return-Path: <linux-next+bounces-3918-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCFF97C228
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 01:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29852282F13
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 23:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A85D176259;
	Wed, 18 Sep 2024 23:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aK2creOX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581B161328;
	Wed, 18 Sep 2024 23:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726701294; cv=none; b=brjRiFD87xZBYUbUU9NI0pe2iUEuoAQaqK0MBUOl2hMtlukb7VE3GHOwfkgnHaViUXp2YM1nX5hSDVW5pP9vcFB377ijHo9XqGDkDUDc8QHr8JZcKr1MlC7trtDVOiVNEdyxpxGzeSxOYHtKyVHWpz+3BBQC3CWuh6L4cpyOS4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726701294; c=relaxed/simple;
	bh=Q8XtyeJxYF1w8xQ+VIc38QxYdCfUnYzj6f99ILqk5Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XqPWhnnZAxLax+sbH1LzYwZTlKOdXs6wXUYse/FhmOW98tqmPipJwcZ9TEIwOvam+8fvwOvO7Uk7mSXwxXSeMipyQkx9/CGQ+7waIqWcwudDPwp5ZvM/+yK4WRY+noVXQtTKbtBAkl7/3yz2972z7FAXtmqBDmZXztZiIWYCCS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aK2creOX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726701289;
	bh=loB4MBO2lPu1x5oOJOeKCVoaNo+TM68YcvDfmmj/OmA=;
	h=Date:From:To:Cc:Subject:From;
	b=aK2creOXgG6OTAHXr3Ws5so3AN9EgFgNUexTlg3Iydu8PXrOF7jlV4KO2XkDIetlN
	 ij3il8YU4C1XmtTMqJb4kyEGpr39foC8jSQ6wfA5q6O5xcEJbIuZKe4o7GDoOpSaDi
	 kWkSd7i514/kI8dTaS/ivlpNTUGd3fsYy3/oq43rjL3eG8QyCiVBvYBxOqqb77/jZG
	 PmWxZ7+lY0xGtl4Z2WDZugcheReNakgn//L7LmkbKGIIwnCSTi6To9D71rzqpCH6f2
	 6fpWNnYIx01J9+DVn9BRv/icRsItDpz3ay3+52ZaFte9RLro14OwoWltItURovJI/O
	 Ph/ctF60HK9aQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8Dxz3lVFz4xcb;
	Thu, 19 Sep 2024 09:14:47 +1000 (AEST)
Date: Thu, 19 Sep 2024 09:14:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hongbo Li <lihongbo22@huawei.com>, Kees Cook <kees@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: linux-next: build failure after merge of the mm-nonmm-stable tree
Message-ID: <20240919091446.37087f60@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tYRyOGHF6DnmZZ/qrtH1zo6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tYRyOGHF6DnmZZ/qrtH1zo6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-nonmm-stable tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/string_helpers.h:7,
                 from include/linux/seq_file.h:7,
                 from include/linux/cgroup.h:18,
                 from include/linux/memcontrol.h:13,
                 from include/linux/swap.h:9,
                 from include/linux/suspend.h:5,
                 from arch/powerpc/kernel/asm-offsets.c:21:
include/linux/string_choices.h:74:27: error: redefinition of 'str_true_fals=
e'
   74 | static inline const char *str_true_false(bool v)
      |                           ^~~~~~~~~~~~~~
include/linux/string_choices.h:68:27: note: previous definition of 'str_tru=
e_false' with type 'const char *(bool)' {aka 'const char *(_Bool)'}
   68 | static inline const char *str_true_false(bool v)
      |                           ^~~~~~~~~~~~~~

Caused by commit

  32cebfe1cc21 ("lib/string_choices: add str_true_false()/str_false_true() =
helper")

merging badly with commit

  6ff4cd1160af ("lib/string_choices: Add str_true_false()/str_false_true() =
helper")

from Linus' tree.

I applied the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 19 Sep 2024 09:07:58 +1000
Subject: [PATCH] fix up for bad merge of "lib/string_choices: add str_true_=
false()/str_false_true() helper"

which also exists in Linus' tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/string_choices.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/string_choices.h b/include/linux/string_choices.h
index ef2bb6826919..120ca0f28e95 100644
--- a/include/linux/string_choices.h
+++ b/include/linux/string_choices.h
@@ -71,12 +71,6 @@ static inline const char *str_true_false(bool v)
 }
 #define str_false_true(v)		str_true_false(!(v))
=20
-static inline const char *str_true_false(bool v)
-{
-	return v ? "true" : "false";
-}
-#define str_false_true(v)		str_true_false(!(v))
-
 /**
  * str_plural - Return the simple pluralization based on English counts
  * @num: Number used for deciding pluralization
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/tYRyOGHF6DnmZZ/qrtH1zo6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbrXuYACgkQAVBC80lX
0GyKxQf9ED5x+H06/4IlLsIyzw3bYi5A9FC6NJce1Pe9IXDX2SVGOi4g4IFGqoQe
7wHoPGaHC9Dy8sPXdpDBphc5waeKKW5SnI0b8u6ZmOIVVXY13L1njD6liiNFxnnD
yRMDkdG6t1B7MZ84o0uGnCGBDfXMqDUcRS59gr+VvS/s1UAzcF6lJhy75ulK7u5l
C3SvbqA0z250tbBhJyAhVc84hh1GFHvhdMSTYU3XbyUJuIQMCcZOUEzoC77s9jjC
3H7uzXjabrSSYujsUEZnByM6xokMX1O+vqWDazgwfP0MHQepqdX6xk6ep2VG74Ee
tIY2AIjWQxW4pZ7VlCDVk8Kh52SofA==
=W63I
-----END PGP SIGNATURE-----

--Sig_/tYRyOGHF6DnmZZ/qrtH1zo6--

