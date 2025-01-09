Return-Path: <linux-next+bounces-5122-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E5EA0838D
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 00:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73B873A968F
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 23:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53552205AB4;
	Thu,  9 Jan 2025 23:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ETur7WcH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C50F205E37
	for <linux-next@vger.kernel.org>; Thu,  9 Jan 2025 23:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736465509; cv=none; b=oblNO8NIeCzPbySIWPNtjf2BLEx676k4SMuIkQeb1nMAEFiIJlTE2kO8RIiTmqRs+LGzKltUaknxgS+DBq63p0Gud5nKjoNQz/7jLHeRwia3j9fIVxJ//jscLUfgfLsk2WRTorqU6pCM3dQWDd7sioBjMkST2Ac6bAAEPTeCidY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736465509; c=relaxed/simple;
	bh=PLtIMml5ATdSKu0MzeFvdal072XuZwmiEpc7VBVjlWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfmOC7TgAG16IW/AC76UExB+Llrdqak9GIcjwv6hf/NJnNhMU0MterRENzfsfudtXTNBqUvZQ4IwzK/2p4q2uXLAD38u7Q8oXkYp1Llrfp0zvNa9ERzA12RCUJcWPwkkK4O5ehSoXJPH3zGDPuxp0QoKbOrM2pN6i0koModTJfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ETur7WcH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2163b0c09afso25206285ad.0
        for <linux-next@vger.kernel.org>; Thu, 09 Jan 2025 15:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736465506; x=1737070306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WRh5zWpbMC9x72/WLUS0zBm1osMc9d+HX4lkXBsj7j8=;
        b=ETur7WcHJok0P/+Vanwrdn/0q2cfZVR6r/RWC5JctTLGcgsnVYrYqHo2o3b6W2r7B+
         2Q5vJJP6maBCd6vTSvseTaz/6Ch6sHeukrdEPxUeiCL3UnwEvnzrTOcqoLt7CzerBqbD
         Qx/B8wXes4laHtYtk1sov5VhNwidllFJnhT9jRkek7hO/KjcRKU/2mRCKcNyoUc5Z8rt
         FEV6xjdrdc/P4hXLmXoTlP3fRtZr2SzEA3TESFjAgCwwTGmCjolw4T935J1zBmFBX254
         kU7Nht/qdv0wp/ck8qWp/j1G7DgNItd/z8Pfpv7sQp6yQ3mQivGCJnI+O4MVhxG7yl5P
         0uVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736465506; x=1737070306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRh5zWpbMC9x72/WLUS0zBm1osMc9d+HX4lkXBsj7j8=;
        b=LyLDqpUIKj7meM+L6yYT4UazbW+tr3YdVwDhDZOFnu9hHpLOdp8TEtTFlrfvu1I4tV
         tqy1qiCmz8LfAVE3Ie9Dsps6aMPm7oLhUwI+ZEtAKlEkW7jfJNNRDqrkkp2+s+52W2EG
         9upsK/ljAdMuJwBoL840+CS6Dzls6/gWSD1P6+0V4ZQSdttzqbA8X9Dy76Hit7LNzWnK
         g2BzxrLpJXLxXgwt8ldLAEHps4rGK9ZCwut25ViSlWac81QHtB7EYX6q5A99JIU/Idoh
         KZ1PDD5XWwRjtJcR9RG7k/CmM/QbAbBvB8/xfiKCpTztxiHa8t+TYfNv1AWWmeWYRmwS
         QdJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9QenPryNpIINCtxzWTonSw5Chf94DQB3yT0Cb0BUxZrXyJ63OJxxmWlAhzQae44to6TIZSloV0vf@vger.kernel.org
X-Gm-Message-State: AOJu0YxeqVUhgZ5LGZhIh7vQw9BPIA5Upc4zU2Tkic3jeB/y8palFBZc
	lLHJOO45XLIazyqAQpW0ZNxYL6wcCym/Gn1XzpDohBRK3W74PCfe1E57Ozykxho=
X-Gm-Gg: ASbGncs5XWabaMRhFeHHnoYD09HCUYTtFmC+ToUaPDT8AdWvbQq8LzLFGJHo8+51U0Y
	c7lf+JvqEeZ9qMG3YNa2kfRwTWO6zbCEBbRcnn/BQnCL9otl3r/GJl4Hn48T7+SJWmECOWGBKiF
	j9V+BRTKEE5Aw+LprIRuaaT09b6SP9Veed8m9hw+hYoQDCJE55eEIQ7IT3OyYUSJ1FBbTzsMtkL
	sj4fNq5ly8/4S3j73z8s46sWjSWS6Fw/Yn3O58oaWH/o0Te+quf
X-Google-Smtp-Source: AGHT+IGjBNbaewaclCa+7lDAHKHR7mrlTShBP/9UtS3lxaGDiekboif1KLFJpjCURWKN0moo8ZPB6A==
X-Received: by 2002:a17:902:d4ce:b0:215:e98c:c5c1 with SMTP id d9443c01a7336-21a83f5e7a7mr130770335ad.30.1736465506134;
        Thu, 09 Jan 2025 15:31:46 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm3063565ad.210.2025.01.09.15.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:31:45 -0800 (PST)
