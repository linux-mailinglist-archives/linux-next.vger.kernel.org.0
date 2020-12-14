Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 950872DA439
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 00:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgLNXik (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 18:38:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:49938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728198AbgLNXij (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 18:38:39 -0500
Date:   Mon, 14 Dec 2020 17:37:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607989078;
        bh=fnAS6MkH1ixn2rQeMGUq7HxFriFYnNoItGMTUmcfAig=;
        h=From:To:Cc:Subject:In-Reply-To:From;
        b=NHw1acSvYZ19g8mfuNopLwS2bQt5oSFyC46FGYyUO3UAvqfbu51zueYVR7bamJaYH
         6q/4ZPZeEX3gvTgOP2DRJ8sTQveOxjhnubSEDtK4vtyr52jbHLyjdZahO/J2md7iXG
         JfDrQ6flgqlfYEsgV4OwXIrHEg8p9uWc5U5LOTwuF2wQFx0UJrir4NtER0mcJCEWJM
         qgSrF4VoMOSvXUcQWFkdMsbLjy5MEkvKlMzJBGeAdpcP6WUfQdawbxZ6RZ8XKILD/Y
         Z1s5Sw/vOYFMiRXslqhaIHYBDOtmgxVFPcBKbYCzVyeGKrtVO3kmeVZ/65vNZ+RY9w
         f4i8b3jL803Qw==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jay Vosburgh <jay.vosburgh@canonical.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sean V Kelley <sean.v.kelley@intel.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the pci tree
Message-ID: <20201214233757.GA276422@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_MM3y9XWcSBSbm23yv6=wM=egvU-RvD9HReaLzo56J35w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 14, 2020 at 06:18:54PM -0500, Alex Deucher wrote:
> On Mon, Dec 14, 2020 at 6:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Tue, Dec 15, 2020 at 07:34:31AM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > On Tue, 8 Dec 2020 13:56:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > Today's linux-next merge of the amdgpu tree got a conflict in:
> > > >
> > > >   drivers/pci/pcie/err.c
> > > >
> > > > between commits:
> > > >
> > > >   8f1bbfbc3596 ("PCI/ERR: Rename reset_link() to reset_subordinates()")
> > > >   0791721d8007 ("PCI/ERR: Use "bridge" for clarity in pcie_do_recovery()")
> > > >   05e9ae19ab83 ("PCI/ERR: Add pci_walk_bridge() to pcie_do_recovery()")
> > > >
> > > > from the pci tree and commit:
> > > >
> > > >   36a8901e900a ("PCI/ERR: Fix reset logic in pcie_do_recovery() call")
> > > >
> > > > from the amdgpu tree.
> > > >
> > > > I fixed it up (I think - see below) and can carry the fix as
> > > > necessary. This is now fixed as far as linux-next is concerned, but any
> > > > non trivial conflicts should be mentioned to your upstream maintainer
> > > > when your tree is submitted for merging.  You may also want to consider
> > > > cooperating with the maintainer of the conflicting tree to minimise any
> > > > particularly complex conflicts.
> >
> > Huh.  It's sub-optimal to change this core code via both the PCI and
> > the amdgpu tree, with no heads-up to me.
> >
> > 400b308d388a ("PCI/ERR: Fix reset logic in pcie_do_recovery() call")
> > (apparently in the amdgpu tree) doesn't have a Link: tag to the
> > posting of the patch, where there was quite a lot of useful discussion
> > that should be connected somehow.
> >
> > I think the posting was
> > https://lore.kernel.org/r/cbba08a5e9ca62778c8937f44eda2192a2045da7.1595617529.git.sathyanarayanan.kuppuswamy@linux.intel.com
> >
> > I had deferred merging this patch so I could merge Sean's RCEC work
> > first, and then resolve the conflict when merging *this* patch.
> 
> I don't plan to merge this upstream via my tree.  I was just carrying
> it in my drm-next branch because we have a number of users that depend
> on it for working DPC and a number of people use this branch for
> testing.

OK, thanks.  FWIW, it's currently marked "Changes Requested" in
patchwork, so it isn't really going anywhere right now:

https://patchwork.kernel.org/project/linux-pci/patch/cbba08a5e9ca62778c8937f44eda2192a2045da7.1595617529.git.sathyanarayanan.kuppuswamy@linux.intel.com/

I have merged Sean's series, so this would be a good time to try to
move this one forward.
