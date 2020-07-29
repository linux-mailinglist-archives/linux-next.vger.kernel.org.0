Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A92231E86
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 14:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2M2S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 08:28:18 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:59970 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgG2M2S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 08:28:18 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1k0lBn-0000h4-Pf; Wed, 29 Jul 2020 22:28:08 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 29 Jul 2020 22:28:07 +1000
Date:   Wed, 29 Jul 2020 22:28:07 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Waiman Long <longman@redhat.com>
Subject: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header loop
Message-ID: <20200729122807.GA7047@gondor.apana.org.au>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729114757.GA19388@gondor.apana.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This miniseries breaks a header loop involving qspinlock_types.h.
The issue is that qspinlock_types.h includes atomic.h, which then
eventually includes kernel.h which could lead back to the original
file via spinlock_types.h.

The first patch moves ATOMIC_INIT into linux/types.h while the second
patch actuallys breaks the loop by no longer including atomic.h
in qspinlock_types.h.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
