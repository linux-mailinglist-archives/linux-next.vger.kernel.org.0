Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E151A194456
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 17:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728317AbgCZQbT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 12:31:19 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:34263 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726163AbgCZQbS (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Mar 2020 12:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585240277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bL9wXvUQMS+ddhd8NC9VI5/YUqPHU2Be5Tj9XP870e0=;
        b=NtfE7pb/um5y0d4ZcYsZ1kSRpAcjFJJjOHi6Am4boS8//HgQun3baMT/+EXRdBfs5C2eOX
        cHfhPnpdHlORo7XPbpl4H91jhKG0UyMb1IhEhDw4txzEsERfwwgBq/Kj6FNHJ8F0flKR5b
        Hru4rELz+MjiThT7Z4D/vF78uv3yIDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-wgjBlCAMMXmyXXGdVGF3DA-1; Thu, 26 Mar 2020 12:31:15 -0400
X-MC-Unique: wgjBlCAMMXmyXXGdVGF3DA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C76F18A5500;
        Thu, 26 Mar 2020 16:31:14 +0000 (UTC)
Received: from treble (ovpn-112-176.rdu2.redhat.com [10.10.112.176])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F52B94B42;
        Thu, 26 Mar 2020 16:31:13 +0000 (UTC)
Date:   Thu, 26 Mar 2020 11:31:10 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 18 (objtool)
Message-ID: <20200326163110.n35lxcgkfcar7vd5@treble>
References: <20200319173101.wufpymi7obhqgoqd@treble>
 <20200319173326.oj4qs24x4ly5lrgt@treble>
 <20200319174028.azzaisoj5gbss7zk@treble>
 <20200319174550.4wpx4j357nw67nzz@treble>
 <20200320082613.GA20696@hirez.programming.kicks-ass.net>
 <202003201131.9B688BC@keescook>
 <20200324164433.qusyu5h7ykx3f2bu@treble>
 <202003241105.4707F983@keescook>
 <20200324222406.zg6hylzqux353jhq@treble>
 <202003252251.771EF5EC5F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202003252251.771EF5EC5F@keescook>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 25, 2020 at 10:57:02PM -0700, Kees Cook wrote:
> > In the meantime I can still change objtool to ignore unreachable UD2s if
> > there aren't any better ideas.
> 
> It'll still need the objtool change for CONFIG_UBSAN_TRAP, though based on
> the clang bug discussion, I'll probably _also_ be adding CONFIG_UBSAN_WARN
> which won't have an unreachable (and won't bloat the kernel). Testing
> still under way... it is possible that CONFIG_UBSAN_TRAP will go away
> in the future, though. If that happens, should I also remove the change
> at that time?

I'll go ahead and make the patch and post it soon.  It should be pretty
trivial.  We can always revert it if CONFIG_UBSAN_TRAP goes away.

-- 
Josh

