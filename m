Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF45232CB5
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 09:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgG3HvF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 03:51:05 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:36338 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728624AbgG3HvF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jul 2020 03:51:05 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1k13Kq-0000pp-J1; Thu, 30 Jul 2020 17:50:41 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Thu, 30 Jul 2020 17:50:40 +1000
Date:   Thu, 30 Jul 2020 17:50:40 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Vineet Gupta <vgupta@synopsys.com>,
        Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        Waiman Long <longman@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header
 loop
Message-ID: <20200730075040.GA21623@gondor.apana.org.au>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
 <ed62ba67-0e1d-3fee-8c09-7750d5690be5@redhat.com>
 <CAHp75VdbZu008RcxNhMysoqBs2FSPXWv+au_ROJ7FPVd0uOhtg@mail.gmail.com>
 <20200730005922.GA9710@gondor.apana.org.au>
 <CAHp75Vf9Oj5DsGveN32i0A2TqudS+DXfhJYUOzSMJ6VD_A+2Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf9Oj5DsGveN32i0A2TqudS+DXfhJYUOzSMJ6VD_A+2Ow@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 30, 2020 at 10:47:16AM +0300, Andy Shevchenko wrote:
>
> We may ask Synopsys folks to look at this as well.
> Vineet, any ideas if we may unify ATOMIC64_INIT() across the architectures?

I don't think there is any technical difficulty.  The custom
atomic64_t simply adds an alignment requirement so the initialisor
remains the same.

I just didn't want to add more complexity to the existing patch.
As a follow-up patch it should be quite straightforward.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
