Return-Path: <linux-next+bounces-5121-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF4BA08344
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 00:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1BD1168AFC
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 23:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657C2199235;
	Thu,  9 Jan 2025 23:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cnnfdeAJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3F3171658;
	Thu,  9 Jan 2025 23:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736463912; cv=none; b=q916fYxQc1EpZx7unpbJhNaG+pF+9KfB8BEnDuHiMVnKdcooUu6LubEhWwpIdzvHqjXWbecP+4ju8u+jRmuEfFLfQI7bQMir5OMHQZaKM9Kf6GZJEtqEqZfKNBypMkEGWMdfdN4I1ToVbTz+Vv3yZZFT+OBmYEyIjkJXqdRza1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736463912; c=relaxed/simple;
	bh=CsQueEImNIvlA9RqVpiPB9EWhP4lDb1CLV3K1TX9fTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=silql5dcnZmk6aDWt5xMAts+oXJKx5x5A5Xu6VWvKj2rAHpFk/z4YMyxYYFmsvES+j09ZpryQWrsLjwwTkZJs2aiuEDfc4EKe5aWv/ycNsCikDN8Cktcb2J2kURHVrqBnhwaU2+WJeus425KbulFHwzRsbWjGpgvNmtLD2PpUbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cnnfdeAJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736463899;
	bh=oazwJ6amUAAe9S211lYoB0KKeiW+lwu7PHwSU3JY/5s=;
	h=Date:From:To:Cc:Subject:From;
	b=cnnfdeAJsC4bftFkEolbQEqvyzxjdP0ICQ8KJyBjnNgI0HJGTk6NZDKXGDYS6wEHl
	 BNZL5DsS0M7QpkvpUBapePzkQ+oSZkiX0iIsLGiVYn18GWO+XkdpiCPc7/LnaaO163
	 B9sLHK+iayHd3og1/aj9T72DfoXBs7YnMN2xl74j7y/kSUQRma69LpYqcWo/6GkvkS
	 sRM6ZFdIFQqLpDBll+7CYVgD4BHjLcCK1Lk4lzX0K8LhExMvXzRkijwPFs94IL+iAT
	 1HgoWCDJy3z0t65M84yIoQXLsyL79ceBt6XITJPyGzAEITrV7jA613L26M6UmPl4hr
	 QE20wzo6yH26g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTgNW2J9Lz4wbR;
	Fri, 10 Jan 2025 10:04:59 +1100 (AEDT)
Date: Fri, 10 Jan 2025 10:05:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, Charlie Jenkins
 <charlie@rivosinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the perf tree
Message-ID: <20250110100505.78d81450@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SHAGflB_3j0Ok7yIxEOEMz0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SHAGflB_3j0Ok7yIxEOEMz0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the perf tree, today's linux-next build (native perf)
failed like this:

