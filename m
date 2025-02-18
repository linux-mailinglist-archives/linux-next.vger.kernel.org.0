Return-Path: <linux-next+bounces-5486-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F58A3A87D
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 21:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F36C1885812
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 20:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D30017A305;
	Tue, 18 Feb 2025 20:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFEh34HX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A891BE87B;
	Tue, 18 Feb 2025 20:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739909668; cv=none; b=juYnZ/i8q7wHHC9+7fA4cJp0jkTKcDtAavH5FrXsG7kn0Sxc2r8PSwNT7vVHk2yB+RymnnuwusxviyqryZnat1H/JoPOoryjl9qHfY5nIiVgWXgcPMIDjQzFF+qTjmtuzNLGr0J3lF+Ej85dHeL12GDdZ5Ck5DmRAl/l53n/SZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739909668; c=relaxed/simple;
	bh=p2n6hK0Qw/S58TsTI5rRfYxfkm/K60EKwuEzucYNFko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bP1rk7yG74PSbiF7jp19muRpIkjFexCh1S6w0DrYeJfieDaKS+9jDs+IbbMOzaHkxsEaejPHHePOQUWm3fPfBZCJZ2trbMURy/7OkJlBu8jO7Td5BniGliC4fZUyzLSBjV0ijTCMYXqHz6RXmpiEiNtrwZjJR0xcLbw2zssNVLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFEh34HX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220e989edb6so119117935ad.1;
        Tue, 18 Feb 2025 12:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739909666; x=1740514466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp9kbQyOKTPnkkb66ovZCJuS5wfhcmXlwXbA1qB2SIo=;
        b=dFEh34HXvCi/tuwbRE73E3dgho31SU5Y6h8x7EmGnOMsdpUSCkwJtYjMm3+Hmx/GD9
         SU8ZH3y9DxeWzCEQ3ofWFzBFOv3VcUJ6sr4ZadQw88LUAcWKrgjvpheDHFu/uOLNBduv
         t3xzUehhig0R5nCukE4LT8s9fqoRhOyby09tgEqh2xrLWhyr9ctgVvno2IR+Z/ZVVVcq
         0EfNynqTchuA4Bp+so/Gq44itYq2yOwWOHkN+5bDel94w4gYOCwsLO7ESkaWv3+rCZiY
         9G8h1lPZX6ELP2DkvBusfLNxC1zmuldIcO9Vp5V2IhQdUpnRKW2Z8s1StfdDnYyqZRs2
         6rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739909666; x=1740514466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp9kbQyOKTPnkkb66ovZCJuS5wfhcmXlwXbA1qB2SIo=;
        b=nWyNBZrmnqGVKB1ReHVMV55BRohqcLDjjNxW7mIJpFa2tq0BUrUVkR7vmbug585t4a
         mc1b990nPDVk0PT9RtmN5429oa4RhM/cEcSC4wieV/HdhrkoqEY7YG2AzmSRDvurbkeN
         p+SzLAKPHcoIbpk+wmyWkC5pqF5HGkhjWV83O2L9l2opwtrfTAo+gFRTaHcfRo1PTsTU
         i2QP0G+Em9nRKLx80oH57A3bRTJSo2K1oJ0zei05cDYW1+B9Jg1jJvMNT3TwuxsJVlVN
         NK1yA9eI+oiIaaJ6yfnQOX7MbzUeq5tanem64JRIb7jD1bAr+UaXMkR3jbD8wht54IGg
         fEtg==
X-Forwarded-Encrypted: i=1; AJvYcCWhmc39zfM9dffgQwYfTpdeh3xtZ1WwWLPeK49kdZpjm7F/t2igR2oDDFHFxCoxd8GqEbvx4a2FkRC0@vger.kernel.org
X-Gm-Message-State: AOJu0YziZf670vn+uGs3xXftBp65F0PP30PhdYc34Y4FK1qgGAFCJvsy
	4bCnpaVNoyKrzHetA0gR6b6RJZ7bO66bvUi2+Jjl/o4+1sEo8Ohq
