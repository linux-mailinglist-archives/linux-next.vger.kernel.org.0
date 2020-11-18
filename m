Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022C02B81BF
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 17:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgKRQYe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 11:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgKRQYe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Nov 2020 11:24:34 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FAEC0613D4;
        Wed, 18 Nov 2020 08:24:33 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9B16835A;
        Wed, 18 Nov 2020 16:24:33 +0000 (UTC)
Date:   Wed, 18 Nov 2020 09:24:32 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] ftrace/documentation: Fix RST C code blocks
Message-ID: <20201118092432.1407b900@lwn.net>
In-Reply-To: <20201118105127.4a7b02ef@gandalf.local.home>
References: <20201116173502.392a769c@canb.auug.org.au>
        <20201116124338.76a522e1@gandalf.local.home>
        <20201116122432.796af13b@lwn.net>
        <20201116152552.11572354@gandalf.local.home>
        <20201116132929.7f59943e@lwn.net>
        <20201118103502.24e90f7c@gandalf.local.home>
        <20201118105127.4a7b02ef@gandalf.local.home>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 18 Nov 2020 10:51:27 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 18 Nov 2020 10:35:02 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> > 
> > Some C code in the ftrace-users.rst document is missing RST C block
> > annotation, which has to be added.
> > 
> > Link: https://lore.kernel.org/r/20201116173502.392a769c@canb.auug.org.au
> > 
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> >  
> 
> Jon,
> 
> You want to take this through your tree?

The changes that created the warning in the first place are in the ftrace
tree, right?  So it seems that the fix should be there as well; it won't
apply to the docs tree.

Thanks,

jon
