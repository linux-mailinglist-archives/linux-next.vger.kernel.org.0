Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD07C43E1DF
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 15:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhJ1NTP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 09:19:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:35202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229981AbhJ1NTP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Oct 2021 09:19:15 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDF9C60F0F;
        Thu, 28 Oct 2021 13:16:47 +0000 (UTC)
Date:   Thu, 28 Oct 2021 09:16:46 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kalesh Singh <kaleshsingh@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20211028091646.15f6e6de@gandalf.local.home>
In-Reply-To: <20211028232345.5ffa43bc@canb.auug.org.au>
References: <20211028232345.5ffa43bc@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 28 Oct 2021 23:23:45 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/trace/histogram.rst:1766: WARNING: Inline emphasis start-string without end-string.

I have no idea what that means.

-- Steve

> 
> Introduced by commit
> 
>   2d2f6d4b8ce7 ("tracing/histogram: Document expression arithmetic and constants")
> 

