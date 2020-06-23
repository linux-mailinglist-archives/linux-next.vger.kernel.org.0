Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F5D2055A7
	for <lists+linux-next@lfdr.de>; Tue, 23 Jun 2020 17:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732902AbgFWPSM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 11:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732881AbgFWPSL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2020 11:18:11 -0400
Received: from casper.infradead.org (unknown [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76B1C061573;
        Tue, 23 Jun 2020 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ZFLuUOUiK4sCeVKGNEPdBiHWizlWFU7GA58A4jGEFH8=; b=mb0Rgrh+cJgG5mNsBNyw2psk2O
        8FAY9rg4VfIIwTVRLUD6whsJjONmi5l1C7H+7rixTyk97C0HLMgdDHZBtBpWuRlGjzZZsElFzI7St
        FogUfdToQeP2BKKTZMYqM9JSpx7Jdm9N9ph6x+kRdFaCEc8jmu+sG1JagKTGgZiUzw2mUCLMQeuIq
        SgtFgCyD/0oxYc7ABUT+0/hWmIFRpv0+uZ0uW2DLgKJX+23hxgY031q+0B1ojpp6GFvnIC1H6vdlT
        Z07cgPnjUp1WSHH0G4ZNHO8t2oOSuqTpnkIbUiW+sSHMyJzuqo5/pz2M/sxhZQMHeq5lXSKTk8B09
        lqwi6EvQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jnkg8-0007Ak-Ut; Tue, 23 Jun 2020 15:17:41 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8E6AE30477A;
        Tue, 23 Jun 2020 17:17:38 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 77256234EBA51; Tue, 23 Jun 2020 17:17:38 +0200 (CEST)
Date:   Tue, 23 Jun 2020 17:17:38 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20200623151738.GK4817@hirez.programming.kicks-ass.net>
References: <20200621131554.5a662afe@canb.auug.org.au>
 <20200623102655.6d16e610@canb.auug.org.au>
 <20200623121637.GA8444@alley>
 <20200623121937.GA9671@gondor.apana.org.au>
 <20200623142858.GB8444@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623142858.GB8444@alley>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 23, 2020 at 04:28:58PM +0200, Petr Mladek wrote:

> PS: And yes, it makes sense to push both patches via a single tree to
> make sure that the lockdep.h split is done first.

That's what I got you tip/locking/header for, pull that topic branch
into your tree.
