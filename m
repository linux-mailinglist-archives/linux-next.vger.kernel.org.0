Return-Path: <linux-next+bounces-9124-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EA8C76FB1
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 03:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5BB7735610D
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 02:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7BF277013;
	Fri, 21 Nov 2025 02:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JsFrKWxK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BC621ABAA;
	Fri, 21 Nov 2025 02:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763690865; cv=none; b=koz4Bdj2uIJn7Cp6ItV6/CeEE0zz9dedajGN0oEsLOzKNmEKawZbssgYI9lmzRiTCECffYqD9S1YvotT8sNnhfvKOkEk+3KDAr9hxlJmVGWYo5Ps9QsloNeLcT6N6Y8u0E2l8uoQiFsqfZrK/YTX3fWfH9J/mbpDp7wQjXUldIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763690865; c=relaxed/simple;
	bh=5vnpSUxT88/Iecs2/Of74JYgFZXDuOBqlfqHJkkfDUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dB4We47QPkdt963xKjvt4a1r9UUOFWSG1yOJIcuN1FvXQEblLRLWNLkjrbJjYXS1zua1Ir65xdJsp/SR+uOJQNgtcZ4jxughg6Wc7XfC7jGGxyEZdV004cq5MHNbseC+cA1Zr2MvVjXwaN8F7vtA6bi5KMq8aoQ85cX9SsA38QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JsFrKWxK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763690859;
	bh=Xg51qNBPp0e5NCqrTc8DZPwTWZr6V6FZ18bltBDuiXo=;
	h=Date:From:To:Cc:Subject:From;
	b=JsFrKWxKDO4NaJsNo+3hNF2b9HOg2+WjwgfBgE4+JCu2z7ERY/oP/nhqxS/CZxyCo
	 mT8jwGpm3L7dc8eb41DEfBMpycopEZ6PH25M6LWl61VPoA2Mxsz2tccnAHpdff/vh1
	 +1e1bfb0bSyzyl4bV0J9+j6Wf7H+FW7iWRhPpoWPqJJ6e3pZTNzYr6C6/gXZ83v/JD
	 cWXLFUbrX78DOfjBxPMZk/6pbHjB1vgRPxIJGRuef3fjPg19UTXmkqXyFsVb8mme6G
	 KzwXpMoAHWyBdCfIa3h0EHYNQxop+686ftRnsHPeIoarv02bzsH2ms1f3bs4lcc9Dk
	 OmbRgshbaHcFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCJWs0tp8z4w0L;
	Fri, 21 Nov 2025 13:07:37 +1100 (AEDT)
Date: Fri, 21 Nov 2025 13:07:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Message-ID: <20251121130736.465b826d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c3F3HlhMLklncLNHjbKf885";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/c3F3HlhMLklncLNHjbKf885
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/firmware/efi/efi.c:78:10: error: 'struct mm_struct' has no member n=
amed 'cpus_allowed_lock'
   78 |         .cpus_allowed_lock      =3D __RAW_SPIN_LOCK_UNLOCKED(efi_mm=
.cpus_allowed_lock),
      |          ^~~~~~~~~~~~~~~~~
In file included from include/linux/spinlock_types.h:12,
                 from include/linux/mutex.h:16,
                 from include/linux/kernfs.h:11,
                 from include/linux/sysfs.h:16,
                 from include/linux/kobject.h:20,
                 from drivers/firmware/efi/efi.c:17:
include/linux/spinlock_types_raw.h:69:9: warning: excess elements in struct=
 initializer
   69 |         (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)
      |         ^
drivers/firmware/efi/efi.c:78:35: note: in expansion of macro '__RAW_SPIN_L=
OCK_UNLOCKED'
   78 |         .cpus_allowed_lock      =3D __RAW_SPIN_LOCK_UNLOCKED(efi_mm=
.cpus_allowed_lock),
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
include/linux/spinlock_types_raw.h:69:9: note: (near initialization for 'ef=
i_mm')
   69 |         (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)
      |         ^
drivers/firmware/efi/efi.c:78:35: note: in expansion of macro '__RAW_SPIN_L=
OCK_UNLOCKED'
   78 |         .cpus_allowed_lock      =3D __RAW_SPIN_LOCK_UNLOCKED(efi_mm=
.cpus_allowed_lock),
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  8cea569ca785 ("sched/mmcid: Use proper data structures")

interatcing with commit

  40374d308e4e ("efi: Add missing static initializer for efi_mm::cpus_allow=
ed_lock")

from the arm64 tree.

I have applied the following merge resolution patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 21 Nov 2025 12:57:10 +1100
Subject: [PATCH] fix up for "sched/mmcid: Use proper data structures"

interacting with commit

  40374d308e4e ("efi: Add missing static initializer for efi_mm::cpus_allow=
ed_lock")

from the arm64 tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/firmware/efi/efi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index fc407d891348..a9070d00b833 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -75,7 +75,7 @@ struct mm_struct efi_mm =3D {
 	.mmlist			=3D LIST_HEAD_INIT(efi_mm.mmlist),
 	.cpu_bitmap		=3D { [BITS_TO_LONGS(NR_CPUS)] =3D 0},
 #ifdef CONFIG_SCHED_MM_CID
-	.cpus_allowed_lock	=3D __RAW_SPIN_LOCK_UNLOCKED(efi_mm.cpus_allowed_lock),
+	.mm_cid.lock		=3D __RAW_SPIN_LOCK_UNLOCKED(efi_mm.mm_cid.lock),
 #endif
 };
=20
--=20
2.51.1

--=20
Cheers,
Stephen Rothwell

--Sig_/c3F3HlhMLklncLNHjbKf885
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkfyWgACgkQAVBC80lX
0GyRggf/fIprK7qdy615k0Scgg7/Kj6SNfjpIpwp6AjBQQjRKVMlC8UMEO3ohwFm
0JNVQ5QRGgdCr3VBkZfli74OkwX5vtsoOg5iEWXjah7CnBTKptpIC6evoI+WJs6n
Lygxr06AbUKfZ5qqdf0QaK43rtWU0E6UGNhavIfWL9kpqVSaG3K88EkZqdvVvcLV
xk6x1EUvmc9T6cc9FVYbQbQQBExW3GekHvrBaVOpAjlKyisiI25ccuBFce65dJyH
jVw6e+X23W90tW4mP9dCeRCkbLZHamjA+oyiID8BLwpcjjIhfBwf0kgWbZzNnrqE
InSwC4iWAGPkpSle8Le2V9uhHcNEgA==
=zSzk
-----END PGP SIGNATURE-----

--Sig_/c3F3HlhMLklncLNHjbKf885--

