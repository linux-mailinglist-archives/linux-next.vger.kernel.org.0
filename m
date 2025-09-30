Return-Path: <linux-next+bounces-8526-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C86BAE486
	for <lists+linux-next@lfdr.de>; Tue, 30 Sep 2025 20:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32B713B8E84
	for <lists+linux-next@lfdr.de>; Tue, 30 Sep 2025 18:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3884630C63D;
	Tue, 30 Sep 2025 18:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OU8/9X7a"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A55A1D63D8
	for <linux-next@vger.kernel.org>; Tue, 30 Sep 2025 18:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759255995; cv=none; b=QaL05lzWfTkTtaujTZAEBhF5sYBRtk4zBPAMmtcSt9zipsdTUbzENPZ1pWos3Xw3JQJO4OCXMHoi5k3voekmRh5PX1yoLRgtEYNtZgQOghbe4uPvUxYXiaKuouBiwFpZGT+wcVakwANzjfWqAGXuYlkBn8GgDyCoUGVgc8rLGu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759255995; c=relaxed/simple;
	bh=tLzQaY9xNs46b9TNYBN3bfsuXib5IFK4hY2r84lPSWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpYfi6+fGOz5scao944XV+rCbPAvuowGvHA26gvIscik+ZBlP5UALbhd5j37fQ55F58krW/jCS7V+g9sIu2gbA4uOyFnnHo/cnvta0C5C9OAIh4W8ybtcCUhxGUcijKAzbplVXANKDfk9exmIoLoWciuKNg9t3GCgQQ66e/njm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OU8/9X7a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759255992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IIPDd0kT6C4FiADrZisLSF/yuhkConGOm03Id2jcBDU=;
	b=OU8/9X7aY9LU9lLXUHzc/MgRyzfSNo6rCsRUa0E98VTjk+03bvAg0hH4SKNCcC6ZvOIEbY
	GCHhCPh2DgZ9d3TU1d0BRWQMa4wBbl8rvsL+rV1w3Wh2+Lwfcoa6lJlZCvMTSKliqziXmq
	ul8fMdmPLv+pmX35XSusjDcmUnW1VUA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-TCySejOzNZW3v1ncFoHliA-1; Tue, 30 Sep 2025 14:13:10 -0400
X-MC-Unique: TCySejOzNZW3v1ncFoHliA-1
X-Mimecast-MFC-AGG-ID: TCySejOzNZW3v1ncFoHliA_1759255989
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b3d21b18e8fso190996166b.2
        for <linux-next@vger.kernel.org>; Tue, 30 Sep 2025 11:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759255989; x=1759860789;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIPDd0kT6C4FiADrZisLSF/yuhkConGOm03Id2jcBDU=;
        b=bSTLczRxVWToEZZHJRo5R4BFohByRAa4n9tU+a4mHKGtBVRHOUPRG7IxwE6oMRdHjC
         u+hc/YIRyGvjyp5lm+9LFcfr4gqGrBqRPtAAhQbxHEwaDI6riFe/pf9zr1894Lhc4f15
         H8LOzrG//hm7GtBARZydrSylFwEtqSffHuTSn+fI85eBnniEOmUhHgqK8kg0hHTF7hh4
         JMK9KXja8z3lStiaMMcSgL3f/06Lgmjm0/Mj44jhCoQ1nLEiEeSQ0CnTlGPyGludh16t
         KtXTuKOqc4n/zgDlh6C/Jg5kFu0pQeyeIfTo6dpfjdJSthrhP2tzyu8N5qkv8bCheeqp
         Y6sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMw+iRVf0jULSshRzVoq5kwpoBIK9mHz73FfTG6/ZQCnKb9PHP4DKzFCai2/Zic0a6S5FdMw/0XStY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa4K33T6EhwgmoaUIOaWbnHPBNA23pcs964cP9UmVyZRosB6k4
	Jr/1p3D9xm9DU7OlChT7bS04MCF8NYX/pnYEX+lnnn1zlfmCUzOhh8ZHlkbwotAG7upqq2EW5jQ
	XOjxJtx58lb2ZxDzaPBWvDcRqOuHcPNhfu3ER1Boqt/qLwPBDqFhpk6dIKXZ5GUMQUGYfbIs=
