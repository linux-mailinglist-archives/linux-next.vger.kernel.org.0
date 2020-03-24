Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70181191BC6
	for <lists+linux-next@lfdr.de>; Tue, 24 Mar 2020 22:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgCXVNO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 17:13:14 -0400
Received: from merlin.infradead.org ([205.233.59.134]:33770 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgCXVNO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Mar 2020 17:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=UBXTlfBB5V6oYxQxCHfMAgYy2LlHqpP4L4e/SUdnMD8=; b=OPCVrxwrDknGD1joDQe03rmnNE
        72LgREK3mBMeamsc7gEiKlBNomk45jzZWIQQvLAt0Q9CgvmBBXJPV2yGTF/4LaBMBOk5TRzED7CJS
        YLCKvhv7P1UQ/Vwy4ostNG3SrRx4QVwIGh1Z5oWVkgLIxscU4+Nbg7SBlMUSs4SLQoSX+0ba14Cxx
        xNlgAQxuFxcxPj0aFYdgVp5dAFV4i4/4Maca2y0SilePnJyP6acrX+CJoO22MwcFYpTAXHeJwlce1
        zyYAlgxGu87puwW0rcbJgZ/xR6/tEb3jEebyW3kqz5CqNZOG0dU//pm7IZ4C/wYP7H1AWRUu5R+0y
        /tqDdS3A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGqrC-0005Yd-CA; Tue, 24 Mar 2020 21:13:06 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 35847983502; Tue, 24 Mar 2020 22:13:03 +0100 (CET)
Date:   Tue, 24 Mar 2020 22:13:03 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        andreyknvl@google.com, aryabinin@virtuozzo.com
Subject: Re: linux-next: Tree for Mar 20 (objtool warnings)
Message-ID: <20200324211303.GQ2452@worktop.programming.kicks-ass.net>
References: <20200320201539.3a3a8640@canb.auug.org.au>
 <ca0078e2-89b5-09a7-f61e-7f2906900622@infradead.org>
 <20200324164709.ux4riz7v7uy32nlj@treble>
 <39035493-9d5b-9da3-10d4-0af5d1cdb32a@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39035493-9d5b-9da3-10d4-0af5d1cdb32a@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 24, 2020 at 10:53:05AM -0700, Randy Dunlap wrote:
> >> kernel/kcov.o: warning: objtool: __sanitizer_cov_trace_pc()+0x89: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
> >>
> 
> config-r1510 is attached.
> and kcov.o is attached.

I'm thinking this is because of commit:

  0d6958a70483 kcov: collect coverage from interrupts

Which has:

@@ -1230,6 +1230,9 @@ struct task_struct {

+       bool                            kcov_softirq;

@@ -145,9 +157,10 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru

+       if (!in_task() && !(in_serving_softirq() && t->kcov_softirq))

And this __ubsan_handle_load_invalid_value() is verifying a bool is 0,1.

Another reason to hate on _Bool I suppose...

Let me see what to do about that... :/
