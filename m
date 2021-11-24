Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1B045D0D8
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 00:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245432AbhKXXKp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 18:10:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242988AbhKXXKo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 18:10:44 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808CFC06173E;
        Wed, 24 Nov 2021 15:07:34 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzxVN0Pm9z4xYy;
        Thu, 25 Nov 2021 10:07:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1637795249;
        bh=7pRov1sIZwpusxuBiujaI38cmBz+hmwQh8SiJxJ6V4A=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=BTvkGcA6sRe76Gy1isc7w2/xkrLYnxKe2cqBq0GZkmo3MfAC6f/yy2152OFmF8hfz
         ERp6yUMEqynlekax8tGND0PUYTdPjimS7umZwMJD2eEZzHm6xM0TCeCZystvsXoEp/
         dOGb08CEJi0M0EKZ9GRPnCe+PY71tEutUo8DfZqK0BjfkRucFJoV5j9uqB76ejU77I
         tGRBKn0ErgMMddWkhbwZK7yiSBERddMcgmePyxpK0lviq3ImeJm2W3PY0TXuDBx5FS
         M0XMRHP0ACm+GBzFbMCEaC7auxJI5gaumq9uoq16TBuJyv1mTCSEe+pFI8yY/AowXU
         AQXHNLAwb3lmA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@collabora.com>,
        linux-kernel@vger.kernel.org, arnd@arndb.de, geert@linux-m68k.org,
        monstr@monstr.eu, ysato@users.sourceforge.jp, dalias@libc.org,
        davem@davemloft.net, chris@zankel.net, jcmvbkbc@gmail.com,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org
Cc:     akpm@linux-foundation.org, andrealmeid@collabora.com,
        bigeasy@linutronix.de, boqun.feng@gmail.com,
        linux-next@vger.kernel.org, lkft-triage@lists.linaro.org,
        longman@redhat.com, minchan@kernel.org, mingo@redhat.com,
        naresh.kamboju@linaro.org, peterz@infradead.org, rob@landley.net,
        senozhatsky@chromium.org, sfr@canb.auug.org.au,
        umgwanakikbuti@gmail.com, will@kernel.org
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
In-Reply-To: <20211124132112.11641-1-andrealmeid@collabora.com>
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
Date:   Thu, 25 Nov 2021 10:07:23 +1100
Message-ID: <87lf1dp2z8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Andr=C3=A9 Almeida <andrealmeid@collabora.com> writes:
> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kern=
el/syscalls/syscall.tbl
> index 7bef917cc84e..15109af9d075 100644
> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
> @@ -528,3 +528,4 @@
>  446	common	landlock_restrict_self		sys_landlock_restrict_self
>  # 447 reserved for memfd_secret
>  448	common	process_mrelease		sys_process_mrelease
> +449	common  futex_waitv                     sys_futex_waitv

Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

The selftest doesn't build with old headers, I needed this:

diff --git a/tools/testing/selftests/futex/include/futex2test.h b/tools/tes=
ting/selftests/futex/include/futex2test.h
index 9d305520e849..e6422321e9d0 100644
--- a/tools/testing/selftests/futex/include/futex2test.h
+++ b/tools/testing/selftests/futex/include/futex2test.h
@@ -8,6 +8,10 @@

 #define u64_to_ptr(x) ((void *)(uintptr_t)(x))

+#ifndef __NR_futex_waitv
+#define __NR_futex_waitv 449
+#endif
+
 /**
  * futex_waitv - Wait at multiple futexes, wake on any
  * @waiters:    Array of waiters


cheers
