Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBA02DB3A3
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 19:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730621AbgLOSXF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 13:23:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:45212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729576AbgLOSW5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Dec 2020 13:22:57 -0500
Date:   Tue, 15 Dec 2020 12:22:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608056533;
        bh=jqSIrJHJj7MsgySqZ9za+C23pQD6c/5BB+/am0txRHg=;
        h=From:To:Cc:Subject:In-Reply-To:From;
        b=el+wdHoFIUr+RwiQmkHzykih212NTlfIjbQbVtfum6PdX71LxjHIClxu9eKZq/S0L
         NM4dG1Lylb26SW/AmqYovlvCnWKNlaoeiwv2ODdozi6451c6SsEIqWvVze1pVpIz2j
         yZUlMF0gvmmf2+4y4IAE8RVwX/T9y6EK5gb0o5o8vxiby8RMbPI738xB7KuI+k5x+L
         AUyfMxo7waA99aUj9tzV48PAdvRqxO0NP4AsAgfZ3f+eceoI+kTFhzJ7M+G2QZE2cy
         /+xV4AGoZ8CCyCL6n8igj2p1dw1D1kgNPnu/5cKAOkdxJbGX+MR8hLWspRTFKynd/E
         lQ7bEb7H2yVmQ==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jay Vosburgh <jay.vosburgh@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sean V Kelley <sean.v.kelley@intel.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the pci tree
Message-ID: <20201215182211.GA315827@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_Pp08peDVs6U6V4PqBYVdUgLp-pvrFzFOf8OjbGHO6Z4g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 15, 2020 at 01:04:25PM -0500, Alex Deucher wrote:
> On Tue, Dec 15, 2020 at 12:25 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Mon, Dec 14, 2020 at 10:52:26PM -0800, Kuppuswamy, Sathyanarayanan wrote:
> > > On 12/14/20 3:37 PM, Bjorn Helgaas wrote:
> > > > On Mon, Dec 14, 2020 at 06:18:54PM -0500, Alex Deucher wrote:
> > > > > On Mon, Dec 14, 2020 at 6:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > > On Tue, Dec 15, 2020 at 07:34:31AM +1100, Stephen Rothwell wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > On Tue, 8 Dec 2020 13:56:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > > > > >
> > >
> > > > >
> > > > > I don't plan to merge this upstream via my tree.  I was just carrying
> > > > > it in my drm-next branch because we have a number of users that depend
> > > > > on it for working DPC and a number of people use this branch for
> > > > > testing.
> > > >
> > > > OK, thanks.  FWIW, it's currently marked "Changes Requested" in
> > > > patchwork, so it isn't really going anywhere right now:
> > > >
> > > > https://patchwork.kernel.org/project/linux-pci/patch/cbba08a5e9ca62778c8937f44eda2192a2045da7.1595617529.git.sathyanarayanan.kuppuswamy@linux.intel.com/
> > >
> > > There is a newer version of this patch set. Please use it when
> > > merging this patch.
> > > https://patchwork.kernel.org/project/linux-pci/list/?series=370855
> >
> > That one is still pending.  I haven't had a chance to look at it yet,
> > but seems like there's no point in carrying the superseded version in
> > drm-next.
> 
> I'll go ahead and drop it.

Or pick up the newer version.  You probably still have users that
depend on it, and I think it's too late for me to merge the new one for
this cycle.

Bjorn
