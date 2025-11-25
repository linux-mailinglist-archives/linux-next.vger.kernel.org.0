Return-Path: <linux-next+bounces-9202-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE3BC83A92
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 08:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F7DB3B07E2
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 07:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2CA2FFF8B;
	Tue, 25 Nov 2025 07:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Fw02llAK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0132E62B7;
	Tue, 25 Nov 2025 07:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054630; cv=none; b=BrCydx+H3ouQyMGmt26HC1PJodfbGs7fwUacBl541ke51axS8W5QFux1ZXpwQcDNJEhAD/oQXRm/UAt2bkpa1uVYC+bPLgoNAp5wSI6ZYzWnobECYw2kPl4xah4bpmoRGZCZ2G1MPbSSb1Diyf/CWnTdaGjksPqTCQs3GJqqw54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054630; c=relaxed/simple;
	bh=IGOlEdPPkvXSorjSMexjFCAIGCcqWsiMmGK4FYGqU3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkuR44UrekPRqg2VdL+gxOTwGwskBxsqGDZJk1/F+bds2+1GMvi5pIUTqEtil55mi2pSAfcEmHUzuM2r3pya8SzoXnkvixJOEpqOAp6aCvzpbI3It6QjByYz9FdG44MPJSBwub/Y0bI4imap1gkQIsqG2twOGPIAdTTMV+gQ/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Fw02llAK; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7FE0D40E015B;
	Tue, 25 Nov 2025 07:10:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id I26BfIqkHIUE; Tue, 25 Nov 2025 07:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1764054614; bh=nxvd1+bPIHfnNtv9J5PXFzQ8ws2maC855AGPFyW/ybg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fw02llAKwWElJR+Q0GB1jepWYX2zvhqCcQYWZ1UUwX64QB9OjTDRTPlP79FD00irb
	 xPgBdhbp+/A2WxW11H6PppecHkDGFt5XHk/7Mg9GhCDjIAihUjAr/1YPRyZTaWvzj8
	 BFZ6RL6gU6BEA9UjWTwOTcI2xTJdkF7AURyt7meb2LHAVrU2GHqZYuFWtF2dDpaexR
	 Rd7D7hRxK/JHqZ/JpBrsNedUMbY/0UUKZS21iUsZbJRikBK2N0wvuenNfS6NusL8U3
	 ub6dW6IXdPOAvH8yzVoYM15vPrzpKrPzbLlWGmLZXkEzwXCufpFxLSbrb34ZK83URu
	 7OE7mKVzVdpPx5F6AyNNOzjRtOnj3uWNqeuqXOLZy+8CduHgvRN24YpG9M/K72w7PS
	 vwzhrnOlXEb9I70ejEBui/GVSEcO+KJDkaNuVBAGAhsn4aYpx+uxuvlEIY7+pZoDru
	 U8ZtWso8iRFzM4CI1SMvqv7a+XbKoYoyG0tKUB4ncR/wX6l+1F2iAyl7/2/YfVxn2F
	 /rmArkot1TcgFafDpuWf16b0OIYz2UferY15zOLovCV1l05ABdQC020QCHDT0KHF/k
	 Bh/uWyu3yeNvpea8smbpnWk3ARl0D5z8tvt+Ysqhx0A+s//s3NHwsnDjBtOV98i0W6
	 UMupEFnDO20LkOxSAlfmcXQ4=
Received: from zn.tnic (p57969402.dip0.t-ipconnect.de [87.150.148.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 61B4F40E016E;
	Tue, 25 Nov 2025 07:10:02 +0000 (UTC)
Date: Tue, 25 Nov 2025 08:09:55 +0100
From: Borislav Petkov <bp@alien8.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Babu Moger <babu.moger@amd.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Naveen N Rao (AMD)" <naveen@kernel.org>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <20251125070955.GAaSVWQ1i7l4EVzFV1@fat_crate.local>
References: <20251125155953.01b486f2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125155953.01b486f2@canb.auug.org.au>

On Tue, Nov 25, 2025 at 03:59:53PM +1100, Stephen Rothwell wrote:
> diff --cc arch/x86/include/asm/cpufeatures.h
> index d90ce601917c,646d2a77a2e2..000000000000
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@@ -503,9 -500,12 +504,15 @@@
>   #define X86_FEATURE_IBPB_EXIT_TO_USER	(21*32+14) /* Use IBPB on exit-to-userspace, see VMSCAPE bug */
>   #define X86_FEATURE_ABMC		(21*32+15) /* Assignable Bandwidth Monitoring Counters */
>   #define X86_FEATURE_MSR_IMM		(21*32+16) /* MSR immediate form instructions */
>  -#define X86_FEATURE_X2AVIC_EXT		(21*32+17) /* AMD SVM x2AVIC support for 4k vCPUs */
>  -#define X86_FEATURE_CLEAR_CPU_BUF_VM_MMIO (21*32+18) /*
>  +#define X86_FEATURE_SGX_EUPDATESVN	(21*32+17) /* Support for ENCLS[EUPDATESVN] instruction */
>  +
>  +#define X86_FEATURE_SDCIAE		(21*32+18) /* L3 Smart Data Cache Injection Allocation Enforcement */
> ++#define X86_FEATURE_X2AVIC_EXT		(21*32+19) /* AMD SVM x2AVIC support for 4k vCPUs */
> ++#define X86_FEATURE_CLEAR_CPU_BUF_VM_MMIO (21*32+20) /*
> + 						      * Clear CPU buffers before VM-Enter if the vCPU
> + 						      * can access host MMIO (ignored for all intents
> + 						      * and purposes if CLEAR_CPU_BUF_VM is set).
> + 						      */

Yeah, I caught this already during review, we will make sure to let Linus know
when we send the pull requests.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

