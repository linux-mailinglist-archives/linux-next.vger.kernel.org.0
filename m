Return-Path: <linux-next+bounces-5119-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F606A08086
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 20:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D12ED3A923F
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 19:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBAE1922ED;
	Thu,  9 Jan 2025 19:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mStMk1jW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122B8191499
	for <linux-next@vger.kernel.org>; Thu,  9 Jan 2025 19:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736450308; cv=none; b=YZriM6+Nf9oG6Ky2iyf4fY5oC1TR4Ps2ZdY2fh0IUq3I4tY7XadUmVRUEfapuvI9R9nCrGTMyO52NrNl4a+8ex1V/XQwCAqWIysnARtlWBAmwgCdK8H6IpqIEg6280Mz8XycYM2uslbcaPsJupCWY5ibsqfLZAbcLhhiALueWvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736450308; c=relaxed/simple;
	bh=Ha2sCuuLDa2wxxnktwog673oMcpczNJ/szL0tHZfzPI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tUygXi+tjhPwQvFrcGwAFAOe4D8XRx615SaoMm2ySubcFrYnLudAn2wUOREJrUqgxciTbbO2xBmYH4ayF1/bxRa29KgiAZKRbYpPtgR2z51VJrtl/FJpFXZQF5eO6+fsPJdnbXZ9aBJHCgkZ49fRb5dOPFrhhLeIUa0Vws3GZ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mStMk1jW; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21655569152so22323255ad.2
        for <linux-next@vger.kernel.org>; Thu, 09 Jan 2025 11:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736450305; x=1737055105; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4chx51XB7zNX4mevPlJWYkasEFr7nCx4b6zS7p7gvhs=;
        b=mStMk1jW7lx/EZl+UBk6gJI0B9HP77QRXvk12BydbSWs+kottpoxlGx7hM1mCZnwrL
         vmzQrckx49XPCa9m7fNvUzd5oAwHzOXMkOY7hHudQP901616m+Dqp9uDnOE8SuydBk3Y
         ee+bPYoMCDdzzOClVhTzdueH34ow1hR70gYiK+Be5Xh54k2AShuGCnn647sNLxDXwsbU
         VDHwq7u06LeKpfQb7yALU3mUMQHig0SdDYDFMtNBf9cqNKGzXf/JEOR4g20kFpQzMpiv
         z3dA4GOYBpX42DK5Zw9f86klUmBLDfOMEPLgXa+FyRiqMDaI+1SHOOxAybFYLrpnZ/0q
         C0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736450305; x=1737055105;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4chx51XB7zNX4mevPlJWYkasEFr7nCx4b6zS7p7gvhs=;
        b=YeG56FTV/AgzbLIK2lp04xWZQwWdnrWJ+BD04RfmYIc+5nAG26Q+GF+bdTpQSz7chW
         7GYK/n1He4PsP8mHd42ScakuAcOUVYPpXtqB/0hCdhoza7h8peFW6U5c0FvG0kbsdOWU
         Zh7zsM/UVdn9UkEg8O4RSg97yfMsaz85sz5PxFHvvdSrKtR+/1+XHp2ikiEUWmlZSbDp
         N85+MszDCy9mTKPwwHPJLiBhy0vxqtyrgLWtAOhaA1r4I95g4LySbnqgbu6vM06qYqgf
         4Y7qyRYsuFmiFncHfLYxwU3LWMebu9/9XdUfa7j3XKpxzVvSUFuBDcIaFZiktnctyEL/
         5GUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrbSO7E2Zl+o67lWUErnf+7e9NLoK2yVS+6q1bhZyFjkrw11Kw0g8UZnr85JNFZq4sn10yUw4JK5Iz@vger.kernel.org
X-Gm-Message-State: AOJu0YwYESwwqNeEur+LtVoeWGT6hT+ovfcb3R7gUjuu4+4nvCXJrQvc
	a5S9Tr2b8Eo/U4O2d7ZwfBKZwFqLUTTAFChY4WuoGSyp0RnQlsT2aoBnUrB37w9KbAPehV3hTfT
	lLg==
X-Google-Smtp-Source: AGHT+IGO0istGx5XIPQTM85G2O2AhIv3xbPes1/5L5rfcTuXZ106F2SCqf7FOCFskx0QE9VZ/iwSbSUiizw=
X-Received: from pfbhj7.prod.google.com ([2002:a05:6a00:8707:b0:725:df7a:f4e3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:32cb:b0:725:df1a:288
 with SMTP id d2e1a72fcca58-72d2201c96dmr13359102b3a.24.1736450305388; Thu, 09
 Jan 2025 11:18:25 -0800 (PST)
Date: Thu, 9 Jan 2025 11:18:24 -0800
In-Reply-To: <20250106150509.19432acd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250106150509.19432acd@canb.auug.org.au>
Message-ID: <Z4AhAFlk5qOYMsJx@google.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the tip tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 06, 2025, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
> 
>   arch/x86/kvm/cpuid.c
> 
> between commit:
> 
>   716f86b523d8 ("KVM: x86: Advertise SRSO_USER_KERNEL_NO to userspace")
> 
> from the tip tree and commits:
> 
>   ccf93de484a3 ("KVM: x86: Unpack F() CPUID feature flag macros to one flag per line of code")
>   3cc359ca29ad ("KVM: x86: Rename kvm_cpu_cap_mask() to kvm_cpu_cap_init()")
>   75c489e12d4b ("KVM: x86: Add a macro for features that are synthesized into boot_cpu_data")
>   871ac338ef55 ("KVM: x86: Use only local variables (no bitmask) to init kvm_cpu_caps")
> 
> from the kvm-x86 tree.
> 
> I fixed it up (I think - see below) and can carry the fix as
> necessary. 

Your resolution is good.  I'm impressed you were able to wade through the chaos :-)

Thanks much!

