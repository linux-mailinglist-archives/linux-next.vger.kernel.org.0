Return-Path: <linux-next+bounces-7725-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 369FAB13291
	for <lists+linux-next@lfdr.de>; Mon, 28 Jul 2025 02:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A61063B27A8
	for <lists+linux-next@lfdr.de>; Sun, 27 Jul 2025 23:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB391E48A;
	Mon, 28 Jul 2025 00:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lzU85r33"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BECB4A35;
	Mon, 28 Jul 2025 00:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753660818; cv=none; b=cTWdkwfmrLSc0+1mgOqsywduYJGwyuqfcZFY5ypv/H+3n4E7hcKFzxMaJEGcbuoj5PRJA1knicQlEm1vZC+nNH2P5VA4Qrd/YAxQ1P8rIngmFfcXlLA7JroLdt6TfLjvYY4o1A+3j633VCHMWSAYPGa4iMhh+XhoO49ErOFUkwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753660818; c=relaxed/simple;
	bh=7FOlBTRmd8dEpKVhrzJny7SLB1U+9S1mQl0p3vHcy/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qb4GblF1qWUUsM5X0x/fMX7/7t6gEfGu13ZhhljKmwoqckEoN9FQwWMSaq3/dbCNq/Yfe29EqwMinqazpXyisDDZ/EdNANuLyBDS7Bq1FZaqEh3PKMXZH0CC+lEzTdzVo7wDnqQsxFKe3wcVp5/0eMub74gKfpEvX17rIHEB/VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lzU85r33; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753660605;
	bh=Od/wQZLkvSFzPvwQn//E457WOuGEkjFsp/yYgUZauwg=;
	h=Date:From:To:Cc:Subject:From;
	b=lzU85r33v3LoNqXUQWVpqqa4G4IOSwNeapQzem8tGogQ+9agLAC52npiXBS4uZHTm
	 d7e9LAmHW0lJUTlaAgWxM+5mMuNMu1giYZ1tPqu92H8rFvUhoIwjvUxwQHDzl+qr3n
	 P9q5qIAlW/w04Qm/1STz9lLdKRTih8rPrs3O072THX6sc0q+/JbySaKYfg/MPjm7Hs
	 QFt4o6kkl5IUtOTxTD24Byt9qqs9T41fHm08lAN704pcLYcJaBHJ3hTxFHcwcKGnUf
	 BZrX2o7l9T8QS/8RCCeTYmj5jGlYUnTuz8BJ14AurSTQqdnei2em00IRT2p62DaGUG
	 UcbgUD//4TdGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bqz6N4sCNz4wxJ;
	Mon, 28 Jul 2025 09:56:44 +1000 (AEST)
Date: Mon, 28 Jul 2025 09:59:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the tip tree
Message-ID: <20250728095937.13043cd0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sxzXOrs+CYdBtw4VPNTESWS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sxzXOrs+CYdBtw4VPNTESWS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  include/linux/entry-common.h

between commit:

  a70e9f647f50 ("entry: Split generic entry into generic exception and sysc=
all entry")

from the tip tree and commit:

  bfab6646e9d9 ("unwind_user/deferred: Add unwind cache")

from the ftrace tree.

I fixed it up (I used the former version of this file and applied the
following merge fix patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 28 Jul 2025 09:53:01 +1000
Subject: [PATCH] fix up for "unwind_user/deferred: Add unwind cache"

interacting with "entry: Split generic entry into generic exception and
syscall entry" from the tip tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/irq-entry-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-com=
mon.h
index 8af374331900..0cd828b4a444 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -7,6 +7,7 @@
 #include <linux/context_tracking.h>
 #include <linux/tick.h>
 #include <linux/kmsan.h>
+#include <linux/unwind_deferred.h>
=20
 #include <asm/entry-common.h>
=20
@@ -240,6 +241,7 @@ static __always_inline void exit_to_user_mode(void)
 	lockdep_hardirqs_on_prepare();
 	instrumentation_end();
=20
+	unwind_reset_info();
 	user_enter_irqoff();
 	arch_exit_to_user_mode();
 	lockdep_hardirqs_on(CALLER_ADDR0);
--=20
2.50.1

--=20
Cheers,
Stephen Rothwell

--Sig_/sxzXOrs+CYdBtw4VPNTESWS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiGvWoACgkQAVBC80lX
0Gyz1Af6A8FhiDEvJexDRmRdyLSoim0L1JbHu30uQt6T4cIdHevhFq0vuKig49sU
m4maZgpoQVen4iD8ocVLgCDx4Qzr+RuRMY66JFNCwgsaulZVFJM0YM+es8Y1SDBB
fOkMFJEnZmet9b4Y7Y/1VQDeqqPQvFg+aOkNgnd3PW8FxZpvRQSZZUzCIQnkqkyo
25GsUtgClBNQySzRoLpVPjCE2qZvbHoGT7MoVlifaUNmh8dadBfMY8BXPACYgj4q
sGwK7Ton6YlJ+hce3v8vr96DKKRZTKNCzyPu+aK4xNqMiWzXjfxt96yZrTNTZZis
B4jZOn1zuQd4tkI/rdGtFtdxVYgkSw==
=pqw0
-----END PGP SIGNATURE-----

--Sig_/sxzXOrs+CYdBtw4VPNTESWS--

