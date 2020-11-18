Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3152B81D4
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 17:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgKRQ0y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 11:26:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:56706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgKRQ0y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 11:26:54 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB37F24819;
        Wed, 18 Nov 2020 16:26:52 +0000 (UTC)
Date:   Wed, 18 Nov 2020 11:26:51 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] ftrace/documentation: Fix RST C code blocks
Message-ID: <20201118112651.0b1c9944@gandalf.local.home>
In-Reply-To: <20201118092432.1407b900@lwn.net>
References: <20201116173502.392a769c@canb.auug.org.au>
        <20201116124338.76a522e1@gandalf.local.home>
        <20201116122432.796af13b@lwn.net>
        <20201116152552.11572354@gandalf.local.home>
        <20201116132929.7f59943e@lwn.net>
        <20201118103502.24e90f7c@gandalf.local.home>
        <20201118105127.4a7b02ef@gandalf.local.home>
        <20201118092432.1407b900@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 18 Nov 2020 09:24:32 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> > Jon,
> > 
> > You want to take this through your tree?  
> 
> The changes that created the warning in the first place are in the ftrace
> tree, right?  So it seems that the fix should be there as well; it won't
> apply to the docs tree.

Bah, I forgot the report was on linux-next and not mainline.

OK, I'll take it, but can you give an ack?

-- Steve
