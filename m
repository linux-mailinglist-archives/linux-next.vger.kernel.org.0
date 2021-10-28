Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5D643E1D5
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 15:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhJ1NRG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 09:17:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:34810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230305AbhJ1NRG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Oct 2021 09:17:06 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB8FA60F0F;
        Thu, 28 Oct 2021 13:14:38 +0000 (UTC)
Date:   Thu, 28 Oct 2021 09:14:37 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Wang <yun.wang@linux.alibaba.com>
Subject: Re: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20211028091437.7a3d0838@gandalf.local.home>
In-Reply-To: <20211028163111.7f09f7eb@canb.auug.org.au>
References: <20211028163111.7f09f7eb@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On Thu, 28 Oct 2021 16:31:11 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the ftrace tree got conflicts in:
> 
>   include/linux/trace_recursion.h
>   kernel/trace/ftrace.c

Yeah, this is one of the times I will be sending Linus a link to the merge
of his tree in my repo for my pull request. I have this ready.

> @@@ -162,12 -192,22 +165,18 @@@
>   	current->trace_recursion = val;
>   	barrier();
>   
> + 	preempt_disable_notrace();
> + 

The only difference between what I have and yours, is that I nuked the
extra space ;-)

Thanks,

-- Steve


>  -	return bit + 1;
>  +	return bit;
>   }
>   
