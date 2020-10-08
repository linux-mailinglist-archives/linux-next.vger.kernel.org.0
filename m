Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E5C28712B
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 11:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgJHJDL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 05:03:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:33856 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725963AbgJHJDL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Oct 2020 05:03:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 99685AD32;
        Thu,  8 Oct 2020 09:03:09 +0000 (UTC)
Date:   Thu, 8 Oct 2020 11:02:48 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20201008090248.GA29832@zn.tnic>
References: <20201008152832.32e390da@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201008152832.32e390da@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 08, 2020 at 03:28:32PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> WARNING: modpost: EXPORT symbol "copy_mc_fragile" [vmlinux] version generation failed, symbol will not be versioned.
> 
> Probably introduced by commit
> 
>   ec6347bb4339 ("x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, kernel}()")

Yeah, I've been diddling with this yesterday.

Fix is queued:

https://git.kernel.org/tip/b3149ffcdb31a8eb854cc442a389ae0b539bf28a

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
