Return-Path: <linux-next+bounces-1952-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F128A7962
	for <lists+linux-next@lfdr.de>; Wed, 17 Apr 2024 01:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 018E41C220F3
	for <lists+linux-next@lfdr.de>; Tue, 16 Apr 2024 23:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C82B13AA2D;
	Tue, 16 Apr 2024 23:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Wje0YfYU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A417713A3E8
	for <linux-next@vger.kernel.org>; Tue, 16 Apr 2024 23:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713311680; cv=none; b=uXqyObda6y4bSL2+qxxR+0Wso5tCWewPySrHiDp1YNIw53hS4ue+gNppmDQCEftWAZhYKgBIehwU0//ue3zeJS+HwEkUyeKO3p84BrMDVq6TX7BF3E2gCcflyWXgnTOlhsFJ2yLkhQ2dNc2cwLkEGSRE1AtSJ+7xxMqYei9t8Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713311680; c=relaxed/simple;
	bh=hH2IXYyLUNTbEsjK/nJ0ZXdazav3Fl1xtHqJ9wgCBnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgvOlEBA3MrADOw4DIUhZ7uZcEdSi9TSq/vUcLjRV8RR3Cdshr8csbJYRsFwpbFRARSerVOoFY3EW3xZ4NWBPlphnkkMnwMw/o6sKdWP4sW9gN9n5SeI1uxX8mBFVxInO9Ffck50hw/JJKgUUlpakORSWUHru2VkMoK5N67+Z74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Wje0YfYU; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5acdbfa7a46so99187eaf.3
        for <linux-next@vger.kernel.org>; Tue, 16 Apr 2024 16:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713311679; x=1713916479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=obsgGE9UFLqDe9yocWfnnIS1vPYUkOPTzraJi5WeXac=;
        b=Wje0YfYUJ1dXILWAc+P/+VzHGajVKGryx66ppM1cstwYXG09rAvCjBNbDq2YqdLZAa
         LTqDhlHo5bI3XAUwy8XB2dyRmQ+2sstJ4c/mrGdJ82sW8Dr8HO1gmGGKuz3nDXi3iGH0
         TYaecR1I9wZzkbbX2TVQqZsd7E7lxaqUSB0yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713311679; x=1713916479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=obsgGE9UFLqDe9yocWfnnIS1vPYUkOPTzraJi5WeXac=;
        b=isJzFcIfxGLDmm/nCguk5TiIejBdajssbPh7EpUHq4HuOi/pWCIg+RFj4jObX+EoR1
         pNbvclCOjIvlX/rGuVH16ft3A9yn6gB4KV4MCp/YszJimuYw7hkSomgDzPkhHNJ8oCwD
         hVS9yno1s1wTlPLOPQrJpcn61FwEtUrVPCsNyAhncDq7loqvbuyDDwIwnmH0uu+NPxyB
         pZAAL8CyUkuXIW/AmXdNVs/QEObLGtdev2gGpXh/OG7j/fyz8zBbSInPgraKPgrA0QyG
         5O+F3K84hDyii3FIFFFhV4HDJHOPjP6Jjs28DcVwcqRV1nDf1pt+xIm7qpSe+ZYKUwWM
         RmKw==
X-Forwarded-Encrypted: i=1; AJvYcCVLmBlOZoMUYaLLfmBCSlHmgBr/UbDcNoYpWGuRi0DZGBDYke4r1holH+quumg16NCOFgFgWh2fieWb04f8895P8TLj1a66Pzz3EQ==
X-Gm-Message-State: AOJu0YzVFaEH4m+5Nmn0iuti1GXEGePKHT7MMlErJICJl2qGLrET0hzX
	LiknKRilql/SSk/c1jAm7bv+85LGob66bw1U1rmKGXE071TttEUOwMCNFU/VnEYv99zFYJGXBQF
	X9HY=
X-Google-Smtp-Source: AGHT+IEsQgTwtMYioYHBQ1PcHMqd6YIkQksO6j9NJ5r3RaWWFOGzzSrNerdFgtbO0QrPQRKF/sgE2Q==
X-Received: by 2002:a05:6830:22d6:b0:6ea:367a:f660 with SMTP id q22-20020a05683022d600b006ea367af660mr15557579otc.1.1713311678769;
        Tue, 16 Apr 2024 16:54:38 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id z20-20020a05683020d400b006eb7b744ad0sm1233916otq.71.2024.04.16.16.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 16:54:38 -0700 (PDT)
Message-ID: <ae01f203-ff71-48f9-b5cc-9497ac6e269f@linuxfoundation.org>
Date: Tue, 16 Apr 2024 17:54:37 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the kselftest tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240415144358.086d0a74@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240415144358.086d0a74@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/24 22:43, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the tip tree as a different commit
> (but the same patch):
> 
>    398d99519758 ("selftests/perf_events: Test FASYNC with watermark wakeups.")
> 
> This is commit
> 
>    e224d1c1fb93 ("selftests/perf_events: Test FASYNC with watermark wakeups")
> 
> in the tip tree.
> 

Dropped the patch from linux-kselftest next.

thanks,
-- Shuah

