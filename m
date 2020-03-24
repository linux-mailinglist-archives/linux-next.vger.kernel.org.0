Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 327AC1916BE
	for <lists+linux-next@lfdr.de>; Tue, 24 Mar 2020 17:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgCXQom (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 12:44:42 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:58057 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726988AbgCXQol (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Mar 2020 12:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585068281;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kM5IDdV+KCJbhPDAtCw+16lAUWW1XkUvo85xepZ14JE=;
        b=MZIXVmTETvPHqdtpURuB2cT2Xn/04vG22DfF5maJjZjAVXhV86ryyAnABVarqhDP6lWlEQ
        PQZwzb40F3I2QoMq2XoIFILrtlCRr4/Y4Q2hmv6PcEk2hqsM3v55n+SnHCCBrJwo6varWJ
        CobnZqEHEIpRoLfI1LRuFzw2IoHQWOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-CBMUJGpcP4aMJVIr71SEPw-1; Tue, 24 Mar 2020 12:44:37 -0400
X-MC-Unique: CBMUJGpcP4aMJVIr71SEPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF2FB8017CE;
        Tue, 24 Mar 2020 16:44:35 +0000 (UTC)
Received: from treble (unknown [10.10.119.253])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1842360FC5;
        Tue, 24 Mar 2020 16:44:35 +0000 (UTC)
Date:   Tue, 24 Mar 2020 11:44:33 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 18 (objtool)
Message-ID: <20200324164433.qusyu5h7ykx3f2bu@treble>
References: <20200318220920.48df2e76@canb.auug.org.au>
 <d7dc5b4a-9a7e-ccf7-e00e-2e7f0e79a9bc@infradead.org>
 <20200318182352.2dgwwl4ugbwndi4x@treble>
 <20200318200542.GK20730@hirez.programming.kicks-ass.net>
 <20200319173101.wufpymi7obhqgoqd@treble>
 <20200319173326.oj4qs24x4ly5lrgt@treble>
 <20200319174028.azzaisoj5gbss7zk@treble>
 <20200319174550.4wpx4j357nw67nzz@treble>
 <20200320082613.GA20696@hirez.programming.kicks-ass.net>
 <202003201131.9B688BC@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202003201131.9B688BC@keescook>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 20, 2020 at 11:35:37AM -0700, Kees Cook wrote:
> On Fri, Mar 20, 2020 at 09:26:13AM +0100, Peter Zijlstra wrote:
> > On Thu, Mar 19, 2020 at 12:45:50PM -0500, Josh Poimboeuf wrote:
> > > > On Thu, Mar 19, 2020 at 12:33:31PM -0500, Josh Poimboeuf wrote:
> > 
> > > > > Actually I suspect it's the __builtin_unreachable() annotation which is
> > > > > making UBSAN add the __builtin_trap()...  because I don't see any double
> > > > > UD2s for WARNs.
> > 
> > > Actually, removing __builtin_unreachable() *does* make the extra UD2 go
> > > away -- I forgot I had some silly debug code.
> > 
> > LOL, check this:
> > 
> > "Built-in Function: void __builtin_unreachable (void)
> > 
> >     If control flow reaches the point of the __builtin_unreachable, the
> >     program is undefined. It is useful in situations where the compiler
> >     cannot deduce the unreachability of the code. "
> > 
> > Which, I bet, is what makes UBSAN insert that __builtin_trap().
> > 
> > What a friggin mess :/
> 
> What I'd like is to be able to specify to UBSAN what function to call
> for the trap. I'd prefer to specify a well-defined exception handler,
> but at present, UBSAN just inserts __builtin_trap().
> 
> Can't objtool be told to ignore a ud2 that lacks an execution path to it?

It can ignore unreachable UD2s, if we think that's the right fix.

I was hoping we could find a way to get rid of the double UD2s, but I
couldn't figure out a way to do that when I looked at it last week.

-- 
Josh

