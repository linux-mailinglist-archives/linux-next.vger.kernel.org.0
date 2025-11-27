Return-Path: <linux-next+bounces-9248-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1A9C8E6CF
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 14:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC9DA4E8461
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 13:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405BD2405E1;
	Thu, 27 Nov 2025 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cfFNHFQP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EEE1D63F7
	for <linux-next@vger.kernel.org>; Thu, 27 Nov 2025 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764249565; cv=none; b=qAzfn/X2mdSjm6GnziA5kPKZx2LlqyVBqlSRnE+0d1XTdyVqcYPUiQLP1RfNXo3VwXe1dFwSV8v/OfTgHXdvs8CHMjWX01sFivUb7aUIxV2koVcb6MJPqvgWjhILXWq/EpVkYfFmC3eVYRf+0GAfhC+aSGv9Xn9HMSMn5kojcJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764249565; c=relaxed/simple;
	bh=rOfibwxWRf32Ma++nSfe0PWaLNWAUAJOabr3s2oK5js=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLzIK29g3qnoVAstGT+ZsipEJI3PIWTJtloBmJ6pvLtcyDdU5HrCvNTeIdhBUWNEePNi54fwEkF0xxvP/bS4s6PKsX8oo7bq0Azr6hYM71GHHd9HCEBVwCrd6ACh2Qlw/liY5EnXLDZj8Rv7Q7Vf1195zOTvadAT//4EIhLJ0LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cfFNHFQP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-594285c6509so1039076e87.0
        for <linux-next@vger.kernel.org>; Thu, 27 Nov 2025 05:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764249561; x=1764854361; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qa5rSgxsMBgNnzr8BR11LLdhDyhOIcF98vMIluiI9sA=;
        b=cfFNHFQPIvCt73IYyw74bciZu5JrKqm0TvO7uBwOscWMyGyCeFlzfR7cJkfT8Bh8t5
         W+SjEXGTiDwuF2r6FGv226rgWPFFjB2Thp3RUb4AHOnRZ6Cjw20ZPmU30eRgUAKh9tki
         dvvH70Z5CSZRrq8UGthsly/twVOXCyrF7JOWryOsT4Bb9CenXXi6vG3TyynK5qnDsiae
         4jGso07MdrnjgTYTSHG6MnobRCBSSP2qKXC8UVUYAsSRyHEgyQxL2IVwn/zVuTor3Vhl
         4PuTyTI+SHO9xrQxpxCqSwaV5RmXhzUHrO3QrYFIhm4Zf7w6ScTSulVzjXISHMpLvAnj
         80Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764249561; x=1764854361;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qa5rSgxsMBgNnzr8BR11LLdhDyhOIcF98vMIluiI9sA=;
        b=mUIqbbo7aMn2coZw95Wo8uV5buo7OTv6il4/Su1OE/w4FAOQ7XmBL5YoCABmx5k+3E
         9wx/fj2u6dwibd5GBMTtioGjjfiClFRsyxACQElSdMBFyxgBAp14QVHD21YJn/Hzf8xi
         nPx/P+R5DUVzN68rRDjtX9ePlVLIEht8sfrMhdBnZl6D6xp9yu/1UNS1NzXmh4UOYNoY
         m+UibNezoxy2O07T3gq1jsSSOYflHrFq/SNNLEC+UeVrKKQNvgWC72WzcIY0f6wXMQyM
         epfKS3F8WcnMfukmBYLN9Ofn1WncEQytm8CgdT3F8kiIcqm6PHmQlBNaTY0Pe8df9Jqy
         1yng==
X-Forwarded-Encrypted: i=1; AJvYcCUANIiEtMWs+J8Hgc0mz1lSplO/23hQ7C0rQ52Wbnfq/oGtxbb4Ar0Wi+2GPq0LuAmf+RC2S8s210Jk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrnr0uuWekMEJfXvVv2ixlno9zcJ8tqQUkZxQ/GWPix5S3qgeF
	QZwteCXAywXWP/KxNoc+93/Jn2HDbfZC0LsMebAlENWyoXwgvUPDn/zY+1hRyh6QVu4XNp4FJYF
	L8PhFxMiGXNSfzBNiSQhO5Lgeikd9lWYKZt5+pG5iZA==
