Return-Path: <linux-next+bounces-5150-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A4A092CC
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 15:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D08E116328A
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 14:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B72E20B1E9;
	Fri, 10 Jan 2025 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2UevhIp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B01139587;
	Fri, 10 Jan 2025 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736517718; cv=none; b=lvSYZ17DBSx4FjEJKKwjPkJwmhOSD+dKcO/X8D6oV5tzJS/TlY7xgx99AGY8jQDb/uptnc2nn3KE/ynOJj6ILQhK/d4ByUjYWbJehGbGUVn/fabkHDWqmhJ1QJjUAp9EejckDwmjwjQW/QOc58qvioqk3vf2OQvyz+HiPsmfWEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736517718; c=relaxed/simple;
	bh=4e3GwbXb3E5CL7so+Qjxhc8KFBFY0JkjQtN5lcYlgNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+34GnmGPSyKJ94LjZhlVgO1GIjWEVsNvbvHO9yU5ZdCuP/XZ9Fo8b/VYr1ZiWUgxE4Akp4js3lw1htAi37wiW1rf5zAdDggA2IIjJWFeB2aEhi+DsIBz3uN0/v9sXG/6O2jfL9cDlvUxV8I5EsSnmIHDEIwYqdJkDDJZRxIvT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2UevhIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C6FC4CED6;
	Fri, 10 Jan 2025 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736517717;
	bh=4e3GwbXb3E5CL7so+Qjxhc8KFBFY0JkjQtN5lcYlgNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2UevhIpySI25kAOxZy9thoZYwL2LiLKHRJr2bRb3wb1GTDkblw5QK6jqdruPx673
	 bdg4XrIwMaGTx2oekAEMnQOLplGt+NogTUpvMFmaSIXa93fXZXmJvg+Eph9+aBcKXo
	 +DznCai885ZZp23qg5aDoaxd5zl8vO50ZpydAhpiC7+KRm6UlEz0okoTsrKrcjljxo
	 wOEGEJBvIUQOOTpx3/9YHXBlVvhKVIr6nHq1uH+lvaceNwVu+s5xyUmitRx+KR36gp
	 RtluAqLINkiAkf5TJ7M4h+Y0WwN2Btw8u/y8RhxH8Me099Cv3qLg4a6MZ3aui6fvNv
	 PxGiVTDAVaXgQ==
Date: Fri, 10 Jan 2025 11:01:54 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the perf tree
Message-ID: <Z4EoUoxSYPnS_Hul@x1>
References: <20250110100505.78d81450@canb.auug.org.au>
 <Z4BcXhjzl066fNGe@ghost>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4BcXhjzl066fNGe@ghost>

