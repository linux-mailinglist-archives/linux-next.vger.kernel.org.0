Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C3F369CDD
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 00:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbhDWWkH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Apr 2021 18:40:07 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:45071 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbhDWWkG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Apr 2021 18:40:06 -0400
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4FRq3K2hbxzyNW;
        Sat, 24 Apr 2021 08:39:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1619217567;
        bh=EZR0VDFjXPfxh++r+2ICAHeSSgthWg6cmyWhRs26S6o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a8mbJ+Q4/qasfT9DzMPoMKi8sx04F5QNFvtQAmtC7w5FGJQFUbExlvoEK4I6oN3u9
         ET18nrLy8xMZBuSE8VVsuXdNIA0aiDBYfJqsGK4Rbk/CCAze8hW3c107aNEEwbQSbp
         cqJY5/5HHFRpyrkug4IjCv0vvpr9abnvCWsZdEinrcgjOsFtgix1/1MP9yqu87eM5L
         vf/QHscfStS2YvfpGAqLdrTQ10TEjt/VeXW8mTwD5pZEkt/98V6IBKWOjjCN7RLDAD
         JzF93BluJGIPLqPkyVLpCr6tRMN7XUsfQb0lhw9px0ND3ZoQO89q5T1CHHnR12Q4Rn
         dTmRwSytj7Ldw==
Date:   Sat, 24 Apr 2021 08:39:24 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Prike Liang <Prike.Liang@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210424083924.2e2c7cbc@elm.ozlabs.ibm.com>
In-Reply-To: <CADnq5_NGLC719T9Mx1wR+aLi8Ybwr8-ocCSYCRe=uNEBvJ+R4A@mail.gmail.com>
References: <20210416124044.53d4beee@canb.auug.org.au>
        <20210421164024.42bc068f@canb.auug.org.au>
        <CADnq5_NGLC719T9Mx1wR+aLi8Ybwr8-ocCSYCRe=uNEBvJ+R4A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Alex,

On Fri, 23 Apr 2021 16:36:50 -0400 Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Apr 21, 2021 at 2:40 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Fri, 16 Apr 2021 12:40:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> > >
> > > After merging the amdgpu tree, today's linux-next build (powerpc
> > > ppc64_defconfig) produced this warning:
> > >
> > > drivers/pci/quirks.c: In function 'quirk_amd_nvme_fixup':
> > > drivers/pci/quirks.c:312:18: warning: unused variable 'rdev' [-Wunused-variable]
> > >   312 |  struct pci_dev *rdev;
> > >       |                  ^~~~
> > >
> > > Introduced by commit
> > >
> > >   9597624ef606 ("nvme: put some AMD PCIE downstream NVME device to simple suspend/resume path")  
> >
> > I am still seeing this warning.  
> 
> I no longer have that patch in my tree.  Was this an old build?

I guess my email crossed with the patch removal as I not longer get the
warning. Thanks.

-- 
Cheers,
Stephen Rothwell
