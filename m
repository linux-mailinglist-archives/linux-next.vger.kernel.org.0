Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 383281865D9
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 08:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbgCPHqP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 03:46:15 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:40305 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729941AbgCPHqP (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 03:46:15 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id EA5B4779;
        Mon, 16 Mar 2020 03:46:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 16 Mar 2020 03:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=2U48b1OkAarqc0xXfeMnJgB2CZI
        yBVsUti28LUm6swI=; b=j9Ir1QOtXSyFb93o2AU2DvWfuBlsyxYWt7R9r1nxZMs
        1IcxMMriU9GhfZVWta18UtAcjuZJlHoWvNNw3VuyTq6jCjP7+Ek51E3di95R1XJ+
        SodMOWuonhi42fZgOtIuBCXLsSHWegn0Oj71bSs7ejPBTgaec1Yi9YQm+FUjHIOc
        AqkRZzUoU3xQV2M77M8WAr8kOYV3zsk0zUGugHXoaaE2dOJaKxTohJtSv4Zmbt8R
        /ziqbmEGhbEKKvdwrT4nArCU6p7aLabNxbHQZgFSrfGmPrBjQsnldtploi3ZmqcY
        S+CmgdhSbdZvNSqdvF9p73hDeKlu6Ir/z7wZlGEn82w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2U48b1
        OkAarqc0xXfeMnJgB2CZIyBVsUti28LUm6swI=; b=tya1M8he5NU4mTmBHAvyAz
        pqcMPZ3UUXQWejjCHJuyPTEhtguZ5NGLyP7Rv+34ehSSMDa1pztHszVHDCzAtVHM
        PA3HO9tDsjMLTt7go6eLT25PPdW5wpACfFHSYTeTyYPiaa+sJbUMNZPO9R/qLQpN
        qS/uXCrtl/XglwZWsGBrUBrf5bg/gnYf+J3l1ZD/CF/UjA1jMh4JTRhiqjKCN9Sq
        Z/m0qW39Ky3ZYzIol6ILhZC58/Ek2vbumM8zr6oclY5pbM4G0WriSJbZUETLJ5G4
        IKlBJ0GLaNd2oU7SOrP7pjvrNLshsuFxTlK6fhawvGZ13GXQizFKZc4Y1opJVsTw
        ==
X-ME-Sender: <xms:xS5vXo-BM4crKnz9IWM1xbMueFJG_QWUr71ylmjLgYpy-HZiJyywFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefvddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:xS5vXsE6sWFts2uUyIxMomyo_FUc0kvelpTv-5GNWWpojVGAXFgNMw>
    <xmx:xS5vXr7uQLMbzoBOLymol94s4nDZ0GcESsTpNJSRJqJ1102j2DqGwg>
    <xmx:xS5vXjnkaCtd0GUe_1ByzqY881zwd9FosFBMYibnGEjARnhOklJunw>
    <xmx:xS5vXv0kAeYyRDqRB_A-ev-VwOrW9vCLUL_G54oslj4A9R6gLHvWzQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id C15443280063;
        Mon, 16 Mar 2020 03:46:12 -0400 (EDT)
Date:   Mon, 16 Mar 2020 08:46:11 +0100
From:   Greg KH <greg@kroah.com>
To:     Jiri Slaby <jslaby@suse.cz>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tty tree with Linus' tree
Message-ID: <20200316074611.GA3128046@kroah.com>
References: <20200310144013.6df85b46@canb.auug.org.au>
 <20200310090422.GB2445065@kroah.com>
 <b518b4d6-b959-525f-1425-cdcb1277958f@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b518b4d6-b959-525f-1425-cdcb1277958f@suse.cz>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 16, 2020 at 07:38:33AM +0100, Jiri Slaby wrote:
> On 10. 03. 20, 10:04, Greg KH wrote:
> > On Tue, Mar 10, 2020 at 02:40:13PM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Today's linux-next merge of the tty tree got a conflict in:
> >>
> >>   drivers/tty/vt/selection.c
> >>
> >> between commits:
> >>
> >>   4b70dd57a15d ("vt: selection, push console lock down")
> >>   e8c75a30a23c ("vt: selection, push sel_lock up")
> >>
> >> from Linus' tree and commits:
> >>
> >>   9256d09f1da1 ("vt: selection, create struct from console selection globals")
> >>   bc80932cc25a ("vt: selection, indent switch-case properly")
> >>
> >> from the tty tree.
> >>
> >> I fixed it up (I think - see below) and can carry the fix as necessary.
> >> This is now fixed as far as linux-next is concerned, but any non trivial
> >> conflicts should be mentioned to your upstream maintainer when your tree
> >> is submitted for merging.  You may also want to consider cooperating
> >> with the maintainer of the conflicting tree to minimise any particularly
> >> complex conflicts.
> > 
> > Thank you for this, I hadn't gotten to it yet.
> > 
> > Your merge looks the same as mine, and I've pushed out the merge
> > resolution in my tree.
> 
> Ah, the two merges differ, actually.
> 
> Stepen's (cdc26c076ff):
> 
> -       if (sel_cons != vc_cons[fg_console].d) {
>  -      mutex_lock(&vc_sel.lock);
> +       if (vc_sel.cons != vc_cons[fg_console].d) {
> 
> 
> Yours (cb05c6c82fb0):
>  -      if (sel_cons != vc_cons[fg_console].d) {
>  +      mutex_lock(&vc_sel.lock);
>  +      if (vc_sel.cons != vc_cons[fg_console].d) {
> 
> > Jiri, can you double-check to verify that the merge is correct in my
> > tree?
> 
> So this is now a tty tree problem. Will send a patch in a minute.

Thanks for fixing this up, now merged.

greg k-h
