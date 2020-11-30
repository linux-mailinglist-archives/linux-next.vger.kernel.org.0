Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFE32C8208
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 11:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbgK3KWB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 05:22:01 -0500
Received: from mx2.suse.de ([195.135.220.15]:33680 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgK3KWB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 05:22:01 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7F6C2ABD2;
        Mon, 30 Nov 2020 10:21:19 +0000 (UTC)
Date:   Mon, 30 Nov 2020 11:21:20 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20201130102120.GB6586@zn.tnic>
References: <20201130150336.128b84a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201130150336.128b84a0@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 30, 2020 at 03:03:36PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/x86/pci/i386.c
> 
> between commit:
> 
>   ace091d17272 ("x86/PCI: Fix kernel-doc markup")
> 
> from the pci tree and commit:
> 
>   638920a66a17 ("x86/PCI: Make a kernel-doc comment a normal one")
> 
> from the tip tree.

Bjorn, I fixed up the comment too, while picking up, see below. But I
don't care all that much which one to take so I leave it up to you to
decide. :-)

Thx.

commit 638920a66a17c8e1f4415cbab0d49dc4a344c2a7
Author: Alex Shi <alex.shi@linux.alibaba.com>
Date:   Fri Nov 13 16:58:14 2020 +0800

    x86/PCI: Make a kernel-doc comment a normal one
    
    The comment is using kernel-doc markup but that comment isn't a
    kernel-doc comment so make it a normal one to avoid:
    
      arch/x86/pci/i386.c:373: warning: Function parameter or member \
              'pcibios_assign_resources' not described in 'fs_initcall'
    
     [ bp: Massage and fixup comment while at it. ]
    
    Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
    Signed-off-by: Borislav Petkov <bp@suse.de>
    Link: https://lkml.kernel.org/r/1605257895-5536-5-git-send-email-alex.shi@linux.alibaba.com

diff --git a/arch/x86/pci/i386.c b/arch/x86/pci/i386.c
index fa855bbaebaf..f2f4a5d50b27 100644
--- a/arch/x86/pci/i386.c
+++ b/arch/x86/pci/i386.c
@@ -366,9 +366,9 @@ static int __init pcibios_assign_resources(void)
 	return 0;
 }
 
-/**
- * called in fs_initcall (one below subsys_initcall),
- * give a chance for motherboard reserve resources
+/*
+ * This is an fs_initcall (one below subsys_initcall) in order to reserve
+ * resources properly.
  */
 fs_initcall(pcibios_assign_resources);
 


-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
