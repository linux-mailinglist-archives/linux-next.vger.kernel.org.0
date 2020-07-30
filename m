Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D583232946
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 02:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgG3A7i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 20:59:38 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:34210 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726859AbgG3A7i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 20:59:38 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1k0wup-00050D-0F; Thu, 30 Jul 2020 10:59:24 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Thu, 30 Jul 2020 10:59:22 +1000
Date:   Thu, 30 Jul 2020 10:59:22 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Waiman Long <longman@redhat.com>,
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
Message-ID: <20200730005922.GA9710@gondor.apana.org.au>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
 <ed62ba67-0e1d-3fee-8c09-7750d5690be5@redhat.com>
 <CAHp75VdbZu008RcxNhMysoqBs2FSPXWv+au_ROJ7FPVd0uOhtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdbZu008RcxNhMysoqBs2FSPXWv+au_ROJ7FPVd0uOhtg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 06:04:57PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 29, 2020 at 4:35 PM Waiman Long <longman@redhat.com> wrote:
> > On 7/29/20 8:28 AM, Herbert Xu wrote:
> 
> ...
> 
> > This patch series looks good to me. I just wonder if we should also move
> > ATOMIC64_INIT() to types.h for symmetry purpose. Anyway,
> 
> Same question here.

Yes I almost started doing it but at least one architecture (arc)
had a custom atomic64_t so I kept it out just to be on the safe
side.

We certainly could do this as a follow-up patch.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
