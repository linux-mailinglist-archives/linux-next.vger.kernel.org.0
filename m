Return-Path: <linux-next+bounces-5155-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACC6A09BC5
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 20:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D193E188E367
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 19:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A433C212FB9;
	Fri, 10 Jan 2025 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RHyzNhE6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8314124B249
	for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736536931; cv=none; b=YpzIV+GTYbRdKN1fOA6OimnXmGteuwNL4St/cQT1cpFYakur5mD7fk/Ebe/9Y0SZlCQyXS7R6FU1R9OKSZJDGSkdtLMBUC/3n8tp6zA7GJcoeNaWbdRtt4uWUr9JI5EcSdB+LtMc/ICB1Y8fSY5uXf1bobg+ACOVSCqPz9dUfKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736536931; c=relaxed/simple;
	bh=GN8mpBbrRecBDXkmuxzuYcpjqGRXs/af1kMsRwX3hGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpZZwre5kgrGdTUwArYZdQBk/JHlF5UxfSKzpy+bpBCnUL6tfYvVmT495KTXatYSmtqfyLDKpbZ0zyHn2ZpJtFHkpBQ+mT20aHsDQOCmpE4O76xbHMHx77gHCNFDOLZ1N2cjSCeMpws4J6YQjT7JM1gLd042qTglwDXMxzy8pNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=RHyzNhE6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2156e078563so35889565ad.2
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 11:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736536929; x=1737141729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dHhXyh9WTV4lXX6e4152nGCiAiEO+zENd+mgz50+BYc=;
        b=RHyzNhE6cCJA/XVH4/ReFcUCpGHPLi1gcbWza6UzQ52sYI6Wld2OvToMyk6S0sNWmf
         22byZ4zcjVWBuwrmfSVxv9K8saVBgc13g7G0emN7KyrQSv9ld1cEuijnRj0LYI+cae67
         VSkIweUtU6klt15d/SA9Ynrq4X8f3iI7QIOnEeul6Xqx4Xf/86f0iH/0K/QHwuj/0Drs
         1IVVqeN5N0b9NBHjPtpJYB2iv6DTBRezEAM9r5XRa5C9G24oUgkunj3cv6y+ngHEVUT0
         RIcsRFby6jkWlvIZeDYjf5WkYf+sDSU3dzdU/WSYePnVu9DbmAWfAasIqKMM4Yy7r02+
         gmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736536929; x=1737141729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHhXyh9WTV4lXX6e4152nGCiAiEO+zENd+mgz50+BYc=;
        b=hc3wdl42MFbNUIE9py7cfDJfO1mWNCdSq17GxwnjNsvFwVqRaFK4lhZIJ2u8vOAL8H
         qvb9O54AyVG0MnrdoZJ3l1CtGvxuAYe3Kvykq3J7nfKE3AykwiNC2yknF7gsEdGQ9bP+
         qdMvuRHjChESRf+gKis8Vde2XnyKQGg89dSKpHBkjHG6Hg5buLGQhaD1jt+WfS6zmCin
         d4dlmUdEktZ3NgpSdt0iDEs/dLLmI91NUu3PWcHcx83Rm1y+7XSypWy5wOgvBROVzG25
         YIfpYrSHcBQVO93j+UDWcrCc/b33tT5D40OvtTyYgkBOJSk2q9SzkSfZo4lI+9bQVjTS
         ZnPg==
X-Forwarded-Encrypted: i=1; AJvYcCWKwFMoZb4yz96k9RvJ7sf42SNv/GtmoyJavZTtmbtvVjrOUB3EKqgjWwTXM9hNyQ/L14kwJFnfe6m/@vger.kernel.org
X-Gm-Message-State: AOJu0YwhikMEaFjKd1qyLz01W1DqFAp5ApyB5eTs+HwqrvvCoCMXSPLb
	zwJ68ADLC+G3BhNRAMiH1f5sUdmcPmqEd4ZzeHKKb2ZQdgC6cX6Q2JpddqGLcIQ=
