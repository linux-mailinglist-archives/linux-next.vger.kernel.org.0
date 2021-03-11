Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7928337FD9
	for <lists+linux-next@lfdr.de>; Thu, 11 Mar 2021 22:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhCKVrM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Mar 2021 16:47:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:36252 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229827AbhCKVqy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Mar 2021 16:46:54 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1F1B7AC54;
        Thu, 11 Mar 2021 21:46:53 +0000 (UTC)
Date:   Thu, 11 Mar 2021 22:46:50 +0100
From:   Oscar Salvador <osalvador@suse.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Mar 11 (vmemmap)
Message-ID: <YEqPypUK2hSOYjA7@localhost.localdomain>
References: <20210311161449.7f58e7a3@canb.auug.org.au>
 <1a39f572-8c04-4bb1-2384-cf0f10cd3333@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a39f572-8c04-4bb1-2384-cf0f10cd3333@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 11, 2021 at 10:51:14AM -0800, Randy Dunlap wrote:
> On 3/10/21 9:14 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Warning: Some of the branches in linux-next are still based on v5.12-rc1,
> > so please be careful if you are trying to bisect a bug.
> > 
> > News: if your -next included tree is based on Linus' tree tag
> > v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
> > consider rebasing it onto v5.12-rc2. Also, please check any branches
> > merged into your branch.
> > 
> > Changes since 20210310:
> > 
> 
> on x86_64:
> 
> ../arch/x86/mm/init_64.c: In function ‘vmemmap_populate_hugepages’:
> ../arch/x86/mm/init_64.c:1585:6: error: implicit declaration of function ‘vmemmap_use_new_sub_pmd’ [-Werror=implicit-function-declaration]
>       vmemmap_use_new_sub_pmd(addr, next);
>       ^~~~~~~~~~~~~~~~~~~~~~~
> ../arch/x86/mm/init_64.c:1591:4: error: implicit declaration of function ‘vmemmap_use_sub_pmd’ [-Werror=implicit-function-declaration]
>     vmemmap_use_sub_pmd(addr, next);
>     ^~~~~~~~~~~~~~~~~~~

It seems that next-20210311 contains v5, which still had this issue.
I sent out v6 yesterday fixing this up [1].

I cannot reproduce with your config there.


[1] https://patchwork.kernel.org/project/linux-mm/cover/20210309214050.4674-1-osalvador@suse.de/

-- 
Oscar Salvador
SUSE L3
