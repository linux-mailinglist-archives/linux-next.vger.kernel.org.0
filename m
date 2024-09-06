Return-Path: <linux-next+bounces-3641-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF25B96EBB2
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 09:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24F64B20D07
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 07:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822BE13BC0D;
	Fri,  6 Sep 2024 07:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cUXTBiRw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04F417736;
	Fri,  6 Sep 2024 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606766; cv=none; b=Qylf05CRCm6xeKn0H3cWokJivKzedfPIHjOZ6XAcZGN/tIMjnwh092nKHpjaAy0iKqkYtCCIvlj/oBzWw5zenuu7GRtl8ZmGo1VygAz0pflm5tSio2gG20Xh2jp9RQOg3OJJf/J7TLUXklTrQ9VMtp8IuT9kM6j/74B9G9dDwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606766; c=relaxed/simple;
	bh=IzF5rIihL7lJxT8lfy15erRULdwXboRy5WHT1NJSPpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F+ysRyyBQ+iVtQOQrIEgF42m/visf39azCz/8NJkwWu9decNzu6UwsYNiJXM91wF6aj7WnRRaN+EB5L3Uox6ZKJcf/xy5I2BkmyLZjRTssb7Gg0T/zerRXlFVXepBgXoGGDJ4iwcnUUBvsn5Hg+nZPxeIrt+OPw7cM533OgbGes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cUXTBiRw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725606760;
	bh=8q3cxdvnLjQG/zDmWqsIQdVklQCDMrLC+Rd6gb/pySY=;
	h=Date:From:To:Cc:Subject:From;
	b=cUXTBiRwBNhqwvRKzlputPnyfe1sNmTn/EcR2Xi0IRVydxaBicIVZ0PRmZnypxvUJ
	 iC+8b6Bf5VHBMy6bFHSUu1235EaMp3o59V1Mwj7X2tICRcXiXBRCUIW6i6gNLO3SQ0
	 KYHA7qwqo2vmhpIZcE80a9/mIIhOskvWNi4sbHYcTaBxzaTtaFKqUJiNfNoFejoZBc
	 +PupFBAmd77VXnsZNo/5W6rbKkC0bi0CXHASFx5i7Zqp3dOIiPaND9qPRPQ2JKUB1S
	 838oLojHUVgkPxqHY2uzvWqT6pIvSxbafXgh6wm0iZVWMsJBd9uX8n0+pvGThxPcif
	 SprVVE5ojoh6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0S9M3Jtzz4x11;
	Fri,  6 Sep 2024 17:12:39 +1000 (AEST)
Date: Fri, 6 Sep 2024 17:12:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Hongbo Li <lihongbo22@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp tree
Message-ID: <20240906171238.07709365@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2PW2Gyzoh0UwpXVslscubvp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2PW2Gyzoh0UwpXVslscubvp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp tree, today's linux-next build (powerpc
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

  6ff4cd1160af ("lib/string_choices: Add str_true_false()/str_false_true() =
helper")

interacting with commit

  32cebfe1cc21 ("lib/string_choices: add str_true_false()/str_false_true() =
helper")

from the mm-nonmm-unstable branch of the mm tree.

Git inserted both definitions in my merge.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 6 Sep 2024 17:08:52 +1000
Subject: [PATCH] fix up for "lib/string_choices: Add
 str_true_false()/str_false_true() helper'

merging badly with "lib/string_choices: add
str_true_false()/str_false_true() helper" from the mm tree.

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

--Sig_/2PW2Gyzoh0UwpXVslscubvp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaq2YACgkQAVBC80lX
0GzsEQf9ET9MSDCnmFfe+0B5/6XKT2Ayk+zjHMaeweOYwVi2e2npDTyuVMD84A57
AdcGkrj94MppS1jX5aCwns0lG057/plJvKZsiwLpZRvMGr9W6Y9limgzzdeIxM3Q
YTngqPEHxCEikCp/++tjvqUQwQ4Ak0RF8JluMU4aIacdqJFsgJCGS7YCyKnu9r06
LFb/2Zn3tPf7Vr5kqh4r/GFxfyEVaFcG348LZ5sLtePE0F5gYl/b4H5ItA7uNyhH
axVCbyrb1hQ8+xKUtI5esHNNJCJJ2YgSBgxvIDB2AxE2Ta50H/P3WhIYuJ5V1Yro
EHmCPPKUKfKF8ZIbG6KtGDj8yJkjvg==
=7fad
-----END PGP SIGNATURE-----

--Sig_/2PW2Gyzoh0UwpXVslscubvp--

