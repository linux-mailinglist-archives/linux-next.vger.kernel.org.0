Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA30134F564
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 02:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhCaARS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 20:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbhCaARC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 20:17:02 -0400
X-Greylist: delayed 2144 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 30 Mar 2021 17:17:02 PDT
Received: from gimli.rothwell.id.au (gimli.rothwell.id.au [IPv6:2404:9400:2:0:216:3eff:fee1:997a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF7EC061574;
        Tue, 30 Mar 2021 17:17:02 -0700 (PDT)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4F96Lz16hBzyd1;
        Wed, 31 Mar 2021 11:16:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1617149820;
        bh=93HAt3FYQfyd9HrVKQg+TwNp3vFOYJkRDVBNXPnzLHA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fgpbJTXVn9M/y+DnubnnODTiILtFpoVkrRFJJ0y4YDpnlYfMpbUa02JKPLI2rGJhR
         8OTnk8XhyhXoomAVuZEUrNoWJcii6jzrD+SrQl9CE2P5Pm+HUzviq7vK6IK/hYPiEU
         sGeU/3TjiEH9nA8/jjBLJNMU0jWrt4GeP15vfFFqtTwrvuvSfzuuXF+uRzt0vNMZKi
         dm39BSSXFsIflaCQqDZzG/2cGZQ1xl+weBGYfe0jfihrUmC/BxXirDBLBbsNwkluzv
         dr2lfwNvL4VsZXBL+NvojAGmszjty1R/nkVp7COoDngR4V17dSCb2sxpvVHYtLpSFO
         dIBhKfkQAbQIA==
Date:   Wed, 31 Mar 2021 11:16:57 +1100
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Frank Rowand <frank.rowand@sony.com>,
        Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the overlayfs tree
Message-ID: <20210331111657.0babeb05@elm.ozlabs.ibm.com>
In-Reply-To: <CAJfpeguWeWp=648jtvaxNc+RFShTGDa=_gMDuq72qznt5LqQvw@mail.gmail.com>
References: <20210329201426.78d4b28b@canb.auug.org.au>
        <CAJfpeguWeWp=648jtvaxNc+RFShTGDa=_gMDuq72qznt5LqQvw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Miklos,

On Mon, 29 Mar 2021 11:28:10 +0200 Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> On Mon, Mar 29, 2021 at 11:14 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the overlayfs tree, today's linux-next build (htmldocs)  
> 
> I think you mixed up drivers/of/overlay.c with fs/overlay/.

You are entirely correct and I have no idea how I managed that :-(

-- 
Cheers,
Stephen Rothwell
