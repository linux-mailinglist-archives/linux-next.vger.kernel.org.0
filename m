Return-Path: <linux-next+bounces-2076-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0618B376C
	for <lists+linux-next@lfdr.de>; Fri, 26 Apr 2024 14:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD88228335C
	for <lists+linux-next@lfdr.de>; Fri, 26 Apr 2024 12:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F08146A70;
	Fri, 26 Apr 2024 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXfrl7/U"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AF01E52A
	for <linux-next@vger.kernel.org>; Fri, 26 Apr 2024 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714135596; cv=none; b=JoYx3P6WElbhZ6tCS4G51HYRaWCyS4pSZ+ZTOmZ8manx+AojPSTXUYyVObzf90fzkb+UW42dBc62Z0W3hBOqrJA9D0uWa+G3g3EpX9k3eTwjCJnd3CLBK36Cn/MmsUW1mhlryGBVJMN3XmQkuUNvN3h8Qn3Oq9UIc0fBdc6/WBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714135596; c=relaxed/simple;
	bh=U38lBxBdbJAthk3PLgTGuFCWuSMCMjm4213qHVnCgSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K46TgI3Yj2zESXmr2VvS5XfL1U8wjmMzj1vdTqCYeaJa0931a3fwPb6Rsg9kWRlDhEHagDGLXGrsyFzftxHs95SxkoAPZOwEQmg8uBncYm/h3zCOisaw82q/9B+fA2SRciRNVxALYdKXyRMgQDbUAPdKUkOUQSe4AiWSWEo8700=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xXfrl7/U; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f00f24f761so1789078b3a.3
        for <linux-next@vger.kernel.org>; Fri, 26 Apr 2024 05:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714135595; x=1714740395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JPGh0gHVMZemht/wTDB6oM+5daI9kym71AAC6ctQhF4=;
        b=xXfrl7/UJp/jiVikZrxjWQfIhsaGU2qw672qSw22/5tjU+Xks0D4RdLAxQ9N1xOes/
         216wnAQTS55IS0w6b6utgKBb3KpUAs7U0dZjNgUP+fI3ag/OIHeqIRmRsyo9uWIUMlcE
         tPEOteISeaJaekn/srA3bERXqeA2dKhVirNuggIPVrDAqALnnta2LykBltnw410Pvrn/
         xei+t3umw5aG6uTiiymYftdXbkIsFD0pMS9i7L+jZXy3B4va5Agaeg4DE+vT0yVsJPhE
         mAQ59l7Is2WmhMgG5Fod1/yo/pTfTmMXhZQyukXkDDd+Y717aSYZ01ALmQfyXenMa+gx
         8Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714135595; x=1714740395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPGh0gHVMZemht/wTDB6oM+5daI9kym71AAC6ctQhF4=;
        b=oGAtbTf3LqSWa/hLL5TWXqHVvgPbxOU5+lZ/zGsmGt1lpCxkcyxAcFamR0pC+OaEri
         ihPq3+JjpRCf4JZlWf6AAoySWGUAgH8RT2LaRYjv3MgFe7sKL2YzO3VBaVDMohmqmatm
         uXDXXsABsOAIRhF0JU/LpjzOj8d2gQmqNXyNlftkWrPCMzSwjAf5cUYoceSep10MoPzQ
         /uqYv3JbGd39lQiZQcWFhngEQhk3DFB/3tUV5Jmf/gSXom4hW7//etZTMZUVSY47gpvT
         ionF1Gc1PYQXhy/D8DRlb0GbJf29feM/C7zzvP34WW+7jJC3cUcJVA8rcyyjpQ1HhUtV
         XYHg==
X-Forwarded-Encrypted: i=1; AJvYcCUZwsCyO7Gt5gzdRE5k00m65s6lW94BYfKqdfga3xcZZ+sFMSELBAUxdRUQC55LQygjtHPvt7wNz2SdO8n3oZw4TpffCKyTR6YOIA==
X-Gm-Message-State: AOJu0Yy3r5kscrJ4ohBUc4VNZI/HE5rmELY57TWWzeaOlQR40EKRXt04
	mtdfk8JbCrJ55ryzu+GWj3hvVi1tSHAih27DCtG4rIgYYzQ8i9f1pEAb9qhn8M2bV3q0iBWc3oS
	P
X-Google-Smtp-Source: AGHT+IGAUEFjtMciPj0WTl57ecfVy2di6KoPWw+jQLFGgzZkcfYdqLC/5IZA9LUBGvufMoOH/niw+w==
X-Received: by 2002:a05:6a00:4b48:b0:6ec:d972:c3d8 with SMTP id kr8-20020a056a004b4800b006ecd972c3d8mr3012610pfb.10.1714135594609;
        Fri, 26 Apr 2024 05:46:34 -0700 (PDT)
Received: from localhost ([122.172.87.52])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b006ed007b3596sm14800145pfn.69.2024.04.26.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 05:46:33 -0700 (PDT)
Date: Fri, 26 Apr 2024 18:16:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the cpufreq-arm
 tree
Message-ID: <20240426124627.nscubryyy77pp4nz@vireshk-i7>
References: <20240426065343.4a29617b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426065343.4a29617b@canb.auug.org.au>

On 26-04-24, 06:53, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   51090b2ef6ea ("dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM4450 compatibles")
> 
> is missing a Signed-off-by from its committer.

Sorry about that. Fixed now.

-- 
viresh

