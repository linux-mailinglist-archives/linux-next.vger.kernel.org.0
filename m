Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD38207198
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 12:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388028AbgFXKze (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 06:55:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:35280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727100AbgFXKzd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Jun 2020 06:55:33 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B92EA2084D;
        Wed, 24 Jun 2020 10:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592996132;
        bh=nSECj9C8zuSXkIqMFZ5C/ZsscNsZzqwo0LwvBlsTjG0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OHC6H/V2p2QfoaxvZlrvePG1axfxm0gguyFK2nFzFHuL2KPWlDiTyk/7Cs1NFh3fl
         Qv89fTvWxnsSCwlmNlo4IifCe/S+kvUxQ99tjEnJG7lDjl+DaoWlF/0tmrXwO6RCVW
         uu36Vf1fGT2Fj/xJgWNrXCAx0X571f+ftQR8i2bE=
Date:   Wed, 24 Jun 2020 11:55:28 +0100
From:   Will Deacon <will@kernel.org>
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jun 24 [build failure on arm64]
Message-ID: <20200624105528.GB6134@willie-the-truck>
References: <20200624165323.3dffcde5@canb.auug.org.au>
 <7a7e31a8-9a7b-2428-ad83-2264f20bdc2d@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a7e31a8-9a7b-2428-ad83-2264f20bdc2d@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 24, 2020 at 05:08:56PM +0800, Shaokun Zhang wrote:
> +Will Deacon,
> 
> Hi Will,
> 
> There's a build failure on arm64:
> 
>   CALL    scripts/atomic/check-atomics.sh
>   CALL    scripts/checksyscalls.sh
>   LD      arch/arm64/kernel/vdso/vdso.so.dbg
> ld: unrecognized option '--no-eh-frame-hdr'
> ld: use the --help option for usage information
> arch/arm64/kernel/vdso/Makefile:64: recipe for target
> 'arch/arm64/kernel/vdso/vdso.so.dbg' failed
> make[1]: *** [arch/arm64/kernel/vdso/vdso.so.dbg] Error 1
> arch/arm64/Makefile:175: recipe for target 'vdso_prepare' failed
> make: *** [vdso_prepare] Error 2
> 
> GCC version is followed:
> gcc (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609
> 
> It seems caused by
> 87676cfca141 arm64: vdso: Disable dwarf unwinding through the sigreturn
> trampoline

Urgh, binutils quality strikes again. If you're able to reproduce locally,
can you try the diff below, please? All the linkers I have kicking around
seem to support --no-eh-frame-hdr.

Will

--->8

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 1e5a940532da..97d3d3632093 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -23,8 +23,9 @@ btildflags-$(CONFIG_ARM64_BTI_KERNEL) += -z force-bti
 # potential future proofing if we end up with internal calls to the exported
 # routines, as x86 does (see 6f121e548f83 ("x86, vdso: Reimplement vdso.so
 # preparation in build-time C")).
-ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv \
-               -Bsymbolic --no-eh-frame-hdr --build-id -n $(btildflags-y) -T
+ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv       \
+            -Bsymbolic $(call ld-option, --no-eh-frame-hdr) --build-id -n      \
+            $(btildflags-y) -T
 
 ccflags-y := -fno-common -fno-builtin -fno-stack-protector -ffixed-x18
 ccflags-y += -DDISABLE_BRANCH_PROFILING

