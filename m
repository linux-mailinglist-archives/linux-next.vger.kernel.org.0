Return-Path: <linux-next+bounces-5434-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E9A336C8
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 05:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3179F188AC28
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 04:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA772063C2;
	Thu, 13 Feb 2025 04:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U6TQcmoS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD435949;
	Thu, 13 Feb 2025 04:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739420375; cv=none; b=p0hI+/AZk3ajNMGWxH8vOLIaSqHlaRzqPvpbYbGFEqzkUZbIuc4dCBTMgCP1g8nl46Q9efPJFVL5nc6axHzXEf+l6YJZHjZxaLWeoNJ3IOzaw1P/GyKdHP2sz1M7ouLnWrS+cnEEmTTI51hRipgkf/M6doU8/CHHCv4osSb2ffk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739420375; c=relaxed/simple;
	bh=6HfRT/fnO/W8aeu78ZrIL+G349ObINelVdicx7iZ7qE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Tva8lkMoxZEyYQCBozWnD4G2e/VDs46IF5aa0IYORhiIFN3z4fv9UrguzwvSTaEkKadpk9qIgoYSFYACziBEPFKLzILL9FWzMsjz/7mcQyHlQR8zwIEz09c6pLS95O3gCYaMNAho0u7GiZa1f2VFgBkbyGOjwqctKzeCD+wbQKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U6TQcmoS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739420369;
	bh=2Ks13A/3NIuV2yBdwTh76NLt4bg5sihP3Ssn+/waTtM=;
	h=Date:From:To:Cc:Subject:From;
	b=U6TQcmoSAld8SCykcX+u1e38eyNHTQmzBknpoAie3cZ9ublmfy1frTWKt+7Vu8Ui1
	 pM749Qa45osqm3//mVNXti50q041Kovloa9Y5L0MH1Mj6oEarBqk7DVEnPV1nKpmBa
	 tB/U1f56qOXF1s7CHbdXLAtlHaE6r3cMjAOZXiRvRK1ei8LEyi5kRxJ+pd/ilz8BYl
	 qK4sjfcdJYkI0S3h2m/dpj7oUN0sT3vZ5VIH5Hpa0uuElnXz8/BBhNks4yHzcybgA9
	 45IXGOjkBJbNo/ftqTcy6t6J/C805SfADEehJts7v3Bcn01yijfI7Vooa8mK8T2IAI
	 RIRHzhOCRgYHw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ythlh4Knyz4x2J;
	Thu, 13 Feb 2025 15:19:28 +1100 (AEDT)
Date: Thu, 13 Feb 2025 15:19:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the kspp tree with the net-next tree
Message-ID: <20250213151927.1674562e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9yxX6k3rdBpRL/u6GtMczE4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9yxX6k3rdBpRL/u6GtMczE4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  lib/Makefile

between commit:

  b341f6fd45ab ("blackhole_dev: convert self-test to KUnit")

from the net-next tree and commit:

  db6fe4d61ece ("lib: Move KUnit tests into tests/ subdirectory")

from the kspp tree.

I fixed it up (I used the latter version of this file and applied the
following merge fix patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 13 Feb 2025 14:50:27 +1100
Subject: [PATCH] fix up for "lib: Move KUnit tests into tests/ subdirectory"

interacting with commit

  b341f6fd45ab ("blackhole_dev: convert self-test to KUnit")

from the net-next tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/tests/Makefile                    | 1 +
 lib/{ =3D> tests}/blackhole_dev_kunit.c | 0
 2 files changed, 1 insertion(+)
 rename lib/{ =3D> tests}/blackhole_dev_kunit.c (100%)

diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 8696d778d92f..8961fbcff7a4 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -6,6 +6,7 @@
 CFLAGS_bitfield_kunit.o :=3D $(DISABLE_STRUCTLEAK_PLUGIN)
 obj-$(CONFIG_BITFIELD_KUNIT) +=3D bitfield_kunit.o
 obj-$(CONFIG_BITS_TEST) +=3D test_bits.o
+obj-$(CONFIG_BLACKHOLE_DEV_KUNIT_TEST) +=3D blackhole_dev_kunit.o
 obj-$(CONFIG_CHECKSUM_KUNIT) +=3D checksum_kunit.o
 obj-$(CONFIG_CMDLINE_KUNIT_TEST) +=3D cmdline_kunit.o
 obj-$(CONFIG_CPUMASK_KUNIT_TEST) +=3D cpumask_kunit.o
diff --git a/lib/blackhole_dev_kunit.c b/lib/tests/blackhole_dev_kunit.c
similarity index 100%
rename from lib/blackhole_dev_kunit.c
rename to lib/tests/blackhole_dev_kunit.c
--=20
2.45.2



--=20
Cheers,
Stephen Rothwell

--Sig_/9yxX6k3rdBpRL/u6GtMczE4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmetcs8ACgkQAVBC80lX
0GyIkgf/W4SvrqVwfDAKHcFtXdrFrgyiVFwZKikEKyogQriGAdkHosZ3ItPDuo9i
5TXf3zPeCxYKxR2z89UIQPO/74kA5sXLKTtlBDiWRq38Y0pMufavqUmnoxYsQ1o9
9K96ARucHRBxRPhZj2jU7CE2ymCSTQigd6ib4A51tHZyWXYyp4mw3mqOaGA3boH1
ygfLqz0t+CXBz75hLTmy8mha22ofgOg3Wp5sBFapzcZ0R2lQ/ZUdeOu3yQxMUgDK
gMgpv/Nlu5pyu70BfGdAvLUFtZwxHVE2hkLyGguXf7IOLVelebF8dHODI8UCfiQd
hTwSETuTRtNkFsXj513WgwG8k1ssXQ==
=b42K
-----END PGP SIGNATURE-----

--Sig_/9yxX6k3rdBpRL/u6GtMczE4--

