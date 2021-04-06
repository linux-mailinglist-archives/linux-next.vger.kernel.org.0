Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC89355B73
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 20:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237262AbhDFSc4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 14:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhDFScz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 14:32:55 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97714C06174A;
        Tue,  6 Apr 2021 11:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=yRfBBwXQ8zuYyHSuFyyXrEy054J/K64QGlN3koRXJOc=; b=fP80VAklApcmjKG/aC3NvVwD5m
        NYi9Y3m5+3m3+FUsqY3PyDoxyOlgGhIrmBRgpAt2uhwG9hxg1hDg+blJZ7u3UGaDfv6yKIPh58dAN
        D0y3SqJJOmwAjdYMsRfsqrCykiu/r41GvaIEeMdEPgNBRpUKjzrsHH+BTd05bsiYoaYM2MUtruupC
        pdC78vnFeUJgcJaI84Q0vleUgTnrxqcmxnqkHl8MDKJ/niZ04nE1r1Nngk4PLQWK/vde3XTsCIiP/
        8e0+aPyceTFqTofI9nLekZS/tUZ+Iq1mg4gteV5+a/9pUO5BGCebCKLSLaEIsLimC1nfxZnCrEzx3
        219LoG2w==;
Received: from [2601:1c0:6280:3f0::e0e1]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lTqVF-003HOv-Jb; Tue, 06 Apr 2021 18:32:42 +0000
Subject: Re: linux-next: Tree for Apr 6 (arch/x86/mm/init_64.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oscar Salvador <osalvador@suse.de>, X86 ML <x86@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>
References: <20210406223109.50ebe35a@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <58d0c74b-ef4d-447b-9285-3d2c192fd3eb@infradead.org>
Date:   Tue, 6 Apr 2021 11:32:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210406223109.50ebe35a@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/6/21 5:31 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210401:
> 

on x86_64:
# CONFIG_SPARSEMEM_VMEMMAP is not set


gcc (SUSE Linux) 7.5.0


../arch/x86/mm/init_64.c: In function 'remove_pmd_table':
../arch/x86/mm/init_64.c:1127:8: error: implicit declaration of function 'vmemmap_pmd_is_unused'; did you mean 'vmemmap_pmd_populate'? [-Werror=implicit-function-declaration]
        vmemmap_pmd_is_unused(addr, next)) {
        ^~~~~~~~~~~~~~~~~~~~~
        vmemmap_pmd_populate


Looks like that compound "if" is too much for gcc 7.5.0 to handle:

			} else if (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) &&
				   vmemmap_pmd_is_unused(addr, next)) {
					free_hugepage_table(pmd_page(*pmd),
							    altmap);
					spin_lock(&init_mm.page_table_lock);
					pmd_clear(pmd);
					spin_unlock(&init_mm.page_table_lock);
			}


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
