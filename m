Return-Path: <linux-next+bounces-5213-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD6AA11A7B
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 08:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E9B31887D0E
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 07:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246E422FADE;
	Wed, 15 Jan 2025 07:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTdLmudD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A60522E406
	for <linux-next@vger.kernel.org>; Wed, 15 Jan 2025 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736925035; cv=none; b=dY2YaTOb+58IyH4Y84H3KSSYRUrjWXPgUIoLRNG7PR4LixK8hGJ3MviW0TECI8YT2kjY5I/ULq7kur0ASqbm0a/vT5raV2iZzohLtRHrnCT3zE45Vaj0S1TWY1M012nKHp2kQXLRfKXPNGZavR0Z5KdoVHSmxMN4zXX49myOoa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736925035; c=relaxed/simple;
	bh=89Uprt3jQ5GaxW7Fj4Ps2eTr6psk49iCKDxyTAhlY8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXlBiK3Re7s6Pg2uQTUdK28DBSnmwC5+EVXw4UQ5lhlT8p+1Lpvu006zZe4U+06GEAz0rYOcibEgzAJ5TcSuTbKPft2PMKU9+UGo4GJjZaIFWlJgM7LiYJtjV6/y84Vrv9xSw7FxHtF7RPLInYRzqf4erknS+sfW26lyMQYm+Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTdLmudD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21661be2c2dso112077575ad.1
        for <linux-next@vger.kernel.org>; Tue, 14 Jan 2025 23:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736925033; x=1737529833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mOEG+IaOcy/PrGjU+jpIYZNjdIjvx4vhwiI1pnCKOGQ=;
        b=fTdLmudD0y5uiQTgerG3C5nvfIDts/6oIcws2fK0VXsd0qDv0icn8Zc+LDF1mxiIzu
         SS7c1uZlNFzXaiGu5HXEqhidrrih9dCipzQ4P5sesMGy06yOt1UOX9QBXDns/YG4AQ2d
         wZyYS+heYCxHtoou34Bu3jZIo6rZVeTWWOhCcYaJGKkGoDBOO6x9rVJkUCw0OhWSibYG
         krbLSR8WajXDZlvjujj003r6EOCvAfdGRP0KBsijPbKd3HkGFLj+WWrNNWiMlVvGOezc
         LxjIROApXztUJpXcTx6N/8UhDr3oIThp0soRAv208HQO3CcoWlq3RMYr7oz6vwtca7KC
         m99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736925033; x=1737529833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOEG+IaOcy/PrGjU+jpIYZNjdIjvx4vhwiI1pnCKOGQ=;
        b=i8ckIfF3r6x0y6Nm2SQB29DRGf0HgMn0YTIuxq6DHmniPJQEBd3UatYQH5Lqdt4skz
         hEPwcSf7Qu+SawxJW7gBBV4V1hlBKyYbPjyINUizTgzKRcLIunDMVqKfeW46/ggppymk
         y2/7seRjOxy0VO5VTrsDiCFFx4/muTbDrg5VdntbMReUKnLVdfkdy/fjr2TiVu+3ndQh
         MflHxhqL/6NfMymANbpBa84ryoYIFWf+2IVvK5Jl/gio+oFtCKUX2F/l5LrORWthaPHy
         ReNIQds/c3xjf+STeMbzYaVqJl/tvk6z1NOiFn6AWnf6TJPhdfvclDcJdebCWnC4mWC2
         b3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4We6DQcq7RJruQvPdSDc8+GFlB9RPnOmulxg8H3hANSpj+IWhRdai3bIpDFhvPpdl9HhEaEOUypUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzvgFnjQvpc7YUPZLhKNuGQZKkjtbNoJ0neNICkarXgQ1PZ/5Dj
	J5Qc/yy6iaIPiaqwDnTra3DkpKkNcdJoK7DCRtFxjDZEOKx/1NDLO9SgqdO0TIDePy4PYZnvC4g
	y
X-Gm-Gg: ASbGncvmgzWHVoO44O0arwZ0W5EMKPQB4otJB8eqRnEOpc7rqasi4gDsW/wDr66xV09
	74RWwIFK7n2+/g1A+R7DbQz1lB9kzSYu6WP7gma7dO4nPaA/fTJkm5leG89zOJbS5mjA08a73N5
	fq1MszuOglbTCykT7bbWmjE2nKdeL+FRYSgRQlP9of1YZZBdYMHwo7MJ0evzY3kNb/8u3yPwlmy
	J1guw+8ufwY+23Xx+ukVCQoR4PBKNoJsJRoXGr5l6a6Dh62uSKNXafe63c=
X-Google-Smtp-Source: AGHT+IEuMHxPDGbFNFKeOxEsheuJz48NrfvJv5c2Cg62+Zl3YMvzwq71Mc/iiPlFMjP0tmG1Go0JZg==
X-Received: by 2002:a17:902:da88:b0:216:1543:195d with SMTP id d9443c01a7336-21a83f64026mr430344725ad.25.1736925032893;
        Tue, 14 Jan 2025 23:10:32 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10de62sm76151775ad.13.2025.01.14.23.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:10:32 -0800 (PST)
Date: Wed, 15 Jan 2025 12:40:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the cpufreq-arm tree
Message-ID: <20250115071030.jkezypgvajz2xzs5@vireshk-i7>
References: <20250115122713.21a5721f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115122713.21a5721f@canb.auug.org.au>

On 15-01-25, 12:27, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the pm tree as a different commit (but
> the same patch):
> 
>   819ea9cd7de8 ("cpufreq: Move endif to the end of Kconfig file")
> 
> This is commit
> 
>   7e265fc04690 ("cpufreq: Move endif to the end of Kconfig file")
> 
> in the pm tree.

Dropped from my tree.

-- 
viresh

