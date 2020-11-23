Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091D12C0311
	for <lists+linux-next@lfdr.de>; Mon, 23 Nov 2020 11:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgKWKNm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 05:13:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:43328 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727849AbgKWKNm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Nov 2020 05:13:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9A329ABDE;
        Mon, 23 Nov 2020 10:13:40 +0000 (UTC)
Date:   Mon, 23 Nov 2020 11:13:34 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] x86/sgx: Fix sgx_ioc_enclave_provision() kernel-doc comment
Message-ID: <20201123101334.GC29678@zn.tnic>
References: <20201123181922.0c009406@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201123181922.0c009406@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 23, 2020 at 06:19:22PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (htmldocs) produced
> these warnings:
> 
> arch/x86/kernel/cpu/sgx/ioctl.c:666: warning: Function parameter or member 'encl' not described in 'sgx_ioc_enclave_provision'
> arch/x86/kernel/cpu/sgx/ioctl.c:666: warning: Excess function parameter 'enclave' description in 'sgx_ioc_enclave_provision'
> 
> Introduced by commit
> 
>   c82c61865024 ("x86/sgx: Add SGX_IOC_ENCLAVE_PROVISION")

---
From: Borislav Petkov <bp@suse.de>

Fix

  ./arch/x86/kernel/cpu/sgx/ioctl.c:666: warning: Function parameter or member \
	  'encl' not described in 'sgx_ioc_enclave_provision'
  ./arch/x86/kernel/cpu/sgx/ioctl.c:666: warning: Excess function parameter \
	  'enclave' description in 'sgx_ioc_enclave_provision'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 arch/x86/kernel/cpu/sgx/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/sgx/ioctl.c b/arch/x86/kernel/cpu/sgx/ioctl.c
index 30aefc93a31d..c206aee80a04 100644
--- a/arch/x86/kernel/cpu/sgx/ioctl.c
+++ b/arch/x86/kernel/cpu/sgx/ioctl.c
@@ -652,7 +652,7 @@ static long sgx_ioc_enclave_init(struct sgx_encl *encl, void __user *arg)
 
 /**
  * sgx_ioc_enclave_provision() - handler for %SGX_IOC_ENCLAVE_PROVISION
- * @enclave:	an enclave pointer
+ * @encl:	an enclave pointer
  * @arg:	userspace pointer to a struct sgx_enclave_provision instance
  *
  * Allow ATTRIBUTE.PROVISION_KEY for an enclave by providing a file handle to
-- 
2.21.0

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
