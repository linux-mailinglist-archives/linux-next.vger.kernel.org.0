Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3B13D0B6B
	for <lists+linux-next@lfdr.de>; Wed, 21 Jul 2021 11:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236196AbhGUIkG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jul 2021 04:40:06 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:50696 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237277AbhGUIRT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jul 2021 04:17:19 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id DCB031FE7D;
        Wed, 21 Jul 2021 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1626857825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=u0kC18X/luRjFIG/rcDP9X4vD1QUzspWnVNHzWoy7wQ=;
        b=e/4mBaqKMgOr3tXAjWQrJxDHRDbwqWOmEQtL060VVGu0BpQBkcy2JoV/ZOSOkljL6ZWSek
        dqqz3yU3FLZxJTMHn63ZRopUHcvId+T/Ph8mcGM7uneV4z8E+8qO5KWCN6/qbdyS6Ww3Rb
        a/hGoGTXMC74BKnvnkkdEYn5tZBJ42g=
Received: from suse.cz (pathway.suse.cz [10.100.12.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 936BEA3B81;
        Wed, 21 Jul 2021 08:57:05 +0000 (UTC)
Date:   Wed, 21 Jul 2021 10:57:05 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Chris Down <chris@chrisdown.name>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20210721085705.fy6hrc5n3qtlwehq@pathway.suse.cz>
References: <20210720174300.018cc765@canb.auug.org.au>
 <CA+G9fYs2ApGkrJHL5HOO1jEJZ714itVp+Tdj7fWzkG+JWc=pOA@mail.gmail.com>
 <YPbBfdz9srIpI+bb@chrisdown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPbBfdz9srIpI+bb@chrisdown.name>
User-Agent: NeoMutt/20170912 (1.9.0)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue 2021-07-20 13:28:45, Chris Down wrote:
> Hey folks,
> 
> Naresh Kamboju writes:
> > On Tue, 20 Jul 2021 at 13:13, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > 
> > > Hi all,
> > > 
> > > After merging the printk tree, today's linux-next build (mips allnoconfig)
> > > failed like this:
> > > 
> > > arch/mips/kernel/genex.o: In function `handle_mcheck_int':
> > > (.text+0x190c): undefined reference to `printk'
> > > arch/mips/kernel/genex.o: In function `handle_reserved_int':
> > > (.text+0x1c8c): undefined reference to `printk'
> > > 
> > > Caused by commit
> > > 
> > >   337015573718 ("printk: Userspace format indexing support")
> > 
> > Following MIPS builds failed at our end due the reported problem.
> 
> Thanks: missed this as I made sure to change all .S files to use _printk,
> but this is in a .h file included in a .S file.
> 
> Here's what's needed. :-)
> 
> diff --git arch/mips/include/asm/asm.h arch/mips/include/asm/asm.h
> index ea4b62ece336..2f8ce94ebaaf 100644
> --- arch/mips/include/asm/asm.h
> +++ arch/mips/include/asm/asm.h
> @@ -114,7 +114,7 @@ symbol		=	value
>  		.set	push;				\
>  		.set	reorder;			\
>  		PTR_LA	a0, 8f;				\
> -		jal	printk;				\
> +		jal	_printk;			\
>  		.set	pop;				\
>  		TEXT(string)
>  #else

Chris, could you please send it as a proper patch?

Best Regards,
Petr