X-Gm-Gg: ASbGncuO/4HcOl7hy0L4meZvM5550gF5Dk/Phtb7B1ryzwsdmZCSWifdpzKFPs1GohF
	EwRm1sWN3oQ31VrFetEnUvXxCvt5I5n8qmmeLT6FqQyJ67gLDyspUPd4dWbOyybsS/ywbJmp58E
	oW+CPB60GxKqauDPEiIROGKfi4zE07YArxy4q3ldsdASjM6Tva/RPgX1FVFdRkMlDKL1ss3a+AO
	J8a15pNn0W+4LwW4VNG1GK+ZMG6dabPUJr+1JJAdC0NjMdLaeUi
X-Google-Smtp-Source: AGHT+IHAfDFfQ4W1Udoucze3qv5EqQEfgB75CAUriQu784HlGf9FQzTWa3CdnTfC9H04znQn3+JpEw==
X-Received: by 2002:a05:6a20:6a28:b0:1e1:a75a:c452 with SMTP id adf61e73a8af0-1e88d10cc7fmr20482877637.19.1736536928686;
        Fri, 10 Jan 2025 11:22:08 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4bc7:d274:c14b:fde8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4068178csm1929847b3a.148.2025.01.10.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 11:22:08 -0800 (PST)
Date: Fri, 10 Jan 2025 11:22:06 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the perf tree
Message-ID: <Z4FzXu6FTIaFyEwA@ghost>
References: <20250110100505.78d81450@canb.auug.org.au>
 <Z4BcXhjzl066fNGe@ghost>
 <Z4EoUoxSYPnS_Hul@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4EoUoxSYPnS_Hul@x1>

