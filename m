Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1FCCDFEE5
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 10:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388099AbfJVICx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Oct 2019 04:02:53 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59802 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388098AbfJVICx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Oct 2019 04:02:53 -0400
Received: from [213.220.153.21] (helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1iMp7w-0007W6-L4; Tue, 22 Oct 2019 08:02:48 +0000
Date:   Tue, 22 Oct 2019 10:02:47 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>, linux@rasmusvillemoes.dk,
        cyphar@cyphar.com, keescook@chromium.org
Subject: Re: linux-next: Tree for Oct 18 (objtool)
Message-ID: <20191022080247.6zc36jaqfr4s6o7i@wittgenstein>
References: <20191018180300.090dbcb9@canb.auug.org.au>
 <40de4e26-450e-b932-3d73-e833c8aeaa2e@infradead.org>
 <20191021123549.GC1817@hirez.programming.kicks-ass.net>
 <20191021131149.GA19358@hirez.programming.kicks-ass.net>
 <20191021131947.yih3wqjbfroaj4dz@wittgenstein>
 <20191021134759.GG1800@hirez.programming.kicks-ass.net>
 <20191021193652.lfccehm37dkkofp7@wittgenstein>
 <20191022074034.GK1817@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191022074034.GK1817@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 22, 2019 at 09:40:34AM +0200, Peter Zijlstra wrote:
> On Mon, Oct 21, 2019 at 09:36:53PM +0200, Christian Brauner wrote:
> > Ok, so I take it you route that patch somehwere through tip?
> > I'm happy with the ubsan fix:
> 
> Yeah, I'll go make a real patch with Changelog of it and stick it in
> tip.

Excellent! Thanks!
Christian
