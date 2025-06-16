Return-Path: <linux-next+bounces-7154-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2B4ADA69A
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 05:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D46851890159
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 03:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455481EEE6;
	Mon, 16 Jun 2025 03:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TufeZZsJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B91FC3;
	Mon, 16 Jun 2025 03:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750042896; cv=none; b=PiroiSJofUVCF6pTbPfPfemycgmelky8dlAb0pY9EiHSNcvlMxDoaN2JAzDEdzcVYN8StuPWf5KOflgAzR1tWVcVndEVyUy48KhBMTO6u7s5N65AtcGBAk/zBoWR63yfMWdDF2IKcRJ8tAHBe0yS32kDaGBCfseVHY21Crg/1+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750042896; c=relaxed/simple;
	bh=zTuMbMPi2+rVp97D7jsFGjRewuljHwK79wUSCkTiMOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SCtqS/vioQeZ/jKkT6rPCh4XveB8pF5Rvsi5fRGl1p2tKIGPHXpELpISiK4qwC9SCkK1A6FG8hpazXNjcxn2vuWTVXlYGcue1UPwZOb0D4Z0YW4iDdWxfyUowPQDdE14uk9Zvra9dFX9qHf3ntiMCymLIWI+bIPWysyBEHS43J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TufeZZsJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750042887;
	bh=uywGkv2uoZkEWpK9FHfKipbDj5LJuwbzL+h/d9Q4jgc=;
	h=Date:From:To:Cc:Subject:From;
	b=TufeZZsJ1koXL5A8wOdyDKhR/jvC5CkgGR3ClR2XD2H2+qS5YSdc0de4zqO+d+sW1
	 Fiu77SCkjXTY2TlsM2KwffTTr7L4CcQ/axC4jA+kdsVOmbO/kdz+NYJwWvq3Cx1Ta+
	 NoHTOFdF2t2CB2itaXHPL2hFmsLm7aFudqm6qj2a4bqaw7//LpDZnNSfRrwb3n0HAC
	 DnEt9dlZllIj11Ci9l7nY5SEoam9gdPyXfAuRP4scUcKXgPREC4zrnzIZFjGXV8nTA
	 erwI1o6YWWYof5MCqr8uHFfuRfT83XbmC4igFCMDS3HpG3z8vTrGXIOY07Y98KnouX
	 jK+u+LZZsq0Eg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bLFBv00NHz4wcm;
	Mon, 16 Jun 2025 13:01:26 +1000 (AEST)
Date: Mon, 16 Jun 2025 13:01:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound tree
Message-ID: <20250616130126.08729b84@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U8PrXY8F=L+g=9.sV+twsqQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U8PrXY8F=L+g=9.sV+twsqQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/uaccess.h:12,
                 from include/linux/sched/task.h:13,
                 from include/linux/sched/signal.h:9,
                 from include/linux/rcuwait.h:6,
                 from include/linux/percpu-rwsem.h:7,
                 from include/linux/fs.h:34,
                 from include/linux/compat.h:17,
                 from sound/core/pcm_native.c:7:
sound/core/pcm_compat.c: In function 'snd_pcm_ioctl_sync_ptr_x32':
sound/core/pcm_native.c:3081:60: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'tstamp'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |                                                            ^
arch/x86/include/asm/uaccess.h:234:22: note: in definition of macro '__put_=
user_size'
  234 |         __typeof__(*(ptr)) __x =3D (x); /* eval x once */          =
       \
      |                      ^~~
sound/core/pcm_native.c:3081:9: note: in expansion of macro 'unsafe_put_use=
r'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3081:60: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'tstamp'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |                                                            ^
arch/x86/include/asm/uaccess.h:234:35: note: in definition of macro '__put_=
user_size'
  234 |         __typeof__(*(ptr)) __x =3D (x); /* eval x once */          =
       \
      |                                   ^
sound/core/pcm_native.c:3081:9: note: in expansion of macro 'unsafe_put_use=
r'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3081:60: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'tstamp'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |                                                            ^
arch/x86/include/asm/uaccess.h:235:20: note: in definition of macro '__put_=
user_size'
  235 |         __typeof__(ptr) __ptr =3D (ptr); /* eval ptr once */       =
       \
      |                    ^~~
