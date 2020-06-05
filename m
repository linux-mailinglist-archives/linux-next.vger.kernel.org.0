Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452C81EEE9F
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 02:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgFEAEs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 20:04:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46485 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726016AbgFEAEr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 20:04:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591315486;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3ZEfFGX2brEg7XaCjWenhhqt8CmqT/i/JEA+8whSp1o=;
        b=BJVCws8DxJ2k+BsLffYr5d8i8zd+LXGJqmk1If5EUZ1DxeOsBXMiN0RGsy1XYheuEdIrVs
        vj8MPbItI0F2ag0+u7lCCl6OTUHKTNArz6Y9TGyYpwTytsqDGYXgXgJx9PyduFDe1Ygrjl
        lUOl2wLxSdA4JSWHKRvX4Sufx5DnJBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-dSxWr-iQP_6xAZ4bXyonYg-1; Thu, 04 Jun 2020 20:04:44 -0400
X-MC-Unique: dSxWr-iQP_6xAZ4bXyonYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20B8E1009600;
        Fri,  5 Jun 2020 00:04:43 +0000 (UTC)
Received: from treble (ovpn-116-170.rdu2.redhat.com [10.10.116.170])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D34A2707B1;
        Fri,  5 Jun 2020 00:04:41 +0000 (UTC)
Date:   Thu, 4 Jun 2020 19:04:39 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <20200605000439.v75kbagqcxvctqam@treble>
References: <20200605083715.1a6c29ce@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200605083715.1a6c29ce@canb.auug.org.au>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 05, 2020 at 08:37:15AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the origin tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> kernel/module.c: In function 'do_init_module':
> kernel/module.c:3593:2: error: implicit declaration of function 'module_enable_ro'; did you mean 'module_enable_x'? [-Werror=implicit-function-declaration]
>  3593 |  module_enable_ro(mod, true);
>       |  ^~~~~~~~~~~~~~~~
>       |  module_enable_x
> 
> Caused by commit
> 
>   e6eff4376e28 ("module: Make module_enable_ro() static again")
> 
> This config has neither CONFIG_ARCH_HAS_STRICT_MODULE_RWX or
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX set.  This failure was hidden in
> linux-next due to commit
> 
>   db991af02f11 ("module: break nested ARCH_HAS_STRICT_MODULE_RWX and STRICT_MODULE_RWX #ifdefs")
> 
> from the modules tree. I have cherry-picked that commit for today.

Sorry, I guessed we missed that dependency between the live-patching and
module trees.

Jessica, are you planning on sending a pull request?

-- 
Josh

