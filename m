Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76D92194FD7
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 04:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgC0DzU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 23:55:20 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:49567 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727708AbgC0DzU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Mar 2020 23:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585281319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jbUZbS8mLCFbjFYPv9xZPzpFZFr2HhSo9vjkHm0xqCQ=;
        b=h2N8pfD/AWfFpEePUi91ZPJxUhzGcb2vHwYpKIGZHweRzSQJ/ZAdhQJ96CdJwtqfpbtsGj
        g6vSNACa6xBdoPIm40Hv6EZIgyLhNVaEgekwEtb/wiFTOJDSmiNLfNGxYfTJDdINcHhmAF
        9GpCvbReYMWLm6WFHuF8jTaVj2itDF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-FV5CEmW1NISu3HHUcOuYjQ-1; Thu, 26 Mar 2020 23:55:17 -0400
X-MC-Unique: FV5CEmW1NISu3HHUcOuYjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0194518C43D6;
        Fri, 27 Mar 2020 03:55:16 +0000 (UTC)
Received: from treble (unknown [10.10.110.12])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5792D9B93E;
        Fri, 27 Mar 2020 03:55:14 +0000 (UTC)
Date:   Thu, 26 Mar 2020 22:55:11 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 18 (objtool)
Message-ID: <20200327035511.7lqv5ij4e745vzv2@treble>
References: <20200319174028.azzaisoj5gbss7zk@treble>
 <20200319174550.4wpx4j357nw67nzz@treble>
 <20200320082613.GA20696@hirez.programming.kicks-ass.net>
 <202003201131.9B688BC@keescook>
 <20200324164433.qusyu5h7ykx3f2bu@treble>
 <202003241105.4707F983@keescook>
 <20200324222406.zg6hylzqux353jhq@treble>
 <202003252251.771EF5EC5F@keescook>
 <20200326163110.n35lxcgkfcar7vd5@treble>
 <202003261133.814BEE9F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202003261133.814BEE9F@keescook>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 26, 2020 at 11:36:10AM -0700, Kees Cook wrote:
> On Thu, Mar 26, 2020 at 11:31:10AM -0500, Josh Poimboeuf wrote:
> > On Wed, Mar 25, 2020 at 10:57:02PM -0700, Kees Cook wrote:
> > > > In the meantime I can still change objtool to ignore unreachable UD2s if
> > > > there aren't any better ideas.
> > > 
> > > It'll still need the objtool change for CONFIG_UBSAN_TRAP, though based on
> > > the clang bug discussion, I'll probably _also_ be adding CONFIG_UBSAN_WARN
> > > which won't have an unreachable (and won't bloat the kernel). Testing
> > > still under way... it is possible that CONFIG_UBSAN_TRAP will go away
> > > in the future, though. If that happens, should I also remove the change
> > > at that time?
> > 
> > I'll go ahead and make the patch and post it soon.  It should be pretty
> > trivial.  We can always revert it if CONFIG_UBSAN_TRAP goes away.
> 
> Awesome, thanks very much. After digging into the WARN-style option,
> it seems that TRAP is unlikely to go away because it's Clang only;
> GCC doesn't support the "minimal runtime" option. Yay compilers.

Oh well...

> Anyway, I'll still get the WARN mode sent out. Thanks for looking at this;
> can you CC me on the patch? I'm trying to get more familiar with objtool
> so I don't have to bug you when objtool is angered by crazy stuff I do. ;)

Will do.  I know objtool tends to get in the way of adding cool features
sometimes.  More eyes on the objtool code are definitely welcome.

-- 
Josh

