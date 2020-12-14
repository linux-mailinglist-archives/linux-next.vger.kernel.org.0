Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7092DA409
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 00:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbgLNXS3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 18:18:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:47930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404570AbgLNXQx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 18:16:53 -0500
Date:   Mon, 14 Dec 2020 17:16:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607987771;
        bh=VDiT4zQJACxUWCyCxi9Omcil0WlrHQZewv2kMdAXzNU=;
        h=From:To:Cc:Subject:In-Reply-To:From;
        b=rBlhxqKXXYCJqh+9/FioygZVTiFzbeO//MSiCJmDMG9CFnqmH0DWOa163f83eq10G
         0EESRSAIRd+ZxczOO6pIWZE1ba9I+BSdCSFsUQdqtX7xE0odq5LtOmEUsUDPL8eFYS
         g+6r/RfzjPpj/aaEUYWoJgDckBRBERIouJYZLPpJIWr/whHVa/w7g2Z76d4hyYkn9+
         S57MmfT9pKmcBkUjyXGcsKNubh161kUyAoipWQBx0pIOsguhXoIVKubFpH7hEv3nW7
         dBWUOD6wMw7uYH9Ms7h/mE/I7sFK/jQ9bwEUXS22PfRMpA+Mh0QkuqiMjdiVTA+IS3
         ND1QrHAIhAwjA==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jay Vosburgh <jay.vosburgh@canonical.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sean V Kelley <sean.v.kelley@intel.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the pci tree
Message-ID: <20201214231609.GA266793@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215073431.37720731@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 15, 2020 at 07:34:31AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 8 Dec 2020 13:56:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the amdgpu tree got a conflict in:
> > 
> >   drivers/pci/pcie/err.c
> > 
> > between commits:
> > 
> >   8f1bbfbc3596 ("PCI/ERR: Rename reset_link() to reset_subordinates()")
> >   0791721d8007 ("PCI/ERR: Use "bridge" for clarity in pcie_do_recovery()")
> >   05e9ae19ab83 ("PCI/ERR: Add pci_walk_bridge() to pcie_do_recovery()")
> > 
> > from the pci tree and commit:
> > 
> >   36a8901e900a ("PCI/ERR: Fix reset logic in pcie_do_recovery() call")
> > 
> > from the amdgpu tree.
> > 
> > I fixed it up (I think - see below) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.

Huh.  It's sub-optimal to change this core code via both the PCI and
the amdgpu tree, with no heads-up to me.

400b308d388a ("PCI/ERR: Fix reset logic in pcie_do_recovery() call")
(apparently in the amdgpu tree) doesn't have a Link: tag to the
posting of the patch, where there was quite a lot of useful discussion
that should be connected somehow.

I think the posting was
https://lore.kernel.org/r/cbba08a5e9ca62778c8937f44eda2192a2045da7.1595617529.git.sathyanarayanan.kuppuswamy@linux.intel.com

I had deferred merging this patch so I could merge Sean's RCEC work
first, and then resolve the conflict when merging *this* patch.

