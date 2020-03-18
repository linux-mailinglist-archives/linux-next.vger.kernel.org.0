Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C59F18A26A
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 19:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgCRSes (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 14:34:48 -0400
Received: from mail.skyhub.de ([5.9.137.197]:53450 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726647AbgCRSes (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 14:34:48 -0400
Received: from zn.tnic (p200300EC2F0B450084928C9FAEA2F9FB.dip0.t-ipconnect.de [IPv6:2003:ec:2f0b:4500:8492:8c9f:aea2:f9fb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EE3541EC0CFB;
        Wed, 18 Mar 2020 19:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1584556487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=CJE3KOqbdzcdAA4tnut68OnvOQdfGMEspNjEMsSW2gw=;
        b=dZRhDVxLhreppLmXOhJXaAhCr9vGDc9tMADcynzUXsN63kewjWMLY5zcIA43nffCLFygDH
        n38J8+tdTtXmS/lRor00/yio7W8kTTTg/uN8mvnsgaBKg9NjPulRssJIsbs85nwppYNt0f
        oAldBT+C/Rj4L6JadK4EL07mLiVYsa0=
Date:   Wed, 18 Mar 2020 19:34:51 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>
Subject: [PATCH] x86/ioremap: Fix CONFIG_EFI=n build
Message-ID: <20200318183451.GC4377@zn.tnic>
References: <20200316183039.0d1c45ce@canb.auug.org.au>
 <7561e981-0d9b-d62c-0ef2-ce6007aff1ab@infradead.org>
 <20200318151707.GB4377@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200318151707.GB4377@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 04:17:07PM +0100, Borislav Petkov wrote:
> > ld: arch/x86/mm/ioremap.o: in function `__ioremap_caller':
> > ioremap.c:(.text+0x150): undefined reference to `efi_mem_type'
> 
> Working on it.

The below should fix it:

---
From: Borislav Petkov <bp@suse.de>
Date: Wed, 18 Mar 2020 19:27:48 +0100

In order to use efi_mem_type(), one needs CONFIG_EFI enabled. Otherwise
that function is undefined. Use IS_ENABLED() to check and avoid the
ifdeffery as the compiler optimizes away the following unreachable code
then.

Fixes: 985e537a4082 ("x86/ioremap: Map EFI runtime services data as encrypted for SEV")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Link: https://lkml.kernel.org/r/7561e981-0d9b-d62c-0ef2-ce6007aff1ab@infradead.org
---
 arch/x86/mm/ioremap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 935a91e1fd77..18c637c0dc6f 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -115,6 +115,9 @@ static void __ioremap_check_other(resource_size_t addr, struct ioremap_desc *des
 	if (!sev_active())
 		return;
 
+	if (!IS_ENABLED(CONFIG_EFI))
+		return;
+
 	if (efi_mem_type(addr) == EFI_RUNTIME_SERVICES_DATA)
 		desc->flags |= IORES_MAP_ENCRYPTED;
 }
-- 
2.21.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
