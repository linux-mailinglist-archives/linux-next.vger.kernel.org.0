Return-Path: <linux-next+bounces-5530-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A04A4A3FF4C
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 20:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9971E169E3B
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 19:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EE8253329;
	Fri, 21 Feb 2025 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl0bNujm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521212528E5;
	Fri, 21 Feb 2025 19:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740164629; cv=none; b=A6NgPVldQy5caDpjTMNwxV8kOwX3souqJW0rb+u8ZHHuWwfWU4RMAA+i09tBxnGMGaEWtIU8noawAzkiS+/Q2U+23LLttUzl4D9HCAftxkykHGOZTtHIDyZEq0tV8/ZA+ElDU2tIOGrKGOpojZ6kFC700suvdolao6VG4CW80vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740164629; c=relaxed/simple;
	bh=Yx3CJUQ5auhYQe1AJZt5x2K3GAMK2KGFQSDBdaEAfFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qn3pscEs4nejNiQGuRYMum7tafbh/lzgSM7uiD+5tOOlz0rbvpBuw6DaBsu79w7SIgY+msH9ZtjUXv35BRb1PjKslm15ZBXa+WmFJXBW+vz+X3iB2qYEKQ6ILrvG4ZafzsLnBHW8msQ6YCc0FNUnqf43AipNLg+Nlclg2Kn0jpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl0bNujm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220e83d65e5so49239135ad.1;
        Fri, 21 Feb 2025 11:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740164627; x=1740769427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vH5HFKaawkeYnTHXne+k2M6Gi4L64IdQGTcUjzfy9HQ=;
        b=Jl0bNujmhj1ZT3UvB4hm2DM/3omwI+EwUv5vxUZUnFWP7DvZ2l3Pu/r+ZWguQvL57g
         HMQvdJNu96iJ3kuWVIAyW+m/c1l6CtN/PTyvnIVhWigY6u8DIFDjzvrmpGXkrpzlCfVV
         fw9AxQJG9PUxTnjc2rFeCwBFlEFYukXzCskoovwwudIvf6PRgnrPoYjgAhAZdiuhZtmU
         jFjAiDV4UA4WTD2Nwsv5/rXaIgN4nEpOIuehFkwi9NWkLeTXcHHBVfbVIGt+AMujmNcu
         nlGGCDp6hdUfK71gpT/dWvyo/pcYTJzPe82vj+0oL4Uq2KX3989o/mGVoP6iLzHuGdOB
         +b3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740164627; x=1740769427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH5HFKaawkeYnTHXne+k2M6Gi4L64IdQGTcUjzfy9HQ=;
        b=MFq/yX34qfauc4kYpQJqwGvhb2ll9N1EPQHr21RB/JeQLg1B+6Th2AjaI2DizxjPQ3
         qrf2FskXt66MobSTY5vXn3C5w6oSPjHWLFarZsleGVA0qZXTOVHnyfWBnEItxlkylSSj
         dud0PwJaeBou4n/wxeEHVuE3RXam9dDlGFaiEmtct0Rfn30aKpYLBDg/j5jNOc/e7DsJ
         akuNrozZ+CbVgLQ+L7esBxVz2ThYV7CCz65KEwuqtD64F/89HzoiKALGVVIcQD1fZpJA
         Ka2SEMVy31ISeJKb1ibK8CJVfbJlJp0JO2n1fymfPi+sJvTd2OS4+ZM2xA2gNuMQk+37
         rkAg==
X-Forwarded-Encrypted: i=1; AJvYcCWsbRZAm239NNEKhdW42yEsf2E1/xaHmRReJsvo1Cvo/aTwwwuyXVOfPTyiuGxsX6qEf3yFF1jUqvjf@vger.kernel.org
X-Gm-Message-State: AOJu0YwduRhSIja9+/V5pc+DVIeK3HO1+qdflFO0NIY1jTN3eT3oN8Tc
	J7DdLQo5cUkhEmoJGRGTkZpWyPKeRK2ADYqo9vxy17hzPqGbskJX
X-Gm-Gg: ASbGncvZMHR5/YibSsq+sc0ftX+Z9ex9lrzqV1ad4BbJXhpXveSfmyhrj0uKPpsRzUG
	QbBAegQ0WDxEo0cv9vVUzxSan5k6e1esydfFmWykH+LBMJgXQggRAAs7mb9l5OgouorOcbRNMZa
	Kctodw8lODowqDKEXCoxw0/2BCwJ8R77NGIcDb84AZjXBO1MVXUfVsN+JxIhrNRo673NCg4YVmr
	PNR0ueMHj0fY53yYCGwrzBgA5/cG67D0ei/lroAs9f7ZrZHXAtKvHEXQ4euRBOzMlS+4J6UNXgy
	o4p9ULNPgZyYY6tFMVvEMIlU0Q==
X-Google-Smtp-Source: AGHT+IHdmbG5cRGpHshEwzmBxgJqyw7H3qrw+xRtwNe8nI+Hjc2ysty4thRXFYYFyK6ggCpp5W52Tw==
X-Received: by 2002:a05:6a21:69b:b0:1e1:aef4:9ce8 with SMTP id adf61e73a8af0-1eef3d87138mr8755556637.28.1740164627344;
        Fri, 21 Feb 2025 11:03:47 -0800 (PST)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73264729945sm12838710b3a.179.2025.02.21.11.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:03:46 -0800 (PST)
Date: Fri, 21 Feb 2025 14:03:44 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	sfr@canb.auug.org.au, ionela.voinescu@arm.com,
	linux-next@vger.kernel.org, sumitg@nvidia.com,
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com, zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com
Subject: Re: [PATCH v2] arm64: Utilize for_each_cpu_wrap for reference lookup
Message-ID: <Z7jOEFtVtcuMyjjt@thinkpad>
References: <20250220091015.2319901-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220091015.2319901-1-beata.michalska@arm.com>

On Thu, Feb 20, 2025 at 09:10:15AM +0000, Beata Michalska wrote:
> While searching for a reference CPU within a given policy,
> arch_freq_get_on_cpu relies on cpumask_next_wrap to iterate over
> all available CPUs and to ensure each is verified only once.
> Recent changes to cpumask_next_wrap will handle the latter no more,
> so switching to for_each_cpu_wrap, which  preserves expected behavior
> while ensuring compatibility with the updates.
> Not to mention that when iterating over each CPU, using a dedicated
> iterator is preferable to an open-coded loop.
> 
> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>

Reviewed-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>

> ---
>  v2:
>  Updated commit message
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
> +				}
> +				if (!idle_cpu(ref_cpu))
> +					break;
> +			}
>  
>  			cpufreq_cpu_put(policy);
>  
> -- 
> 2.25.1

