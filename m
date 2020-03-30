Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 483CF197644
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 10:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbgC3IRF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 04:17:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:39218 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729575AbgC3IRF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 04:17:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C576DAEA1;
        Mon, 30 Mar 2020 08:17:00 +0000 (UTC)
Date:   Mon, 30 Mar 2020 10:16:52 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200330081652.GB14624@zn.tnic>
References: <20200330143529.4dafeb34@canb.auug.org.au>
 <CAMe9rOqnRCEdHhSHOT=Ut11D3O2WhjiFYhvPnaU5dANZNPE-=A@mail.gmail.com>
 <20200330150819.7f0199a2@canb.auug.org.au>
 <20200330074823.GA14624@zn.tnic>
 <87wo72uv3z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wo72uv3z.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 30, 2020 at 07:04:16PM +1100, Michael Ellerman wrote:
> Or just squash the hunk Stephen posted into the commit, which is what I
> thought would happen to begin with.
> 
> You can have my ack for it:
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thanks but considering how this is not really urgent stuff and it can
take its time and get some wider testing before getting upstream, I'd
prefer to delay it.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
