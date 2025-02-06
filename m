Return-Path: <linux-next+bounces-5378-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E891A29F67
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 04:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C94B33A46AE
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 03:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C89154BE2;
	Thu,  6 Feb 2025 03:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QnVaRI4H"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CFC3B1A4
	for <linux-next@vger.kernel.org>; Thu,  6 Feb 2025 03:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738812962; cv=none; b=TrBHhQAveW+WX4CDZgLhqGQALJ+V8ZiWAOdrvSn9sVY6h82/WmUsArF41n1XDwZiNe/QNFrEuLzTrXrLLL93S97juDexzhyVcK9o36ueVazA6h7xZEYA5B50GDBeeap5QshAUgakZrWPG1UdwmxubNL7zAJHOGPhOQp8wt71LaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738812962; c=relaxed/simple;
	bh=SliaH8b6GjP5DO8bJ29b+UYqG8BQPICpMIb2A8l/7sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcuCiChi2xax2BhEHBV+KhUmHGEv73GQa40j4J9iUQVX33K4MDTlo8IztoyQydpsTqyn8WscSiBHSDKrAv/6RIpeLw22gEH74aTB8IgGd4iFJscMEQi9W/XE/OKw0CRhxLuNqL+gk6oagLmhPC1cXnzVAFc9+4+8S7fMPCCjLKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QnVaRI4H; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f01fe1ce8so5980185ad.2
        for <linux-next@vger.kernel.org>; Wed, 05 Feb 2025 19:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738812960; x=1739417760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5QdU5dLEWKXzhZsgVLEFYLWQnoZN9dNqbJWkrckt/Tc=;
        b=QnVaRI4H6uC3lt04xrNZl3RKLSvV3AAojwOMHmdJMiOP7jV8QD7aA5eijDHwiyLIgA
         rtKgVAW2DcvWcnAoyeYZ247oFednEnsWwZWoHf22fhNlwoXqdXogw4JobVfNP07PJ6Jk
         IJ2Ru3sGy8Pav2X9rsJTvrxQz51vZcEyPxmOOzEeIc5k9oXpZ40m2oPeibJVQohaW72n
         wraF+T4YMc3+eKu2T5kETNZP6n/ArJkxxnWUracXUB01oJR4OiH9lE79iiD0K8GZNgd7
         loSYtkKYhX6WVjhEoy4deVFcpNd+UreKDDkPPzOc8Ey0zJQNaJRfK0tpXCGQUnhtotja
         kpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738812960; x=1739417760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QdU5dLEWKXzhZsgVLEFYLWQnoZN9dNqbJWkrckt/Tc=;
        b=iKgvUHop56AP6g1hrhCDI1eBvrUYHw93a4AxXv+JUWgwB8W1AbGJRSv3c2CHK8hF11
         f8NCb9jUlsqtH5AF7x8K/iEVA8445TbqDO0lO78dE92VKsedchagV277Ny2BmZw/2Wxw
         4D0TvN0NymWyWWYsR79axjSRWtfC5RXXqkfjJ9ycc77uXhVl4BR8AR80GuGbV6kwRNoC
         J8yhQpJpnOlDqIHtCbi9cEtIE8V+162k+oVbCqBFLqaovVHc2rkNTyEUo2D3U3kpaXy9
         jZQCOr7mJ/Jti/iS41qnE0e+rHMrSrvqPrq1zBzAoCT2qGan3R+5YYitlf8az6v1CtoM
         gTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL5KFfLH37ihwCtjM6GahA2E1seY+ErbMu3v9lJnyAWm52HQVMIMj7Xp1px8T7Q9njFywOIO/6CwSJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwbEIuh/8aoEtZIEvYEJjG7vL7KdrFAlMcXP8O3doD7EQ8tQAaU
	xyAngOz06vwQ1bjzxLMAFKNVtBZ+UYxjjmAkoBY6prjGwpQcYb2pKcxnVEvH7qs=
X-Gm-Gg: ASbGncssRMgde0QLwWc4jlN9SXqDoHdYAmxwwKODuZzqgv763Dry/Y5iO2izaMA/z4w
	3xOyabos2SYsWns2AWImGKVhG3KM/u/b+rU+/t7cu709rWEQHVJavp3zTVpseqP4DNOuqEHuaZe
	XIKrdHqBkqozP8JGThjCCfUxjy5AWxzXc39T4jrtaFvzGuqJzzSf0ftrdd71ZdX/LFflHdsahml
	I8Q7YFgfutXzuUUy2dfwOAXMroiMTNf99W5BHdYYdPfcpPGo1FPVLSbezMrNzMlpxQm39sCFE6Q
	TGEnAnyPFq6op/u7KQ==
X-Google-Smtp-Source: AGHT+IFu8Ns2woiq6S/e2FUNHLRPplPpN02WxrN73BtCsPcLpHZ5SjLLdFbqjcsqRh2Jl0/9eiGzrQ==
X-Received: by 2002:a17:902:e5c7:b0:21f:db8:262d with SMTP id d9443c01a7336-21f17f02bdcmr101308555ad.35.1738812960121;
        Wed, 05 Feb 2025 19:36:00 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650f382sm1803545ad.29.2025.02.05.19.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:35:59 -0800 (PST)
Date: Thu, 6 Feb 2025 09:05:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: linux-next: manual merge of the cpufreq-arm tree with the pm tree
Message-ID: <20250206033555.q24q36txif37hzgu@vireshk-i7>
References: <20250206115034.5d3004c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206115034.5d3004c6@canb.auug.org.au>

On 06-02-25, 11:50, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the cpufreq-arm tree got a conflict in:
> 
>   drivers/cpufreq/cpufreq.c
> 
> between commit:
> 
>   0813fd2e14ca ("cpufreq: prevent NULL dereference in cpufreq_online()")
> 
> from the pm tree and commit:
> 
>   60208a700f76 ("cpufreq: Restrict enabling boost on policies with no boost frequencies")
> 
> from the cpufreq-arm tree.

Fixed now.

-- 
viresh

