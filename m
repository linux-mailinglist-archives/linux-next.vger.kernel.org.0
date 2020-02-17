Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2BEC160860
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 03:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgBQC54 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Feb 2020 21:57:56 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:46476 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbgBQC5z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 16 Feb 2020 21:57:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=fvW9MSMh9kEZIr51sUu4eHoff9LTnk1nQKXSASjslKo=; b=hrie61hLh+edr3TtebFbwpgPl1
        nt6PxcIjub0RJAWUPgR3Uiy+7aWx/MwleItEHSIUvlUdgckrPXZ4A9PYpzZ/n7P8ujkG2z6FiagXj
        JBCpZx3QwznwO/iy6TnGWigigXoKpExoYNgAIVuMOxPFFeEJF+c9h+OHgzZ67RBPKn/Nh4lk622QH
        xkqDPEEu9KgzKfnDmo+4Gv2C1LxVBiaOIr45fafgZ0bqlEpRiZWWTN0M54kNRjj6LLTZzZZsEWLJS
        763KQOfRRVFCyA9lxfCLC4BIGTUnyLmNEofyyS393enIFTEX0y6+2b5sWEWwKJeJwh4brr6HAeDsD
        ZX45Gccg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3WbW-0004N6-80; Mon, 17 Feb 2020 02:57:50 +0000
Subject: [PATCH] hugetlb: fix <linux/hugetlb_cgroup.h> structs
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Mina Almasry <almasrymina@google.com>
Cc:     linux-mm@kvack.org, linux-next@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        David Rientjes <rientjes@google.com>,
        Greg Thelen <gthelen@google.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <7ff9e944-1c6c-f7c1-d812-e12817c7a317@oracle.com>
 <20200214204544.231482-1-almasrymina@google.com>
 <CAHS8izMjyLzCsSga59dE+zDC3sLBuA=_u4EtsShN+EZQ1EQitw@mail.gmail.com>
 <5237b9bc-2614-0a3a-afa5-5015f30d28bc@infradead.org>
 <f0fd4a6b-1d4a-8e7d-65c0-a454fbf550a2@infradead.org>
 <CAHS8izP36oTFJdrV7+NSc1sc1fuGB48QDMCkamRM2nW2ni=tSg@mail.gmail.com>
 <CAHS8izOTc_7RKHoJVG_dOKEjT1d4KxNOUwMqqZwyqZm0fe=HcA@mail.gmail.com>
 <cad14d07-199e-fd2e-f2ac-0d7460277d62@infradead.org>
Message-ID: <cf31c5ba-c60e-cee2-9c43-0da453f31b0c@infradead.org>
Date:   Sun, 16 Feb 2020 18:57:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cad14d07-199e-fd2e-f2ac-0d7460277d62@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/16/20 6:48 PM, Randy Dunlap wrote:
> On 2/16/20 1:03 PM, Mina Almasry wrote:
>> On Sun, Feb 16, 2020 at 12:40 PM Mina Almasry <almasrymina@google.com> wrote:
>>>

>> any insight into why I can't reproduce the
>> warning? Wrong tree perhaps?
>>
>> I suspect a forward declaration of struct resv_map and struct
>> file_region in hugetlb_cgroup.h would also fix.

Yes, adding struct stubs in that header file does remove the
build warnings.

thanks.

=== patch follows ===

From: Randy Dunlap <rdunlap@infradead.org>

Fix build warnings when CONFIG_HUGETLB is not set/enabled.
Fixes these warnings:

In file included from ../mm/migrate.c:39:0:
../include/linux/hugetlb_cgroup.h:147:21: warning: ‘struct file_region’ declared inside parameter list will not be visible outside of this definition or declaration
              struct file_region *rg,
                     ^~~~~~~~~~~
../include/linux/hugetlb_cgroup.h:146:63: warning: ‘struct resv_map’ declared inside parameter list will not be visible outside of this definition or declaration
 static inline void hugetlb_cgroup_uncharge_file_region(struct resv_map *resv,
                                                               ^~~~~~~~
../include/linux/hugetlb_cgroup.h:234:59: warning: ‘struct resv_map’ declared inside parameter list will not be visible outside of this definition or declaration
 static inline void hugetlb_cgroup_uncharge_counter(struct resv_map *resv,
                                                           ^~~~~~~~

Suggested-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 include/linux/hugetlb_cgroup.h |    3 +++
 1 file changed, 3 insertions(+)

--- mmotm-2020-0213-2226.orig/include/linux/hugetlb_cgroup.h
+++ mmotm-2020-0213-2226/include/linux/hugetlb_cgroup.h
@@ -18,6 +18,9 @@
 #include <linux/mmdebug.h>
 
 struct hugetlb_cgroup;
+struct file_region;
+struct resv_map;
+
 /*
  * Minimum page order trackable by hugetlb cgroup.
  * At least 4 pages are necessary for all the tracking information.