Date: Thu, 9 Jan 2025 15:31:42 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the perf tree
Message-ID: <Z4BcXhjzl066fNGe@ghost>
References: <20250110100505.78d81450@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110100505.78d81450@canb.auug.org.au>

On Fri, Jan 10, 2025 at 10:05:05AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the perf tree, today's linux-next build (native perf)
> failed like this:
> 
> In file included from tools/perf/arch/powerpc/include/syscall_table.h:5,
>                  from util/syscalltbl.c:16:
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:16:16: error: initialized field overwritten [-Werror=override-init]
>    16 |         [13] = "time",
>       |                ^~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:16:16: note: (near initialization for 'syscalltbl[13]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:22:16: error: initialized field overwritten [-Werror=override-init]
>    22 |         [18] = "oldstat",
>       |                ^~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:22:16: note: (near initialization for 'syscalltbl[18]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:27:16: error: initialized field overwritten [-Werror=override-init]
>    27 |         [22] = "umount",
>       |                ^~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:27:16: note: (near initialization for 'syscalltbl[22]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:31:16: error: initialized field overwritten [-Werror=override-init]
>    31 |         [25] = "stime",
>       |                ^~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:31:16: note: (near initialization for 'syscalltbl[25]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:35:16: error: initialized field overwritten [-Werror=override-init]
>    35 |         [28] = "oldfstat",
>       |                ^~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:35:16: note: (near initialization for 'syscalltbl[28]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:67:16: error: initialized field overwritten [-Werror=override-init]
>    67 |         [59] = "oldolduname",
>       |                ^~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:67:16: note: (near initialization for 'syscalltbl[59]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:76:16: error: initialized field overwritten [-Werror=override-init]
>    76 |         [67] = "sigaction",
>       |                ^~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:76:16: note: (near initialization for 'syscalltbl[67]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:82:16: error: initialized field overwritten [-Werror=override-init]
>    82 |         [72] = "sigsuspend",
>       |                ^~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:82:16: note: (near initialization for 'syscalltbl[72]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:84:16: error: initialized field overwritten [-Werror=override-init]
>    84 |         [73] = "sigpending",
>       |                ^~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:84:16: note: (near initialization for 'syscalltbl[73]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:88:16: error: initialized field overwritten [-Werror=override-init]
>    88 |         [76] = "getrlimit",
>       |                ^~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:88:16: note: (near initialization for 'syscalltbl[76]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:95:16: error: initialized field overwritten [-Werror=override-init]
>    95 |         [82] = "select",
>       |                ^~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:95:16: note: (near initialization for 'syscalltbl[82]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:98:16: error: initialized field overwritten [-Werror=override-init]
>    98 |         [84] = "oldlstat",
>       |                ^~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:98:16: note: (near initialization for 'syscalltbl[84]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:104:16: error: initialized field overwritten [-Werror=override-init]
>   104 |         [89] = "readdir",
>       |                ^~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:104:16: note: (near initialization for 'syscalltbl[89]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:125:17: error: initialized field overwritten [-Werror=override-init]
>   125 |         [109] = "olduname",
>       |                 ^~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:125:17: note: (near initialization for 'syscalltbl[109]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:136:17: error: initialized field overwritten [-Werror=override-init]
>   136 |         [119] = "sigreturn",
>       |                 ^~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:136:17: note: (near initialization for 'syscalltbl[119]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:142:17: error: initialized field overwritten [-Werror=override-init]
>   142 |         [124] = "adjtimex",
>       |                 ^~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:142:17: note: (near initialization for 'syscalltbl[124]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:145:17: error: initialized field overwritten [-Werror=override-init]
>   145 |         [126] = "sigprocmask",
>       |                 ^~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:145:17: note: (near initialization for 'syscalltbl[126]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:156:17: error: initialized field overwritten [-Werror=override-init]
>   156 |         [136] = "personality",
>       |                 ^~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:156:17: note: (near initialization for 'syscalltbl[136]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:182:17: error: initialized field overwritten [-Werror=override-init]
>   182 |         [161] = "sched_rr_get_interval",
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:182:17: note: (near initialization for 'syscalltbl[161]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:184:17: error: initialized field overwritten [-Werror=override-init]
>   184 |         [162] = "nanosleep",
>       |                 ^~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:184:17: note: (near initialization for 'syscalltbl[162]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:202:17: error: initialized field overwritten [-Werror=override-init]
>   202 |         [179] = "pread64",
>       |                 ^~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:202:17: note: (near initialization for 'syscalltbl[179]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:204:17: error: initialized field overwritten [-Werror=override-init]
>   204 |         [180] = "pwrite64",
>       |                 ^~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:204:17: note: (near initialization for 'syscalltbl[180]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:211:17: error: initialized field overwritten [-Werror=override-init]
>   211 |         [186] = "sendfile",
>       |                 ^~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:211:17: note: (near initialization for 'syscalltbl[186]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:217:17: error: initialized field overwritten [-Werror=override-init]
>   217 |         [191] = "readahead",
>       |                 ^~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:217:17: note: (near initialization for 'syscalltbl[191]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:241:17: error: initialized field overwritten [-Werror=override-init]
>   241 |         [221] = "futex",
>       |                 ^~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:241:17: note: (near initialization for 'syscalltbl[221]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:248:17: error: initialized field overwritten [-Werror=override-init]
>   248 |         [229] = "io_getevents",
>       |                 ^~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:248:17: note: (near initialization for 'syscalltbl[229]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:253:17: error: initialized field overwritten [-Werror=override-init]
>   253 |         [233] = "fadvise64",
>       |                 ^~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:253:17: note: (near initialization for 'syscalltbl[233]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:262:17: error: initialized field overwritten [-Werror=override-init]
>   262 |         [241] = "timer_settime",
>       |                 ^~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:262:17: note: (near initialization for 'syscalltbl[241]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:264:17: error: initialized field overwritten [-Werror=override-init]
>   264 |         [242] = "timer_gettime",
>       |                 ^~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:264:17: note: (near initialization for 'syscalltbl[242]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:268:17: error: initialized field overwritten [-Werror=override-init]
>   268 |         [245] = "clock_settime",
>       |                 ^~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:268:17: note: (near initialization for 'syscalltbl[245]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:270:17: error: initialized field overwritten [-Werror=override-init]
>   270 |         [246] = "clock_gettime",
>       |                 ^~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:270:17: note: (near initialization for 'syscalltbl[246]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:272:17: error: initialized field overwritten [-Werror=override-init]
>   272 |         [247] = "clock_getres",
>       |                 ^~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:272:17: note: (near initialization for 'syscalltbl[247]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:274:17: error: initialized field overwritten [-Werror=override-init]
>   274 |         [248] = "clock_nanosleep",
>       |                 ^~~~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:274:17: note: (near initialization for 'syscalltbl[248]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:278:17: error: initialized field overwritten [-Werror=override-init]
>   278 |         [251] = "utimes",
>       |                 ^~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:278:17: note: (near initialization for 'syscalltbl[251]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:284:17: error: initialized field overwritten [-Werror=override-init]
>   284 |         [256] = "sys_debug_setcontext",
>       |                 ^~~~~~~~~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:284:17: note: (near initialization for 'syscalltbl[256]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:318:17: error: initialized field overwritten [-Werror=override-init]
>   318 |         [290] = "utimesat",
>       |                 ^~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:318:17: note: (near initialization for 'syscalltbl[290]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:320:17: error: initialized field overwritten [-Werror=override-init]
>   320 |         [291] = "newfstatat",
>       |                 ^~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:320:17: note: (near initialization for 'syscalltbl[291]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:334:17: error: initialized field overwritten [-Werror=override-init]
>   334 |         [304] = "utimensat",
>       |                 ^~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:334:17: note: (near initialization for 'syscalltbl[304]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:339:17: error: initialized field overwritten [-Werror=override-init]
>   339 |         [308] = "sync_file_range2",
>       |                 ^~~~~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:339:17: note: (near initialization for 'syscalltbl[308]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:343:17: error: initialized field overwritten [-Werror=override-init]
>   343 |         [311] = "timerfd_settime",
>       |                 ^~~~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:343:17: note: (near initialization for 'syscalltbl[311]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:345:17: error: initialized field overwritten [-Werror=override-init]
>   345 |         [312] = "timerfd_gettime",
>       |                 ^~~~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:345:17: note: (near initialization for 'syscalltbl[312]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:377:17: error: initialized field overwritten [-Werror=override-init]
>   377 |         [343] = "recvmmsg",
>       |                 ^~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:377:17: note: (near initialization for 'syscalltbl[343]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:382:17: error: initialized field overwritten [-Werror=override-init]
>   382 |         [347] = "clock_adjtime",
>       |                 ^~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:382:17: note: (near initialization for 'syscalltbl[347]')
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:399:17: error: initialized field overwritten [-Werror=override-init]
>   399 |         [363] = "switch_endian",
>       |                 ^~~~~~~~~~~~~~~
> /home/sfr/next/perf/arch/powerpc/include/generated/asm/syscalls_64.h:399:17: note: (near initialization for 'syscalltbl[363]')
> cc1: all warnings being treated as errors
> 
> Presumably caused by commit
> 
>   7eca67cf3dab ("perf tools powerpc: Use generic syscall table scripts")
> 
> This is a native powerpc build of perf on a little endian host.

Thank you for reporting! I see that these headers for powerpc are
generating duplicate entries. This is due to me mistakenly setting the
abis for the syscall headers for powerpc to be spu and nospu, causing
conflicts. It looks like for the uapi, only nospu needs to be exposed. I
will send a patch to fix that.

- Charlie

> 
> I have used the perf tree from next-20250109 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell



