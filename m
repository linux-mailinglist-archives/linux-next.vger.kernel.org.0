Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C90F85C2
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 01:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfKLA7r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 19:59:47 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34617 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727338AbfKLA7r (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Nov 2019 19:59:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47BqCN2b3dz9s7T;
        Tue, 12 Nov 2019 11:59:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1573520384;
        bh=keCg8e+U+Atffb3YaegfdPkbXQVajztNOGjGSeZJiyE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Qk0Uxk/gFaiyZ/AtoHKUxjlALFcXFappKOTYT43yi9KcB6Ao+O7RBWQzU+OlZ/mIz
         PDTgA04ddEw4ua8xiuEDXSCoK0R1Pxde3n1A2+hlMZAIABJY7ScB0pfz99b5KSsaX6
         EnQ4lBVyC72kVQ+/wN4SpE/lYLh1wEJkBVLQI2qZmPg81Yhb3CfYF+FsJJwwNo+R6F
         FNQtYuVeoD8YFL+EtsFwvpp61h5Vvt+oBcbHdKMlKVmpNfbOR2UYF6Hb0fIqelRdRN
         0T4P1L9GKDjUxzUbrbs1tMlPvnN4YkZUJDtXzdAhFvpKmTkSPlG4ge4kQD3BdZ8XNr
         b3D4u3Iux5tyw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mm\@kvack.org" <linux-mm@kvack.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
In-Reply-To: <871rue4so0.fsf@mpe.ellerman.id.au>
References: <20191105211920.787df2ab@canb.auug.org.au> <0892a018-152f-629d-3dd0-60ce79f2887b@oracle.com> <871rue4so0.fsf@mpe.ellerman.id.au>
Date:   Tue, 12 Nov 2019 11:59:41 +1100
Message-ID: <87v9rp3o5e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Michael Ellerman <mpe@ellerman.id.au> writes:
>
> Mike Kravetz <mike.kravetz@oracle.com> writes:
>> On 11/5/19 2:19 AM, Stephen Rothwell wrote:
...
>> From 4b3ab017e639e4e583fff801e6d8e6727b7877e8 Mon Sep 17 00:00:00 2001
>> From: Mike Kravetz <mike.kravetz@oracle.com>
>> Date: Tue, 5 Nov 2019 15:12:15 -0800
>> Subject: [PATCH] powerpc/mm: remove pmd_huge/pud_huge stubs and include
>>  hugetlb.h
>>
>> This removes the power specific stubs created by commit aad71e3928be
>> ("powerpc/mm: Fix build break with RADIX=y & HUGETLBFS=n") used when
>> !CONFIG_HUGETLB_PAGE.  Instead, it addresses the build break by
>> getting the definitions from <linux/hugetlb.h>.
>>
>> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
>> ---
>>  arch/powerpc/include/asm/book3s/64/pgtable-4k.h  | 3 ---
>>  arch/powerpc/include/asm/book3s/64/pgtable-64k.h | 3 ---
>>  arch/powerpc/mm/book3s64/radix_pgtable.c         | 1 +
>>  3 files changed, 1 insertion(+), 6 deletions(-)
>
> The two pgtable headers are included eventually by our top-level
> pgtable.h, and that is included by over 100 files. So I worry this is
> going to break the build somewhere in some obscure configuration.
>
> I'll push it through some test builds and see what happens.

Seems OK, it didn't introduce any new build failures.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
