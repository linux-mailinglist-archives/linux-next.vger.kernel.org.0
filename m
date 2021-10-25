Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C96543913A
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 10:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbhJYIfH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 04:35:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:53596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229839AbhJYIfG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Oct 2021 04:35:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C2A3604AC;
        Mon, 25 Oct 2021 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635150764;
        bh=+0hJcJGigVEilsD8EtE+r1TM7uyL/Vy0B+cfcagyyjs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GOh34K1PJUjKWDlE8Sb5ah+ICCkL4xm6WQqp/OY+fQNDp8HRIZCO/jz8+2zoPyicQ
         nnJNFJXsPgtci6xb2PulZbfbIq0VY05xF1QpuGQ/awtwIsna7YyUTvQGSsjZZMduLX
         B/pY5L8uVRgQCXrZOR6CUO2hjaO76zqQlpSMbIgOEqdYhtRHdNioT+kfZfKLfIdXva
         9U1IBLhpLqV02nKZwCHB78sBq/kSxv7TOgD3I0M+FnQuX9nhuy843fTD/izwHzSKZh
         Aolgk85i/CbTUDyeMRLCuHx4YC2xn8BShIpLsocNvI/Qc5ye8NQPIgLep+uwKv20wT
         d75341uKw6vZw==
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] lib/bootconfig: Make xbc_alloc_mem() and xbc_free_mem() as __init function
Date:   Mon, 25 Oct 2021 17:32:37 +0900
Message-Id: <163515075747.547467.5746167540626712819.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025151327.00af129d9f876e252b042d01@kernel.org>
References: <20211025151327.00af129d9f876e252b042d01@kernel.org>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Since the xbc_alloc_mem() and xbc_free_mem() are used from
the __init functions and memblock_alloc() is __init function,
make them __init functions too.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Fixes: 4ee1b4cac236 ("bootconfig: Cleanup dummy headers in tools/bootconfig")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/bootconfig.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index a056ae137750..3276675b25e1 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -43,12 +43,12 @@ static int open_brace[XBC_DEPTH_MAX] __initdata;
 static int brace_index __initdata;
 
 #ifdef __KERNEL__
-static inline void *xbc_alloc_mem(size_t size)
+static inline void * __init xbc_alloc_mem(size_t size)
 {
 	return memblock_alloc(size, SMP_CACHE_BYTES);
 }
 
-static inline void xbc_free_mem(void *addr, size_t size)
+static inline void __init xbc_free_mem(void *addr, size_t size)
 {
 	memblock_free_ptr(addr, size);
 }

