Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6BAF2F5E53
	for <lists+linux-next@lfdr.de>; Thu, 14 Jan 2021 11:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbhANKIL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jan 2021 05:08:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:57348 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726374AbhANKIK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Jan 2021 05:08:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BCC8BAB7A;
        Thu, 14 Jan 2021 10:07:28 +0000 (UTC)
Date:   Thu, 14 Jan 2021 11:07:21 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Yazen Ghannam <Yazen.Ghannam@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20210114100721.GA13213@zn.tnic>
References: <20210114151145.328a142c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210114151145.328a142c@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 14, 2021 at 03:11:45PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
> 
> arch/x86/kernel/cpu/amd.c: In function 'bsp_init_amd':
> arch/x86/kernel/cpu/amd.c:545:3: error: '__max_die_per_package' undeclared (first use in this function); did you mean 'topology_max_die_per_package'?

Yah, the *one* time I forget to run randconfig builds... :-\

Thanks for reporting, fix coming up...

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
