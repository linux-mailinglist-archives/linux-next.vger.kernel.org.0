Return-Path: <linux-next+bounces-2907-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3CD92C69F
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 01:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF197B2139C
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 23:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE34317B05F;
	Tue,  9 Jul 2024 23:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="unopaghW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEA2156C7B;
	Tue,  9 Jul 2024 23:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720567940; cv=none; b=bAKSUKKxjWY73on6A2hO+CwTBokq6z6bgnkea6Okm0VjVlf4jHgAbfyJyUns8DmXz7uY3wrn8T3rxpeBpArgElkzCwJG/YXBRT6yUW0YIEM1eY6TLpidW5cv4YctBo1Q5zi3cRSMXgJdU0OgLb5Q9NNS86k2kiTExY6Z8YsMb24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720567940; c=relaxed/simple;
	bh=kg7pFIBfqX0AdcwcV9ETjjLMMMzxINEwviBbNgLHs9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gNqn5Z7kjOT0VAfUWVv/QPWKR166XcD7TliGdo3FBmK51f+RKFj7RhP9kdhgU1KFio1omNR6g4NBjrwLJutb2gnoyvsS4BwV8/gg49/KUnOCxjCiEnS0mWyMhzq1i46BxlBbFsDtmi46nn5uhEDojCzLoct+/ATkLmMyd0WSxt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=unopaghW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720567934;
	bh=bmMAoaLG7G0LxIsGv59B/bHX/ckRwcguFG+V7Q8Inm4=;
	h=Date:From:To:Cc:Subject:From;
	b=unopaghWoJZbwFahmHKIPMk48YRSCdsfzAh05ebavH7mQgoXmsv5zoGC3yCQU5PKR
	 xtXlOqqmJ52j4KoIr+p7FNpT32d90m9+bbjXt8VFHj24jEM5atA/MhiItPvHLXxmLr
	 OWeMO+qkcYSBRAq5cL+5zeooPO15N5oHae215P3H9Ay89OGCGcqPTpBMOCMnwKPSMb
	 FccEawBf7gsNT1Decquuirr7TmO7CP6c5Q8+SmuLOJJJKM/keSq3UjbRVwuE5QW/gE
	 N6bgTvHpQMZw2HibVwQ3pOXliBCnjqJW+2XqAeixkribpYE+m/n605WigRfsQ1EV6m
	 I1s5mN8a69l1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJcht2XLMz4w2P;
	Wed, 10 Jul 2024 09:32:14 +1000 (AEST)
Date: Wed, 10 Jul 2024 09:32:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20240710093213.2aefb25f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QL0jR5kHXbHceEfJJyQlPIi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QL0jR5kHXbHceEfJJyQlPIi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ld: cannot find MEM_KEEP: No such file or directory

Caused by commit

  78e70fd784bd ("init/modpost: conditionally check section mismatch to __me=
minit*")

from the mm-nonmm-unstable branch of the mm tree.

grep is your friend :-)

I have applied the following fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 10 Jul 2024 09:28:02 +1000
Subject: [PATCH] fixup for "init/modpost: conditionally check section misma=
tch to __meminit*"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/vmlinux.lds.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinu=
x.lds.S
index f420df7888a7..7ab4e2fb28b1 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -123,8 +123,6 @@ SECTIONS
 		 */
 		*(.sfpr);
 		*(.text.asan.* .text.tsan.*)
-		MEM_KEEP(init.text)
-		MEM_KEEP(exit.text)
 	} :text
=20
 	. =3D ALIGN(PAGE_SIZE);
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/QL0jR5kHXbHceEfJJyQlPIi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaNyH0ACgkQAVBC80lX
0GwYWgf+OWghahGfNgnSkTLEA8l2bEK1ZifRQUO6s7V8eCEFy0g8A4X9w4W7A7yX
tC/Q7PgAtQahZKd8p61Gg2ojHs1h5vaegsAuTe+GvWrJFeV/WGjg+TvpR6UW6vQj
Is6rq8Pq0Dw209hE00MhN4H3xiSMGSyV6zERvuCdbG1VPIS9pvco/pPIhI2sZF4h
rHgdY6deQq9YRCoAdze2bKOVzQUnInT0NC6B6GXCzVF0px2Nd9+eFyBGmtbM5Kzm
hSadjPuGejrF08YWzzvIkx1yHmxsovOiy+UAf8F6nCbrk6IigeIgW8UBuPbGeX26
PxGJLeAPoQvToN81hUyys96CFuUHUQ==
=XLB8
-----END PGP SIGNATURE-----

--Sig_/QL0jR5kHXbHceEfJJyQlPIi--

