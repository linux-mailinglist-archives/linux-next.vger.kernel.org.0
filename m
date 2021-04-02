Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D96E352643
	for <lists+linux-next@lfdr.de>; Fri,  2 Apr 2021 06:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhDBEd5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Apr 2021 00:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhDBEd5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Apr 2021 00:33:57 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3617C0613E6
        for <linux-next@vger.kernel.org>; Thu,  1 Apr 2021 21:33:56 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id h3so2865271pfr.12
        for <linux-next@vger.kernel.org>; Thu, 01 Apr 2021 21:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Q1i5EJWnW5PqHILFiXwcf3j4Dah4dszNwZY8/G8CQ18=;
        b=zY2xXPIRXW6nAdkvueKrorvqa8OFUnZw/mfEiabTyitfCKPzGRUJ1BLQ2nu6YKFc54
         0TLLM0h76sjUBxIylvz0uUNPs7HYswlIAnUJ3gxRT1LM+KvuPXQYIKgSoJqX172FtbWw
         CHxpkNH0pnCaq+UM/fFQHc0W9t8XHejb6Yd8u2N2ag2DDUMCWhRBFkUceQG7mAUjF42x
         ZqWpmGtrDf5+YigeZZo6/A0sX4J7R7TZa2LTSO2Z4NjDXuwuEYmdcR2pCdI5AwrC1HQz
         kDJXUPZAixuFxANDl3XJxsUCbZYe+KrHrxTi9SffNTk1j83ZK7QJyoEThiYJ++wxZ3U0
         qd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Q1i5EJWnW5PqHILFiXwcf3j4Dah4dszNwZY8/G8CQ18=;
        b=slLB/JTjFDrBmr5oFfl6glFe3Ep/pDc/y2+XMGMVUJ5mCigyLZSkq/DPsUzg/a6z1G
         g1+ktQkLh9jo8l7CBve6c34qvRhcD3pyuIIJjVh1n3Dk90NlPObg+q46GhcMGmhwrUlP
         K/2uzl+ZCmlYsZztqElLpLwsGD61pUsAAnlpoHrqHuG9jyuRp9r3CpEPNntWpbEk1dzE
         5mtsxj6tlNtXcv0AkTNVmn6QUIKV0AaKN5KtPRgyGGut4A7GKqa8GUvFxaOwMr3xzfFg
         P2PwYAssl203RrYYK7mue2uIjeQJzpEmjAuXUeEr3ov/3sV6wI831aTEnFZSIruhGQTl
         pwdg==
X-Gm-Message-State: AOAM531bHDi3xQWzsbBb5kd+ChIMhTQyBDthJFnjeg+RLji35i/f5ZO+
        m+3PPMBGApCBd0oli+CkMQaiJw==
X-Google-Smtp-Source: ABdhPJyTFu7dZyzEVKeRnvUljTgV7Wm+IMbn8kgjJmgg/qw/pLgeq1gaAugJrR3ptgIU4bNmwiDMVg==
X-Received: by 2002:a63:5c25:: with SMTP id q37mr2302580pgb.218.1617338036129;
        Thu, 01 Apr 2021 21:33:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id m7sm7015334pfd.52.2021.04.01.21.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 21:33:55 -0700 (PDT)
Date:   Thu, 01 Apr 2021 21:33:55 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Apr 2021 21:33:53 PDT (-0700)
Subject:     Re: linux-next: manual merge of the risc-v tree with Linus' tree
In-Reply-To: <20210331094034.7481acca@canb.auug.org.au>
CC:     Paul Walmsley <paul@pwsan.com>, alex@ghiti.fr,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-1c8afca0-213d-4ce3-9d4e-70926e92b133@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 30 Mar 2021 15:40:34 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the risc-v tree got a conflict in:
>
>   arch/riscv/mm/kasan_init.c
>
> between commits:
>
>   f3773dd031de ("riscv: Ensure page table writes are flushed when initializing KASAN vmalloc")
>   78947bdfd752 ("RISC-V: kasan: Declare kasan_shallow_populate() static")
>
> from Linus' tree and commit:
>
>   2da073c19641 ("riscv: Cleanup KASAN_VMALLOC support")
>
> from the risc-v tree.
>
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

They're my own trees ;)

I'm not so great at reading merge diffs, but the right fix here is to 
have the local_flush_tlb_all() after the call to 
kasan_shallow_populate_pgd(), just as there is one after 
kasan_populate_pgd().  My merge diff looks like this

