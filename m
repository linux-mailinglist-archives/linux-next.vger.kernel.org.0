Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3C5DEE48
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 15:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbfJUNsW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 09:48:22 -0400
Received: from merlin.infradead.org ([205.233.59.134]:56440 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfJUNsW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 09:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ZGvSSfQE1bXs7b7/Y+GLH35ZxrQDn8J3d5rnHf5CV+E=; b=dtH8QkLxrlpazRw+GU7abukNE
        vi5dhJEo4f3b/XNkeqGV3z697us3OCDEFktmPiNn9eHB+wczWNNqvsF/DFVFxEg32oXVO2wg6JneF
        Uyn92R+ro9isBYAnb26842pk6Z95wFbQcVwrrAs32eXBbftSJCR6iaJzqm4tEHFNnpGvQUZkXS7f/
        ibbVIcjANLdXp95vnP7neL3kuuwwK4flfuoBGblNON1vA3AnZNEIkxYBAtMc9fCcxjuTOpfRNiP6D
        lZ88JLB3M9Ar9zGmEu3+MsMwJaMzt1Vgfr9wWn3hc6M7z7Y23/ZzPmOjzSvqn+/F8zOAcsAadvyO6
        +Kih6e10Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iMY2U-0005R3-1V; Mon, 21 Oct 2019 13:48:02 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B93693070DC;
        Mon, 21 Oct 2019 15:47:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 414B5201EF68E; Mon, 21 Oct 2019 15:47:59 +0200 (CEST)
Date:   Mon, 21 Oct 2019 15:47:59 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>, linux@rasmusvillemoes.dk,
        cyphar@cyphar.com, keescook@chromium.org
Subject: Re: linux-next: Tree for Oct 18 (objtool)
Message-ID: <20191021134759.GG1800@hirez.programming.kicks-ass.net>
References: <20191018180300.090dbcb9@canb.auug.org.au>
 <40de4e26-450e-b932-3d73-e833c8aeaa2e@infradead.org>
 <20191021123549.GC1817@hirez.programming.kicks-ass.net>
 <20191021131149.GA19358@hirez.programming.kicks-ass.net>
 <20191021131947.yih3wqjbfroaj4dz@wittgenstein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021131947.yih3wqjbfroaj4dz@wittgenstein>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 21, 2019 at 03:19:48PM +0200, Christian Brauner wrote:
> On Mon, Oct 21, 2019 at 03:11:49PM +0200, Peter Zijlstra wrote:

> > By popular request; here's that alternative. Completely untested :-)
> 
> Am I not getting some mails? :)

You're not on the 'right' IRC channels :-)

> I prefer this one as it allows us to avoid working around this in
> usercopy.c. Should especially make if this potentially helps in other
> cases as well?

That was Josh's argument too.

Personally I think GCC is being a moron here, because with value range
analysis it should be able to prove the shift-UB cannot happen (the <
sizeof(unsigned long) conditions on both), but alas, it emits the UBSAN
calls anyway.