X-Gm-Gg: ASbGncun5Abj2fUZ+QJP1VjvzCbBGKeUA+uXXPKerTFsirNSZyljqm17FsUFknlex+w
	8GFWDB5vaXxfWPfZjp6g7MxyM9A3Tv3CDL/ARJWkaXMzeAJFDxahKX/mFHgK9QyqnKh3Gg2CCkD
	unt1cyF7t3AedUhzP5OAJvAMbtUFun1dNctdByzO1ettyI4sWbyq/KQjTfWRXZNE9FVAPPUhtkP
	9qAVBzgT/G/JmL766HfD0qhVTMuHF/sKHf/lie9BJc88iFjVLQDHyO+7VO5id9QZQ12G+ru7SmA
	88wPzZNl52YWewa8Eu3daO+XZpWwfPqKe8Fiv8GDT2CZstfB/QT3PM+TojZOnqrNG6yX8Tx9PRD
	HM/3pOE9+XqhcS03Qn7WBlcxSHUGEtDB00irKr2cQAz2IrIPjE5w=
X-Received: by 2002:a17:907:9447:b0:b46:9a2d:9ef with SMTP id a640c23a62f3a-b46e6a08184mr59776466b.63.1759255988706;
        Tue, 30 Sep 2025 11:13:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7pZ97wuHTXTTcZBhQGrP/6pyws1EiYlgdha7WtbgyDLfQO1zxTuzhS0LBdBiQxzqfXIUGlw==
X-Received: by 2002:a17:907:9447:b0:b46:9a2d:9ef with SMTP id a640c23a62f3a-b46e6a08184mr59773866b.63.1759255988268;
        Tue, 30 Sep 2025 11:13:08 -0700 (PDT)
Received: from [192.168.10.81] ([176.206.127.188])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b4691b07a77sm52359666b.2.2025.09.30.11.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 11:13:07 -0700 (PDT)
Message-ID: <e8907aaf-ff55-4873-849c-91a844494cf7@redhat.com>
Date: Tue, 30 Sep 2025 20:13:06 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the tip tree
To: Mark Brown <broonie@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
References: <aNEb7o3xrTDQ6JP4@finisterre.sirena.org.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aNEb7o3xrTDQ6JP4@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/25 11:50, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
> 
>    arch/x86/kvm/emulate.c
> 
> between commit:
> 
>    6204aea36b74c ("KVM: x86: Introduce EM_ASM_1")
> 
> from the tip tree and commit:
> 
>    f8457615b71c6 ("KVM: x86: Don't emulate instructions affected by CET features")
> 
> from the kvm-x86 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This will soon become a conflict between kvm and tip.

Paolo

