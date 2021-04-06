Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0305355B8A
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 20:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbhDFSkE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 14:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234393AbhDFSkE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 14:40:04 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E25FC06174A;
        Tue,  6 Apr 2021 11:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=yKsyvrUvWx+7rCQfzwL2hGXH3VmyEkMRJv8JIsImntY=; b=mrkm+aD4C+3Q6K4vhmgYoqYIkO
        OxZxrZ3qTeugzBlgYkDi5nTGHJ6EkUcpGMk2dlWXaGN2bRt8HSVMN6hASosIZ9VZDcXUVLz0O++Pn
        UWRdZCLQemChXBdEVarQhJSuCK5qNnz5WK5TCYrtix0STh+gH315TtspIH2OxJd8LfpiYYVE61FrM
        O6xFyuDx5WwjKSl6DNJfRXEtp29VYJD/TK3Omo5QDLmbZjcXgLSzOgoqAo+SaXFxpZrAJYZEPLwfB
        pDokSAUzRkH3uZLDaRFvYZ3uADTMKiOJNdJFSRBMEmt9xVadq8jHF4DeonHY0u464ojTRALTxzew/
        fUrLYjsw==;
Received: from [2601:1c0:6280:3f0::e0e1]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lTqcB-003HfD-MR; Tue, 06 Apr 2021 18:39:52 +0000
Subject: Re: linux-next: Tree for Apr 6 (arch/x86/mm/init_64.c)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oscar Salvador <osalvador@suse.de>, X86 ML <x86@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>
References: <20210406223109.50ebe35a@canb.auug.org.au>
 <58d0c74b-ef4d-447b-9285-3d2c192fd3eb@infradead.org>
Message-ID: <a7895e6e-b00a-4b75-6506-ca38af495829@infradead.org>
Date:   Tue, 6 Apr 2021 11:39:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <58d0c74b-ef4d-447b-9285-3d2c192fd3eb@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/6/21 11:32 AM, Randy Dunlap wrote:
> On 4/6/21 5:31 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20210401:
>>
> 
> on x86_64:
> # CONFIG_SPARSEMEM_VMEMMAP is not set
> 
> 
> gcc (SUSE Linux) 7.5.0
> 
> 
> ../arch/x86/mm/init_64.c: In function 'remove_pmd_table':
> ../arch/x86/mm/init_64.c:1127:8: error: implicit declaration of function 'vmemmap_pmd_is_unused'; did you mean 'vmemmap_pmd_populate'? [-Werror=implicit-function-declaration]
>         vmemmap_pmd_is_unused(addr, next)) {
>         ^~~~~~~~~~~~~~~~~~~~~
>         vmemmap_pmd_populate
> 
> 
> Looks like that compound "if" is too much for gcc 7.5.0 to handle:
> 
> 			} else if (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) &&
> 				   vmemmap_pmd_is_unused(addr, next)) {
> 					free_hugepage_table(pmd_page(*pmd),
> 							    altmap);
> 					spin_lock(&init_mm.page_table_lock);
> 					pmd_clear(pmd);
> 					spin_unlock(&init_mm.page_table_lock);
> 			}
> 
> 

This is what I am using for now:

---
---
 arch/x86/mm/init_64.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- linux-next-20210406.orig/arch/x86/mm/init_64.c
+++ linux-next-20210406/arch/x86/mm/init_64.c
@@ -1123,14 +1123,16 @@ remove_pmd_table(pmd_t *pmd_start, unsig
 				pmd_clear(pmd);
 				spin_unlock(&init_mm.page_table_lock);
 				pages++;
-			} else if (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) &&
-				   vmemmap_pmd_is_unused(addr, next)) {
+			}
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+			else if (vmemmap_pmd_is_unused(addr, next)) {
 					free_hugepage_table(pmd_page(*pmd),
 							    altmap);
 					spin_lock(&init_mm.page_table_lock);
 					pmd_clear(pmd);
 					spin_unlock(&init_mm.page_table_lock);
 			}
+#endif
 
 			continue;
 		}
