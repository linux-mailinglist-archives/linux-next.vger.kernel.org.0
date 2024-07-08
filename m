Return-Path: <linux-next+bounces-2845-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AE092AC49
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 00:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BAF71F22B30
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 22:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F201509BE;
	Mon,  8 Jul 2024 22:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kx8czMfD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CC614F9F4
	for <linux-next@vger.kernel.org>; Mon,  8 Jul 2024 22:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720479279; cv=none; b=Go/uKMo42fk+K6ffmjOzd5GmVvMwThj45m2gj7ayJOsDHPCmOwno1IIt9sXWww72nZJcGKa0ADgoNyZbNVKJXpLl5/c9qfcorbU4LRUwNkIhV3NkGedoTL0VjpPOSjnxz+EE2kbhL/c5KLrKpdy0EiLzju3grUrRVdfIT0kkKMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720479279; c=relaxed/simple;
	bh=M1teXtEqzBNMemfd7v+9SUr6KAqOs1d1qIm6KT4egzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8J22uxRf/13ir8EqUVmMZfWe7uypXf4F7/uXJeWZPi+QLwhvRsyKt4ajn7jgqfIFCcnizOPcZ0K+zxDCEY2K551L/liMUCeCEwYlt8/k8IP4lNkwr3Kd8fgEuLdY46H50Jmw9x9XbX9rQsLLIXk8LnXMyXpKWYPyD8R6O5QiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kx8czMfD; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e03618fc78bso4398211276.2
        for <linux-next@vger.kernel.org>; Mon, 08 Jul 2024 15:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720479277; x=1721084077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BpMVBXpONIC3Eu1OWrK8ZtjErK/z9AKePwun/fM/jmc=;
        b=Kx8czMfDGVSqQIYq/ZfoRjhcmrUxSwONcn3+IBvhyfjZEDY2ycsvfGrSADkKh09q9z
         7xivVC7bZZIclJe6b46/v4eldCzuBp1jMyRHAYIjXpaRr9HJEB7ZNlNkaBgUkHz5lKX5
         84m0B/y/f9wFrtAFagwc1IBvUSvQFxm33pu2Eyp7Kt4tHeF5tA1zBdHASaj/GhamUhLl
         ghWhKRYUh7HGuveJ1ATJg1UG7t+iJlYkSSHxMKUzO71NzEF4cKZ/iaKu5yPHmvEcrIMh
         lwWvbPm5DPhsDFDf14F92IMzAgvV+SKMCoBZbneohc6hofvh4rCQj0LLpieniDWRIQGl
         tlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720479277; x=1721084077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpMVBXpONIC3Eu1OWrK8ZtjErK/z9AKePwun/fM/jmc=;
        b=VYqtIm9ZaiBpkmhnt1SdSoJOKQt9Bg6tBhMVgPB/OnT85mfPT0ONLdkSG8KCx8rzpt
         Ld+w+M8rPM2FLgsQyU4Mhj0IXH0CAc/ZzfxJQNtjdJ255OSsmYMAxLPboROw2aYMpw6c
         vyeydsX4IIiIX5X75dC7nXfg9y8VG8qd04oGLYKMmxkp4hwg2NYW0jTHssnvTecmGhs4
         163sQo/8dUxDDMXl8VT2DYmefpS4dc2Opqwe63xBvNsjBuT7YuVPmwmHNgV/zbLal31D
         TtQZzYnSh4eVBteqqH8q+57K9engbdszRwkY8rLy1hAFKJduw6OSoSRt6MyCczmk1nPE
         NliQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9h16hesaNSwh+NXGl6IJ+3RSm1C35h6ZG4eZIPY39mzMfBMmQTTClgSWnnZzEvpfv66wPywM0VjBsCrcjOzEygkWoc5rd6HmXvw==
X-Gm-Message-State: AOJu0YylqgXDfMoMWH/LiLqfXzu4TJ+hlF1dPchfnGk9y3lVCCvzF6PK
	Fv2HzySrU8wheOdTnElW8sEoLtA3pU0fU3UsszloaZEQ0GdlpiSl3ZWNem/T2x7Wu6wnESrRPVO
	Qhh8oJschoW4cTR3/p/eafWA8eZIH6nHOPQuptZj4nlwpErNCU+Y=
X-Google-Smtp-Source: AGHT+IHd7gushZ3fFJI6Z5/9daSH7WjN5Kth+2qfzwWNdWdQpkpmbQyT7N11rbO1k5F3rGB/Xbfge+MrIJrcQbxIxgg=
X-Received: by 2002:a25:4cc1:0:b0:dfd:b3bb:ac11 with SMTP id
 3f1490d57ef6-e041b1c2cc4mr1140503276.59.1720479277314; Mon, 08 Jul 2024
 15:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709085238.1fbc301d@canb.auug.org.au>
In-Reply-To: <20240709085238.1fbc301d@canb.auug.org.au>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Jul 2024 01:54:25 +0300
Message-ID: <CAA8EJppPsTniX-0XJ-aX26hzO2GKEF_Y_qAjN3tYhQctfzJOww@mail.gmail.com>
Subject: Re: linux-next: error when fetching the drm-msm-lumag tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Tue, 9 Jul 2024 at 01:52, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Fetching the drm-msm-lumag tree
> (https://gitlab.freedesktop.org/lumag/msm.git#msm-next-lumag) produces
> this error:
>
> fatal: couldn't find remote ref refs/heads/msm-next-lumag

Probably it got removed by gitlab when the MR was merged. I reinstated
the branch. Thanks for the info.

-- 
With best wishes
Dmitry

