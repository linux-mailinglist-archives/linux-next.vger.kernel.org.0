Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784C743F1AE
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 23:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhJ1VdI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 17:33:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:52460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230476AbhJ1VdI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Oct 2021 17:33:08 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5A4D61056;
        Thu, 28 Oct 2021 21:30:39 +0000 (UTC)
Date:   Thu, 28 Oct 2021 17:30:38 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20211028173038.3e7d5518@gandalf.local.home>
In-Reply-To: <20211029081009.0fd1a83a@canb.auug.org.au>
References: <20211028232345.5ffa43bc@canb.auug.org.au>
        <20211028091646.15f6e6de@gandalf.local.home>
        <20211029081009.0fd1a83a@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 29 Oct 2021 08:10:09 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > > Documentation/trace/histogram.rst:1766: WARNING: Inline emphasis start-string without end-string.    
> > 
> > I have no idea what that means.  
> 
> I assume you need to quote (with '\') the '*' on line 1767 (?).

Yeah, I figured that out when Kalesh sent me the patch to fix it ;-)

-- Steve
