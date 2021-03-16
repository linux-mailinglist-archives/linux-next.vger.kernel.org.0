Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756D133E08A
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 22:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhCPVbr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 17:31:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:44092 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229490AbhCPVbl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Mar 2021 17:31:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A9815AE47;
        Tue, 16 Mar 2021 21:31:40 +0000 (UTC)
Date:   Tue, 16 Mar 2021 22:31:37 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wei Liu <wei.liu@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juergen Gross <jgross@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Kelley <mikelley@microsoft.com>
Subject: Re: linux-next: manual merge of the hyperv tree with the tip tree
Message-ID: <20210316213137.GG18822@zn.tnic>
References: <20210315143505.35af617b@canb.auug.org.au>
 <20210316150254.GC18822@zn.tnic>
 <20210316150554.32xtihkhvdkup3eq@liuwe-devbox-debian-v2>
 <20210317080744.33f5c6a9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317080744.33f5c6a9@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 08:07:44AM +1100, Stephen Rothwell wrote:
> No worries, I will keep applying the patch (my setup allows that to
> happen automatically).  Linus should apply it as a part of the merge
> resolution (as do I).

Thanks!

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
