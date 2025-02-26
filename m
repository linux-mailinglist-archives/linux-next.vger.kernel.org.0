Return-Path: <linux-next+bounces-5575-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40021A454CA
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 06:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34888178BBC
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 05:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B0A1A9B34;
	Wed, 26 Feb 2025 05:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uCMWZ7UO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DC221ABB4;
	Wed, 26 Feb 2025 05:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740546745; cv=none; b=kuz6muAo0UI5I2oSb/fQa1p8K0zigjsY5R1sV7tOcin3cuflhZMXM+qwDlUjtAcfxERBcgwxB/nM4tt/oaOrrG8Du01A+eGefBqGfaQLwOvUUz0T2wCwizO009lOpvLqJCt5BiLwKrSOPJmBSo4KrXHRv7nXNEqaQxmWaVwjtME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740546745; c=relaxed/simple;
	bh=XE53TvoMXZQt2dH3x9D1XoSvun85xI/K7ZI4q6a9Wro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gXfkW3XIgip+lOoTGzwAe4xtNYDojT6FaPUDC+daVPA6gNcw4bZDQoxW6kc8iKo8xX20XEBZSb8a207Aug1B+XuN6E8lKu/yy3ly8jbXHkGunu6lqH1AaoW5TQGN31Ptk1G0DygpLSxdDjEtmDtaPyxSOOZt74ocBOnHugtTaZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uCMWZ7UO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740546739;
	bh=HCk/PeTHpV9gyIE6s0AOSHso25TUgI3xLfm/gvUAhLU=;
	h=Date:From:To:Cc:Subject:From;
	b=uCMWZ7UOgeeDfQUBscp0T6CNuGv3g15Nz8E32wJVUio0BSIomv2ZzZllD/bWEpjRi
	 0mci9+sSvQfLbfHkazAJVZSBvcrAqQmEteFSD9jYEHx+KA0sXgAZZOR5g5vGtvUaQc
	 chw9MgPhbeRCxnSUKFBhb5Qhh0qGQN5OlTOgiKzdqQp2DdqAAIG9AT/ltpnAVki/h7
	 RKOjDDd9rtwTf8K3yW0+t/c8hDWXuXa7DM3sh7SZiM76HsUrQaBTGCdK2aqTkbkb+f
	 gBlghaboj1lJ2rl0yA42WUk2tphoJq/Zc+3nhy7WA722IcXn1lYVsuENOWcogxrVAq
	 co3xoWVwO8Fgg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z2jJf4vQqz4x21;
	Wed, 26 Feb 2025 16:12:18 +1100 (AEDT)
Date: Wed, 26 Feb 2025 16:12:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kairui Song <kasong@tencent.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20250226161217.1e7c5ae1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cbjZGoC5KY.naOOlll=uoeq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cbjZGoC5KY.naOOlll=uoeq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (powerpc allnoconfig)
failed like this:

In file included from include/linux/suspend.h:5,
                 from arch/powerpc/mm/mem.c:17:
include/linux/swap.h:581:12: error: 'folio_alloc_swap' defined but not used=
 [-Werror=3Dunused-function]
  581 | static int folio_alloc_swap(struct folio *folio, gfp_t gfp_mask)
      |            ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

(and many, many more - some just warnings)

Caused by commit

  436a263c3c8e ("mm, swap: simplify folio swap allocation")

from the mm-unstable branch of the mm tree.

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 26 Feb 2025 15:54:33 +1100
Subject: [PATCH] fix up for "mm, swap: simplify folio swap allocation"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/swap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 6547fc4b9523..eb0ffcbe93e8 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -578,7 +578,7 @@ static inline int swp_swapcount(swp_entry_t entry)
 	return 0;
 }
=20
-static int folio_alloc_swap(struct folio *folio, gfp_t gfp_mask)
+static inline int folio_alloc_swap(struct folio *folio, gfp_t gfp_mask)
 {
 	return -EINVAL;
 }
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/cbjZGoC5KY.naOOlll=uoeq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme+orEACgkQAVBC80lX
0GxdMAf/bz3pLl7JK+zeJmVGR8bodcV56Y7ChcXkiDV02MS0albrGNoncrDnSrUo
jhx6k0hRBGjGxUJi6wt4ebRg1f/ScqCHq43vV2RxCwjQK8H22sZBiiEySer0UN7Z
QR8qT1BPOzp/7fdPUj0pQOA/7U/fM+PEhqOnXGyU4CTfY5UIMUZVpB6mlg5t1Bj3
BfyyV39X3Kx2v1icUiP01FexANyILxGViKdFp5vW+1kSMeJZHG8h3IJ8iP1Vn+JM
ubSiTDDhJFx2Ret7GcGpVJbb6L+tD1kFww0HUAGGKw+FI9exwOcYZzdPn1EI/bNy
3PPaFM317otBq6XgnnfZ5Ajs/QJmVg==
=w0pH
-----END PGP SIGNATURE-----

--Sig_/cbjZGoC5KY.naOOlll=uoeq--

