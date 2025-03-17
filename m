Return-Path: <linux-next+bounces-5829-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2E5A650D0
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 14:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E63B1669E9
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 13:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0150023F39C;
	Mon, 17 Mar 2025 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNTNn934"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEA5EBE
	for <linux-next@vger.kernel.org>; Mon, 17 Mar 2025 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218112; cv=none; b=aKQTF3WsMZdB8I/QweucXly0Z8MaNBjz7nufx+VoQHawXi98fGozPHp6e5Zj/o8XpF3HVIWzxTia8QD8MejFKWEV5VkVbRfp3xAI8WuV4HqvHGWfw0AKpU9OsAZISQWiOkSdVCKZnl9W0hU7AQf6oofJAX+Izu+9lC7ychA3HkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218112; c=relaxed/simple;
	bh=lEmfNyIA6RNJ3ny5+YoC3NGJhAIqHrv/+7Ma+TDB3uE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rl7jRpmwno5EvitE5MrCbPhJrE5cHygEAmclXgoUwB/Pc1sed0qJwomDA5mXWQS4XU1Wl5o7ddPJ+2xGTvlnyxz3JcfBW4ho11nXDrUvU3tOPNAOzNeZUVSDkGkAlU+gQ9A2UdZ53xqXtyugKwoR0qbGr2aTSUcSiKdK2mSdNCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNTNn934; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499b18d704so4423318e87.0
        for <linux-next@vger.kernel.org>; Mon, 17 Mar 2025 06:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742218106; x=1742822906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCb4df9E2zGdFeYXN7RFk9uBy6N11qlE25jYcmNSEUM=;
        b=ZNTNn934T0vMmGq8TugDom9m98NBkAy2UN0yw+1/yHAf4dUzjAISv6yww3avgTzb9r
         Fnu+XXIsnzzVxNjb3epLPT+PY7xIHlY+986vPyGjOjRUeuGwGKmdvK6N2deLaDPh05Wb
         TBui02AWR4m1sJsEaXaveiqjEF5uNW2WJQDPGGV3g13nFfHP10Vyl86IWQh9t0DK29/B
         HNK6gzjhT5Q1Nd6Re6vHnqDbFJR51JFEvpbWdm1rD3/I9wMwOERL9axWpbkGCgt+XE+o
         VypVQ71erJbccO6I9im9kgq7rHZh1dooM70W6/cDYJSuKAjm74fNBrYsLdaWfE0zQWpL
         a+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742218106; x=1742822906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCb4df9E2zGdFeYXN7RFk9uBy6N11qlE25jYcmNSEUM=;
        b=ZjUnvRsTbNH5vsZFmHIX0s+5VXSWDiczEr4F+4am9RBI2/ViwSmr2mj+CIUQBReEXL
         lqRmn7obDfg++0pOFPJRYBn/vHsCRWP1eMzh4KzjXir/h6tvu88PkLv4jnEWlocHlcaR
         bJ88uVCqKlNTbjyiDTdE3cpo3NOkOJUwRKclxKdM2gfp+bZN2BugR6d/7GF9c7FbduaC
         hTZPKiV3VZmtdmYoJG2JKUwg5tJ6SQXm4cMAlN/ksYcrXC2yCNBoMHzorvChv+0jKPn9
         qZ6GAfliJIUa7LYWizi7z+R9HudqsiEDWJa7KwhCQsxZoOXvAdpRqS9Yp9iyll9rS/dT
         dZkA==
X-Forwarded-Encrypted: i=1; AJvYcCWsS1qJk8ySt0jj7XoemJAznSKBON2epd391aT2bfgM4wjZUccckvl/pmTJb8MWSbWjRYGqrASQQzn6@vger.kernel.org
X-Gm-Message-State: AOJu0YwE2gA171bZb7JFahoZIElfKny+rzS0lP3sO3Qw3ySFshlpGbUt
	U8nC3RQtfMCAtlGMI1VrgT5mydnmyemydUr3c1V7nuEe0yWfUU49dq+/Z0rj4oz8x4xt7aGyOfv
	Yy6kXVdFzUSgHgsLa5lk13bUYMqU0vwMpdY8ShC/aTyHY+cJU
X-Gm-Gg: ASbGncujMgP4JsON5miI1dg8NLZABjUwbIoXmD8V4TAXdFplgdCu+lzcErFOfXT9Dcl
	XPjTqDdLpHnJL4ueqMhg0dzBGzIBH0OxoKBOrDVmlsrgCwyfddQdH5WbUhqBNienZVxMcSiOweF
	eYmzQ5n4fwUh3xVFkmRRFBCxAnN2dLxsQ+6g==
X-Google-Smtp-Source: AGHT+IHfDvwh0B6r6tp0N3rPaDV+ueRiI+e16YoknvYQYEn15rtBX3cLUUUSuskc9RIR+xdHm27WD7RcqnQ3U6ffaps=
X-Received: by 2002:a05:6512:128a:b0:545:3037:a73a with SMTP id
 2adb3069b0e04-549c39045f1mr6739117e87.13.1742218106136; Mon, 17 Mar 2025
 06:28:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317084331.032c61d9@canb.auug.org.au>
In-Reply-To: <20250317084331.032c61d9@canb.auug.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Mar 2025 14:28:15 +0100
X-Gm-Features: AQ5f1JpHY_xjtnDU5i4KEaQWMkGw18yj3KS7YcrQUBJ62FogfFBiv04Z1Kwj2Es
Message-ID: <CACRpkdYMo7wdnahe8rCtUB0epSz4j=0d5r8GxZn0AbrLdU_yXg@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Prathamesh Shete <pshete@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 10:43=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:


> In commit
>
>   a906b771499a ("pinctrl: tegra: Set SFIO mode to Mux Register")
>
> Fixes tag
>
>   Fixes: 59b67585e242 ("pinctrl: add a driver for NVIDIA Tegra")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: 971dac7123c7 ("pinctrl: add a driver for NVIDIA Tegra")

I went in and fixed it!

Yours,
Linus Walleij

