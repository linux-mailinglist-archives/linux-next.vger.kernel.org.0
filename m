Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE731D718C
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 09:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgERHMo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 03:12:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:51962 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbgERHMo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 May 2020 03:12:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 81EEEAC52;
        Mon, 18 May 2020 07:12:45 +0000 (UTC)
Date:   Mon, 18 May 2020 09:12:34 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20200518071234.GA24692@zn.tnic>
References: <20200518151032.57d57052@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200518151032.57d57052@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 18, 2020 at 03:10:32PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   include/linux/compiler.h
> 
> between commit:
> 
>   a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")
> 
> from Linus' tree and commit:
> 
>   f670269a42bf ("x86: Fix early boot crash on gcc-10, next try")
> 
> from the tip tree.

That commit is gone in the meantime so you won't have the merge conflict
anymore once tip/master is regenerated.

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
