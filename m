Return-Path: <linux-next+bounces-5379-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C78DA29F6B
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 04:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65E55167BA3
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 03:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D3D154BE2;
	Thu,  6 Feb 2025 03:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0dPKYfU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9922982D98
	for <linux-next@vger.kernel.org>; Thu,  6 Feb 2025 03:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738812975; cv=none; b=eCnUi2zifH/ma/NOHRkO4j4QoGsSYnkJPo4hBBHkPbdR4o1rTF24t91iOEekgj1q0do/OZP84PY5mua3xpkzGLpFxg312eM2xF+iqribcGKUygElFuuYJLTd8pPOuy9f6wL+RQbA0wi0MnHFuf2uyTD1rD3uQoLWDkE2oZny1e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738812975; c=relaxed/simple;
	bh=nUn7jpead0jVpksmmBt3fvbMOGLyCxMY1xFmiLz0+Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oASkU1N0HLcrfOyZaHGPghRdYd1Ju1uEc2X993sCixCz8iF5VSq3vlChi1Yu9agUn+xKb8KKJhwzvAcT70Zn9SWN9MXYiPsngIxedakirMRRRi1tiFTL1R1FWgl1cQ5Cv7VBh8US2nXR8Cs63ZBaYYIpUYg/WdNSgNGwWguDl6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b0dPKYfU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f2f386cbeso7831175ad.0
        for <linux-next@vger.kernel.org>; Wed, 05 Feb 2025 19:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738812973; x=1739417773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dIOpqioAgB/ndF8DP7XFwysQIB8lV2nNyd0Ih1ODRvU=;
        b=b0dPKYfUUKw+LrBc2GVnI+OqvHUJoGRb+NIpzvr5zv1Gh0tR7qjLvZt0zN2B0r2u/I
         ZrW69w1iq41jjpt+Zet6LxCo7rkBEyAJone251wf1UbzcchsLz8S0Q4q90jrlUgCn5we
         i7N+CVKUZq4o0QlslEKt9w1NMew1AkwJNvJXVfQ2Aqra2JOxhju13EmDTzMb5bf6EhXN
         w+vdhIjUSwuJkzFqDEQC76sYq4/zyhcEOmHjJyO7pH9Wm7DxmXRVAXellxLmqxCjDZOr
         Mh0eL8DYYHsDXd3UJgPm5Gczrma89V56cPSkRbBkWQSnHcGqwJcpjusjhrJvn/N0qdeG
         Gn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738812973; x=1739417773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIOpqioAgB/ndF8DP7XFwysQIB8lV2nNyd0Ih1ODRvU=;
        b=UuxxjgVeiOJTdL9M9E3Oa+oSWcLgWJNdxr2DLvJWQ9AEEEE8oV58cnVFnesbeNHGlH
         QQ6IPRNtmotu1Ax1uFIMDFeSpPFs+mENqn7jW0KBnA4nIY4XaG98JPKIx52CaiJsfEZu
         7pgQZnMIOORpNd2EFs8KtedfxwGPIAvQj6G+V7LfEuW/XL2we8jTXFhHlu1QY9vZ3imq
         oUNDeKDj3x7Q5/3HnNbtNiU+Q6WpRdLQwr/k5lIpMPmmHNsMjT3gRxGns4OwZzU7/xu0
         ysRhtiRfzTZ+aPC9ePKshLo8eZ7Sbh7DBt9s37blrHTQQsnGvGLWdvC00Y4swfRZh5hs
         1iDw==
X-Forwarded-Encrypted: i=1; AJvYcCWSnGqMI9+FhzTtnWtu/80+XSuPtXEGDsRpTODlV1Q/fAV1VW01t4erPz72rShfsJrJQNjUzizJM/L1@vger.kernel.org
X-Gm-Message-State: AOJu0YzlgICFJnM/y9OIfrMbokMiIbphbjhhCWOWzzKWNx8kxsIdCfBb
	UrvmchmvjjooYrgikIuryrO1/iKwljQRz+akG7RLBmHzNYOCKIjKIfNn+n+Mtds=
X-Gm-Gg: ASbGncu2mohEL2bVBgq9wH44B9cYkqSpnXPUM50rEN5bdO/mejUwjye/ViC2zkCTM2y
	UOoJvjeLC/0WNWTjU7Bn9xOmT9vsGvFee+Pxrm2l+cUQO8yy5Skba1hQx+7Bvir2z7SF0qshzbG
	l955pVxJouZIWRkOIoS9ix7hazcpB9PGfCcNvwqoGnPWSA01zUoei0YPkLIihMIZ6E0/RiF5I2/
	dJrQwhON5WYWNf2c/ZbnvP7gYJL2fzIDPzxc3pr4VReS/+ro2qyrLJxdi9YQXFmv1/lGodeUCbV
	ll9dhcxDdCup5qvKLw==
X-Google-Smtp-Source: AGHT+IEqTGzce3M40oO4G0cKjxaLxgPjJr9NNCtr2/Bik129TKMeIjQQMblYfK3AauPHmIrP0e8gwA==
X-Received: by 2002:a17:902:f681:b0:216:61d2:46b8 with SMTP id d9443c01a7336-21f17e275a2mr86399375ad.23.1738812972871;
        Wed, 05 Feb 2025 19:36:12 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368afde8sm1668905ad.223.2025.02.05.19.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:36:12 -0800 (PST)
Date: Thu, 6 Feb 2025 09:06:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the cpufreq-arm tree
Message-ID: <20250206033608.qgllu3dbcmv5o4fc@vireshk-i7>
References: <20250206115403.67140b26@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206115403.67140b26@canb.auug.org.au>

On 06-02-25, 11:54, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the pm tree as a different commit (but
> the same patch):
> 
>   9d51d2710061 ("cpufreq: airoha: modify CONFIG_OF dependency")
> 
> This is commit
> 
>   90508a1bb8f0 ("cpufreq: airoha: modify CONFIG_OF dependency")
> 
> in the pm tree.

Fixed now.

-- 
viresh

