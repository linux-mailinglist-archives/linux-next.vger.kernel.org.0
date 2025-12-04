Return-Path: <linux-next+bounces-9333-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8B6CA32E9
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 11:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED511300E742
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 10:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5019337BBC;
	Thu,  4 Dec 2025 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b905ZK4x"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC81337BA1
	for <linux-next@vger.kernel.org>; Thu,  4 Dec 2025 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764843258; cv=none; b=i6NUCccQe44XOpJlPr9w5/HrLzo7Yd0GjUmgKUI/6q25C4GIVO2Cgi3Un4V7GGFB8h67sUnVxHmijwk/FWsmIIQ9DL/y1UhxPOIxzY8r33uNCj759Ni7DoCzEpGO1AHBkLQ4Didaw6VqeENFXCA8dQl/77C/PZsraXLwtAH6NYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764843258; c=relaxed/simple;
	bh=pYNaUleOJNpP+/eYHJsCgPXPDeW7AQVJ1IbGz98O29Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCUebP7ORcVbPdWXjlKBAz9bT/1uK62aXSCDYdNt2m9eafVp/vZTzU/Vk7KsysGTUkC3D1UlVDm3GjtFJOcoImfyfS0PNfQ80I5IrP4NWVFuHP4cT0xugkbyrMrzY4JuO9G0lhiklSBM07MWAh3wzBe+dAtpVgy/74GL4QlFNNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b905ZK4x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46441C19425
	for <linux-next@vger.kernel.org>; Thu,  4 Dec 2025 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764843258;
	bh=pYNaUleOJNpP+/eYHJsCgPXPDeW7AQVJ1IbGz98O29Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b905ZK4x3GsY/EknocexUQAW5cyJioFfha65t2yOIgucuCHa4UOjGIQBJHCSkiQb3
	 Qvan+DLlhRA0hQuG1KYb47PYY4Cja/wy0v+N4yoW+0zuJJ6NKiiJ6nDwwvgcSM4GK9
	 Aip+tJ+py4DHpp+Npt598Uv9MYLPuX7eBHLawEo0J443F0OVvdhQjEw1a5mwsUZUeJ
	 LoGbzMTxSzJMUavK19CeYZXAnLUB19CIJUv4GxA1DOBvIEea1x4c9+vBnjfQMfgLLr
	 ZuLYy4z5vMXHMx6h+1h3+PK6shJYWWgNTf44AoTf7/XH9/G+vlxShEK2jakvlckpb7
	 8PAIoEOZ5wwHQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5959da48139so780663e87.1
        for <linux-next@vger.kernel.org>; Thu, 04 Dec 2025 02:14:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV998r3aQtkyWdvi1Dp0sVM45bd5Bv2OT3lEhQwDFtqUbXK6XeB1C85x2dLsIH6FMHPM3Crlbs5YqiT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/47s3GF7ue6hp9xBwD7+x5O4EOySfNc6sdYlBQ9SBCxm3YH0E
	U3RGDEH2Qv9jzwH1Cpe+M9Rtb6Dqw9H3L1ob/QPvxTZt5Pa5W/kWO00V4AL3N7Ryj2uhYOEh+jM
	HNgw5N4S8B+Q/X4luLMR4dU66F4Aezi8VG3ciAn589Q==
X-Google-Smtp-Source: AGHT+IGlPYgkRNo9mBlYM/VnkhHcbC81roAlz2w2S9o/KklcxGJxVASbQLf4maYoGnDUYTQ0hHEqWp1cF5b9IPspFrc=
X-Received: by 2002:a05:6512:124b:b0:594:34b9:a7f4 with SMTP id
 2adb3069b0e04-597d66b7dfcmr940244e87.29.1764843256926; Thu, 04 Dec 2025
 02:14:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com> <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
 <2023112739-willing-sighing-6bdd@gregkh> <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
 <2025112705-registrar-drivable-2341@gregkh> <CAMRc=Meb0-Q7UCPhbfQ+pLybS2Jp=QpwxXGXNfQ+Ti64okoqYw@mail.gmail.com>
 <2025120326-treat-unstopped-f883@gregkh>
In-Reply-To: <2025120326-treat-unstopped-f883@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 4 Dec 2025 11:14:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdhG7tBoEt2cm8qVJS8tisKPNr6u+umtPW6dFw8yF=N=A@mail.gmail.com>
X-Gm-Features: AWmQ_bmURBdUM8O_DmKkTrT4tt34yC__Hb5uhplwc0lwnHaCcnOqTLp4hNngp4Y
Message-ID: <CAMRc=MdhG7tBoEt2cm8qVJS8tisKPNr6u+umtPW6dFw8yF=N=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to modules
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Maxime Ripard <mripard@kernel.org>, rafael@kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org, 
	linus.walleij@linaro.org, Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 6:01=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> >
> > I hope that explains it better.
>
> Yes it does, thanks.
>
> > To answer your question: the caller can't tell GPIO about this relation=
ship,
> > GPIO would have to ask reset about it but having a dedicated symbol for=
 this
> > doesn't really sound like the best approach.
>
> Ah, ick, no it doesn't.  I really don't know what to suggest here,
> sorry.
>

I found a viable workaround inside GPIO where I create another GPIO
shared proxy for the potential reset-gpio device. So that if there are
two users of the same "reset-gpios", we create three proxies in total:
one for user 1, one for user 2 and another one for the reset-gpio
device which may or may not be instantiated.

I think that the best approach would still be having access to
device_is_dependent(). I don't quite get why read-only inspecting
device links outside of PM or driver core should really be a bad
thing, but I can live without it, I guess.

Bart

