Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B9443B429
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 16:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236643AbhJZOcY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 10:32:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235132AbhJZOcS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 10:32:18 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1CDA610F8;
        Tue, 26 Oct 2021 14:29:53 +0000 (UTC)
Date:   Tue, 26 Oct 2021 10:29:52 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Heiko Carstens <hca@linux.ibm.com>,
        Jiri Olsa <jolsa@redhat.com>, linux-next@vger.kernel.org
Subject: Re: Upcoming merge conflict between ftrace and s390 trees
Message-ID: <20211026102952.78eb9fd4@gandalf.local.home>
In-Reply-To: <your-ad-here.call-01635255744-ext-3853@work.hours>
References: <YXAqZ/EszRisunQw@osiris>
        <your-ad-here.call-01635255744-ext-3853@work.hours>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 26 Oct 2021 15:42:24 +0200
Vasily Gorbik <gor@linux.ibm.com> wrote:

> On Wed, Oct 20, 2021 at 04:40:39PM +0200, Heiko Carstens wrote:
> > just as heads-up: there will be an upcoming merge conflict between
> > ftrace and s390 trees in linux-next which will cause a compile error
> > for s390.
> > 
> > With the s390 tree this commit is already in linux-next:
> > https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git/commit/?h=features&id=c316eb4460463b6dd1aee6d241cb20323a0030aa
> > 
> > And soon this patch will likely be within the ftrace tree:
> > https://lore.kernel.org/lkml/20211008091336.33616-9-jolsa@kernel.org/
> > 
> > Maybe Steven could reply to this when he applies it.  
> 
> Hi Stephen,
> 
> could you please pick up this fixup from Heiko in linux-next on top of
> s390 tree? ftrace changes mentioned are now in linux-next and this fixup
> is needed to avoid s390 build error.

Ah, I missed this.

Yes, I have that code pushed to my for-next branch.

-- Steve
