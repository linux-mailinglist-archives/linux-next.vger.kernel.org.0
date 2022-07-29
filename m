Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 792FF584B94
	for <lists+linux-next@lfdr.de>; Fri, 29 Jul 2022 08:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234592AbiG2GRf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Jul 2022 02:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234402AbiG2GRe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Jul 2022 02:17:34 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900D51A83D;
        Thu, 28 Jul 2022 23:17:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvHP4295wz4x1K;
        Fri, 29 Jul 2022 16:17:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1659075448;
        bh=zS+sIh8PqcW0UswVx6yqbrQBCsUpeSOZtzbxo8FtaV0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Tysz5VUryZJTUNqljuqSrqxx0DbPzp22hwvCdDgv5742BYqiW6qnp0QYf/PtbKpDR
         Yzm3UWncW50NPFWOzMPlPmjk8kyh2kLHdZf5B/Av1U8v14IIpw/TQFxn6LeItkqgAl
         ZlwS8GebrPFv+Rdz0ZssKy5P5WaYdrqEAClonpVU23bbac7X5Q1r9FJiXTykcd/6Do
         6bBqo/co3ODI6kCFWDfyFTLEKHFzsHm97/KlKqU19rmxtlICgRsS1uc7CwDe0fhPbW
         RNZiUB6SxGfisUYwgvVkgHUSOZ92s3cAGg2IrkNUD4jS6BA3RBd0MasJkNeGkuthMO
         0oqkUc7h/RR8A==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Sachin Sant <sachinp@linux.ibm.com>, linux-cxl@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org
Subject: Re: [linux-next] Build failure drivers/cxl/cxl_pmem (powerpc)
In-Reply-To: <7FF6D18F-2F85-4FFC-96B8-D1B1E8D8D622@linux.ibm.com>
References: <7FF6D18F-2F85-4FFC-96B8-D1B1E8D8D622@linux.ibm.com>
Date:   Fri, 29 Jul 2022 16:17:27 +1000
Message-ID: <87sfmkbfyg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Sachin Sant <sachinp@linux.ibm.com> writes:
> Linux-next (5.19.0-rc8-next-20220728) fails to build on powerpc with
> following error:
>
> ERROR: modpost: "memory_add_physaddr_to_nid" [drivers/cxl/cxl_pmem.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:128: modules-only.symvers] Error 1
>
> The code in question was last changed by following patch:
>
> commit 04ad63f086d1
>        cxl/region: Introduce cxl_pmem_region objects

This should fix it.

Dan, do you want to apply that on top of your tree to reduce the window
of breakage?

cheers


From 8ca5b098b6ff1048953be748dbffc987996e2605 Mon Sep 17 00:00:00 2001
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 29 Jul 2022 16:13:55 +1000
Subject: [PATCH] powerpc/mm: Export memory_add_physaddr_to_nid() for modules

The cxl_pmem module wants to call memory_add_physaddr_to_nid(), so
export the symbol.

Fixes: 04ad63f086d1 ("cxl/region: Introduce cxl_pmem_region objects")
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 7b0d286bf9ba..01772e79fd93 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -55,6 +55,7 @@ int memory_add_physaddr_to_nid(u64 start)
 {
 	return hot_add_scn_to_nid(start);
 }
+EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
 #endif
 
 int __weak create_section_mapping(unsigned long start, unsigned long end,
-- 
2.35.3

