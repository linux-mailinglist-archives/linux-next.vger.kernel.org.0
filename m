Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D30F418A245
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 19:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgCRSYA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 14:24:00 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:60440 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726596AbgCRSYA (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 14:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584555839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1BhPTAKqSYELkcumcDrePcKLFULRe/8k/IRbjYPD+Us=;
        b=aFvqpM0Q7oB0vA5/KHOmtj/bmwvRddSdNus3bGEKu2J0vq+u1XY2XRwfqE3ZnUMnpGTgPt
        6o93AuZLEemxJcUay223/pZ3Q9hRDAWuDX/mc/BDjWelq6dOyaBEJQMeHWma4S9sL7/6BB
        Pd2yYK238x0U6zbnwxED4MY+f2B+hhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-Gr67u16UMG-dw6JrsGdxxg-1; Wed, 18 Mar 2020 14:23:57 -0400
X-MC-Unique: Gr67u16UMG-dw6JrsGdxxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50D95107ACCA;
        Wed, 18 Mar 2020 18:23:56 +0000 (UTC)
Received: from treble (unknown [10.10.110.4])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C08E119756;
        Wed, 18 Mar 2020 18:23:54 +0000 (UTC)
Date:   Wed, 18 Mar 2020 13:23:52 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: Tree for Mar 18 (objtool)
Message-ID: <20200318182352.2dgwwl4ugbwndi4x@treble>
References: <20200318220920.48df2e76@canb.auug.org.au>
 <d7dc5b4a-9a7e-ccf7-e00e-2e7f0e79a9bc@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d7dc5b4a-9a7e-ccf7-e00e-2e7f0e79a9bc@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 09:48:01AM -0700, Randy Dunlap wrote:
> On 3/18/20 4:09 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200317:
> > 
> 
> Hi,
> 
> For some reason, the attached .config file generates over 350 objtool warnings.
> There are all "unreachable instruction" warnings.
> 
> Here is a small sample:
> 
> mm/page-writeback.o: warning: objtool: __set_page_dirty_nobuffers()+0x25b: unreachable instruction
> kernel/sched/fair.o: warning: objtool: load_balance()+0x54c: unreachable instruction
> kernel/power/process.o: warning: objtool: freeze_kernel_threads()+0x115: unreachable instruction
> mm/readahead.o: warning: objtool: read_cache_pages_invalidate_page()+0x1b5: unreachable instruction
> kernel/power/suspend.o: warning: objtool: suspend_devices_and_enter()+0x101f: unreachable instruction
> kernel/sched/rt.o: warning: objtool: dequeue_top_rt_rq()+0x67: unreachable instruction

This seems to be caused by 

  545ed6816b72 ("ubsan: add trap instrumentation option")

Kees, any idea why that commit causes at least some BUG() statements to
output an extra UD2?

-- 
Josh

