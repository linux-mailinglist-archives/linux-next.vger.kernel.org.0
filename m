Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB9018BEA0
	for <lists+linux-next@lfdr.de>; Thu, 19 Mar 2020 18:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgCSRp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Mar 2020 13:45:58 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:29366 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727382AbgCSRp6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Mar 2020 13:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584639957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2qmYUYBn0oNBTimXYQKRYpTD4KGsYm/rG15XCQh8C2U=;
        b=cDKBQqPYF97poGLFiJzUe2864qFWMMJdTh+CbljQSnBRS0COAcmkEwlM6pgZIcE+pgNlAt
        y+epT4kmJV/6tQnqC4APV1EYZVVPD+yC/cSbaPILGiNjVwSa11tH+AhRELYk5YKbi5rqsU
        +zcdUaVJy0kGPXhCVwkX3yzh2fn7pYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-ljtr03pCN96pm7sB_D4Qcw-1; Thu, 19 Mar 2020 13:45:56 -0400
X-MC-Unique: ljtr03pCN96pm7sB_D4Qcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A9448017CC;
        Thu, 19 Mar 2020 17:45:54 +0000 (UTC)
Received: from treble (unknown [10.10.110.4])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 50971BBBF6;
        Thu, 19 Mar 2020 17:45:53 +0000 (UTC)
Date:   Thu, 19 Mar 2020 12:45:50 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: Tree for Mar 18 (objtool)
Message-ID: <20200319174550.4wpx4j357nw67nzz@treble>
References: <20200318220920.48df2e76@canb.auug.org.au>
 <d7dc5b4a-9a7e-ccf7-e00e-2e7f0e79a9bc@infradead.org>
 <20200318182352.2dgwwl4ugbwndi4x@treble>
 <20200318200542.GK20730@hirez.programming.kicks-ass.net>
 <20200319173101.wufpymi7obhqgoqd@treble>
 <20200319173326.oj4qs24x4ly5lrgt@treble>
 <20200319174028.azzaisoj5gbss7zk@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200319174028.azzaisoj5gbss7zk@treble>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 19, 2020 at 12:40:32PM -0500, Josh Poimboeuf wrote:
> On Thu, Mar 19, 2020 at 12:33:31PM -0500, Josh Poimboeuf wrote:
> > On Thu, Mar 19, 2020 at 12:31:05PM -0500, Josh Poimboeuf wrote:
> > > ... except the __builtin_trap() UD2 seems to be coming *after* the BUG
> > > UD2.  Could it be the BUG UD2 itself which is convincing UBSAN to add
> > > the __builtin_trap()?
> > 
> > Actually I suspect it's the __builtin_unreachable() annotation which is
> > making UBSAN add the __builtin_trap()...  because I don't see any double
> > UD2s for WARNs.
> 
> Scratch that theory, removing the __builtin_unreachable() from
> unreachable() doesn't make the double UD2 go away.

Actually, removing __builtin_unreachable() *does* make the extra UD2 go
away -- I forgot I had some silly debug code.

Not sure what the "fix" should be though.

-- 
Josh

