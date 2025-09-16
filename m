Return-Path: <linux-next+bounces-8329-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC07B595C2
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 14:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBB197B2A42
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 12:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787D73081A9;
	Tue, 16 Sep 2025 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CtUxyuc9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411BE27FB34;
	Tue, 16 Sep 2025 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758024318; cv=none; b=B1y8N/9JUQGvpDrGPgjfoykHQ0Xsno/zHLoiK5xULo5XG6mb3lhLa6V0f+OjidAE1Cuf0proDZgEklNLjnZLc4Byn7RFfom7zPVk2JB5urvW1uyjXrWEpfTJRjmup8wA5xMqKMokpFi4tnZZ6X3O7pjZWCha/750soYOPPQhB70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758024318; c=relaxed/simple;
	bh=a5njBTmEgug3G3Ok23bq68P9JRhVH2bCJAN2vRzHr2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwVqpvwSzZ6hBGOA81Gv7bOEiSvdjpB3TAtaj1gvtcqDnpmELrdvS2PrrtOnKv7cCmfbubJheO1lxTy0+XNmZ1OV1R11uwhUJ2KhIs0soeDdNO97Dy7/zOAQxsKRchtcAKUMULF29rAcThMthza91URZfPrvjY1UvC6fplb2Vmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CtUxyuc9; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4DF7F40E00DD;
	Tue, 16 Sep 2025 12:05:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vUfVhyUm7pLN; Tue, 16 Sep 2025 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1758024304; bh=1o0RJkSvj8cwhvvVa4ruxsgxt1D6l+YszBJI0+bCypo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CtUxyuc9J0E5EzFvm4DLmybZeWGSL1i/5RbtkrJvFWu3n6RdtMKrqUqmkZTCn33Ld
	 ZvuPnZO++gyooLka60B50DaprW8M45iktAY465oruMGDMm4BLOqYlf9YVRKftYFm9c
	 AG+D+mndnHtloyuqnAOVjx2hwGq/2Rxu+xNJ/WwhXNeaD93To0c2UCDMooNuXUKD23
	 15WrqcvlIT4TlFfIA/6iholNtxjw81MgxwY8UxbAXReSolcNEBScr+uf0l/rnp/sBy
	 61GyqbtF2e5e2rgqk6akNI+rk/Ws1clTDZirhGHLDKHjRy3xsgXNyll1F0WIr/5NPz
	 49NADYr4wpQjmzKcE5vgKQjo3u49d4B0X2R5QuG+RqExpdOeZoVOBzt0zdcbAYbEVb
	 7ZlOpZmMFEZ9DWsSCPDaGzKjsAsI5IYcOQ0c2YXXlnpf2cI/bO+yQKqmvkPxI5NSdj
	 HA4TMtNFEyzxcO4tIwBf2h3ct74rAKRnKz5lPnHPG7dWiTeDzkk5TLBhBGDnKkFBLG
	 TM36Wi4emVYzFK7y+2FGfPWN/SXodAZ2Uuqwbb8cy5w9rhBjX8hafdBCJN9ITYATxQ
	 gMJ0JLBSGJu0nRirEd0dtmjgOejq5FJCObv7niM+c85z58Sa9zJ/gUS5Goxetu7L+G
	 1uJ+x5xHNqyArfGt/ZnQAPyE=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 95AE740E01A3;
	Tue, 16 Sep 2025 12:04:56 +0000 (UTC)
Date: Tue, 16 Sep 2025 14:04:50 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mark Brown <broonie@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
	Babu Moger <babu.moger@amd.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Xin Li <xin@zytor.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the tip-fixes
 tree
Message-ID: <20250916120450.GFaMlSYuNse-UBiXD2@fat_crate.local>
References: <aMlPZcYlk7hRlMkE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aMlPZcYlk7hRlMkE@sirena.org.uk>

On Tue, Sep 16, 2025 at 12:52:05PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
> 
>   arch/x86/include/asm/cpufeatures.h
> 
> between commits:
> 
>   2f8f173413f1c ("x86/vmscape: Add conditional IBPB mitigation")
>   e19c06219985f ("x86/cpufeatures: Add support for Assignable Bandwidth Monitoring Counters (ABMC)")
> 
> from the tip-fixes tree and commit:
> 
>   3c7cb84145336 ("x86/cpufeatures: Add a CPU feature bit for MSR immediate form instructions")
> 
> from the kvm-x86 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc arch/x86/include/asm/cpufeatures.h
> index b2a562217d3ff,8738bd783de22..0000000000000
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@@ -495,8 -496,7 +496,9 @@@
>   #define X86_FEATURE_TSA_SQ_NO		(21*32+11) /* AMD CPU not vulnerable to TSA-SQ */
>   #define X86_FEATURE_TSA_L1_NO		(21*32+12) /* AMD CPU not vulnerable to TSA-L1 */
>   #define X86_FEATURE_CLEAR_CPU_BUF_VM	(21*32+13) /* Clear CPU buffers using VERW before VMRUN */
>  -#define X86_FEATURE_MSR_IMM		(21*32+14) /* MSR immediate form instructions */
>  +#define X86_FEATURE_IBPB_EXIT_TO_USER	(21*32+14) /* Use IBPB on exit-to-userspace, see VMSCAPE bug */
>  +#define X86_FEATURE_ABMC		(21*32+15) /* Assignable Bandwidth Monitoring Counters */
> ++#define X86_FEATURE_MSR_IMM		(21*32+16) /* MSR immediate form instructions */

Thanks Mark, LGTM.

We'll mention this in our pull requests so that Linus merges stuff correctly.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

