Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D83154E2DB0
	for <lists+linux-next@lfdr.de>; Mon, 21 Mar 2022 17:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348101AbiCUQRT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Mar 2022 12:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242154AbiCUQRS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Mar 2022 12:17:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7844663CB;
        Mon, 21 Mar 2022 09:15:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 031FF612CE;
        Mon, 21 Mar 2022 16:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79B0C340E8;
        Mon, 21 Mar 2022 16:15:50 +0000 (UTC)
Date:   Mon, 21 Mar 2022 12:15:49 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        mhiramat@kernel.org, ast@kernel.org, hjl.tools@gmail.com,
        rick.p.edgecombe@intel.com, rppt@kernel.org,
        linux-toolchains@vger.kernel.org, Andrew.Cooper3@citrix.com,
        ndesaulniers@google.com
Subject: Re: linux-next: build warnings after merge of the tip tree
Message-ID: <20220321121549.1c8588c5@gandalf.local.home>
In-Reply-To: <20220321121209.3b95e406@gandalf.local.home>
References: <20220321140327.777f9554@canb.auug.org.au>
        <Yjh11UjDZogc3foM@hirez.programming.kicks-ass.net>
        <Yjh3xZuuY3QcZ1Bn@hirez.programming.kicks-ass.net>
        <20220321112805.1393f9b9@gandalf.local.home>
        <YjiiDFHIQg78QwSb@hirez.programming.kicks-ass.net>
        <20220321121209.3b95e406@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 21 Mar 2022 12:12:09 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> > > funcB:
> > > 	call __fentry__    
> > 			push funcB on trace-stack  
> > > 
> > > 	[..]    
> > 	call __fexit__
> > 			pop trace-stack until empty
> > 			  'exit funcB'
> > 			  'exit funcA'  
> 
> And what happens if funcC called funcA and it too was on the stack. We pop
> that too? But it's not done yet, because calling of funcA was not a tail
> call.

And I just thought of another issue, where even my solution wont fix it.
What happens if we trace funcA but not funcB? How do we get to trace the
end of funcA?

-- Steve
