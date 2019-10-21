Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01C53DF619
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 21:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbfJUThC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 15:37:02 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43881 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728543AbfJUThC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 15:37:02 -0400
Received: from [213.220.153.21] (helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1iMdU6-0005N0-Dy; Mon, 21 Oct 2019 19:36:54 +0000
Date:   Mon, 21 Oct 2019 21:36:53 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>, linux@rasmusvillemoes.dk,
        cyphar@cyphar.com, keescook@chromium.org
Subject: Re: linux-next: Tree for Oct 18 (objtool)
Message-ID: <20191021193652.lfccehm37dkkofp7@wittgenstein>
References: <20191018180300.090dbcb9@canb.auug.org.au>
 <40de4e26-450e-b932-3d73-e833c8aeaa2e@infradead.org>
 <20191021123549.GC1817@hirez.programming.kicks-ass.net>
 <20191021131149.GA19358@hirez.programming.kicks-ass.net>
 <20191021131947.yih3wqjbfroaj4dz@wittgenstein>
 <20191021134759.GG1800@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191021134759.GG1800@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 21, 2019 at 03:47:59PM +0200, Peter Zijlstra wrote:
> On Mon, Oct 21, 2019 at 03:19:48PM +0200, Christian Brauner wrote:
> > On Mon, Oct 21, 2019 at 03:11:49PM +0200, Peter Zijlstra wrote:
> 
> > > By popular request; here's that alternative. Completely untested :-)
> > 
> > Am I not getting some mails? :)
> 
> You're not on the 'right' IRC channels :-)

Well, we saw that that wasn't true today. :)

> 
> > I prefer this one as it allows us to avoid working around this in
> > usercopy.c. Should especially make if this potentially helps in other
> > cases as well?
> 
> That was Josh's argument too.
> 
> Personally I think GCC is being a moron here, because with value range
> analysis it should be able to prove the shift-UB cannot happen (the <
> sizeof(unsigned long) conditions on both), but alas, it emits the UBSAN
> calls anyway.

Ok, so I take it you route that patch somehwere through tip?
I'm happy with the ubsan fix:

Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
