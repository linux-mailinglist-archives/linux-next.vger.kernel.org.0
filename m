Return-Path: <linux-next+bounces-3797-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E5976B58
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 15:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD6851C23566
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 13:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F451A4F2F;
	Thu, 12 Sep 2024 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sdjevSe7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D70E17966F
	for <linux-next@vger.kernel.org>; Thu, 12 Sep 2024 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726149476; cv=none; b=uqGOgfE855hiHrcMEWy3HlGl4axsvcZOpLetqmd2OTLCaLddt+qLURpCzZx8mStPZqQeJbntOEbWuNskc/nT8OzZaagD4sXLutF5RbYjvnU5lTVjajOZhSwn+S7GJWIhbbUToA9YfaTjEkPQHvu1m4mksTlBhNmBc7yfUtZrsL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726149476; c=relaxed/simple;
	bh=2t6DDl14FPTQBxdkXhrMD1mgAQ7ENfFgTaBWL8nte+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnaMu06zJp+xvdL4zwWYOmWnuiwpsUsquAqyIN8a8xL6PKRNherN3aHyLHC8XSX4q11sB45qlgOQZ+xTda4dMDAVzR06zEXuAd4JVvuDi6gB6cwIYO5lnkAxQYeMtHPGHlRh1M03B8AtR5qUQZ4BdgEL0jtMr9bA4GiQ54RgkAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sdjevSe7; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-535694d67eeso1024072e87.0
        for <linux-next@vger.kernel.org>; Thu, 12 Sep 2024 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726149473; x=1726754273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BquzwUboHzXTtdjd0oA0kjxZhS1hFAwbnuUx4HBJ0HA=;
        b=sdjevSe7zdUduecM/dZeRauUEqYexVDyD9gGVTnbJ559VjhFxGp+uQN5YdpxU2MtGa
         a1Jdr2UsOHZPmCTC4z1/KnL0Vkgi8sHbqYfM0dc73fMT7IdX0r3DJzznj/pct9DpMOvH
         O8P9oWg2YsVx7UeRaf6ISPE1CS1i42PCHppCk3HUpZKrj9A1xRYRxvsNGTGHZ0eYU7D2
         nsLcG+MdqKDHYzOnf5HeWiHILJp8nYTj+xCbg8c55dZCZhjV+6z0jd2GO/eaetVipP5D
         gJeJ6NuMQjhmux3yDeZfEEAdRQU5rYJiypAmYgaWrS+mCn8+C80KdyKj4xQtfXn/cZGE
         9e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726149473; x=1726754273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BquzwUboHzXTtdjd0oA0kjxZhS1hFAwbnuUx4HBJ0HA=;
        b=CfPvCAf0ZogQOveB76YgWgCsYD2Qv2zvEzhl8VB+0S3QLjuEumZdtm3+oetxHSIYqU
         cmgvTREZQAG4nR7oGO/6R6Fc9mwfheANzlxqod74vosN7if+3ILrxZZ9usQW65rzSyxe
         5OE+HHnQnPtuu8iDS1C/lRjyeDnkU/4b3BfanakzREUbEcp7/76wi4gRpE6seAV3jTBC
         9FfEbH9I+gV9Q1h2DCtraXprvK10bVWZWOe48jlo9OAdPnf2+LA+hriw4zSG2obIXf0V
         WvxmQTSMQjNc6+cZVCj+iB32tZw0ScWY2Edx4NAJFCCJ3C9RDeGcpJAJtV/DXYgmBQse
         eVgg==
X-Forwarded-Encrypted: i=1; AJvYcCWq/gArNjYZRU0+0o+pDNNHN5N8DeO5Wr+sfaf2eY0J/UyWkb3y/sPxHpoSKIbH370pGKHH5P7FxUsq@vger.kernel.org
X-Gm-Message-State: AOJu0YwnvlXIuVtkhY5G1sYlIdFI5/S3ZG5OLeVXMdvN6/0lVltMGxFE
	mVY2rn4UrHRrLcUFoeheFDuGE2tYsDXkOpwtK99GuU1UTB/TYF+mU34A0oURl6gi3Ohm7OKPgIG
	5
X-Google-Smtp-Source: AGHT+IHHjX/elZwmUhRzKmMZTPFW8UNakvXLNck40dZybOYY8Xg9afuQtW40j5sB4fM0Jm7lNQ5O5A==
X-Received: by 2002:a05:6512:3d93:b0:533:32cf:6420 with SMTP id 2adb3069b0e04-53679075a23mr986727e87.8.1726149472778;
        Thu, 12 Sep 2024 06:57:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f868cc4sm1923399e87.33.2024.09.12.06.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 06:57:52 -0700 (PDT)
Date: Thu, 12 Sep 2024 16:57:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
	Maxime Ripard <mripard@kernel.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <porwsaq63pizqyzq7agmt72lmowramhp6z5yqgu4fzs5n624ge@wyvmaahjmx7b>
References: <20240904163018.214efaa7@canb.auug.org.au>
 <20240911180741.45311006@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911180741.45311006@canb.auug.org.au>

On Wed, Sep 11, 2024 at 06:07:41PM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 4 Sep 2024 16:30:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the drm-misc-fixes tree, today's linux-next build (htmldocs)
> > produced this warning:
> > 
> > Error: Cannot open file drivers/gpu/drm/drm_bridge_connector.c
> > 
> > Introduced by commit
> > 
> >   9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
> 
> That commit is now in Linus' tree, but I am still getting the warning.

Pushed out the fix to the drm-misc-fixes branch.

-- 
With best wishes
Dmitry

