Return-Path: <linux-next+bounces-463-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8908191B0
	for <lists+linux-next@lfdr.de>; Tue, 19 Dec 2023 21:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72EE81F25327
	for <lists+linux-next@lfdr.de>; Tue, 19 Dec 2023 20:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B354039ADF;
	Tue, 19 Dec 2023 20:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IDX/Pr7I"
X-Original-To: linux-next@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761013986C
	for <linux-next@vger.kernel.org>; Tue, 19 Dec 2023 20:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 19 Dec 2023 15:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1703018905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJ1ocseWQHxPvBXfq20mMbpwj8SclcUvB29LRUEj++0=;
	b=IDX/Pr7IzCItPsNkUeIgy08NcNCT0NSt2I5hcm7UuR9omz145qOoLRTAF127gw36Ezwtkx
	jLcuRRvicIj1G0uth6yy8fCEE4HhOfW8sZSjeAq9IEoOJ0w7joWHdLEs3nugsxvTFIRjx6
	ZRbOl9KBa1gAe+HgKGedSwdJVm+Iop4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: Re: arch/parisc/mm/init.c:534:29: error: invalid application of
 'sizeof' to incomplete type 'struct shmid64_ds'
Message-ID: <20231219204821.vok7nch6knn2bhgo@moria.home.lan>
References: <CA+G9fYvq+wdDhTjR2YkULF-_-nQNPGzCeOON-08EbVyidj-J6w@mail.gmail.com>
 <CADYN=9+0stxkNLkqcbodZD879r8DACT1M-3QyZrt4JsrAi0E1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADYN=9+0stxkNLkqcbodZD879r8DACT1M-3QyZrt4JsrAi0E1Q@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Dec 19, 2023 at 08:19:43PM +0100, Anders Roxell wrote:
> On Tue, 19 Dec 2023 at 16:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > Following build failures noticed on parisc on Linux next-20231219 tag.
> >
> > parisc:
> >   build:
> >     * gcc-11-defconfig - Failed
> >     * gcc-11-allnoconfig - Failed
> >     * gcc-11-tinyconfig - Failed
> >
> > Build error:
> > arch/parisc/mm/init.c: In function 'mem_init':
> > arch/parisc/mm/init.c:534:29: error: invalid application of 'sizeof'
> > to incomplete type 'struct shmid64_ds'
> >   534 |         BUILD_BUG_ON(sizeof(struct shmid64_ds) != 104);
> >       |                             ^~~~~~
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Steps to reproduce:
> >
> >  tuxmake --runtime podman --target-arch parisc --toolchain gcc-11
> > --kconfig defconfig
> 
> A bisection showed this patch as the faulty 1e462c05f65b ("shm: Slim
> down dependencies")
> Revering this patch made it build.

Thanks, I've applied the following fixup:
commit ab6400d24d17e5248cbb0db37a56745554e6b6a5
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Tue Dec 19 15:47:45 2023 -0500

    fixup! shm: Slim down dependencies

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index a2a3e89f2d9a..f876af56e13f 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -33,6 +33,7 @@
 #include <asm/msgbuf.h>
 #include <asm/sparsemem.h>
 #include <asm/asm-offsets.h>
+#include <asm/shmbuf.h>
 
 extern int  data_start;
 extern void parisc_kernel_start(void);	/* Kernel entry point in head.S */

