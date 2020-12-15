Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD88C2DB288
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 18:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbgLOR0n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 12:26:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:33808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729673AbgLOR0e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Dec 2020 12:26:34 -0500
Date:   Tue, 15 Dec 2020 11:25:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608053153;
        bh=32+bL+GQpDgEOQNB7TiigXJBGuTJfVnYj0Ea8NfaoBc=;
        h=From:To:Cc:Subject:In-Reply-To:From;
        b=uVdNlx/moYtZZ+HLjk36KTRFSzrz3RvqJUBOD7WpB01d8BBuGcTyL2ahimDw5a6fu
         Nmo/BjpVEhqZ3cNfZpBNzWZZALtGPk9zlGPJgdSLih/ZREsZ3XB7CdxfVp8bJW/5qO
         hJdyEK+KWPjxsRkYCId92wQ98aXi7Er5XxuiSUUdQtb7weUwwfPf+fs0gOvOQiRJaq
         yaItN2Z+KpWyXp6mwk+eaah/CfzsYqpEaxQMGcY3Ur1on0GoXr0eOqTxRsSVuq7OcI
         PvKRoLy87+bwuS2sc0O4ZkIwdlAbkcT9jKeGxNTVlRwJs74E+N1eNlHxsriOwIXpER
         ovQ7/lsvoSi7A==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jay Vosburgh <jay.vosburgh@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sean V Kelley <sean.v.kelley@intel.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the pci tree
Message-ID: <20201215172552.GA310296@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bebf5028-9a3e-59fe-ea70-c5e5e61fcb72@linux.intel.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 14, 2020 at 10:52:26PM -0800, Kuppuswamy, Sathyanarayanan wrote:
> On 12/14/20 3:37 PM, Bjorn Helgaas wrote:
> > On Mon, Dec 14, 2020 at 06:18:54PM -0500, Alex Deucher wrote:
> > > On Mon, Dec 14, 2020 at 6:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Tue, Dec 15, 2020 at 07:34:31AM +1100, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > > 
> > > > > On Tue, 8 Dec 2020 13:56:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > > > 
> 
> > > 
> > > I don't plan to merge this upstream via my tree.  I was just carrying
> > > it in my drm-next branch because we have a number of users that depend
> > > on it for working DPC and a number of people use this branch for
> > > testing.
> > 
> > OK, thanks.  FWIW, it's currently marked "Changes Requested" in
> > patchwork, so it isn't really going anywhere right now:
> > 
> > https://patchwork.kernel.org/project/linux-pci/patch/cbba08a5e9ca62778c8937f44eda2192a2045da7.1595617529.git.sathyanarayanan.kuppuswamy@linux.intel.com/
>
> There is a newer version of this patch set. Please use it when
> merging this patch.
> https://patchwork.kernel.org/project/linux-pci/list/?series=370855

That one is still pending.  I haven't had a chance to look at it yet,
but seems like there's no point in carrying the superseded version in
drm-next.
