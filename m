Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5928F4D045D
	for <lists+linux-next@lfdr.de>; Mon,  7 Mar 2022 17:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243222AbiCGQoV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Mar 2022 11:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240217AbiCGQoS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Mar 2022 11:44:18 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE516E8E0
        for <linux-next@vger.kernel.org>; Mon,  7 Mar 2022 08:43:23 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id 85so4319291qkm.9
        for <linux-next@vger.kernel.org>; Mon, 07 Mar 2022 08:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WxlXZbKegotTRphKHmCehZpEgIJ4wMzTilNUVs/+5nY=;
        b=8J+stYa/ocPVv4jvR8jIsD+/+b5SachD9ks6Kn+B8F/whEu+72+yI/G6t+314zdcxd
         Df+s50+d8n2lhyrpKZXDxkiH6o/PZj8inwflMIuKRKBkEjpZ9GhjKmsZqCRQfiaEkkB/
         /DGdHIeDv/AAfifFcb1K1Ci3zrSPR+1em5+roDCBfagbueoLwJOj2IehLzQ/2I9SBUf4
         UApXBg7gBCypq1vebggjm1qWM8lomACQseQGiRbLtWf8vZmCOolN5bgBwPqNFrxKiuXa
         fSddDQcgI12TtMdFR1JjQpbKaFb2oVfG/4P4tV5KGrVdAPPfVj7vMQ8u0XaeNcdVUy6E
         JZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WxlXZbKegotTRphKHmCehZpEgIJ4wMzTilNUVs/+5nY=;
        b=XvckhjEJIrjMsx2J/Oja/knEbBwONXSSK9zkJKX5rNYyMlim9wbdjW5y+M/BSporTk
         NUs/BCGtrXVNYUyp9cs7jTDY/F03vVlaeuBOgo7td20/ZjpeBmQMsIy9MTfXLZLSf+zx
         Ml5grkFHvmH0E06uWzcFyMh5NpeyeFh/hsI+1EMp3Efdhey9EG/YhsWKsE7XW5db5zUp
         zlozJSA4TEfzWJ4fkSVyNt63Et0Y1ToWIxVtSXUx+0blExEiyvG5IkoEkfB0PFdRxcDV
         79/T16phClPxNL7exwEI8838kuCuPV7JHZfbw3UY413YNiEsHlo5b0/5Ts00jz8qJXc6
         PGsQ==
X-Gm-Message-State: AOAM532CF76ZpR2QM2nF6xV9S0Hy0YA1E32kM7/rYNA1YIwLxUUNyf+9
        EMACj0VFDi2bXzSpE5mKaz2M64cOf+Eg0Q==
X-Google-Smtp-Source: ABdhPJxoAqXS7uh7G4R0lKgwS1ukWjfjVAzh0Qd9NFLxKhj/Nbz9L9pNu/gMDy1cKjWunuipXrVZFQ==
X-Received: by 2002:a05:620a:4706:b0:67a:e619:8615 with SMTP id bs6-20020a05620a470600b0067ae6198615mr7474264qkb.775.1646671402742;
        Mon, 07 Mar 2022 08:43:22 -0800 (PST)
Received: from localhost (cpe-98-15-154-102.hvc.res.rr.com. [98.15.154.102])
        by smtp.gmail.com with ESMTPSA id j11-20020a37a00b000000b0067b436faccesm622651qke.122.2022.03.07.08.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 08:43:22 -0800 (PST)
Date:   Mon, 7 Mar 2022 11:43:21 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <YiY2KYyjsCaANwo0@cmpxchg.org>
References: <20220307215530.7c981424@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307215530.7c981424@canb.auug.org.au>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Sorry about that. This should fix it:

---
From a4d90a5faa418d98f925abe47b1a4fcffc4283f9 Mon Sep 17 00:00:00 2001
From: Johannes Weiner <hannes@cmpxchg.org>
Date: Mon, 7 Mar 2022 11:38:42 -0500
Subject: [PATCH] mm: madvise: MADV_DONTNEED_LOCKED fix

On MiPS:
mm/madvise.c:55:7: error: 'MADV_DONTNEED_LOCKED' undeclared (first use in this function); did you mean 'MADV_DONTNEED'?

Define MADV_DONTNEED_LOCKED on archs that don't use the common mman.h

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 arch/alpha/include/uapi/asm/mman.h  | 2 ++
 arch/mips/include/uapi/asm/mman.h   | 2 ++
 arch/parisc/include/uapi/asm/mman.h | 2 ++
 arch/xtensa/include/uapi/asm/mman.h | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/arch/alpha/include/uapi/asm/mman.h b/arch/alpha/include/uapi/asm/mman.h
index 56b4ee5a6c9e..4aa996423b0d 100644
--- a/arch/alpha/include/uapi/asm/mman.h
+++ b/arch/alpha/include/uapi/asm/mman.h
@@ -74,6 +74,8 @@
 #define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
 #define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
 
+#define MADV_DONTNEED_LOCKED	24	/* like DONTNEED, but drop locked pages too */
+
 /* compatibility flags */
 #define MAP_FILE	0
 
diff --git a/arch/mips/include/uapi/asm/mman.h b/arch/mips/include/uapi/asm/mman.h
index 40b210c65a5a..1be428663c10 100644
--- a/arch/mips/include/uapi/asm/mman.h
+++ b/arch/mips/include/uapi/asm/mman.h
@@ -101,6 +101,8 @@
 #define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
 #define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
 
+#define MADV_DONTNEED_LOCKED	24	/* like DONTNEED, but drop locked pages too */
+
 /* compatibility flags */
 #define MAP_FILE	0
 
diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 9e3c010c0f61..a7ea3204a5fa 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -55,6 +55,8 @@
 #define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
 #define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
 
+#define MADV_DONTNEED_LOCKED	24	/* like DONTNEED, but drop locked pages too */
+
 #define MADV_MERGEABLE   65		/* KSM may merge identical pages */
 #define MADV_UNMERGEABLE 66		/* KSM may not merge identical pages */
 
diff --git a/arch/xtensa/include/uapi/asm/mman.h b/arch/xtensa/include/uapi/asm/mman.h
index b3a22095371b..7966a58af472 100644
--- a/arch/xtensa/include/uapi/asm/mman.h
+++ b/arch/xtensa/include/uapi/asm/mman.h
@@ -109,6 +109,8 @@
 #define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
 #define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
 
+#define MADV_DONTNEED_LOCKED	24	/* like DONTNEED, but drop locked pages too */
+
 /* compatibility flags */
 #define MAP_FILE	0
 
-- 
2.35.1
