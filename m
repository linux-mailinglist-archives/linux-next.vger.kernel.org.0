Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28824424978
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 00:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbhJFWIq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 18:08:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhJFWIq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Oct 2021 18:08:46 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE6AA610A8;
        Wed,  6 Oct 2021 22:06:52 +0000 (UTC)
Date:   Wed, 6 Oct 2021 18:06:51 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Oct 5 (warnings: a. trace; b. mm/migrate)
Message-ID: <20211006180651.73f46f11@gandalf.local.home>
In-Reply-To: <6d8f22a1-5f54-aa2a-7628-1d98a7f0fb95@infradead.org>
References: <20211005190628.1f26b13d@canb.auug.org.au>
        <c1d9e328-ad7c-920b-6c24-9e1598a6421c@infradead.org>
        <20211006172207.11982951@gandalf.local.home>
        <6d8f22a1-5f54-aa2a-7628-1d98a7f0fb95@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 6 Oct 2021 14:32:21 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> >> a. randconfig: KCONFIG_SEED=0xBFBEA13C
> >> ../kernel/trace/trace.c:1712:13: error: 'trace_create_maxlat_file' defined but not used [-Werror=unused-function]
> >>    static void trace_create_maxlat_file(struct trace_array *tr,  
> > 
> > Does this fix it?
> > 
> > -- Steve  
> 
> Yes, thanks.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> 

I believe the proper tags are:

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

-- Steve
