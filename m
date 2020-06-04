Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F0C1EE366
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 13:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgFDL2D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 07:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgFDL2D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 07:28:03 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44405C03E96D;
        Thu,  4 Jun 2020 04:28:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49d3Rj27Rhz9sSc;
        Thu,  4 Jun 2020 21:28:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1591270081;
        bh=RxX+tPyrCW35oHj1PQviARj5kQb6NCOIuDZHvW2/7JA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=omPVORFa7AnLlaWXLnzXanEDFAvuqwukoHBDpCA2Ecqm48DD5gUnX4EigsY3Q1XjR
         P6GMTMLLIvn7vj4/gls+S79Utetp2eP6CgLLOjSYg7d0GNLnZm76T5IjpQXTvQNVmZ
         9Jh6TzRcAJW4Bt3bS9JgZPXu+b6z2AlyciO/CVoIyqxp+KAU7Sug1edGeV3i8OoGFS
         FB17sJKvyMCGF7v5gmsLEafqVj2LMS1uSzhEyQb7V9czGQoVMr6VIFc9A0JSLVdvwH
         KStv/HUsFz6LipSZZzsNf6crrprieJs86cClYnZCizDONw4KCyjW9x/lDj2ATysf3z
         oVhSYpiMr32fw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: fix ups for clashes between akpm and powerpc trees
In-Reply-To: <20200604183805.6f384b23@canb.auug.org.au>
References: <20200603202655.0ad0eacc@canb.auug.org.au> <20200604165246.436f02ba@canb.auug.org.au> <20200604183805.6f384b23@canb.auug.org.au>
Date:   Thu, 04 Jun 2020 21:28:23 +1000
Message-ID: <87r1uvgje0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> On Thu, 4 Jun 2020 16:52:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index 25c3cb8272c0..a6799723cd98 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -1008,6 +1008,12 @@ extern struct page *p4d_page(p4d_t p4d);
>>  #define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
>>  #define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
>>  
>> +static inline unsigned long pgd_index(unsigned long address)
>> +{
>> +	return (address >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1);
>> +}
>> +#define pgd_index pgd_index
>> +
>>  #define pte_ERROR(e) \
>>  	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
>>  #define pmd_ERROR(e) \
>
> I have added that hunk to linux-next for tomorrow as a fix for
> mm-consolidate-pgd_index-and-pgd_offset_k-definitions.
>
> Its not strickly necessary, but Michael expressed a preference for the
> inline function.

That was because we just recently converted it into a static inline to
avoid UBSAN warnings:

commit c2e929b18cea6cbf71364f22d742d9aad7f4677a
Author:     Qian Cai <cai@lca.pw>
AuthorDate: Thu Mar 5 23:48:52 2020 -0500

    powerpc/64s/pgtable: fix an undefined behaviour

    Booting a power9 server with hash MMU could trigger an undefined
    behaviour because pud_offset(p4d, 0) will do,

    0 >> (PAGE_SHIFT:16 + PTE_INDEX_SIZE:8 + H_PMD_INDEX_SIZE:10)

    Fix it by converting pud_index() and friends to static inline
    functions.

    UBSAN: shift-out-of-bounds in arch/powerpc/mm/ptdump/ptdump.c:282:15
    shift exponent 34 is too large for 32-bit type 'int'
    CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc4-next-20200303+ #13
    Call Trace:
    dump_stack+0xf4/0x164 (unreliable)
    ubsan_epilogue+0x18/0x78
    __ubsan_handle_shift_out_of_bounds+0x160/0x21c
    walk_pagetables+0x2cc/0x700
    walk_pud at arch/powerpc/mm/ptdump/ptdump.c:282
    (inlined by) walk_pagetables at arch/powerpc/mm/ptdump/ptdump.c:311
    ptdump_check_wx+0x8c/0xf0
    mark_rodata_ro+0x48/0x80
    kernel_init+0x74/0x194
    ret_from_kernel_thread+0x5c/0x74


> I was wondering if pgd_index "Must be a compile-time
> constant" on one (or a few) architectures, then why not leave the
> default as an inline function and special case it as a macro where
> needed ...

AIUI that requirement comes from x86 which has:

#define KERNEL_PGD_BOUNDARY	pgd_index(PAGE_OFFSET)
#define KERNEL_PGD_PTRS		(PTRS_PER_PGD - KERNEL_PGD_BOUNDARY)
...
#define MAX_PREALLOCATED_USER_PMDS KERNEL_PGD_PTRS
...
pgd_t *pgd_alloc(struct mm_struct *mm)
{
	pgd_t *pgd;
	pmd_t *u_pmds[MAX_PREALLOCATED_USER_PMDS];


Which will produce a variable length array if pgd_index() isn't a
compile-time constant.

cheers
