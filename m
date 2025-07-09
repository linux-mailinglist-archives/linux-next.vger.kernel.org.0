Return-Path: <linux-next+bounces-7430-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2EBAFE6D1
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 13:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 598511C470BF
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 11:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1ED28EC15;
	Wed,  9 Jul 2025 11:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kodzAjc/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A3428E5F3;
	Wed,  9 Jul 2025 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058960; cv=none; b=rx1dlFkT+Z2C/gC3Ui2zo0kFAJE4DogzhAePDxVr39TDPoe5r+/7CgauLVwojA6nbFcedLsfNHAwzXGIO2femkGQpRb+TpBl4InVY2zw9jXIw6rb+Me8szV8/8VRWZf5fM8W7b7SdzL1zfCerruDvD6fkRKO77x6nZ6ulUMZb/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058960; c=relaxed/simple;
	bh=4QbYdk4relHtczYb3iYvG3QjtBsYPO2ROs36Eubw8TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZf6jud6OMcGuvbwTZoWgJS3R2oSb6QdYyssP/dn/Mix10uPlhV2qxQGqukg5P+YiihybjK4Yk2wThYmaJElR8rvXNsCKGgvXc8WpnCUZEdJOOP02EDGZx/9kxrJ4B+TCj4FeQ1kKiTevPdYi1Ovbm6xS1q7+3biI7K+dg1D3QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kodzAjc/; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 798AE40E0169;
	Wed,  9 Jul 2025 11:02:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YJ3pb_v37dHa; Wed,  9 Jul 2025 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1752058952; bh=Wj63O570yGWcj0zgodIDIamGaAqJcv0i9niEyEUFdwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kodzAjc/57o/MJ64lKaQkN1SkcEhjtUr4d+8p4K1SNtisH/F6PbMEQqsBfWazA4a4
	 HyZydEwKsA2SCRepA0brvBh253LDTJU3d//f8G8pFHFds1r5x9q9tgeK/c/4rJvaUE
	 8t5of3R/5Jo4Ccoz7Yw39CArujebcKzFDp00YTyhiODs0zS/1DxCzNRQ0EQJEvwdwA
	 G8IfJfZ7ArPS0EcwXAdG3X9T8M30NkBV8KaDjbHk40FQCl1KYa8N49fqBbSjoP18Ji
	 kD/33Bej1cA90pEWXvPSBIW9fKIjY6vWvVZIkx/fopLQT21r/EBwPts58k3h4NXEsA
	 lUihNS5FPTgak0sIaVw2Nhea25hglUnboyomrIqp/fHymg1FQWqb4y1wxEcXIypTBR
	 cHogGoYec9F/2d6MeBvDpmGBqu4l1zLyYEOHDrYwqowMtStpnhvJAgjw/6rN0wDKON
	 tCnLG7P7T+y6tJqxAVlxRi6zuBDrlBCv6SgBMnahbWpGjmB7Q73QJegc9u8A0tMTBD
	 TqeKQvNfp8E9H7mQDOHTioVkXIVb3hFs4B05+WiOtcIT9V2d/DNgkcITbxPo84PBfX
	 Bfwxwf12/uFVGMYN9QT8LchVyUb8Y+8n2tLoYVVbHRBXg2cEfYe65+CqLEgfM/XD8j
	 jvMA0p1f/x4EQim/ATFPXYRw=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2B94540E0216;
	Wed,  9 Jul 2025 11:02:28 +0000 (UTC)
Date: Wed, 9 Jul 2025 13:02:22 +0200
From: Borislav Petkov <bp@alien8.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sean Christopherson <seanjc@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with Linus' tree
Message-ID: <20250709110222.GAaG5MPsCkWLfAmNGD@fat_crate.local>
References: <20250709160456.12aabc8b@canb.auug.org.au>
 <20250709171115.7556c98c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709171115.7556c98c@canb.auug.org.au>

On Wed, Jul 09, 2025 at 05:11:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 9 Jul 2025 16:04:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the kvm-x86 tree got a conflict in:
> > 
> >   arch/x86/kvm/vmx/vmx.c
> > 
> > between commit:
> > 
> >   f9af88a3d384 ("x86/bugs: Rename MDS machinery to something more generic")
> > 
> > from Linus' tree and commit:
> > 
> >   83ebe7157483 ("KVM: VMX: Apply MMIO Stale Data mitigation if KVM maps MMIO into the guest")
> > 
> > from the kvm-x86 tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Actually, the resolution is below.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/x86/kvm/vmx/vmx.c
> index 191a9ed0da22,65949882afa9..47019c9af671
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@@ -7290,8 -7210,8 +7210,8 @@@ static noinstr void vmx_vcpu_enter_exit
>   	if (static_branch_unlikely(&vmx_l1d_should_flush))
>   		vmx_l1d_flush(vcpu);
>   	else if (static_branch_unlikely(&cpu_buf_vm_clear) &&
> - 		 kvm_arch_has_assigned_device(vcpu->kvm))
> + 		 (flags & VMX_RUN_CLEAR_CPU_BUFFERS_FOR_MMIO))
>  -		mds_clear_cpu_buffers();
>  +		x86_clear_cpu_buffers();
>   
>   	vmx_disable_fb_clear(vmx);
>   

Yap, LGTM.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