In file included from tools/perf/arch/powerpc/include/syscall_table.h:5,
                 from util/syscalltbl.c:16:
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:16:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   16 |         [13] =3D "time",
      |                ^~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:16:16:=
 note: (near initialization for 'syscalltbl[13]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:22:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   22 |         [18] =3D "oldstat",
      |                ^~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:22:16:=
 note: (near initialization for 'syscalltbl[18]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:27:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   27 |         [22] =3D "umount",
      |                ^~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:27:16:=
 note: (near initialization for 'syscalltbl[22]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:31:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   31 |         [25] =3D "stime",
      |                ^~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:31:16:=
 note: (near initialization for 'syscalltbl[25]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:35:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   35 |         [28] =3D "oldfstat",
      |                ^~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:35:16:=
 note: (near initialization for 'syscalltbl[28]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:67:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   67 |         [59] =3D "oldolduname",
      |                ^~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:67:16:=
 note: (near initialization for 'syscalltbl[59]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:76:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   76 |         [67] =3D "sigaction",
      |                ^~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:76:16:=
 note: (near initialization for 'syscalltbl[67]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:82:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   82 |         [72] =3D "sigsuspend",
      |                ^~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:82:16:=
 note: (near initialization for 'syscalltbl[72]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:84:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   84 |         [73] =3D "sigpending",
      |                ^~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:84:16:=
 note: (near initialization for 'syscalltbl[73]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:88:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   88 |         [76] =3D "getrlimit",
      |                ^~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:88:16:=
 note: (near initialization for 'syscalltbl[76]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:95:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   95 |         [82] =3D "select",
      |                ^~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:95:16:=
 note: (near initialization for 'syscalltbl[82]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:98:16:=
 error: initialized field overwritten [-Werror=3Doverride-init]
   98 |         [84] =3D "oldlstat",
      |                ^~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:98:16:=
 note: (near initialization for 'syscalltbl[84]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:104:16=
: error: initialized field overwritten [-Werror=3Doverride-init]
  104 |         [89] =3D "readdir",
      |                ^~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:104:16=
: note: (near initialization for 'syscalltbl[89]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:125:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  125 |         [109] =3D "olduname",
      |                 ^~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:125:17=
: note: (near initialization for 'syscalltbl[109]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:136:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  136 |         [119] =3D "sigreturn",
      |                 ^~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:136:17=
: note: (near initialization for 'syscalltbl[119]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:142:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  142 |         [124] =3D "adjtimex",
      |                 ^~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:142:17=
: note: (near initialization for 'syscalltbl[124]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:145:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  145 |         [126] =3D "sigprocmask",
      |                 ^~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:145:17=
: note: (near initialization for 'syscalltbl[126]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:156:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  156 |         [136] =3D "personality",
      |                 ^~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:156:17=
: note: (near initialization for 'syscalltbl[136]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:182:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  182 |         [161] =3D "sched_rr_get_interval",
      |                 ^~~~~~~~~~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:182:17=
: note: (near initialization for 'syscalltbl[161]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:184:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  184 |         [162] =3D "nanosleep",
      |                 ^~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:184:17=
: note: (near initialization for 'syscalltbl[162]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:202:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  202 |         [179] =3D "pread64",
      |                 ^~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:202:17=
: note: (near initialization for 'syscalltbl[179]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:204:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  204 |         [180] =3D "pwrite64",
      |                 ^~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:204:17=
: note: (near initialization for 'syscalltbl[180]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:211:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  211 |         [186] =3D "sendfile",
      |                 ^~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:211:17=
: note: (near initialization for 'syscalltbl[186]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:217:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  217 |         [191] =3D "readahead",
      |                 ^~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:217:17=
: note: (near initialization for 'syscalltbl[191]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:241:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  241 |         [221] =3D "futex",
      |                 ^~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:241:17=
: note: (near initialization for 'syscalltbl[221]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:248:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  248 |         [229] =3D "io_getevents",
      |                 ^~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:248:17=
: note: (near initialization for 'syscalltbl[229]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:253:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  253 |         [233] =3D "fadvise64",
      |                 ^~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:253:17=
: note: (near initialization for 'syscalltbl[233]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:262:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  262 |         [241] =3D "timer_settime",
      |                 ^~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:262:17=
: note: (near initialization for 'syscalltbl[241]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:264:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  264 |         [242] =3D "timer_gettime",
      |                 ^~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:264:17=
: note: (near initialization for 'syscalltbl[242]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:268:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  268 |         [245] =3D "clock_settime",
      |                 ^~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:268:17=
: note: (near initialization for 'syscalltbl[245]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:270:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  270 |         [246] =3D "clock_gettime",
      |                 ^~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:270:17=
: note: (near initialization for 'syscalltbl[246]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:272:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  272 |         [247] =3D "clock_getres",
      |                 ^~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:272:17=
: note: (near initialization for 'syscalltbl[247]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:274:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  274 |         [248] =3D "clock_nanosleep",
      |                 ^~~~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:274:17=
: note: (near initialization for 'syscalltbl[248]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:278:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  278 |         [251] =3D "utimes",
      |                 ^~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:278:17=
: note: (near initialization for 'syscalltbl[251]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:284:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  284 |         [256] =3D "sys_debug_setcontext",
      |                 ^~~~~~~~~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:284:17=
: note: (near initialization for 'syscalltbl[256]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:318:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  318 |         [290] =3D "utimesat",
      |                 ^~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:318:17=
: note: (near initialization for 'syscalltbl[290]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:320:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  320 |         [291] =3D "newfstatat",
      |                 ^~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:320:17=
: note: (near initialization for 'syscalltbl[291]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:334:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  334 |         [304] =3D "utimensat",
      |                 ^~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:334:17=
: note: (near initialization for 'syscalltbl[304]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:339:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  339 |         [308] =3D "sync_file_range2",
      |                 ^~~~~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:339:17=
: note: (near initialization for 'syscalltbl[308]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:343:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  343 |         [311] =3D "timerfd_settime",
      |                 ^~~~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:343:17=
: note: (near initialization for 'syscalltbl[311]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:345:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  345 |         [312] =3D "timerfd_gettime",
      |                 ^~~~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:345:17=
: note: (near initialization for 'syscalltbl[312]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:377:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  377 |         [343] =3D "recvmmsg",
      |                 ^~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:377:17=
: note: (near initialization for 'syscalltbl[343]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:382:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  382 |         [347] =3D "clock_adjtime",
      |                 ^~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:382:17=
: note: (near initialization for 'syscalltbl[347]')
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:399:17=
: error: initialized field overwritten [-Werror=3Doverride-init]
  399 |         [363] =3D "switch_endian",
      |                 ^~~~~~~~~~~~~~~
/home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:399:17=
: note: (near initialization for 'syscalltbl[363]')
cc1: all warnings being treated as errors

Presumably caused by commit

  7eca67cf3dab ("perf tools powerpc: Use generic syscall table scripts")

This is a native powerpc build of perf on a little endian host.

I have used the perf tree from next-20250109 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/SHAGflB_3j0Ok7yIxEOEMz0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeAViEACgkQAVBC80lX
0GweyggAl7nh9JosfaT6lEd0lxI+D4ob7E5Qfh18DwkyLP5Mv52o0Hhj6SGEPFiX
lbtBQNTE9+ot4tlnMbUEf+I0pzL4zYek41cj6/U9txZPENTBzOTj0rK+TfY6G/q0
JdHUUOlhyN8C0FG63uiNVaI6keIY/JH7/Y2soHnIKw0UzzBwTiV4NB7itAk5XX1W
Jkuy8xsBzZZU7dhAfeGOBVAk5bUQV+3QhlkHn+1A9dvpUHKYNpVtSnB4NlR08VDe
1fKS1pLPL35IpWQNKjeM4AynNScgShXyN4l/sGrqR8utG2+l/PWTb9vw9WKr+TXb
z563CpjXeW3H5xGDF7I/4OkeiK62mQ==
=Um5B
-----END PGP SIGNATURE-----

--Sig_/SHAGflB_3j0Ok7yIxEOEMz0--

