Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 404644D6855
	for <lists+linux-next@lfdr.de>; Fri, 11 Mar 2022 19:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350833AbiCKSOk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Mar 2022 13:14:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350731AbiCKSOk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Mar 2022 13:14:40 -0500
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0245115678D;
        Fri, 11 Mar 2022 10:13:34 -0800 (PST)
Received: from kbox (c-73-140-2-214.hsd1.wa.comcast.net [73.140.2.214])
        by linux.microsoft.com (Postfix) with ESMTPSA id 48C4D20B7178;
        Fri, 11 Mar 2022 10:13:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 48C4D20B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1647022414;
        bh=XbDHx/jSLSkMdXfZzf5CbubsDCrQ0HgtiCggr0K60b0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QsxQW9EXkzduSiEiWxdkdSzIxBOZfvClcshFRHcUQdOI9TANkJ/aZmGFz88ExbBBv
         pIipzTRT/YdY3melIuS1SSMNDy7kjpLpefWkCde15DjPSdPsWpzpD+DMPjC0Idp6XG
         cCXLm2CZSlGAKrTOawvz1DrjkTXNgUzdU6pj73Sg=
Date:   Fri, 11 Mar 2022 10:13:28 -0800
From:   Beau Belgrave <beaub@linux.microsoft.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org
Subject: Re: [next] arm64: allmodconfig: kernel BUG at
 include/linux/page-flags.h:509
Message-ID: <20220311181328.GA1904@kbox>
References: <CADYN=9+xY5Vku3Ws5E9S60SM5dCFfeGeRBkmDFbcxX0ZMoFing@mail.gmail.com>
 <20220311112426.7e3cf434@gandalf.local.home>
 <20220311171123.GA1675@kbox>
 <20220311130453.54a4e0b2@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311130453.54a4e0b2@gandalf.local.home>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-19.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 11, 2022 at 01:04:53PM -0500, Steven Rostedt wrote:
> On Fri, 11 Mar 2022 09:11:23 -0800
> Beau Belgrave <beaub@linux.microsoft.com> wrote:
> 
> > Maybe I am mistaken, but I remember reading in the case of a kernel
> > allocated page shared with user space they must be reserved. It was
> > stated that the PTE may not know the PFN belongs to user or kernel.
> > 
> > If this is not the case, I don't see why we couldn't allocate zero'd
> > pages as you describe. We just need to make sure we don't crash user
> > processes touching the page if it does get paged out (and ideally not
> > slow down their execution).
> 
> Anything allocated by the kernel via alloc_page() will never be paged out.
> As the kernel may use it in any location (including NMIs). The ftrace ring
> buffer allocates its pages this way.
> 

Is that true as well for the user process that has this mapped? Will the
user process virtual memory that maps to this ever page it out? I
believe that was the concern. My understanding is by reserving in
kernel, even though it won't page out on that side, marks the user side
entry to not let it page out.

The other thing is that this patch applied to 5.10.X on ARM64 does not
appear to hit this. Is it some weird interaction with something else or
was 5.10.X just getting lucky?

Thanks,
-Beau
