Return-Path: <linux-next+bounces-2017-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686F68ADFA2
	for <lists+linux-next@lfdr.de>; Tue, 23 Apr 2024 10:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21122288356
	for <lists+linux-next@lfdr.de>; Tue, 23 Apr 2024 08:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A41651016;
	Tue, 23 Apr 2024 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X08769yh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E994D58E
	for <linux-next@vger.kernel.org>; Tue, 23 Apr 2024 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713860625; cv=none; b=rmKFW5g7D88E4t7Xv80pL9aRMEloF/WY60wFz/FrN7kWjOtc0oc52M4mpRGz5TgDGK4JHmEsp8eMfL0v5f6qBedIoAclHgaAjAYcpv42VhHayyxCzef0V3pyoFXIayDhO7ZCdwkai49ZAAS2Qt+w8+ezC8ULg7QyR9AuG+hNvfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713860625; c=relaxed/simple;
	bh=Rww7TxuzQROoyZ+YFLTo/PMMJ6PyQ1PTF3vLyCFRV18=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Qffud0/MLnYQ4xWkGC4FBLmHeFTtUWMMLvOkomKhbcHi+IJUHGiC1G6qttnLjHKJ1Z0fR4UxC7jGylMjt57vzyxVdgd2zVPcgLAmFR/DpfoPvCfFUmxOXXelk5yx2s4cZDF5Mnx1ViNh+dXGqQ4YZDMYrR/eysVh+nn/D4YSqkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X08769yh; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7eb9cb7b657so1543730241.1
        for <linux-next@vger.kernel.org>; Tue, 23 Apr 2024 01:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713860622; x=1714465422; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hvJAvOkdB3nYgeq28VFan9zcQ7TGjXgnfVwBWPnAFoU=;
        b=X08769yhmUijkihDFEUaufF6DQiWlJhzFzKo20S7e6YoGeFUJwvdLfHl/53VV7Px9J
         LS5sQsFhcBtOcu4c0paC2YV6qDQEP/Fp5IeNMynyuZZ8IVq9F2wqTRuivWGBuXn3Mi0L
         l/JrUaaAn3dDhe6iKipAfNw7tKkJvTppfo5MHYqIF6RA6xYioxHQ0tqnjBdTfz3tlcmm
         6/souTIbVAx1L15vtUHFQSgj9+1eCWTgSLcrJGnri2wvd2C4wp0kUdIxacjDGcJ7TmcU
         LVbvgWgIOhYJ/5p/oWVMTc5l88h8AMmcWw8hSowOEyQ9usI/UmuoBtrIh6sqzw7Koo4O
         EadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713860622; x=1714465422;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvJAvOkdB3nYgeq28VFan9zcQ7TGjXgnfVwBWPnAFoU=;
        b=wEPjnJtXs5YUYtexHe0Ga3ab/bGglodFTJqqaJ8L8Mp/a5VNF/Aoe0PjTlP5r3BmzW
         K1cxZirY004JVmmkQVXYliU9cISXmHQGnH3r70ZLr+KRZeLradl5evm9Whx2uBUetbMp
         eqrsONMN5v9coEmaWWciNGpi6d/oMsu2jmNmlpuXtvl+7dVFeloAiBI3tHSR9G8suIAG
         VcbZpz5j2akNajXmsQ6QuG0JyIzJ27h2MlXSq1ybY96Nb6mkWLGWBrgQ97NHXcYsxEWN
         eYi+TCIMrhR5IqYL0WCnOVaFupL+iJcY0II36RLd7OMo8fl6elI9b+xiDcz0WSmPnFVH
         LzOQ==
X-Gm-Message-State: AOJu0YzphmgF2WgU+6fdKvg8dXbj6MfMOYmtf1qqJS3jeDFBl8yGeoym
	bjA3eIBieoN+PKp/IoJgRqetdWnX4F0rvm98jYU5KiH2tUS/0BJXfiq0GBJP57mSiwG8an19GZ3
	z+tPfR+KC3qfxgEhzNvBc/MXiB1/kAPB/7khw5TJOSaqJT8PYoZ0=