sound/core/pcm_native.c:3081:9: note: in expansion of macro 'unsafe_put_use=
r'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3081:60: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'tstamp'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |                                                            ^
arch/x86/include/asm/uaccess.h:235:34: note: in definition of macro '__put_=
user_size'
  235 |         __typeof__(ptr) __ptr =3D (ptr); /* eval ptr once */       =
       \
      |                                  ^~~
sound/core/pcm_native.c:3081:9: note: in expansion of macro 'unsafe_put_use=
r'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3081:60: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'tstamp'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |                                                            ^
arch/x86/include/asm/uaccess.h:237:17: note: in definition of macro '__put_=
user_size'
  237 |         switch (size) {                                            =
     \
      |                 ^~~~
sound/core/pcm_native.c:3081:9: note: in expansion of macro 'unsafe_put_use=
r'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:239:17: note: in expansion of macro '__put_u=
ser_goto'
  239 |                 __put_user_goto(__x, __ptr, "b", "iq", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3081:9: note: in expansion of macro 'unsafe_put_use=
r'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:242:17: note: in expansion of macro '__put_u=
ser_goto'
  242 |                 __put_user_goto(__x, __ptr, "w", "ir", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3081:9: note: in expansion of macro 'unsafe_put_use=
r'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:245:17: note: in expansion of macro '__put_u=
ser_goto'
  245 |                 __put_user_goto(__x, __ptr, "l", "ir", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3081:9: note: in expansion of macro 'unsafe_put_use=
r'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:146:9: note: in expansion of macro '__put_us=
er_goto'
  146 |         __put_user_goto(x, ptr, "q", "er", label)
      |         ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:248:17: note: in expansion of macro '__put_u=
ser_goto_u64'
  248 |                 __put_user_goto_u64(__x, __ptr, label);            =
     \
      |                 ^~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3081:9: note: in expansion of macro 'unsafe_put_use=
r'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/asm-generic/bitops/instrumented-atomic.h:14,
                 from arch/x86/include/asm/bitops.h:429,
                 from include/linux/bitops.h:67,
                 from include/linux/kernel.h:23,
                 from include/linux/cpumask.h:11,
                 from arch/x86/include/asm/paravirt.h:21,
                 from arch/x86/include/asm/cpuid/api.h:57,
                 from arch/x86/include/asm/processor.h:19,
                 from arch/x86/include/asm/timex.h:5,
                 from include/linux/timex.h:67,
                 from include/linux/time32.h:13,
                 from include/linux/time.h:60,
                 from include/linux/compat.h:10:
arch/x86/include/asm/uaccess.h:253:34: error: passing argument 1 of 'kmsan_=
copy_to_user' makes pointer from integer without a cast [-Wint-conversion]
  253 |         instrument_put_user(__x, __ptr, size);                     =
     \
      |                                  ^~~~~
      |                                  |
      |                                  int
include/linux/instrumented.h:213:28: note: in definition of macro 'instrume=
nt_put_user'
  213 |         kmsan_copy_to_user(ptr, &from, sizeof(from), 0);        \
      |                            ^~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3081:9: note: in expansion of macro 'unsafe_put_use=
r'
 3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.=
tv_sec, failed);             \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/instrumented.h:13:
include/linux/kmsan-checks.h:87:52: note: expected 'void *' but argument is=
 of type 'int'
   87 | static inline void kmsan_copy_to_user(void __user *to, const void *=
from,
      |                                       ~~~~~~~~~~~~~^~
sound/core/pcm_native.c:3082:61: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'tstamp'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |                                                             ^
arch/x86/include/asm/uaccess.h:234:22: note: in definition of macro '__put_=
user_size'
  234 |         __typeof__(*(ptr)) __x =3D (x); /* eval x once */          =
       \
      |                      ^~~
sound/core/pcm_native.c:3082:9: note: in expansion of macro 'unsafe_put_use=
r'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3082:61: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'tstamp'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |                                                             ^
arch/x86/include/asm/uaccess.h:234:35: note: in definition of macro '__put_=
user_size'
  234 |         __typeof__(*(ptr)) __x =3D (x); /* eval x once */          =
       \
      |                                   ^
sound/core/pcm_native.c:3082:9: note: in expansion of macro 'unsafe_put_use=
r'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3082:61: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'tstamp'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |                                                             ^
arch/x86/include/asm/uaccess.h:235:20: note: in definition of macro '__put_=
user_size'
  235 |         __typeof__(ptr) __ptr =3D (ptr); /* eval ptr once */       =
       \
      |                    ^~~
sound/core/pcm_native.c:3082:9: note: in expansion of macro 'unsafe_put_use=
r'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3082:61: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'tstamp'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |                                                             ^
arch/x86/include/asm/uaccess.h:235:34: note: in definition of macro '__put_=
user_size'
  235 |         __typeof__(ptr) __ptr =3D (ptr); /* eval ptr once */       =
       \
      |                                  ^~~
sound/core/pcm_native.c:3082:9: note: in expansion of macro 'unsafe_put_use=
r'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3082:61: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'tstamp'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |                                                             ^
arch/x86/include/asm/uaccess.h:237:17: note: in definition of macro '__put_=
user_size'
  237 |         switch (size) {                                            =
     \
      |                 ^~~~
sound/core/pcm_native.c:3082:9: note: in expansion of macro 'unsafe_put_use=
r'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:239:17: note: in expansion of macro '__put_u=
ser_goto'
  239 |                 __put_user_goto(__x, __ptr, "b", "iq", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3082:9: note: in expansion of macro 'unsafe_put_use=
r'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:242:17: note: in expansion of macro '__put_u=
ser_goto'
  242 |                 __put_user_goto(__x, __ptr, "w", "ir", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3082:9: note: in expansion of macro 'unsafe_put_use=
r'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:245:17: note: in expansion of macro '__put_u=
ser_goto'
  245 |                 __put_user_goto(__x, __ptr, "l", "ir", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3082:9: note: in expansion of macro 'unsafe_put_use=
r'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:146:9: note: in expansion of macro '__put_us=
er_goto'
  146 |         __put_user_goto(x, ptr, "q", "er", label)
      |         ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:248:17: note: in expansion of macro '__put_u=
ser_goto_u64'
  248 |                 __put_user_goto_u64(__x, __ptr, label);            =
     \
      |                 ^~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3082:9: note: in expansion of macro 'unsafe_put_use=
r'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:253:34: error: passing argument 1 of 'kmsan_=
copy_to_user' makes pointer from integer without a cast [-Wint-conversion]
  253 |         instrument_put_user(__x, __ptr, size);                     =
     \
      |                                  ^~~~~
      |                                  |
      |                                  int
include/linux/instrumented.h:213:28: note: in definition of macro 'instrume=
nt_put_user'
  213 |         kmsan_copy_to_user(ptr, &from, sizeof(from), 0);        \
      |                            ^~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3082:9: note: in expansion of macro 'unsafe_put_use=
r'
 3082 |         unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp=
.tv_nsec, failed);           \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/kmsan-checks.h:87:52: note: expected 'void *' but argument is=
 of type 'int'
   87 | static inline void kmsan_copy_to_user(void __user *to, const void *=
from,
      |                                       ~~~~~~~~~~~~~^~
sound/core/pcm_native.c:3084:67: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'audio_tstamp'; did you mean 'audio_tstamp_sec'?
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |                                                                   ^=
~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:234:22: note: in definition of macro '__put_=
user_size'
  234 |         __typeof__(*(ptr)) __x =3D (x); /* eval x once */          =
       \
      |                      ^~~
sound/core/pcm_native.c:3084:9: note: in expansion of macro 'unsafe_put_use=
r'
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3084:67: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'audio_tstamp'; did you mean 'audio_tstamp_sec'?
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |                                                                   ^=
~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:234:35: note: in definition of macro '__put_=
user_size'
  234 |         __typeof__(*(ptr)) __x =3D (x); /* eval x once */          =
       \
      |                                   ^
sound/core/pcm_native.c:3084:9: note: in expansion of macro 'unsafe_put_use=
r'
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3084:67: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'audio_tstamp'; did you mean 'audio_tstamp_sec'?
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |                                                                   ^=
~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:235:20: note: in definition of macro '__put_=
user_size'
  235 |         __typeof__(ptr) __ptr =3D (ptr); /* eval ptr once */       =
       \
      |                    ^~~
sound/core/pcm_native.c:3084:9: note: in expansion of macro 'unsafe_put_use=
r'
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3084:67: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'audio_tstamp'; did you mean 'audio_tstamp_sec'?
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |                                                                   ^=
~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:235:34: note: in definition of macro '__put_=
user_size'
  235 |         __typeof__(ptr) __ptr =3D (ptr); /* eval ptr once */       =
       \
      |                                  ^~~
sound/core/pcm_native.c:3084:9: note: in expansion of macro 'unsafe_put_use=
r'
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3084:67: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'audio_tstamp'; did you mean 'audio_tstamp_sec'?
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |                                                                   ^=
~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:237:17: note: in definition of macro '__put_=
user_size'
  237 |         switch (size) {                                            =
     \
      |                 ^~~~
sound/core/pcm_native.c:3084:9: note: in expansion of macro 'unsafe_put_use=
r'
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:239:17: note: in expansion of macro '__put_u=
ser_goto'
  239 |                 __put_user_goto(__x, __ptr, "b", "iq", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3084:9: note: in expansion of macro 'unsafe_put_use=
r'
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:242:17: note: in expansion of macro '__put_u=
ser_goto'
  242 |                 __put_user_goto(__x, __ptr, "w", "ir", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3084:9: note: in expansion of macro 'unsafe_put_use=
r'
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:245:17: note: in expansion of macro '__put_u=
ser_goto'
  245 |                 __put_user_goto(__x, __ptr, "l", "ir", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3084:9: note: in expansion of macro 'unsafe_put_use=
r'
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:146:9: note: in expansion of macro '__put_us=
er_goto'
  146 |         __put_user_goto(x, ptr, "q", "er", label)
      |         ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:248:17: note: in expansion of macro '__put_u=
ser_goto_u64'
  248 |                 __put_user_goto_u64(__x, __ptr, label);            =
     \
      |                 ^~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3084:9: note: in expansion of macro 'unsafe_put_use=
r'
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:253:34: error: passing argument 1 of 'kmsan_=
copy_to_user' makes pointer from integer without a cast [-Wint-conversion]
  253 |         instrument_put_user(__x, __ptr, size);                     =
     \
      |                                  ^~~~~
      |                                  |
      |                                  int
include/linux/instrumented.h:213:28: note: in definition of macro 'instrume=
nt_put_user'
  213 |         kmsan_copy_to_user(ptr, &from, sizeof(from), 0);        \
      |                            ^~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3084:9: note: in expansion of macro 'unsafe_put_use=
r'
 3084 |         unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.a=
udio_tstamp.tv_sec, failed); \
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/kmsan-checks.h:87:52: note: expected 'void *' but argument is=
 of type 'int'
   87 | static inline void kmsan_copy_to_user(void __user *to, const void *=
from,
      |                                       ~~~~~~~~~~~~~^~
sound/core/pcm_native.c:3085:68: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'audio_tstamp'; did you mean 'audio_tstamp_sec'?
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |                                                                    =
^~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:234:22: note: in definition of macro '__put_=
user_size'
  234 |         __typeof__(*(ptr)) __x =3D (x); /* eval x once */          =
       \
      |                      ^~~
sound/core/pcm_native.c:3085:9: note: in expansion of macro 'unsafe_put_use=
r'
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3085:68: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'audio_tstamp'; did you mean 'audio_tstamp_sec'?
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |                                                                    =
^~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:234:35: note: in definition of macro '__put_=
user_size'
  234 |         __typeof__(*(ptr)) __x =3D (x); /* eval x once */          =
       \
      |                                   ^
sound/core/pcm_native.c:3085:9: note: in expansion of macro 'unsafe_put_use=
r'
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3085:68: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'audio_tstamp'; did you mean 'audio_tstamp_sec'?
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |                                                                    =
^~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:235:20: note: in definition of macro '__put_=
user_size'
  235 |         __typeof__(ptr) __ptr =3D (ptr); /* eval ptr once */       =
       \
      |                    ^~~
sound/core/pcm_native.c:3085:9: note: in expansion of macro 'unsafe_put_use=
r'
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3085:68: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'audio_tstamp'; did you mean 'audio_tstamp_sec'?
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |                                                                    =
^~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:235:34: note: in definition of macro '__put_=
user_size'
  235 |         __typeof__(ptr) __ptr =3D (ptr); /* eval ptr once */       =
       \
      |                                  ^~~
sound/core/pcm_native.c:3085:9: note: in expansion of macro 'unsafe_put_use=
r'
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/core/pcm_native.c:3085:68: error: 'struct snd_pcm_mmap_status_x32' ha=
s no member named 'audio_tstamp'; did you mean 'audio_tstamp_sec'?
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |                                                                    =
^~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:237:17: note: in definition of macro '__put_=
user_size'
  237 |         switch (size) {                                            =
     \
      |                 ^~~~
sound/core/pcm_native.c:3085:9: note: in expansion of macro 'unsafe_put_use=
r'
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:239:17: note: in expansion of macro '__put_u=
ser_goto'
  239 |                 __put_user_goto(__x, __ptr, "b", "iq", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3085:9: note: in expansion of macro 'unsafe_put_use=
r'
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:242:17: note: in expansion of macro '__put_u=
ser_goto'
  242 |                 __put_user_goto(__x, __ptr, "w", "ir", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3085:9: note: in expansion of macro 'unsafe_put_use=
r'
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:245:17: note: in expansion of macro '__put_u=
ser_goto'
  245 |                 __put_user_goto(__x, __ptr, "l", "ir", label);     =
     \
      |                 ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3085:9: note: in expansion of macro 'unsafe_put_use=
r'
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:472:18: error: cast to pointer from integer =
of different size [-Werror=3Dint-to-pointer-cast]
  472 | #define __m(x) (*(struct __large_struct __user *)(x))
      |                  ^
arch/x86/include/asm/uaccess.h:483:36: note: in expansion of macro '__m'
  483 |                 : : ltype(x), "m" (__m(addr))                      =
     \
      |                                    ^~~
arch/x86/include/asm/uaccess.h:146:9: note: in expansion of macro '__put_us=
er_goto'
  146 |         __put_user_goto(x, ptr, "q", "er", label)
      |         ^~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:248:17: note: in expansion of macro '__put_u=
ser_goto_u64'
  248 |                 __put_user_goto_u64(__x, __ptr, label);            =
     \
      |                 ^~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3085:9: note: in expansion of macro 'unsafe_put_use=
r'
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:253:34: error: passing argument 1 of 'kmsan_=
copy_to_user' makes pointer from integer without a cast [-Wint-conversion]
  253 |         instrument_put_user(__x, __ptr, size);                     =
     \
      |                                  ^~~~~
      |                                  |
      |                                  int
include/linux/instrumented.h:213:28: note: in definition of macro 'instrume=
nt_put_user'
  213 |         kmsan_copy_to_user(ptr, &from, sizeof(from), 0);        \
      |                            ^~~
arch/x86/include/asm/uaccess.h:533:9: note: in expansion of macro '__put_us=
er_size'
  533 |         __put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(pt=
r)), label)
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_native.c:3085:9: note: in expansion of macro 'unsafe_put_use=
r'
 3085 |         unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.=
audio_tstamp.tv_nsec, failed);\
      |         ^~~~~~~~~~~~~~~
sound/core/pcm_compat.c:451:13: note: in expansion of macro 'snd_pcm_sync_p=
tr_put_user'
  451 |         if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/kmsan-checks.h:87:52: note: expected 'void *' but argument is=
 of type 'int'
   87 | static inline void kmsan_copy_to_user(void __user *to, const void *=
from,
      |                                       ~~~~~~~~~~~~~^~
cc1: all warnings being treated as errors

Caused by (sone of) commits

  2acd83beb4d3 ("ALSA: pcm: refactor copy from/to user in SNDRV_PCM_IOCTL_S=
YNC_PTR")
  de32a6120b80 ("ALSA: pcm: Convert snd_pcm_sync_ptr() to user_access_begin=
/user_access_end()")
  a0f3992ee86e ("ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_t=
imespec in struct snd_pcm_mmap_status32")
  a9b49bf8ad59 ("ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access=
_begin/user_access_end()")

I have used the sound tree from next-20250613 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/U8PrXY8F=L+g=9.sV+twsqQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhPiQYACgkQAVBC80lX
0GzlNwf/bjL5Bvcl8J7GKcYGmE6kg5zllJluf014c/29ph11IbhbaoMtdwBr2JHu
E8H3Vq9jVuCSvOsaBXh1n8gRIAxWYkBI9JSNaGnrpocAUOs7bQXiobrd437YgPu+
G3FN0wP0ALeIezxPHNdoi2E43lKU0qCUNx8/GC1dl0dOA5236iTtJb2355oB42Xa
IZPB28qnejhKnVvCCUTfFpEyCjgWyW+PSgnPqTI8j4sOdBt+w84SPNWoO5uc8Co6
iZIvdJgDNH4JJemmgUpgDpmcupKTPmNR3wIm8q1LBVMP3gV0vOHRDL81ER8+f01m
F0MN4+xey79CxdYpo0I+jo90A14Viw==
=6RTW
-----END PGP SIGNATURE-----

--Sig_/U8PrXY8F=L+g=9.sV+twsqQ--