X-Gm-Gg: ASbGncvO72ajK/Wujune7ljNqO+nD/sAiGtGiQEzWqCkE9GPXQCsWvZVYEQR98AivXJ
	BXbAnGM3ZnJyVy7CgSRGcCh6NhBXR/MUIZ4Rj6T7QjuFF0VhE6GPO8iAztbmRmJwcydVC9U2aEn
	+6GpSyhcjdzrROO6aNhzqXY5MpmecGbcNPy6Sl5RAWnZ4P+DtyHFLvTpbLh6zZ6zkGGf6+h3wZr
	06jho2QUFMd1FFI7KJi6LMIWw9I/HYCjWwWrMmfJzMEZ8Jd4Y7UE/i02XJ5MvddfIJ5Fc++tLNH
	gmY6dCE+O490zps=
X-Google-Smtp-Source: AGHT+IE4y9RZsLl4ZPEhoolF6Dek2f7wBe/IvlnSACVwxT3sFshBI66xUkRrjGVcxO0wEb4QnWLcXw==
X-Received: by 2002:a05:6a21:4cc7:b0:1ee:b8bc:3d2f with SMTP id adf61e73a8af0-1eeb8bdbd8amr13685875637.4.1739909665586;
        Tue, 18 Feb 2025 12:14:25 -0800 (PST)
Received: from localhost ([216.228.125.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324277f388sm10896504b3a.174.2025.02.18.12.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 12:14:25 -0800 (PST)
Date: Tue, 18 Feb 2025 15:14:23 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	sfr@canb.auug.org.au, ionela.voinescu@arm.com,
	linux-next@vger.kernel.org, sumitg@nvidia.com,
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com, zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com
Subject: Re: [PATCH] arm64: Utilize for_each_cpu_wrap for reference lookup
Message-ID: <Z7TqFLU0Kwg9cUjO@thinkpad>
References: <20250218192412.2072619-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218192412.2072619-1-beata.michalska@arm.com>

On Tue, Feb 18, 2025 at 07:24:12PM +0000, Beata Michalska wrote:
> While searching for a reference CPU within a given policy,
> arch_freq_get_on_cpu relies on cpumask_next_wrap to iterate over
> all available CPUs and to ensure each is verified only once.
> Recent changes to cpumask_next_wrap will handle the latter no more,
> so switching to for_each_cpu_wrap, which  preserves expected behavior
> while ensuring compatibility with the updates.

This is technically correct, but I would rather point that for
iterating over each CPU, it's better to use a dedicated iterator
instead of opencoded loop.

> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  based on arm64 for-next/amuv1-avg-freq
> 
>  arch/arm64/kernel/topology.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index a09b0551ec59..9e3583720668 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -254,7 +254,7 @@ int arch_freq_get_on_cpu(int cpu)
>  		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
>  		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
>  			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> -			int ref_cpu = cpu;
> +			int ref_cpu;
>  
>  			if (!policy)
>  				return -EINVAL;
> @@ -265,11 +265,15 @@ int arch_freq_get_on_cpu(int cpu)
>  				return -EOPNOTSUPP;
>  			}
>  
> -			do {
> -				ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
> -							    start_cpu, true);
> -
> -			} while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
> +			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
> +				if (ref_cpu == start_cpu) {
> +					/* Prevent verifying same CPU twice */
> +					ref_cpu = nr_cpu_ids;
> +					break;

If start_cpu == cpu, and you begin with 'cpu + 1', you will never
check the 'cpu' for idle, right? Maybe like this?

        unsigned int start_cpu = cpu + 1;

> +				}
> +				if (!idle_cpu(ref_cpu))
> +					break;
> +			}
>  
>  			cpufreq_cpu_put(policy);
>  
> -- 
> 2.25.1

