Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6DABFD37A
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 04:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfKODn1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 22:43:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:41792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726549AbfKODn1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 22:43:27 -0500
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B301D20723;
        Fri, 15 Nov 2019 03:43:26 +0000 (UTC)
Date:   Thu, 14 Nov 2019 22:43:24 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Viktor Rosendahl (BMW)" <viktor.rosendahl@gmail.com>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20191114224324.108486d8@oasis.local.home>
In-Reply-To: <20191115140213.74c5efe7@canb.auug.org.au>
References: <20191115140213.74c5efe7@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 15 Nov 2019 14:02:13 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> In file included from kernel/trace/trace.c:52:
> kernel/trace/trace.h:804:13: warning: 'latency_fsnotify' defined but not used [-Wunused-function]
>   804 | static void latency_fsnotify(struct trace_array *tr) { }
>       |             ^~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   91edde2e6ae1 ("ftrace: Implement fs notification for tracing_max_latency")
> 
> "inline" missing :-(
> 

Thanks for pointing that out, I'll go and fix this.


-- Steve


