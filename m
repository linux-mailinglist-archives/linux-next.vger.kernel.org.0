Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2075A33393F
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 10:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhCJJwv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 04:52:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:60550 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232292AbhCJJwZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Mar 2021 04:52:25 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1615369943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BzpWVQgMrjdLxjzqjLNOJBINgLByL8FbMn1TCm9MLpU=;
        b=uNVIyVuu1EaOJBxUk/vvyC9SQJqBYq8n5Q4IYKCX/29tT8VWk0KekZAnzqVhHpQFDf+/ae
        iLmYr86ilvyT67s4mahVc/Cz7An3vqdQWQE30aWbSJCYuyI74IzkMt03p5F9gN90PCMT5a
        1tjIL7aSVtwdJjvt73GrwMsChVOsPBc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id CF3E0AE42;
        Wed, 10 Mar 2021 09:52:23 +0000 (UTC)
Date:   Wed, 10 Mar 2021 10:52:23 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yafang Shao <laoar.shao@gmail.com>
Subject: Re: linux-next: Tree for Mar 10 (lib/test_printf.c)
Message-ID: <YEiW12IkiVothTb2@alley>
References: <20210310150217.046fef19@canb.auug.org.au>
 <62857b03-c12c-6841-72ae-d94f00a3a868@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62857b03-c12c-6841-72ae-d94f00a3a868@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue 2021-03-09 21:57:48, Randy Dunlap wrote:
> On 3/9/21 8:02 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> 
> on i386 (at least):
> 
> ../lib/test_printf.c: In function 'page_flags_test':
> ../lib/test_printf.c:595:17: error: 'sec' undeclared (first use in this function); did you mean 'sem'?
>   page_flags |= (sec & SECTIONS_MASK) << SECTIONS_PGSHIFT;
>                  ^~~
> 
> 
> Should that be 'section'?

Yup, it looks like.

There seems to be one more problem found by the test robot:

   lib/test_printf.c:595:17: note: each undeclared identifier is reported only once for each function it appears in
>> lib/test_printf.c:612:17: error: 'tag' undeclared (first use in this function)
     612 |  page_flags |= (tag & KASAN_TAG_MASK) << KASAN_TAG_PGSHIFT;


Yafang is going to send a fix. I have temporary removed the
problematic patch from printk/linux.git, for-next branch.

I am sorry for the troubles. Anyway, it is great that linux-next
and all the test robots are around.

Best Regards,
Petr
