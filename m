Return-Path: <linux-next+bounces-6428-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC85DAA0174
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 06:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72D8D1A8824B
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 04:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85584193077;
	Tue, 29 Apr 2025 04:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AsA7UZRe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D652F78F58
	for <linux-next@vger.kernel.org>; Tue, 29 Apr 2025 04:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745902106; cv=none; b=ijkix0q13Qc7BmjjiK9CL0B47rXbnjkV3GSZuJLwVGpKzKBfbDkFMK1ln955LWrFqLMqjRLpr0GZT+F/eJI4r2qDokfspWlajBpGtMbcc9Vb8AP018ZSfLu8UIAtZWTwC8EmXkTVOmbmy1IdD5koYzgAu3/JdMjGJJUEzpwbPV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745902106; c=relaxed/simple;
	bh=VCMJJve88anrsuxyVK+TfXE7cbneFl3RnHO8/EQ2TMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btNi5Y/0AtPTKomsv5oNxDJ4/jujlwzipE0ZV/FgyRKtPXG87STi0y5aYCrPe1rXSacOGoYCgJ80wS/2iRQkBCfhUQXojEuZdn3p1RjiyF2DSu64CbFUr9QpWp1pkoa9zaib4lq+7sUbJLAr9iWaoFeKBVHauvamD5BW6PJGiEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AsA7UZRe; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c33e4fdb8so59139265ad.2
        for <linux-next@vger.kernel.org>; Mon, 28 Apr 2025 21:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902104; x=1746506904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtMz8/ccT5uwWHv0d7bgFO8EnSen4dzqNoDx/0ufVro=;
        b=AsA7UZRe/bKvL6j23s81PqHxdN9d2VJq0CcOn0HC6OqPtbqsMoE1pf7amKw99Rkm/I
         oItE07NNUogV4KAMfqfgrjqsDOuGniYeDATflZIqV3AQOUBR/E/k9+eWOk1iZihxOjr7
         3+lqcPZDRz7VMn7NanbuEKo4q6QJ4x2EAkHbpP1laew/cnh4+N+XzyH91pVxB2tMG413
         xxvosxhaLAAys9TOgSFtt2icnwoeHQvcMyT+rY2AVX+mWJ2/ikudSaj1ybZVEcx94AXX
         qEu14NmlR4QjkzcpHYbLflpLhIcyZ1R+k1C2PK8ybX98wuaOxe1LRLCPMpHf26EJuQmg
         8XYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902104; x=1746506904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtMz8/ccT5uwWHv0d7bgFO8EnSen4dzqNoDx/0ufVro=;
        b=H3hbv3ufp9s2nLF1rEhtV5iK26Pe9TSHId1fW+H//SP87moDA8Cn+Hqm8x9isuQqq2
         tEmciqs3FCw8aSFqvIROR6SqUP8RT14EgG7IunVnYo5cUK2Kxq96MBcstQJEjV4oLu3V
         g7F4WcuwSGAfVMdxOxdZSfFKmxdBzlSXnpEHjSHy4EhL0EdhSMMUm8cQI5RL5bCARXDS
         mjpbrKE5h+DN41qH2wiq4BBIYRuJW+TA1pXupmPREtGnOPpGEHYkiJa2C00ZIfrBQQC9
         veyPPvcmCrHLfKMFDHpYCJPdjn5mdhvIQOL5iKLdU4G/9jpzWq707GSsHWapaa3AThuh
         iPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVWtZvMEVMsbAyxdmg89+GMCxNeYcN3NnI7QBS4GC3l2D41RzxpILsAXMHebDprlTh2AIl9+55awiW@vger.kernel.org
X-Gm-Message-State: AOJu0Yze3kQrfhDepEkJSmN36d7/Zp7AZtJ8WaOi5xkAhz0IQpoy4/1t
	wr+vIUlrZ6fW/2GmcXWUIIlKhFWjbEboXjmYxtGr+8ZvbTAh1i0l0pwy47SDc/s=
X-Gm-Gg: ASbGncum1slJjWm1vYrWgsddtr1QheJlbA1/JDmHiHg0cEzgpkSqfjLxkxcwdKwSZgm
	sN6tGpSCI2WRB29ivpge5Eb6kn6ndlasRwrXQdyAFXzoXC4gX/zgdsfmgGJN7h9o3DyIbBJ5TJL
	ZgyxpdPb3w8EJkU7yKznlsxtfhesk553aokR7cUaYIHPqh8pHwHRsAtnJGhlo7eh8ePlpSYmrCK
	i93V4BTM0yX+CGniFABz4h9Y5bHiRsnWOrLC16NxgxA4QAZ3nplFZgW8KDL/R96zjkjC8h7EUzZ
	NYl3qCKdwjq3m63zIcHrv4L/rfQPzrIn34W9PrWQnQ==
X-Google-Smtp-Source: AGHT+IH3WduLwf1iQegeQVT+a+cT23q3eY/eYp9SYidIViTtTzAqj1+j2VCGMd7VupPgujLuG8AGRw==
X-Received: by 2002:a17:903:2309:b0:220:faa2:c917 with SMTP id d9443c01a7336-22de6066b8dmr29539615ad.34.1745902103964;
        Mon, 28 Apr 2025 21:48:23 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76cfasm92771715ad.47.2025.04.28.21.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 21:48:23 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:18:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cpufreq-arm tree
Message-ID: <20250429044820.2yhrr3xvmy6riwgc@vireshk-i7>
References: <20250428115704.46e31d9c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428115704.46e31d9c@canb.auug.org.au>

On 28-04-25, 11:57, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the cpufreq-arm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> error[E0308]: mismatched types
>    --> rust/kernel/cpufreq.rs:950:18
>     |
> 950 |             Some(Self::update_limits_callback)
>     |             ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn pointer, found fn item
>     |             |
>     |             arguments to this enum variant are incorrect
>     |
>     = note: expected fn pointer `unsafe extern "C" fn(*mut bindings::cpufreq_policy)`
>                   found fn item `extern "C" fn(u32) {cpufreq::Registration::<T>::update_limits_callback}`
> help: the type constructed contains `extern "C" fn(u32) {cpufreq::Registration::<T>::update_limits_callback}` due to the type of the argument passed
>    --> rust/kernel/cpufreq.rs:950:13
>     |
> 950 |             Some(Self::update_limits_callback)
>     |             ^^^^^----------------------------^
>     |                  |
>     |                  this argument influences the type of `Some`
> note: tuple variant defined here
>    --> /usr/lib/rustlib/src/rust/library/core/src/option.rs:580:5
>     |
> 580 |     Some(#[stable(feature = "rust1", since = "1.0.0")] T),
>     |     ^^^^
> 
> error: aborting due to 1 previous error
> 
> For more information about this error, try `rustc --explain E0308`.
> 
> Caused by commit
> 
>   c490d1f07bec ("rust: cpufreq: Extend abstractions for driver registration")
> 
> I have used the cpufreq-arm tree from next-20250424 for today.

Fixed and pushed. Thanks. There was a conflict against a recent update
in the PM tree.

-- 
viresh

