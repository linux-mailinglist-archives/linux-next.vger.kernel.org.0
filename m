Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972E02B528B
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 21:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730230AbgKPU3b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 15:29:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730751AbgKPU3a (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 15:29:30 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB4AC0613CF;
        Mon, 16 Nov 2020 12:29:30 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A499E6E6;
        Mon, 16 Nov 2020 20:29:30 +0000 (UTC)
Date:   Mon, 16 Nov 2020 13:29:29 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20201116132929.7f59943e@lwn.net>
In-Reply-To: <20201116152552.11572354@gandalf.local.home>
References: <20201116173502.392a769c@canb.auug.org.au>
        <20201116124338.76a522e1@gandalf.local.home>
        <20201116122432.796af13b@lwn.net>
        <20201116152552.11572354@gandalf.local.home>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 16 Nov 2020 15:25:52 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 16 Nov 2020 12:24:32 -0700
> Jonathan Corbet <corbet@lwn.net> wrote:
> 
> > The problem is those literal blocks.  The easiest fix will be to just use
> > the double-colon notation to indicate a literal block, so the paragraph
> > above would end with "...start your code with::".  Note that there's a few
> > of them to fix.  
> 
> Would something like the below work? I think I fixed the other places with
> issues and for consistency, replaced the ".. code-block:: c" with just "::"
> usage throughout the file.

That will work.  It will also have the effect of removing C syntax
highlighting from the formatted output; that is fine with me, but others
are more attached to it.

jon
