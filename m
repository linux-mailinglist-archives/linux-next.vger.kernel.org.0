Return-Path: <linux-next+bounces-8693-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9753EBFF5DA
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 08:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE4163A8B15
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 06:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4642329B20A;
	Thu, 23 Oct 2025 06:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mq6znM8c"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEC629BDBF
	for <linux-next@vger.kernel.org>; Thu, 23 Oct 2025 06:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761201373; cv=none; b=qw4zjl+wEkVTxG9+WKtmrwHuaY3upLnlrdr3TjmvmFfYEslhcIlkFvmG1HzAq8T3j/ot6SItjC4y5zdP6XWSnMip5YNC13cvbXX1f2vW2pfYQ5ZeQUEGAORuY+UECBrwpdek9uY8WRrv+31sCMQF/TjXZtvONWBpJ5a5dtf5/ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761201373; c=relaxed/simple;
	bh=r2Viw6f2wM7wXaaEqitsHmbdKgJ2vJCMjUuyyb+fcaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p38+RZhAQR1Apy+YVjW3KQowpqGFLyEnCCX6NzPzhYdV9zcQgkG7p46NN+7Lagn0ntcRwArdk990SnTWj1GVSiHKBsLH9Zn/QxidXzLKv56wIRQAJxdqJEjTeDKQUAZbwHOdeyiur18PPYnizXN3FRYePfGlIeS4i4dgNyowSZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mq6znM8c; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a1603a098eso323285b3a.1
        for <linux-next@vger.kernel.org>; Wed, 22 Oct 2025 23:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761201370; x=1761806170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sEWNT+gUT9HJ4EFz82wI/Nf7bJ0v9RjqwdfJhrsf0gs=;
        b=Mq6znM8cpxzM4j0zLQPAfJuCg8VRpWGFb+HFjVLOOdzVDwsQgfs55iIn0vCNYYNeGg
         5SSNwKfegNQnnyNAnv1dYTH2xy/LUY82BcIs+G/y0lUKOCopjZrnWX+V7zIL6LhdLTvN
         g1QzmPtUkhSjRnrsXIfLrhPyhHSt4d4OiSLam6lVGqE6L22e2efTwISg5xqGpSwKoDh5
         /BU8fUQbJuoWc2uuVdQD35rHJuWMJ3tT1qxbP4gAGuw7Shk3k+9x+ZeQcMSuF7Rs92LH
         Ex60RYp2qo3PmFaqUijAFbhnwDWzgUfmo8N/99nlso2mhsEMYfUHtv3dcr7W/GAffxNU
         ckrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761201370; x=1761806170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEWNT+gUT9HJ4EFz82wI/Nf7bJ0v9RjqwdfJhrsf0gs=;
        b=UhC0zA0TXO/SkKQFhayeIPcOIu6nZ+CqJCIYBpGEVl8dD2D1R7i4oxR7VfcurZ6guE
         aMGzw1Xno8M74osY14XaXErdc3ANhD6qLkFTAX4YCon+r28wR13yJjeZE699YMqTN4LB
         dZdQ9Re+kf1A4PhZ9ocrjzIjWVEYIWiC/fbzxMjCsOT8t1P87FXfPT5Eies2hp5TrKeb
         zCsRJmN1NQ8PfHUEzp+l1eWJmBy/0gS+bKh4X7o+yU67hSmZsuwmoNBw5wYe8jBTZDdl
         ETBEulkI+wWFzMv9h4kb6CTgkPHbhe7TAPqCqeD2MdBJnIH/lW44OJMiHXp6qSW5LW4J
         nQEw==
X-Forwarded-Encrypted: i=1; AJvYcCWsEVjtZl+VOW6Iwo39KP3gryuG5F/whB6n5XP+OQVEp9ytX5KR2MkroEff8LsWg3+5FZ+PhZWpcHg+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9qXkcR3qhQitEnaan6dVYxwTHcsCCe/O2AEQgOOVSx2WM8lrd
	4g3RvH7x9h2ybibeTPPq50KwqSbrVWPma7xswDM0n7JUNqlyczoIJEDBNFrGxv20Ug55FQBoUmS
	GnVHs