On Thu, Jan 09, 2025 at 03:31:42PM -0800, Charlie Jenkins wrote:
> On Fri, Jan 10, 2025 at 10:05:05AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the perf tree, today's linux-next build (native perf)
> > failed like this:
> > 
> > In file included from tools/perf/arch/powerpc/include/syscall_table.h:5,
> >                  from util/syscalltbl.c:16:
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:16:16: error: initialized field overwritten [-Werror=override-init]
> >    16 |         [13] = "time",
> >       |                ^~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:16:16: note: (near initialization for 'syscalltbl[13]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:22:16: error: initialized field overwritten [-Werror=override-init]
> >    22 |         [18] = "oldstat",
> >       |                ^~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:22:16: note: (near initialization for 'syscalltbl[18]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:27:16: error: initialized field overwritten [-Werror=override-init]
> >    27 |         [22] = "umount",
> >       |                ^~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:27:16: note: (near initialization for 'syscalltbl[22]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:31:16: error: initialized field overwritten [-Werror=override-init]
> >    31 |         [25] = "stime",
> >       |                ^~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:31:16: note: (near initialization for 'syscalltbl[25]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:35:16: error: initialized field overwritten [-Werror=override-init]
> >    35 |         [28] = "oldfstat",
> >       |                ^~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:35:16: note: (near initialization for 'syscalltbl[28]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:67:16: error: initialized field overwritten [-Werror=override-init]
> >    67 |         [59] = "oldolduname",
> >       |                ^~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:67:16: note: (near initialization for 'syscalltbl[59]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:76:16: error: initialized field overwritten [-Werror=override-init]
> >    76 |         [67] = "sigaction",
> >       |                ^~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:76:16: note: (near initialization for 'syscalltbl[67]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:82:16: error: initialized field overwritten [-Werror=override-init]
> >    82 |         [72] = "sigsuspend",
> >       |                ^~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:82:16: note: (near initialization for 'syscalltbl[72]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:84:16: error: initialized field overwritten [-Werror=override-init]
> >    84 |         [73] = "sigpending",
> >       |                ^~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:84:16: note: (near initialization for 'syscalltbl[73]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:88:16: error: initialized field overwritten [-Werror=override-init]
> >    88 |         [76] = "getrlimit",
> >       |                ^~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:88:16: note: (near initialization for 'syscalltbl[76]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:95:16: error: initialized field overwritten [-Werror=override-init]
> >    95 |         [82] = "select",
> >       |                ^~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:95:16: note: (near initialization for 'syscalltbl[82]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:98:16: error: initialized field overwritten [-Werror=override-init]
> >    98 |         [84] = "oldlstat",
> >       |                ^~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:98:16: note: (near initialization for 'syscalltbl[84]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:104:16: error: initialized field overwritten [-Werror=override-init]
> >   104 |         [89] = "readdir",
> >       |                ^~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:104:16: note: (near initialization for 'syscalltbl[89]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:125:17: error: initialized field overwritten [-Werror=override-init]
> >   125 |         [109] = "olduname",
> >       |                 ^~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:125:17: note: (near initialization for 'syscalltbl[109]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:136:17: error: initialized field overwritten [-Werror=override-init]
> >   136 |         [119] = "sigreturn",
> >       |                 ^~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:136:17: note: (near initialization for 'syscalltbl[119]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:142:17: error: initialized field overwritten [-Werror=override-init]
> >   142 |         [124] = "adjtimex",
> >       |                 ^~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:142:17: note: (near initialization for 'syscalltbl[124]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:145:17: error: initialized field overwritten [-Werror=override-init]
> >   145 |         [126] = "sigprocmask",
> >       |                 ^~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:145:17: note: (near initialization for 'syscalltbl[126]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:156:17: error: initialized field overwritten [-Werror=override-init]
> >   156 |         [136] = "personality",
> >       |                 ^~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:156:17: note: (near initialization for 'syscalltbl[136]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:182:17: error: initialized field overwritten [-Werror=override-init]
> >   182 |         [161] = "sched_rr_get_interval",
> >       |                 ^~~~~~~~~~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:182:17: note: (near initialization for 'syscalltbl[161]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:184:17: error: initialized field overwritten [-Werror=override-init]
> >   184 |         [162] = "nanosleep",
> >       |                 ^~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:184:17: note: (near initialization for 'syscalltbl[162]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:202:17: error: initialized field overwritten [-Werror=override-init]
> >   202 |         [179] = "pread64",
> >       |                 ^~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:202:17: note: (near initialization for 'syscalltbl[179]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:204:17: error: initialized field overwritten [-Werror=override-init]
> >   204 |         [180] = "pwrite64",
> >       |                 ^~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:204:17: note: (near initialization for 'syscalltbl[180]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:211:17: error: initialized field overwritten [-Werror=override-init]
> >   211 |         [186] = "sendfile",
> >       |                 ^~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:211:17: note: (near initialization for 'syscalltbl[186]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:217:17: error: initialized field overwritten [-Werror=override-init]
> >   217 |         [191] = "readahead",
> >       |                 ^~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:217:17: note: (near initialization for 'syscalltbl[191]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:241:17: error: initialized field overwritten [-Werror=override-init]
> >   241 |         [221] = "futex",
> >       |                 ^~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:241:17: note: (near initialization for 'syscalltbl[221]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:248:17: error: initialized field overwritten [-Werror=override-init]
> >   248 |         [229] = "io_getevents",
> >       |                 ^~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:248:17: note: (near initialization for 'syscalltbl[229]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:253:17: error: initialized field overwritten [-Werror=override-init]
> >   253 |         [233] = "fadvise64",
> >       |                 ^~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:253:17: note: (near initialization for 'syscalltbl[233]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:262:17: error: initialized field overwritten [-Werror=override-init]
> >   262 |         [241] = "timer_settime",
> >       |                 ^~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:262:17: note: (near initialization for 'syscalltbl[241]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:264:17: error: initialized field overwritten [-Werror=override-init]
> >   264 |         [242] = "timer_gettime",
> >       |                 ^~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:264:17: note: (near initialization for 'syscalltbl[242]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:268:17: error: initialized field overwritten [-Werror=override-init]
> >   268 |         [245] = "clock_settime",
> >       |                 ^~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:268:17: note: (near initialization for 'syscalltbl[245]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:270:17: error: initialized field overwritten [-Werror=override-init]
> >   270 |         [246] = "clock_gettime",
> >       |                 ^~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:270:17: note: (near initialization for 'syscalltbl[246]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:272:17: error: initialized field overwritten [-Werror=override-init]
> >   272 |         [247] = "clock_getres",
> >       |                 ^~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:272:17: note: (near initialization for 'syscalltbl[247]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:274:17: error: initialized field overwritten [-Werror=override-init]
> >   274 |         [248] = "clock_nanosleep",
> >       |                 ^~~~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:274:17: note: (near initialization for 'syscalltbl[248]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:278:17: error: initialized field overwritten [-Werror=override-init]
> >   278 |         [251] = "utimes",
> >       |                 ^~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:278:17: note: (near initialization for 'syscalltbl[251]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:284:17: error: initialized field overwritten [-Werror=override-init]
> >   284 |         [256] = "sys_debug_setcontext",
> >       |                 ^~~~~~~~~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:284:17: note: (near initialization for 'syscalltbl[256]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:318:17: error: initialized field overwritten [-Werror=override-init]
> >   318 |         [290] = "utimesat",
> >       |                 ^~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:318:17: note: (near initialization for 'syscalltbl[290]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:320:17: error: initialized field overwritten [-Werror=override-init]
> >   320 |         [291] = "newfstatat",
> >       |                 ^~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:320:17: note: (near initialization for 'syscalltbl[291]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:334:17: error: initialized field overwritten [-Werror=override-init]
> >   334 |         [304] = "utimensat",
> >       |                 ^~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:334:17: note: (near initialization for 'syscalltbl[304]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:339:17: error: initialized field overwritten [-Werror=override-init]
> >   339 |         [308] = "sync_file_range2",
> >       |                 ^~~~~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:339:17: note: (near initialization for 'syscalltbl[308]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:343:17: error: initialized field overwritten [-Werror=override-init]
> >   343 |         [311] = "timerfd_settime",
> >       |                 ^~~~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:343:17: note: (near initialization for 'syscalltbl[311]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:345:17: error: initialized field overwritten [-Werror=override-init]
> >   345 |         [312] = "timerfd_gettime",
> >       |                 ^~~~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:345:17: note: (near initialization for 'syscalltbl[312]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:377:17: error: initialized field overwritten [-Werror=override-init]
> >   377 |         [343] = "recvmmsg",
> >       |                 ^~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:377:17: note: (near initialization for 'syscalltbl[343]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:382:17: error: initialized field overwritten [-Werror=override-init]
> >   382 |         [347] = "clock_adjtime",
> >       |                 ^~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:382:17: note: (near initialization for 'syscalltbl[347]')
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:399:17: error: initialized field overwritten [-Werror=override-init]
> >   399 |         [363] = "switch_endian",
> >       |                 ^~~~~~~~~~~~~~~
> > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:399:17: note: (near initialization for 'syscalltbl[363]')
> > cc1: all warnings being treated as errors
> > 
> > Presumably caused by commit
> > 
> >   7eca67cf3dab ("perf tools powerpc: Use generic syscall table scripts")
> > 
> > This is a native powerpc build of perf on a little endian host.
> 
> Thank you for reporting! I see that these headers for powerpc are
> generating duplicate entries. This is due to me mistakenly setting the
> abis for the syscall headers for powerpc to be spu and nospu, causing
> conflicts. It looks like for the uapi, only nospu needs to be exposed. I
> will send a patch to fix that.

Right, we need to make the syscall tables for all arches to be built in
all arches, meaning we can translate from syscall numbers found in
tracepoints collected in one arch and present in a perf.data file while
doing analysis on another machine of a different architecture, just like
we do with errno numbers.

This way we would notice these kinds of problems immediatelly while
building anywhere.

I squashed your fix as requested and will force push the result.

- Arnaldo
 
> - Charlie
> 
> > 
> > I have used the perf tree from next-20250109 for today.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> 

