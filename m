Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 421D3DFE7F
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 09:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbfJVHko (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Oct 2019 03:40:44 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47396 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728768AbfJVHko (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Oct 2019 03:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=J3O3pMDF095s1EZO0TLM8EP21VVibuJrHnO1JV78+Rw=; b=lhgGwcj/uXuPE6gdMXIMU54pT
        JQa9+NrIh9mC+NOw4pBYkNOJOpnym22dTO/7MXK8Cj3wZx/n47AFZsLdtm0i0nEFlB6/Gd/p2mVM8
        c0o+rd1THrl8NAj5914NdavleVP9AMN5E6Z6bo68RiwcKgP2K3gQ9IXU3NsnhlWTUToG/At5ZK+GH
        9+P3O17KagE4hIQqvWgnkU/8i/oLLeMcVsi/4SFub5pneZGdsB6ipfNXDGc78qHneztZUE2huGiwW
        gTTjtAlP7Ade+mhM7kWTV5uph7AN/0RqoHNnOYGkiwRKIOtD2a2JpmPbBKj3f+0Mh5pJCNnsEeZeL
        Se0KSkbgQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iMomS-0001DF-MD; Tue, 22 Oct 2019 07:40:36 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 13E78300EBF;
        Tue, 22 Oct 2019 09:39:36 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 2C72F20420897; Tue, 22 Oct 2019 09:40:34 +0200 (CEST)
Date:   Tue, 22 Oct 2019 09:40:34 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>, linux@rasmusvillemoes.dk,
        cyphar@cyphar.com, keescook@chromium.org
Subject: Re: linux-next: Tree for Oct 18 (objtool)
Message-ID: <20191022074034.GK1817@hirez.programming.kicks-ass.net>
References: <20191018180300.090dbcb9@canb.auug.org.au>
 <40de4e26-450e-b932-3d73-e833c8aeaa2e@infradead.org>
 <20191021123549.GC1817@hirez.programming.kicks-ass.net>
 <20191021131149.GA19358@hirez.programming.kicks-ass.net>
 <20191021131947.yih3wqjbfroaj4dz@wittgenstein>
 <20191021134759.GG1800@hirez.programming.kicks-ass.net>
 <20191021193652.lfccehm37dkkofp7@wittgenstein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021193652.lfccehm37dkkofp7@wittgenstein>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 21, 2019 at 09:36:53PM +0200, Christian Brauner wrote:
> Ok, so I take it you route that patch somehwere through tip?
> I'm happy with the ubsan fix:

Yeah, I'll go make a real patch with Changelog of it and stick it in
tip.

> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

Thanks!
