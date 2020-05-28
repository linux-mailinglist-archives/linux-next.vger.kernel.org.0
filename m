Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746E81E6A3F
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 21:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406266AbgE1TTi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 15:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405596AbgE1TTh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 15:19:37 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAD3C08C5C6
        for <linux-next@vger.kernel.org>; Thu, 28 May 2020 12:19:37 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id q16so11990633plr.2
        for <linux-next@vger.kernel.org>; Thu, 28 May 2020 12:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=mmM2VvrmQ5V/fdjPQ7PkRywpyNOwhjbBRHuXd3YqIPA=;
        b=cxBbzS5fnQIpBOKLY+4r8oqienqmA//ahqblebZBOQKpKuoKO/Oa9nG3f5edYuZDDh
         ZL47P9ZZn/s65GUm1SdlokHyt05vcsa4mVVrf+JF3yKsKjmoqaCGINAjfi2QmjgjL8n6
         KjDbGedCt7usLAuCyAZewKHC5f3nF4sQQL4fmh5z1HDRvyBf36efSZrXUZaQMlwJCG1V
         YDNW4UNylLMNdCKXtTpCU/bwWuAoXhs3AzvhOBwmEfb/Fr/HYcwjMJmIVB8u7Dt8+gQC
         mNctIxFS9NxQg8PGKIwBYKgkTcb8HC7oA/kL88AWGP37LHToh7ftiE1r/aDwI5pcNXhH
         Sh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=mmM2VvrmQ5V/fdjPQ7PkRywpyNOwhjbBRHuXd3YqIPA=;
        b=Ay8BTfIbnGzt7mhoPiPG97y0B6umLjNj15bBgBNWfB8ucyREnjeFvmM3Tg1niAADxB
         M4KU5Yq0MJ9nSUZXsyEpmcrJ9u5Bx4IWT2MqT5PfIx1KcxfFYdKVJWASkk0b0ZeBGOk7
         cZbxORc47e05RDLjwYbX1kF6pS5YoMim16XthuiYFBM/HmLe4UcF41OA2FEh7bCZYjmD
         GjCrUgWVqVbajtORlbS6lLV1ZTUDjbAPoJtYeG+VxGxP82dzF9/rEkLbM5wPeK7QgtLx
         pgXiBh4kM5cLPyK8pUzaZ9U7wfJRdb3zGYEbmoQvFTAAMZ2QIeA5MTfwn9SuLFphAzAC
         HILQ==
X-Gm-Message-State: AOAM533xixjESfvatJ73fk2oZNzfLoldMr8PCML9qheer9bPB4mE7LCf
        wCZLq4vuFKhxq005OSti87DleQ==
X-Google-Smtp-Source: ABdhPJwBcV5uxi0C9jMGFrJiTcKMZ9y+lYUf5miQuFG/Sel6U7MNBhPMAq0i/mfT5dafO6yexVdT7Q==
X-Received: by 2002:a17:90b:3648:: with SMTP id nh8mr5030761pjb.14.1590693576227;
        Thu, 28 May 2020 12:19:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id v17sm5613275pfc.190.2020.05.28.12.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 12:19:35 -0700 (PDT)
Date:   Thu, 28 May 2020 12:19:35 -0700 (PDT)
X-Google-Original-Date: Thu, 28 May 2020 10:26:04 PDT (-0700)
Subject:     Re: linux-next: manual merge of the akpm-current tree with the rsic-v tree
In-Reply-To: <20200528192211.2449bd4f@canb.auug.org.au>
CC:     Paul Walmsley <paul@pwsan.com>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, zong.li@sifive.com,
        rppt@linux.ibm.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>, akpm@linux-foundation.org
Message-ID: <mhng-42a49fa7-9216-40d3-9862-d5bed0d97eec@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 28 May 2020 02:22:11 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   arch/riscv/Kconfig
>
> between commit:
>
>   b151fefd23b7 ("riscv: sort select statements alphanumerically")

Andrew: Maybe it's easier if just drop the patch?  It comes from a script, so I
can just resurrect it when things are less busy.

>
> from the rsic-v tree and commits:
>
>   e8d3552c4f20 ("mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP option")
>   4d01b8e6220f ("riscv: support DEBUG_WX")
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> -- 
> Cheers,
> Stephen Rothwell
>
> diff --cc arch/riscv/Kconfig
> index de5c95119de9,68418201734a..000000000000
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@@ -12,47 -12,29 +12,47 @@@ config 32BI
>   
>   config RISCV
>   	def_bool y
>  -	select OF
>  -	select OF_EARLY_FLATTREE
>  -	select OF_IRQ
>   	select ARCH_HAS_BINFMT_FLAT
>  +	select ARCH_HAS_DEBUG_VIRTUAL if MMU
> + 	select ARCH_HAS_DEBUG_WX
>  +	select ARCH_HAS_GCOV_PROFILE_ALL
>  +	select ARCH_HAS_GIGANTIC_PAGE
>  +	select ARCH_HAS_MMIOWB
>  +	select ARCH_HAS_PTE_SPECIAL
>  +	select ARCH_HAS_SET_DIRECT_MAP
>  +	select ARCH_HAS_SET_MEMORY
>  +	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
>  +	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>   	select ARCH_WANT_FRAME_POINTERS
>  +	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>   	select CLONE_BACKWARDS
>   	select COMMON_CLK
>  +	select EDAC_SUPPORT
>  +	select GENERIC_ARCH_TOPOLOGY if SMP
>  +	select GENERIC_ATOMIC64 if !64BIT
>   	select GENERIC_CLOCKEVENTS
>  +	select GENERIC_IOREMAP
>  +	select GENERIC_IRQ_MULTI_HANDLER
>   	select GENERIC_IRQ_SHOW
>   	select GENERIC_PCI_IOMAP
>  +	select GENERIC_PTDUMP if MMU
>   	select GENERIC_SCHED_CLOCK
>  +	select GENERIC_SMP_IDLE_THREAD
>   	select GENERIC_STRNCPY_FROM_USER if MMU
>   	select GENERIC_STRNLEN_USER if MMU
>  -	select GENERIC_SMP_IDLE_THREAD
>  -	select GENERIC_ATOMIC64 if !64BIT
>  -	select GENERIC_IOREMAP
>  -	select GENERIC_PTDUMP if MMU
>   	select HAVE_ARCH_AUDITSYSCALL
>  +	select HAVE_ARCH_KASAN if MMU && 64BIT
>  +	select HAVE_ARCH_KGDB
>  +	select HAVE_ARCH_KGDB_QXFER_PKT
>  +	select HAVE_ARCH_MMAP_RND_BITS if MMU
>   	select HAVE_ARCH_SECCOMP_FILTER
>  +	select HAVE_ARCH_TRACEHOOK
>   	select HAVE_ASM_MODVERSIONS
>  +	select HAVE_COPY_THREAD_TLS
>   	select HAVE_DMA_CONTIGUOUS if MMU
>  +	select HAVE_EBPF_JIT if MMU
>   	select HAVE_FUTEX_CMPXCHG if FUTEX
> - 	select HAVE_MEMBLOCK_NODE_MAP
>  +	select HAVE_PCI
>   	select HAVE_PERF_EVENTS
>   	select HAVE_PERF_REGS
>   	select HAVE_PERF_USER_STACK_DUMP
