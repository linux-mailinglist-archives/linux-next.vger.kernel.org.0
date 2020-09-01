Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 592E7258DF4
	for <lists+linux-next@lfdr.de>; Tue,  1 Sep 2020 14:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgIAMLJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Sep 2020 08:11:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:58586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728156AbgIAMKi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Sep 2020 08:10:38 -0400
Received: from coco.lan (ip5f5ad5cf.dynamic.kabel-deutschland.de [95.90.213.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9CAD206EF;
        Tue,  1 Sep 2020 12:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598962237;
        bh=kitMwPijbswHVuN3JXZb1QXD7bdhVtVtTidWKv0kyc4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=R6ue7GCgfQebQr1htcIjjl5fCf8QsKEBg26dOVVWxQZEtM2a9tCb+SWe7i9zyPI6A
         f1zEHgYRR92srsoOIVsWlCYL9U4OXqBTbjNmUmuaNrRS64lr1X67Vqs5dxhgewSNFY
         s/izY8dlF+sLe5YwD5pmJ5ucnZNQ02fZj7y9hrB4=
Date:   Tue, 1 Sep 2020 14:10:33 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: linux-next: Signed-off-by missing for commits in the v4l-dvb
 tree
Message-ID: <20200901141033.74489cff@coco.lan>
In-Reply-To: <20200901125216.5ae2ecbf@coco.lan>
References: <20200901190354.38b0d16c@canb.auug.org.au>
        <alpine.DEB.2.22.394.2009011205090.2533@hadrien>
        <20200901125216.5ae2ecbf@coco.lan>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Tue, 1 Sep 2020 12:52:16 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Hi Julia,
> 
> Em Tue, 1 Sep 2020 12:05:51 +0200 (CEST)
> Julia Lawall <julia.lawall@inria.fr> escreveu:
> 
> > On Tue, 1 Sep 2020, Stephen Rothwell wrote:
> > 
> > > Hi all,
> > >
> > > Commits
> > >
> > >   063a27cb9820 ("media: tm6000: drop unnecessary list_empty")
> > >   1c047c859965 ("media: saa7134: drop unnecessary list_empty")
> > >   3fdcea7c763a ("media: cx231xx: drop unnecessary list_empty")
> > >
> > > are missing a Signed-off-by from their author.  
> > 
> > My record of these patches all have their Signed-off-bys.  Mauro, do you
> > want me to send them again?
> 
> No need. Yeah, I received them with your SoB, at least on my e-mail.
> 
> The one I applied came from this pull request:
> 
> 	https://patchwork.linuxtv.org/project/linux-media/patch/87327e52-44cc-a2b8-c3fe-619bd6022264@xs4all.nl/
> 
> Unfortunately, it sounds that Hans already dropped the original tag:
> 
> 	https://git.linuxtv.org/hverkuil/media_tree.git/refs/tags
> 
> So, hard to know where the SoB got dropped. It could be due to some
> bug on my scripts - or it can be due to some issue when Hans picked
> them.
> 
> In any case, I'll rewrite the git history with your SoB properly
> added.


Ok, I was able to find a backup of the patch I applied, as my scripts
safe a copy before applying.

One of the scripts I use has a logic to get just the header of a message,
excluding the diff:

	$ githead.pl 0019-0040-cx231xx-drop-unnecessary-list_empty.patch
	[media] cx231xx: drop unnecessary list_empty
	# Original subject: [PATCH 3/7] [media] cx231xx: drop unnecessary list_empty
	
	# Meta data:
	GIT_AUTHOR_DATE=1595761108
	GIT_AUTHOR_NAME=Julia Lawall
	GIT_AUTHOR_EMAIL=Julia.Lawall@inria.fr
	# X-Patchwork-Submitter: Julia Lawall <Julia.Lawall@inria.fr>
	# X-Patchwork-Id: 65835
	# X-IronPort-AV: E=Sophos;i="5.75,398,1589234400";    d="scan'208";a="355309545"
	# Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org # Date: Sun, 26 Jul 2020 12:58:28 +0200
	# X-LSpam-Score: -2.4 (--)
	# X-LSpam-Report: No,  score=-2.4 required=5.0  tests=BAYES_00=-1.9,HEADER_FROM_DIFFERENT_DOMAINS=0.5,MAILING_LIST_MULTI=-1  autolearn=ham autolearn_force=no
	#
	list_for_each_entry is able to handle an empty list.
	The only effect of avoiding the loop is not initializing the
	index variable.
	Drop list_empty tests in cases where these variables are not
	used.
	
	Note that list_for_each_entry is defined in terms of list_first_entry,
	which indicates that it should not be used on an empty list.  But in
	list_for_each_entry, the element obtained by list_first_entry is not
	really accessed, only the address of its list_head field is compared
	to the address of the list head, so the list_first_entry is safe.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	<smpl>
	@@
	expression x,e;
	iterator name list_for_each_entry;
	statement S;
	identifier i;
	@@
	
	-if (!(list_empty(x))) {
	   list_for_each_entry(i,x,...) S

Among other things, such script ignores everything after /^---\n/
regex.

Yet, the smpl patch hit some bug on it, making it lose this part:

	- }
	 ... when != i
	? i = e
	</smpl>
	
	Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
	Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Because it contains this regex: /^-\s/

Making it think that this would have some mangled patch on it.

That part came from the old days where we used CVS (and later
mercurial) and some diffs were not strictly following the
pattern generated by git those days.

I changed my script to avoid this issue to happen again.

Thanks,
Mauro