> > diff --cc drivers/pci/pcie/err.c
> > index 510f31f0ef6d,4a2735b70fa6..000000000000
> > --- a/drivers/pci/pcie/err.c
> > +++ b/drivers/pci/pcie/err.c
> > @@@ -146,61 -146,49 +146,82 @@@ out
> >   	return 0;
> >   }
> >   
> >  +/**
> >  + * pci_walk_bridge - walk bridges potentially AER affected
> >  + * @bridge:	bridge which may be a Port, an RCEC, or an RCiEP
> >  + * @cb:		callback to be called for each device found
> >  + * @userdata:	arbitrary pointer to be passed to callback
> >  + *
> >  + * If the device provided is a bridge, walk the subordinate bus, including
> >  + * any bridged devices on buses under this bus.  Call the provided callback
> >  + * on each device found.
> >  + *
> >  + * If the device provided has no subordinate bus, e.g., an RCEC or RCiEP,
> >  + * call the callback on the device itself.
> >  + */
> >  +static void pci_walk_bridge(struct pci_dev *bridge,
> >  +			    int (*cb)(struct pci_dev *, void *),
> >  +			    void *userdata)
> >  +{
> >  +	if (bridge->subordinate)
> >  +		pci_walk_bus(bridge->subordinate, cb, userdata);
> >  +	else
> >  +		cb(bridge, userdata);
> >  +}
> >  +
> >   pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> >  -			pci_channel_state_t state,
> >  -			pci_ers_result_t (*reset_link)(struct pci_dev *pdev))
> >  +		pci_channel_state_t state,
> >  +		pci_ers_result_t (*reset_subordinates)(struct pci_dev *pdev))
> >   {
> >  +	int type = pci_pcie_type(dev);
> >  +	struct pci_dev *bridge;
> >   	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
> >  -	struct pci_bus *bus;
> >  +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> >   
> >   	/*
> >  -	 * Error recovery runs on all subordinates of the first downstream port.
> >  -	 * If the downstream port detected the error, it is cleared at the end.
> >  +	 * If the error was detected by a Root Port, Downstream Port, RCEC,
> >  +	 * or RCiEP, recovery runs on the device itself.  For Ports, that
> >  +	 * also includes any subordinate devices.
> >  +	 *
> >  +	 * If it was detected by another device (Endpoint, etc), recovery
> >  +	 * runs on the device and anything else under the same Port, i.e.,
> >  +	 * everything under "bridge".
> >   	 */
> >  -	if (!(pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT ||
> >  -	      pci_pcie_type(dev) == PCI_EXP_TYPE_DOWNSTREAM))
> >  -		dev = dev->bus->self;
> >  -	bus = dev->subordinate;
> >  +	if (type == PCI_EXP_TYPE_ROOT_PORT ||
> >  +	    type == PCI_EXP_TYPE_DOWNSTREAM ||
> >  +	    type == PCI_EXP_TYPE_RC_EC ||
> >  +	    type == PCI_EXP_TYPE_RC_END)
> >  +		bridge = dev;
> >  +	else
> >  +		bridge = pci_upstream_bridge(dev);
> >   
> >  -	pci_dbg(dev, "broadcast error_detected message\n");
> >  +	pci_dbg(bridge, "broadcast error_detected message\n");
> >   	if (state == pci_channel_io_frozen) {
> >  -		pci_walk_bus(bus, report_frozen_detected, &status);
> >  +		pci_walk_bridge(bridge, report_frozen_detected, &status);
> > + 		/*
> > + 		 * After resetting the link using reset_link() call, the
> > + 		 * possible value of error status is either
> > + 		 * PCI_ERS_RESULT_DISCONNECT (failure case) or
> > + 		 * PCI_ERS_RESULT_NEED_RESET (success case).
> > + 		 * So ignore the return value of report_error_detected()
> > + 		 * call for fatal errors.
> > + 		 *
> > + 		 * In EDR mode, since AER and DPC Capabilities are owned by
> > + 		 * firmware, reported_error_detected() will return error
> > + 		 * status PCI_ERS_RESULT_NO_AER_DRIVER. Continuing
> > + 		 * pcie_do_recovery() with error status as
> > + 		 * PCI_ERS_RESULT_NO_AER_DRIVER will report recovery failure
> > + 		 * irrespective of recovery status. But successful reset_link()
> > + 		 * call usually recovers all fatal errors. So ignoring the
> > + 		 * status result of report_error_detected() also helps EDR based
> > + 		 * error recovery.
> > + 		 */
> >  -		status = reset_link(dev);
> >  +		status = reset_subordinates(bridge);
> > - 		if (status != PCI_ERS_RESULT_RECOVERED) {
> > + 		if (status == PCI_ERS_RESULT_RECOVERED) {
> > + 			status = PCI_ERS_RESULT_NEED_RESET;
> > + 		} else {
> > + 			status = PCI_ERS_RESULT_DISCONNECT;
> >  -			pci_warn(dev, "link reset failed\n");
> >  +			pci_warn(bridge, "subordinate device reset failed\n");
> >   			goto failed;
> >   		}
> >   	} else {
> > @@@ -215,13 -203,25 +236,25 @@@
> >   
> >   	if (status == PCI_ERS_RESULT_NEED_RESET) {
> >   		/*
> > - 		 * TODO: Should call platform-specific
> > - 		 * functions to reset slot before calling
> > - 		 * drivers' slot_reset callbacks?
> > + 		 * TODO: Optimize the call to pci_reset_bus()
> > + 		 *
> > + 		 * There are two components to pci_reset_bus().
> > + 		 *
> > + 		 * 1. Do platform specific slot/bus reset.
> > + 		 * 2. Save/Restore all devices in the bus.
> > + 		 *
> > + 		 * For hotplug capable devices and fatal errors,
> > + 		 * device is already in reset state due to link
> > + 		 * reset. So repeating platform specific slot/bus
> > + 		 * reset via pci_reset_bus() call is redundant. So
> > + 		 * can optimize this logic and conditionally call
> > + 		 * pci_reset_bus().
> >   		 */
> > + 		pci_reset_bus(dev);
> > + 
> >   		status = PCI_ERS_RESULT_RECOVERED;
> >  -		pci_dbg(dev, "broadcast slot_reset message\n");
> >  -		pci_walk_bus(bus, report_slot_reset, &status);
> >  +		pci_dbg(bridge, "broadcast slot_reset message\n");
> >  +		pci_walk_bridge(bridge, report_slot_reset, &status);
> >   	}
> >   
> >   	if (status != PCI_ERS_RESULT_RECOVERED)
> 
> Just a reminder that this conflict still exists (the amdgpu tree commit
> is now 400b308d388a).
> 
> -- 
> Cheers,
> Stephen Rothwell


