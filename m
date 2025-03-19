Return-Path: <linux-next+bounces-5886-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4EBA68B66
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 12:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2A59428052
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 11:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02886254AFE;
	Wed, 19 Mar 2025 11:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFUQ7U4D"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD65D25179F;
	Wed, 19 Mar 2025 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742383004; cv=none; b=GfosrhFhYGnh7nOSCK5GxICCsMD9GIdL0XRJLVbBkxWQy/S8Gtz/j83ei4kl/lGVtEwbYA9rrtOnbptM0+IoYU9iA/xriGS8G4sr3FbpM6KCpJWk2KUNYGT2EQv4wnMuBHtUoZulDr67B3DSmZPKTHHCw/ffJCYzQfOIIFcTwiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742383004; c=relaxed/simple;
	bh=dRPQZ8+ZNcDS5XiBjr6Ovve11njMGYvhdb9ilPH4gz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwT345Vd/CMsJdLZT3SUKIvaedQUUDl8fMhlx12yjRjnacKR+EUBm785439XPDvkC+45QiZPsCt7h5YFxcxVQzlU+mO4LeQW3m4bpLZdX02UofuUZFLXyVuMdYi7HSNBZUUIsReiCVNc4I/4GBMiGoOqLeBf2glHMUUkGDRqTL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFUQ7U4D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE59DC4CEE9;
	Wed, 19 Mar 2025 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742383004;
	bh=dRPQZ8+ZNcDS5XiBjr6Ovve11njMGYvhdb9ilPH4gz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFUQ7U4D50ddLn0b2nX9JCQrcyL+hSqKaanBKLNh+e6drVtt9UGQW9onMK6X7UEh/
	 +c1QYDxosSc1IsZh02uPVhRL5Feh6ZHNLNsOQIzTa134n5ZlTMDGi5Pfypjh/PiQ9z
	 kAaai7eeiKE2085vn2RDUO9Pde1uoSZzq03lgDcaYHmU4LhbVRKg5AKrjfSytrOEZv
	 BQN0Gdb4DMs2NW+/NHZbl7n5JTMklzVnV2Lx2I4GR/ODyFlWbpEpX2W/zzrEwH0qgS
	 lr9yE44Pu2myVeahFLjBf7V2kxPVlN74+h4IoQ2mOzazkQgQyHTcp5QMvav40FydJW
	 nFrWwle42O1fw==
Date: Wed, 19 Mar 2025 12:16:39 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Dave Airlie <airlied@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <Z9qnl2bxFZ-Q5Al4@pollux>
References: <20250319180556.4475584f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319180556.4475584f@canb.auug.org.au>

Hi Stephen,

On Wed, Mar 19, 2025 at 08:07:46PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

The following diff should fix the below conflict.

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 63c19f140fbd..a08fb6599267 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{bindings, c_str, pci, prelude::*};
+use kernel::{bindings, c_str, device::Core, pci, prelude::*};
 
 use crate::gpu::Gpu;
 
@@ -27,7 +27,7 @@ impl pci::Driver for NovaCore {
     type IdInfo = ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
 
-    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
+    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
         dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
 
         pdev.enable_device_mem()?;

> 
> error[E0053]: method `probe` has an incompatible type for trait
>   --> drivers/gpu/nova-core/driver.rs:30:20
>    |
> 30 |     fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
>    |                    ^^^^^^^^^^^^^^^^ types differ in mutability
>    |
>    = note: expected signature `fn(&kernel::pci::Device<Core>, &()) -> core::result::Result<_, _>`
>               found signature `fn(&mut kernel::pci::Device<kernel::device::Normal>, &()) -> core::result::Result<_, _>`
> help: change the parameter type to match the trait
>    |
> 30 |     fn probe(pdev: &kernel::pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
>    |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> error[E0599]: no method named `enable_device_mem` found for mutable reference `&mut kernel::pci::Device` in the current scope
>   --> drivers/gpu/nova-core/driver.rs:33:14
>    |
> 33 |         pdev.enable_device_mem()?;
>    |              ^^^^^^^^^^^^^^^^^ method not found in `&mut Device`
> 
> error[E0599]: no method named `set_master` found for mutable reference `&mut kernel::pci::Device` in the current scope
>   --> drivers/gpu/nova-core/driver.rs:34:14
>    |
> 34 |         pdev.set_master();
>    |              ^^^^^^^^^^ method not found in `&mut Device`
> 
> error: aborting due to 3 previous errors
> 
> Some errors have detailed explanations: E0053, E0599.
> For more information about an error, try `rustc --explain E0053`.
> 
> Presumably caused by commit
> 
>   7b948a2af6b5 ("rust: pci: fix unrestricted &mut pci::Device")
> 
> interacting with commit
> 
>   54e6baf123fd ("gpu: nova-core: add initial driver stub")
> 
> from the drm tree.
> 
> I have no idea how to fix this, so I have just used the driver-core tree
> from next-20250318 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell



