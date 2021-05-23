Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2AF38DAB5
	for <lists+linux-next@lfdr.de>; Sun, 23 May 2021 11:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbhEWJcG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 23 May 2021 05:32:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:50570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231658AbhEWJcD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 May 2021 05:32:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6C6561151;
        Sun, 23 May 2021 09:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621762231;
        bh=Ek7SYvfllGWZGSWDSHP+3ZRuuazWRLNL0F0GgxvDRMc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oSeUOLM5644vUF+6LchLVgrPjHLA8abBOgmA3v3PjcM0ZYSrsMldWVbU3lKFhkJbp
         worAHAeDsir6xbLe2U10d6ToBF6qGrnmOFetS8XZD0ytzG58CgBbVei0MWZMSYVMtR
         kDyI2lgsIwnzYaq1AwL1o9iAcfvTUXcOqky55FPwIWvq9SVoAt+skuNF4vGEwHgpDj
         HvR6XJrXJJsI6pWyz9jEK//RQEpW5FgpKYgMja9ZgSN4GK3kOXBhkPCHwDTqQBOMk3
         Xl9VQ4nblPLUWOdCNd2CXTWhndM7DONs0zRiFsUuJs05gz+zaLex4Z+05YCiJzT7qC
         pfF3W0FFtIT4Q==
Date:   Sun, 23 May 2021 11:30:26 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: linux-next: Fixes tag needs some work in the v4l-dvb-next tree
Message-ID: <20210523113026.4a3a7f4f@coco.lan>
In-Reply-To: <20210523083636.GA15522@gofer.mess.org>
References: <20210523124953.7a5108b4@canb.auug.org.au>
        <20210523083636.GA15522@gofer.mess.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Sun, 23 May 2021 09:36:36 +0100
Sean Young <sean@mess.org> escreveu:

> Hi Mauro,
> 
> On Sun, May 23, 2021 at 12:49:53PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > In commit
> > 
> >   7c8a36e1fb30 ("media: rc: i2c: Fix an error message")
> > 
> > Fixes tag
> > 
> >   Fixes: acaa34bf06e9 ('media: rc: implement zilog transmitter")
> > 
> > has these problem(s):
> > 
> >   - Subject has leading but no trailing quotes
> >   - Subject does not match target commit subject
> >     Just use
> > 	git log -1 --format='Fixes: %h ("%s")'  
> 
> Now that we have media-staging, can the commit message be ammended?

If the patch didn't reach media_tree, yes, but this patch can't
be fixed anymore, as it is too old:

	commit acaa34bf06e963f0b9481a3c16bfd6867e2369a0
	Author:     Sean Young <sean@mess.org>
	AuthorDate: Sat Oct 21 08:16:47 2017 -0400
	Commit:     Mauro Carvalho Chehab <mchehab@kernel.org>
	CommitDate: Thu Dec 14 09:58:20 2017 -0500

	    media: rc: implement zilog transmitter

We need to double-check why linux-next is detecting it as a new one.

-

Linux-next should be pulling media work from those tree branches:

- v4l-dvb-fixes/fixes, e. g.:
	git://linuxtv.org/media_tree.git fixes
- v4l-dvb/master, e. g.:
	git://linuxtv.org/media_tree.git master
- v4l-dvb-next/master, e. g.:
	git://linuxtv.org/mchehab/media-next.git master

In the past, I was using media-next (a.k.a. v4l-dvb-next at linux-next
nomenclature) to solve some special cases like when I need to deal with
patches that depends on other trees, or when I want to submit a separate
PR for some patches.

-

After the last merge window, I modified my workflow in order to:

1. be able of correcting problems on media patches, if pointed after
   being merged at linux-next;
2. keep picking patches during the merge window.

The change is simple: I'm now pushing non-fixes stuff initially at
media-next master branch. Outside the merge window, the contents of 
this branch is identical to the contents of the media stage tree:

	git://linuxtv.org/media_stage.git

But I'll freeze changes there at the end of -rc6.

A couple of days after media-stage is merged at linux-next
(via media-next/linux-next tree), if no issues, I merge the
patches back at media_tree.

If something gets wrong in the mean time, I simply rebase
media-stage, fixing the issue again and push it back to the
media-next/linux-next tree.

-

Now, I can't understand why this specific patch had a trouble
detected today, as it was this patch is already upstream:

	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=acaa34bf06e9

Apparently since 4.15-rc1:

	$ git describe acaa34bf06e9
	v4.15-rc1-204-gacaa34bf06e9

Thanks,
Mauro