X-Gm-Gg: ASbGnctEJn/mjQ2MROodWbsdjGaNcHB6z+hD3WT8jeZ53TQi2bzEOxWgdX+bwz0vTdu
	L8PtRsNYm9tVnFKWc2D9wYMqkVQu8lBH3SymIDKZdYqh5ryfP21wh2ItU5wC+dVM/eAjE7M5gJX
	9tHjopVH1+wj2pG2DUSkPr5X5ZxxJ2Hu/joRbzs8hnnEZvydpuvQ017w+eEoyerfJ9DSDgUQA2Y
	p85lgtbBJlUjaKSYsY4KBThgIagE7AycI+ixZedGLQ4PPzkLu5jypVlfZpWEgRXhofPZJnbaGwE
	JyeRjhGrReKASRteFKmLTKFKTDacqC73LEfaM2wEki+P76JC/zqFjNqAFg+4EqFUHkQaE6Tv7Kj
	CAYNMzNWkNzCd+I61si21xJRSFmmh8GfsUi7G/239l6Ysqgx97F/cErSBU7hMckaP19Uz4HNnWS
	lM3E/m9boRAU1y
X-Google-Smtp-Source: AGHT+IFPxzD0L54FtzksWCteNTtzPPxqNVcq7p4fjIjoBI+DwrPKbsfF7hPTY9gqWPp0Fxc0Y9Jeyg==
X-Received: by 2002:a17:902:db11:b0:240:48f4:40f7 with SMTP id d9443c01a7336-290cba4efc9mr358978975ad.39.1761201370245;
        Wed, 22 Oct 2025 23:36:10 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dde9880sm12210885ad.26.2025.10.22.23.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:36:09 -0700 (PDT)
Date: Thu, 23 Oct 2025 12:06:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: KernelCI bot <bot@kernelci.org>, kernelci@lists.linux.dev, 
	kernelci-results@groups.io, regressions@lists.linux.dev, gus@collabora.com, 
	linux-next@vger.kernel.org
Subject: Re: [REGRESSION] next/master: (build) cannot jump from this goto
 statement to its label in drivers/opp/o...
Message-ID: <tficx5oz7gtakb5ffd3j5cikjmrfw3js53r4k2xhoxi6z5lok3@a64sj3k7kovf>
References: <176119914391.5792.9020817346274859760@15dd6324cc71>
 <20251023170911.0df27b1d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023170911.0df27b1d@canb.auug.org.au>

On 23-10-25, 17:09, Stephen Rothwell wrote:
> On Thu, 23 Oct 2025 05:59:04 -0000 KernelCI bot <bot@kernelci.org> wrote:
> >
> > Hello,
> > 
> > New build issue found on next/master:
> > 
> > ---
> >  cannot jump from this goto statement to its label in drivers/opp/of.o (drivers/opp/of.c) [logspec:kbuild,kbuild.compiler.error]
> > ---
> > 
> > - dashboard: https://d.kernelci.org/i/maestro:992b985637471b20dfed6cb78dc938315a3ba8b6
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > - commit HEAD:  efb26a23ed5f5dc3554886ab398f559dcb1de96b
> > - tags: next-20251023
> > 
> > 
> > Log excerpt:
> > =====================================================
> > drivers/opp/of.c:1545:3: error: cannot jump from this goto statement to its label
> >  1545 |                 goto register_em;
> >       |                 ^
> > drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
> >  1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
> >       |                             ^
> > drivers/opp/of.c:1539:3: error: cannot jump from this goto statement to its label
> >  1539 |                 goto failed;
> >       |                 ^
> > drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
> >  1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
> >       |                             ^
> > drivers/opp/of.c:1533:3: error: cannot jump from this goto statement to its label
> >  1533 |                 goto failed;
> >       |                 ^
> > drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
> >  1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
> >       |                             ^
> > 3 errors generated.

Fixed and pushed. I didn't check with Clang earlier and so missed this.

-- 
viresh