X-Google-Smtp-Source: AGHT+IETsHlsYMSQzlW7E1YI7QU+5izexDZQYyZejyzwsbgVBBsE69lGVvchijeB+ICSBsYB3Y17A9M/NOChyEX3VXA=
X-Received: by 2002:a67:eed3:0:b0:47b:ebf3:7c6d with SMTP id
 o19-20020a67eed3000000b0047bebf37c6dmr8185544vsp.27.1713860622320; Tue, 23
 Apr 2024 01:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 Apr 2024 13:53:30 +0530
Message-ID: <CA+G9fYuu0SApq057AMQmOiUC1upt_akKYfhu4BR+2BDkMoqs=w@mail.gmail.com>
Subject: mm/slub.c:3330:28: error: implicit declaration of function
 'node_nr_objs'; did you mean 'node_nr_slabs'?
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arm and mips builds failed due to following warnings / errors with
gcc-13 / gcc-12 and clang-17 on the Linux next-20240423 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

arm:
 - imx_v6_v7_defconfig
 - orion5x_defconfig

mips:
 - defconfig
 - ath79_defconfig
 - bcm63xx_defconfig

In file included from include/linux/export.h:5,
                 from include/linux/linkage.h:7,
                 from arch/arm/include/asm/bug.h:5,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/mm.h:6,
                 from mm/slub.c:13:
mm/slub.c: In function 'count_partial_free_approx':
mm/slub.c:3330:28: error: implicit declaration of function
'node_nr_objs'; did you mean 'node_nr_slabs'?
[-Werror=implicit-function-declaration]
 3330 |                 x = min(x, node_nr_objs(n));
      |                            ^~~~~~~~~~~~
include/linux/compiler.h:286:55: note: in definition of macro '__is_constexpr'
  286 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) *
0l)) : (int *)8)))
      |                                                       ^
include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
   85 | #define min(x, y)       __careful_cmp(min, x, y)
      |                         ^~~~~~~~~~~~~
mm/slub.c:3330:21: note: in expansion of macro 'min'
 3330 |                 x = min(x, node_nr_objs(n));
      |                     ^~~
In file included from include/linux/init.h:5,
                 from include/linux/printk.h:6,
                 from include/asm-generic/bug.h:22,
                 from arch/arm/include/asm/bug.h:60:
include/linux/build_bug.h:78:41: error: static assertion failed:
"min(x, node_nr_objs(n)) signedness error, fix types or consider
umin() before min_t()"
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                         ^~~~~~~~~~~~~~
include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
   77 | #define static_assert(expr, ...) __static_assert(expr,
##__VA_ARGS__, #expr)
      |                                  ^~~~~~~~~~~~~~~
include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
   51 |         static_assert(__types_ok(x, y),                 \
      |         ^~~~~~~~~~~~~
include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
   58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x),
__UNIQUE_ID(__y)))
      |                 ^~~~~~~~~~
include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
   85 | #define min(x, y)       __careful_cmp(min, x, y)
      |                         ^~~~~~~~~~~~~
mm/slub.c:3330:21: note: in expansion of macro 'min'
 3330 |                 x = min(x, node_nr_objs(n));
      |                     ^~~
mm/slub.c: At top level:
mm/slub.c:3301:22: warning: 'count_partial_free_approx' defined but
not used [-Wunused-function]
 3301 | static unsigned long count_partial_free_approx(struct
kmem_cache_node *n)
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Steps to reproduce:
---
# tuxmake --runtime podman --target-arch arm --toolchain gcc-13
--kconfig orion5x_defconfig


Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fUaQMPe7cZ5qJJOt50avspw7bH/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240423/testrun/23561861/suite/build/test/gcc-13-orion5x_defconfig/details/

--
Linaro LKFT
https://lkft.linaro.org