> diff --cc arch/x86/kvm/emulate.c
> index 796d0c64f9baf,5c5fb6a6f7f92..0000000000000
> --- a/arch/x86/kvm/emulate.c
> +++ b/arch/x86/kvm/emulate.c
> @@@ -4001,11 -4153,11 +4088,11 @@@ static const struct opcode group4[] =
>    };
>    
>    static const struct opcode group5[] = {
>   -	F(DstMem | SrcNone | Lock,		em_inc),
>   -	F(DstMem | SrcNone | Lock,		em_dec),
>   +	I(DstMem | SrcNone | Lock,		em_inc),
>   +	I(DstMem | SrcNone | Lock,		em_dec),
> - 	I(SrcMem | NearBranch | IsBranch,       em_call_near_abs),
> - 	I(SrcMemFAddr | ImplicitOps | IsBranch, em_call_far),
> + 	I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
> + 	I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
>   -	I(SrcMem | NearBranch | IsBranch, em_jmp_abs),
>   +	I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
>    	I(SrcMemFAddr | ImplicitOps | IsBranch, em_jmp_far),
>    	I(SrcMem | Stack | TwoMemOp,		em_push), D(Undefined),
>    };
> diff --cc arch/x86/include/asm/cpufeatures.h
> index b2a562217d3ff,8738bd783de22..0000000000000
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@@ -495,8 -496,7 +496,9 @@@
>    #define X86_FEATURE_TSA_SQ_NO		(21*32+11) /* AMD CPU not vulnerable to TSA-SQ */
>    #define X86_FEATURE_TSA_L1_NO		(21*32+12) /* AMD CPU not vulnerable to TSA-L1 */
>    #define X86_FEATURE_CLEAR_CPU_BUF_VM	(21*32+13) /* Clear CPU buffers using VERW before VMRUN */
>   -#define X86_FEATURE_MSR_IMM		(21*32+14) /* MSR immediate form instructions */
>   +#define X86_FEATURE_IBPB_EXIT_TO_USER	(21*32+14) /* Use IBPB on exit-to-userspace, see VMSCAPE bug */
>   +#define X86_FEATURE_ABMC		(21*32+15) /* Assignable Bandwidth Monitoring Counters */
> ++#define X86_FEATURE_MSR_IMM		(21*32+16) /* MSR immediate form instructions */
>    
>    /*
>     * BUG word(s)
> diff --cc arch/x86/include/asm/msr-index.h
> index 718a55d82fe45,717baeba6db3c..0000000000000
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@@ -315,14 -315,15 +315,16 @@@
>    #define PERF_CAP_PT_IDX			16
>    
>    #define MSR_PEBS_LD_LAT_THRESHOLD	0x000003f6
>   -
> + #define PERF_CAP_LBR_FMT		0x3f
>    #define PERF_CAP_PEBS_TRAP		BIT_ULL(6)
>    #define PERF_CAP_ARCH_REG		BIT_ULL(7)
>    #define PERF_CAP_PEBS_FORMAT		0xf00
> + #define PERF_CAP_FW_WRITES		BIT_ULL(13)
>    #define PERF_CAP_PEBS_BASELINE		BIT_ULL(14)
>   +#define PERF_CAP_PEBS_TIMING_INFO	BIT_ULL(17)
>    #define PERF_CAP_PEBS_MASK		(PERF_CAP_PEBS_TRAP | PERF_CAP_ARCH_REG | \
>   -					 PERF_CAP_PEBS_FORMAT | PERF_CAP_PEBS_BASELINE)
>   +					 PERF_CAP_PEBS_FORMAT | PERF_CAP_PEBS_BASELINE | \
>   +					 PERF_CAP_PEBS_TIMING_INFO)
>    
>    #define MSR_IA32_RTIT_CTL		0x00000570
>    #define RTIT_CTL_TRACEEN		BIT(0)
> diff --cc arch/x86/kvm/emulate.c
> index 796d0c64f9baf,5c5fb6a6f7f92..0000000000000
> --- a/arch/x86/kvm/emulate.c
> +++ b/arch/x86/kvm/emulate.c
> @@@ -4001,11 -4153,11 +4088,11 @@@ static const struct opcode group4[] =
>    };
>    
>    static const struct opcode group5[] = {
>    	F(DstMem | SrcNone | Lock,		em_inc),
>    	F(DstMem | SrcNone | Lock,		em_dec),
> - 	I(SrcMem | NearBranch | IsBranch,       em_call_near_abs),
> - 	I(SrcMemFAddr | ImplicitOps | IsBranch, em_call_far),
> + 	I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
> + 	I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
>   -	I(SrcMem | NearBranch | IsBranch, em_jmp_abs),
>   +	I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
>    	I(SrcMemFAddr | ImplicitOps | IsBranch, em_jmp_far),
>    	I(SrcMem | Stack | TwoMemOp,		em_push), D(Undefined),
>    };