diff --cc arch/riscv/mm/kasan_init.c
index 2c39f0386673,4f85c6d0ddf8..ec0029097251
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@@ -162,8 -159,36 +162,10 @@@ static void __init kasan_shallow_popula
  {
        unsigned long vaddr = (unsigned long)start & PAGE_MASK;
        unsigned long vend = PAGE_ALIGN((unsigned long)end);
 -      unsigned long pfn;
 -      int index;
 -      void *p;
 -      pud_t *pud_dir, *pud_k;
 -      pgd_t *pgd_dir, *pgd_k;
 -      p4d_t *p4d_dir, *p4d_k;
 -
 -      while (vaddr < vend) {
 -              index = pgd_index(vaddr);
 -              pfn = csr_read(CSR_SATP) & SATP_PPN;
 -              pgd_dir = (pgd_t *)pfn_to_virt(pfn) + index;
 -              pgd_k = init_mm.pgd + index;
 -              pgd_dir = pgd_offset_k(vaddr);
 -              set_pgd(pgd_dir, *pgd_k);
 -
 -              p4d_dir = p4d_offset(pgd_dir, vaddr);
 -              p4d_k  = p4d_offset(pgd_k, vaddr);
 -
 -              vaddr = (vaddr + PUD_SIZE) & PUD_MASK;
 -              pud_dir = pud_offset(p4d_dir, vaddr);
 -              pud_k = pud_offset(p4d_k, vaddr);
 -
 -              if (pud_present(*pud_dir)) {
 -                      p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
 -                      pud_populate(&init_mm, pud_dir, p);
 -              }
 -              vaddr += PAGE_SIZE;
 -      }
 +
 +      kasan_shallow_populate_pgd(vaddr, vend);
+
+       local_flush_tlb_all();
  }

  void __init kasan_init(void)

which doesn't include the diff to kasan_shallow_populate_pgd().  Not 
sure if that's just because my diff is in the other direction, though.  
The expected result is that kasan_shallow_populate_pgd() exists both pre 
and post merge.

>
> -- 
> Cheers,
> Stephen Rothwell
>
> diff --cc arch/riscv/mm/kasan_init.c
> index 4f85c6d0ddf8,2c39f0386673..000000000000
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@@ -153,44 -141,31 +141,33 @@@ static void __init kasan_populate(void 
>   
>   	local_flush_tlb_all();
>   	memset(start, KASAN_SHADOW_INIT, end - start);
>   }
>   
> + static void __init kasan_shallow_populate_pgd(unsigned long vaddr, unsigned long end)
> + {
> + 	unsigned long next;
> + 	void *p;
> + 	pgd_t *pgd_k = pgd_offset_k(vaddr);
> + 
> + 	do {
> + 		next = pgd_addr_end(vaddr, end);
> + 		if (pgd_page_vaddr(*pgd_k) == (unsigned long)lm_alias(kasan_early_shadow_pmd)) {
> + 			p = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
> + 			set_pgd(pgd_k, pfn_pgd(PFN_DOWN(__pa(p)), PAGE_TABLE));
> + 		}
> + 	} while (pgd_k++, vaddr = next, vaddr != end);
> + }
> + 
>   static void __init kasan_shallow_populate(void *start, void *end)
>   {
>   	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
>   	unsigned long vend = PAGE_ALIGN((unsigned long)end);
> - 	unsigned long pfn;
> - 	int index;
> - 	void *p;
> - 	pud_t *pud_dir, *pud_k;
> - 	pgd_t *pgd_dir, *pgd_k;
> - 	p4d_t *p4d_dir, *p4d_k;
> - 
> - 	while (vaddr < vend) {
> - 		index = pgd_index(vaddr);
> - 		pfn = csr_read(CSR_SATP) & SATP_PPN;
> - 		pgd_dir = (pgd_t *)pfn_to_virt(pfn) + index;
> - 		pgd_k = init_mm.pgd + index;
> - 		pgd_dir = pgd_offset_k(vaddr);
> - 		set_pgd(pgd_dir, *pgd_k);
> - 
> - 		p4d_dir = p4d_offset(pgd_dir, vaddr);
> - 		p4d_k  = p4d_offset(pgd_k, vaddr);
> - 
> - 		vaddr = (vaddr + PUD_SIZE) & PUD_MASK;
> - 		pud_dir = pud_offset(p4d_dir, vaddr);
> - 		pud_k = pud_offset(p4d_k, vaddr);
> - 
> - 		if (pud_present(*pud_dir)) {
> - 			p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
> - 			pud_populate(&init_mm, pud_dir, p);
> - 		}
> - 		vaddr += PAGE_SIZE;
> - 	}
> + 
> + 	kasan_shallow_populate_pgd(vaddr, vend);
>  +
>  +	local_flush_tlb_all();
>   }
>   
>   void __init kasan_init(void)
>   {
>   	phys_addr_t _start, _end;
