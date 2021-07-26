Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9453D597B
	for <lists+linux-next@lfdr.de>; Mon, 26 Jul 2021 14:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233991AbhGZLrm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Jul 2021 07:47:42 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:55796 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbhGZLrm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Jul 2021 07:47:42 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 4991F21F83;
        Mon, 26 Jul 2021 12:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1627302490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QU8cYwdmsrvtBphYVUXeLz/ruYBbJBccan55c4kG70c=;
        b=Sc0PLAp+3Sctjax5ynY7A1H0jpBc86Kpsj08x6eojdXFJfYun/HMGGaj4tZ0+3ilvs3Wrw
        9bRwT3c8yQePfD4PwylTdxLgyFr7VkOnIo/dhcaS9i/i0K0PTd8hfUgl7rGn5j2xGi3oKp
        oxlY0QKRsZklkfymDOPH+HndZrKo0as=
Received: from suse.cz (unknown [10.100.224.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id D6FAEA3B8E;
        Mon, 26 Jul 2021 12:28:09 +0000 (UTC)
Date:   Mon, 26 Jul 2021 14:28:09 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Chris Down <chris@chrisdown.name>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the printk tree
Message-ID: <YP6qWSAy3HN0DwYt@alley>
References: <20210720162423.75f61ce0@canb.auug.org.au>
 <YPa/D8tSyk7dw1/l@chrisdown.name>
 <YPbABBSTkN+xNY0w@chrisdown.name>
 <87o8aqt7qn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8aqt7qn.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun 2021-07-25 15:16:00, Jonathan Corbet wrote:
> Chris Down <chris@chrisdown.name> writes:
> 
> > Chris Down writes:
> >>+Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
> >
> > Well, let's actually Cc them this time...
> >
> >>Stephen Rothwell writes:
> >>>After merging the printk tree, today's linux-next build (htmldocs)
> >>>produced this warning:
> >>>
> >>>kernel/printk/printk.c:1: warning: 'printk' not found
> >>>
> >>>Introduced by commit
> >>>
> >>> 337015573718 ("printk: Userspace format indexing support")
> >>>
> >>>I presume that "printk" is referred to elsewhere in the documentation
> >>>as being in this file.
> >>
> >>Hmm, this is an interesting one, because I think we still generally 
> >>just want to refer to the API as being `printk()`. Changing it all 
> >>over the place seems wrong. As you'd imagine, there are quite a few 
> >>references to this name, so it requires a lot of noise all over the 
> >>docs and inline comments.
> >>
> >>Jonathan and other docs folks, how can one tell Sphinx that when it 
> >>sees printk() it's referring to a function-like macro, or otherwise 
> >>squelch this reasonably? :-)
> 
> The problem is that you moved printk(), but left the associated
> kerneldoc comment tied to _printk(), which isn't what you really want to
> document.  The fix should look something like the attached.
> 
> Thanks,
> 
> jon
> 
> --------snip here----------------------
> printk: Move the printk() kerneldoc comment to its new home
> 
> Commit 337015573718 ("printk: Userspace format indexing support") turned
> printk() into a macro, but left the kerneldoc comment for it with the (now)
> _printk() function, resulting in this docs-build warning:
> 
>   kernel/printk/printk.c:1: warning: 'printk' not found
> 
> Move the kerneldoc comment back next to the (now) macro it's meant to
> describe and have the docs build find it there.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

This looks better than my variant. I have pushed it into
printk/linux.git, branch for-5.15-printk-index.

Best Regards,
Petr