On Fri, Jan 10, 2025 at 11:01:54AM -0300, Arnaldo Carvalho de Melo wrote:
> On Thu, Jan 09, 2025 at 03:31:42PM -0800, Charlie Jenkins wrote:
> > On Fri, Jan 10, 2025 at 10:05:05AM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the perf tree, today's linux-next build (native perf)
> > > failed like this:
> > > 
> > > In file included from tools/perf/arch/powerpc/include/syscall_table.h:5,
> > >                  from util/syscalltbl.c:16:
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:16:16: error: initialized field overwritten [-Werror=override-init]
> > >    16 |         [13] = "time",
> > >       |                ^~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:16:16: note: (near initialization for 'syscalltbl[13]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:22:16: error: initialized field overwritten [-Werror=override-init]
> > >    22 |         [18] = "oldstat",
> > >       |                ^~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:22:16: note: (near initialization for 'syscalltbl[18]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:27:16: error: initialized field overwritten [-Werror=override-init]
> > >    27 |         [22] = "umount",
> > >       |                ^~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:27:16: note: (near initialization for 'syscalltbl[22]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:31:16: error: initialized field overwritten [-Werror=override-init]
> > >    31 |         [25] = "stime",
> > >       |                ^~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:31:16: note: (near initialization for 'syscalltbl[25]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:35:16: error: initialized field overwritten [-Werror=override-init]
> > >    35 |         [28] = "oldfstat",
> > >       |                ^~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:35:16: note: (near initialization for 'syscalltbl[28]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:67:16: error: initialized field overwritten [-Werror=override-init]
> > >    67 |         [59] = "oldolduname",
> > >       |                ^~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:67:16: note: (near initialization for 'syscalltbl[59]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:76:16: error: initialized field overwritten [-Werror=override-init]
> > >    76 |         [67] = "sigaction",
> > >       |                ^~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:76:16: note: (near initialization for 'syscalltbl[67]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:82:16: error: initialized field overwritten [-Werror=override-init]
> > >    82 |         [72] = "sigsuspend",
> > >       |                ^~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:82:16: note: (near initialization for 'syscalltbl[72]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:84:16: error: initialized field overwritten [-Werror=override-init]
> > >    84 |         [73] = "sigpending",
> > >       |                ^~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:84:16: note: (near initialization for 'syscalltbl[73]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:88:16: error: initialized field overwritten [-Werror=override-init]
> > >    88 |         [76] = "getrlimit",
> > >       |                ^~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:88:16: note: (near initialization for 'syscalltbl[76]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:95:16: error: initialized field overwritten [-Werror=override-init]
> > >    95 |         [82] = "select",
> > >       |                ^~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:95:16: note: (near initialization for 'syscalltbl[82]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:98:16: error: initialized field overwritten [-Werror=override-init]
> > >    98 |         [84] = "oldlstat",
> > >       |                ^~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:98:16: note: (near initialization for 'syscalltbl[84]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:104:16: error: initialized field overwritten [-Werror=override-init]
> > >   104 |         [89] = "readdir",
> > >       |                ^~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:104:16: note: (near initialization for 'syscalltbl[89]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:125:17: error: initialized field overwritten [-Werror=override-init]
> > >   125 |         [109] = "olduname",
> > >       |                 ^~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:125:17: note: (near initialization for 'syscalltbl[109]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:136:17: error: initialized field overwritten [-Werror=override-init]
> > >   136 |         [119] = "sigreturn",
> > >       |                 ^~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:136:17: note: (near initialization for 'syscalltbl[119]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:142:17: error: initialized field overwritten [-Werror=override-init]
> > >   142 |         [124] = "adjtimex",
> > >       |                 ^~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:142:17: note: (near initialization for 'syscalltbl[124]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:145:17: error: initialized field overwritten [-Werror=override-init]
> > >   145 |         [126] = "sigprocmask",
> > >       |                 ^~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:145:17: note: (near initialization for 'syscalltbl[126]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:156:17: error: initialized field overwritten [-Werror=override-init]
> > >   156 |         [136] = "personality",
> > >       |                 ^~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:156:17: note: (near initialization for 'syscalltbl[136]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:182:17: error: initialized field overwritten [-Werror=override-init]
> > >   182 |         [161] = "sched_rr_get_interval",
> > >       |                 ^~~~~~~~~~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:182:17: note: (near initialization for 'syscalltbl[161]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:184:17: error: initialized field overwritten [-Werror=override-init]
> > >   184 |         [162] = "nanosleep",
> > >       |                 ^~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:184:17: note: (near initialization for 'syscalltbl[162]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:202:17: error: initialized field overwritten [-Werror=override-init]
> > >   202 |         [179] = "pread64",
> > >       |                 ^~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:202:17: note: (near initialization for 'syscalltbl[179]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:204:17: error: initialized field overwritten [-Werror=override-init]
> > >   204 |         [180] = "pwrite64",
> > >       |                 ^~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:204:17: note: (near initialization for 'syscalltbl[180]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:211:17: error: initialized field overwritten [-Werror=override-init]
> > >   211 |         [186] = "sendfile",
> > >       |                 ^~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:211:17: note: (near initialization for 'syscalltbl[186]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:217:17: error: initialized field overwritten [-Werror=override-init]
> > >   217 |         [191] = "readahead",
> > >       |                 ^~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:217:17: note: (near initialization for 'syscalltbl[191]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:241:17: error: initialized field overwritten [-Werror=override-init]
> > >   241 |         [221] = "futex",
> > >       |                 ^~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:241:17: note: (near initialization for 'syscalltbl[221]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:248:17: error: initialized field overwritten [-Werror=override-init]
> > >   248 |         [229] = "io_getevents",
> > >       |                 ^~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:248:17: note: (near initialization for 'syscalltbl[229]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:253:17: error: initialized field overwritten [-Werror=override-init]
> > >   253 |         [233] = "fadvise64",
> > >       |                 ^~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:253:17: note: (near initialization for 'syscalltbl[233]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:262:17: error: initialized field overwritten [-Werror=override-init]
> > >   262 |         [241] = "timer_settime",
> > >       |                 ^~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:262:17: note: (near initialization for 'syscalltbl[241]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:264:17: error: initialized field overwritten [-Werror=override-init]
> > >   264 |         [242] = "timer_gettime",
> > >       |                 ^~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:264:17: note: (near initialization for 'syscalltbl[242]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:268:17: error: initialized field overwritten [-Werror=override-init]
> > >   268 |         [245] = "clock_settime",
> > >       |                 ^~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:268:17: note: (near initialization for 'syscalltbl[245]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:270:17: error: initialized field overwritten [-Werror=override-init]
> > >   270 |         [246] = "clock_gettime",
> > >       |                 ^~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:270:17: note: (near initialization for 'syscalltbl[246]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:272:17: error: initialized field overwritten [-Werror=override-init]
> > >   272 |         [247] = "clock_getres",
> > >       |                 ^~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:272:17: note: (near initialization for 'syscalltbl[247]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:274:17: error: initialized field overwritten [-Werror=override-init]
> > >   274 |         [248] = "clock_nanosleep",
> > >       |                 ^~~~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:274:17: note: (near initialization for 'syscalltbl[248]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:278:17: error: initialized field overwritten [-Werror=override-init]
> > >   278 |         [251] = "utimes",
> > >       |                 ^~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:278:17: note: (near initialization for 'syscalltbl[251]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:284:17: error: initialized field overwritten [-Werror=override-init]
> > >   284 |         [256] = "sys_debug_setcontext",
> > >       |                 ^~~~~~~~~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:284:17: note: (near initialization for 'syscalltbl[256]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:318:17: error: initialized field overwritten [-Werror=override-init]
> > >   318 |         [290] = "utimesat",
> > >       |                 ^~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:318:17: note: (near initialization for 'syscalltbl[290]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:320:17: error: initialized field overwritten [-Werror=override-init]
> > >   320 |         [291] = "newfstatat",
> > >       |                 ^~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:320:17: note: (near initialization for 'syscalltbl[291]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:334:17: error: initialized field overwritten [-Werror=override-init]
> > >   334 |         [304] = "utimensat",
> > >       |                 ^~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:334:17: note: (near initialization for 'syscalltbl[304]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:339:17: error: initialized field overwritten [-Werror=override-init]
> > >   339 |         [308] = "sync_file_range2",
> > >       |                 ^~~~~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:339:17: note: (near initialization for 'syscalltbl[308]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:343:17: error: initialized field overwritten [-Werror=override-init]
> > >   343 |         [311] = "timerfd_settime",
> > >       |                 ^~~~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:343:17: note: (near initialization for 'syscalltbl[311]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:345:17: error: initialized field overwritten [-Werror=override-init]
> > >   345 |         [312] = "timerfd_gettime",
> > >       |                 ^~~~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:345:17: note: (near initialization for 'syscalltbl[312]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:377:17: error: initialized field overwritten [-Werror=override-init]
> > >   377 |         [343] = "recvmmsg",
> > >       |                 ^~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:377:17: note: (near initialization for 'syscalltbl[343]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:382:17: error: initialized field overwritten [-Werror=override-init]
> > >   382 |         [347] = "clock_adjtime",
> > >       |                 ^~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:382:17: note: (near initialization for 'syscalltbl[347]')
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:399:17: error: initialized field overwritten [-Werror=override-init]
> > >   399 |         [363] = "switch_endian",
> > >       |                 ^~~~~~~~~~~~~~~
> > > /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:399:17: note: (near initialization for 'syscalltbl[363]')
> > > cc1: all warnings being treated as errors
> > > 
> > > Presumably caused by commit
> > > 
> > >   7eca67cf3dab ("perf tools powerpc: Use generic syscall table scripts")
> > > 
> > > This is a native powerpc build of perf on a little endian host.
> > 
> > Thank you for reporting! I see that these headers for powerpc are
> > generating duplicate entries. This is due to me mistakenly setting the
> > abis for the syscall headers for powerpc to be spu and nospu, causing
> > conflicts. It looks like for the uapi, only nospu needs to be exposed. I
> > will send a patch to fix that.
> 
> Right, we need to make the syscall tables for all arches to be built in
> all arches, meaning we can translate from syscall numbers found in
> tracepoints collected in one arch and present in a perf.data file while
> doing analysis on another machine of a different architecture, just like
> we do with errno numbers.

Oh that's a good point. tools/perf/util/syscalltbl.c will need to be
reworked to allow non-native archs (just as a note, the native-only
nature was not something that was introduced in this series!).

- Charlie

> 
> This way we would notice these kinds of problems immediatelly while
> building anywhere.
> 
> I squashed your fix as requested and will force push the result.
> 
> - Arnaldo
>  
> > - Charlie
> > 
> > > 
> > > I have used the perf tree from next-20250109 for today.
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> > 

