Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F14FE2C8B7A
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 18:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387728AbgK3Rkt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 12:40:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:45410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387585AbgK3Rkr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 12:40:47 -0500
Received: from localhost (129.sub-72-107-112.myvzw.com [72.107.112.129])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F37720789;
        Mon, 30 Nov 2020 17:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606758006;
        bh=Po0Vni3vuUdizhdl3Kfio3Vs8WN0WIvGW+tvezPdIWM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=VYO+8RMd1QSy/WXiWvosT497TGV+uAL9sNSFnR/1XRVx9xodVjlHd25Fm8lYoZrZz
         ruJcQFINYTk8LOaj1lXFNHznM7c5lSFXJYU6Y4f5M0Thtc4MY4b/HpxZUIoLbUaWcn
         /oXffkOiWW50cc+Xycx9i4+0K+AHoT19YuiShj7U=
Date:   Mon, 30 Nov 2020 11:40:04 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Borislav Petkov <bp@suse.de>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20201130174004.GA1090686@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201130102120.GB6586@zn.tnic>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 30, 2020 at 11:21:20AM +0100, Borislav Petkov wrote:
> On Mon, Nov 30, 2020 at 03:03:36PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the tip tree got a conflict in:
> > 
> >   arch/x86/pci/i386.c
> > 
> > between commit:
> > 
> >   ace091d17272 ("x86/PCI: Fix kernel-doc markup")
> > 
> > from the pci tree and commit:
> > 
> >   638920a66a17 ("x86/PCI: Make a kernel-doc comment a normal one")
> > 
> > from the tip tree.
> 
> Bjorn, I fixed up the comment too, while picking up, see below. But I
> don't care all that much which one to take so I leave it up to you to
> decide. :-)

I dropped ace091d17272 ("x86/PCI: Fix kernel-doc markup") from my
tree so we keep your comment improvements.  Thanks!

> commit 638920a66a17c8e1f4415cbab0d49dc4a344c2a7
> Author: Alex Shi <alex.shi@linux.alibaba.com>
> Date:   Fri Nov 13 16:58:14 2020 +0800
> 
>     x86/PCI: Make a kernel-doc comment a normal one
>     
>     The comment is using kernel-doc markup but that comment isn't a
>     kernel-doc comment so make it a normal one to avoid:
>     
>       arch/x86/pci/i386.c:373: warning: Function parameter or member \
>               'pcibios_assign_resources' not described in 'fs_initcall'
>     
>      [ bp: Massage and fixup comment while at it. ]
>     
>     Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
>     Signed-off-by: Borislav Petkov <bp@suse.de>
>     Link: https://lkml.kernel.org/r/1605257895-5536-5-git-send-email-alex.shi@linux.alibaba.com
> 
> diff --git a/arch/x86/pci/i386.c b/arch/x86/pci/i386.c
> index fa855bbaebaf..f2f4a5d50b27 100644
> --- a/arch/x86/pci/i386.c
> +++ b/arch/x86/pci/i386.c
> @@ -366,9 +366,9 @@ static int __init pcibios_assign_resources(void)
>  	return 0;
>  }
>  
> -/**
> - * called in fs_initcall (one below subsys_initcall),
> - * give a chance for motherboard reserve resources
> +/*
> + * This is an fs_initcall (one below subsys_initcall) in order to reserve
> + * resources properly.
>   */
>  fs_initcall(pcibios_assign_resources);
>  
> 
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
