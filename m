Return-Path: <linux-next+bounces-9419-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6CBCC076B
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 449C63014D96
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F02C40855;
	Tue, 16 Dec 2025 01:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mwmdzoit"
X-Original-To: linux-next@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E7F155C97
	for <linux-next@vger.kernel.org>; Tue, 16 Dec 2025 01:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765848722; cv=none; b=Edb/hRUciZXbUvz7wFN3MgLrQKakY7JdutEpbkoWr/9sq131TV1PzMWm6k3THVrRjCOtYXl9fKV8U0MQNpLqq26eMDxwqU3HTWo/VcPRKsa3oHpu63iP3QOJTX5yf0ABNh66XIdxFov34WdzN+rwQW+RzQT2D8sHFsvf1Zc2IzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765848722; c=relaxed/simple;
	bh=LC8r05fLe2hYe563z3Xy94j/vIQLfyFhduWP99i9SmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIV0c8gYb+OsEEWCF1tBsQdFmjRLplAbQ6iymT3UvhiOH1ai7hqt8nf8cg2XnVWSBqszm97iUjCCD6gSdmx+mRjsck1HV0BKVOaMuOpFgIn40leLhIDGsD2xzPIGuGwktJ7bpAVtZnVZU01+owzRqnQ89dGLXvPuhvq/uC1vGFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mwmdzoit; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <3cd2c37e-458f-409c-86e9-cd3c636fb071@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765848712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XXNvXf2b3Eq9z1G5L0H6owGsJ0eChNfXY/EEyOk4EJY=;
	b=mwmdzoitBuqdbkA0dRmrsTwrH7HkU9Sf9k9MXxDGx7uq4CWVJuCp9mBeOxpdm6WI2tlon1
	QE6jVbY8XMhuvCR9QeAr1GaaJhRWZGnWz1D5P1LVMKdYiP2L5twumkd7KwF6rDOA9+/DJd
	6j9pWObl9qL3Jz1WsqCnSSr15HKa+e0=
Date: Mon, 15 Dec 2025 17:31:42 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [REGRESSION] next/pending-fixes: (build) error: unknown warning
 option '-Wno-suggest-attribute=format'; did...
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>
Cc: KernelCI bot <bot@kernelci.org>, kernelci@lists.linux.dev,
 kernelci-results@groups.io, regressions@lists.linux.dev, gus@collabora.com,
 linux-next@vger.kernel.org, bpf <bpf@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <176584314280.2550.10885082269394184097@77bfb67944a2>
 <20251216122514.7ee70d5f@canb.auug.org.au>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <20251216122514.7ee70d5f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/15/25 5:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 15 Dec 2025 23:59:03 -0000 KernelCI bot <bot@kernelci.org> wrote:
>>
>> Hello,
>>
>> New build issue found on next/pending-fixes:
>>
>> ---
>>  error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option] in kernel/bpf/helpers.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.error]
>> ---
>>
>> - dashboard: https://d.kernelci.org/i/maestro:32e32983183c2c586f588a4a3a7cda83311d5be9
>> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> - commit HEAD:  326785a1dd4cea4065390fb99b0249781c9912bf
>>
>>
>> Please include the KernelCI tag when submitting a fix:
>>
>> Reported-by: kernelci.org bot <bot@kernelci.org>
>>
>>
>> Log excerpt:
>> =====================================================
>>   CC      kernel/bpf/helpers.o
>> error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option]
>>
>> =====================================================
>>
>>
>> # Builds where the incident occurred:
>>
>> ## defconfig on (arm64):
>> - compiler: clang-21
>> - config: https://files.kernelci.org/kbuild-clang-21-arm64-mainline-694097d2cbfd84c3cdba292d/.config
>> - dashboard: https://d.kernelci.org/build/maestro:694097d2cbfd84c3cdba292d
>>
>>
>> #kernelci issue maestro:32e32983183c2c586f588a4a3a7cda83311d5be9
>>
>> --
>> This is an experimental report format. Please send feedback in!
>> Talk to us at kernelci@lists.linux.dev
>>
>> Made with love by the KernelCI team - https://kernelci.org
>>
> 
> Presumably caused by commit
> 
>  ba34388912b5 ("bpf: Disable false positive -Wsuggest-attribute=format warning")

Hi Stephen,

A potential hotfix is here:
https://lore.kernel.org/bpf/d80c77cf-c570-4f3b-960f-bbd2d0316fac@linux.dev/

Needs acks/nacks.

> 
> in the bpf tree.