X-Gm-Gg: ASbGncuDh8vFRoms277Hi6yS/YT3Xiyz3uJ4SQ5lRCxCCgdQ6E53VkA1XKdPIy+YDRw
	SoQN4Sb4pTQns9Q7dpDnc+sv85g2yTgiIqaIBs5Fkoeo9/juzmV/CmUu9tHskmKIXuoUK5jwtaQ
	/VB7sGSowV9wbVlube9ua8v7lctP085A9SsjeZF5C69mpORYPLyGRCvhISgIiOp1nsJrmXmeAa8
	HdXb4tqRPxd2bVyVPKB6nRZsFwtqzACTCmFRfFd01oVLvvGkqnSr9vnSZIlKi/BdqJw4VEUHA8i
	lsp+tBeQaqIxoD0kzzeXhUbLICw=
X-Google-Smtp-Source: AGHT+IFv4GnkzKuW5eP3thzxCRyJsfT/CIvGgglFh+tmFfX0OqQYKRle07uF9vIrb6qOFN7GsZbNvxi1KoK9iGxUlqI=
X-Received: by 2002:a05:6512:238e:b0:595:9dbc:2ed0 with SMTP id
 2adb3069b0e04-596a3ea6664mr9117003e87.4.1764249561056; Thu, 27 Nov 2025
 05:19:21 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:19:19 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:19:19 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <2025112705-registrar-drivable-2341@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com> <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
 <2023112739-willing-sighing-6bdd@gregkh> <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
 <2025112705-registrar-drivable-2341@gregkh>
Date: Thu, 27 Nov 2025 05:19:19 -0800
X-Gm-Features: AWmQ_bnopX1NwnmSAB4rxhi5_XdHwE8aFqWlc4JptCLwfFW0D9DDoUsJLxqpKZ4
Message-ID: <CAMRc=Meb0-Q7UCPhbfQ+pLybS2Jp=QpwxXGXNfQ+Ti64okoqYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to modules
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Maxime Ripard <mripard@kernel.org>, rafael@kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-next@vger.kernel.org, sfr@canb.auug.org.au, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, angelogioacchino.delregno@collabora.com, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, 
	Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Nov 2025 09:29:03 +0100, Greg KH <gregkh@linuxfoundation.org> said:
> On Wed, Nov 26, 2025 at 02:13:03PM +0100, Bartosz Golaszewski wrote:
>> The logical thing to do would be to use "device_is_dependent()" but
>> this thread makes me think that won't fly.
>>
>> What should I do? What's the "correct" way of checking if two devices
>> are linked? I assume that fiddling with the supplier/consumer lists in
>> struct device is not it.
>
> fiddling with those lists is what device_is_dependent() does, but no,
> you really don't want to be doing that either manually or by calling
> this function.
>
> Who is creating this "link"?  Can't that caller tell the gpio core this
> relationship at the same time as you are wanting to keep track of it
> too?
>

The link would be created in reset core.

Let's consider the following:

GPIO Consumer A ---> reset-gpio ---> |
                                     | GPIO Controller pin X
GPIO Consumer B -------------------> |

The GPIO core will scan the device tree and realize that A and B share the
same pin. The reset-gpio device is not described in firmware, it will be
created only when A requests a reset control. When it, on behalf of consumer A,
requests pin X, GPIO core can not associate the link between consumer A and
pin X with the link between reset-gpio and pin X because there's no such
reference in firmware nodes between consumer A and reset-gpio. To GPIO, these
are two separate references to the same pin. Only reset core knows about A
being the consumer of reset-gpio.

We could add a function in reset like:

  struct device *reset_gpio_to_reset_device(struct device *dev);

which would return the actual consumer of pin X for a device we identified as
reset-gpio (for instance: with device_is_compatible(dev, "reset-gpio")) but
that would be adding a symbol for a corner case and a single user and for
which the relevant information already exists and could easily be retrieved
from existing device links.

I hope that explains it better.

To answer your question: the caller can't tell GPIO about this relationship,
GPIO would have to ask reset about it but having a dedicated symbol for this
doesn't really sound like the best approach.

Bartosz

