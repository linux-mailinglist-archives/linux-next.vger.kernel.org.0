Return-Path: <linux-next+bounces-9299-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFD1C9AC28
	for <lists+linux-next@lfdr.de>; Tue, 02 Dec 2025 09:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A457A346B6A
	for <lists+linux-next@lfdr.de>; Tue,  2 Dec 2025 08:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC4E30748B;
	Tue,  2 Dec 2025 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0jOyrLN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584DC306485
	for <linux-next@vger.kernel.org>; Tue,  2 Dec 2025 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764665679; cv=none; b=YlrRuf+/weqK94ttuyVsqbxkYy1RmW4GKYJt0hLwLjIfs9425jHWEG1H1cBvxR+AMkWSwZoMZx2ZTXuyp37jTT8GYWZz8qWYYoX+9SCULbOmAFWD2wnFxC0qKq7hpErhX6FBocQzrWIWUE/TdcjFlr9wSAn3Sz4xP/W0+F/sxfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764665679; c=relaxed/simple;
	bh=6M1ZL8AhCWhQ32NYFxLlrVbyh+vQ6L6egI6jqd0HlhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRlAbYMRVq12ST7ZDKuVAsr6UOZsxz+C+9tiCzjP8KQpTFVovEIhuVwJr/C2Kb+zEggHI7j4erlfnIrdPBf5sSxVjEsR9AYTMCQKqfy1ovFY6bABiKqIOk9kWYLqgeRzhqv3+CZZ90uKirFp1OACtXonVegTGmzhKjyDfsJZtAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0jOyrLN; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so8037616a12.2
        for <linux-next@vger.kernel.org>; Tue, 02 Dec 2025 00:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764665676; x=1765270476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6M1ZL8AhCWhQ32NYFxLlrVbyh+vQ6L6egI6jqd0HlhA=;
        b=B0jOyrLNqaFHnNU4pS7oy47qxJx4+GyLQYGIV9448AJhc1FtLVZsPshvETCd0VlRun
         Z9uvYdJoPYK5RQ19YDwGbBm20hk5eyKmz/EcxMs9JXLEpPhe/wKynFppqSuAld2Yc16b
         7O/bF967a+ZFbSYCyisHh4JOyEM8XvVcR3q3McvUIcdrEJCMVAhdLwTeU3EI/Uh88HrS
         9BPuomae9omoccu08rvcOCsAMWpW+3RF7kAXGZ1mI6N//wU3SDgrpqDCQj90fhnnN4Gs
         L7+lGF0wDGMPK+0mzRRLaYo0FgwmHa5NUVEi//eJKrMvnagJUlBjuLZ/25+vpLpAXlty
         VH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764665676; x=1765270476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6M1ZL8AhCWhQ32NYFxLlrVbyh+vQ6L6egI6jqd0HlhA=;
        b=qxqmQxPPf0MPDi5Ejags5qneA9wajc6qFOphwGwt1YU0fuUVcpmt4+qLbTBdOcYhsD
         KPEhIZXjM3srTXFki96C404H5GCFnCBrGVAtL+5THTu0vl3yJ0lJR4RXNSn2KhGAZtkZ
         sTE4E+epKVJKH8sBHaKTebUucsS2KWhT0M8s42aom5x9bv18WVCMLULokYy1QVHs4suN
         u98d8SVJiCY5m2dbTttQZAbaICJTSP6qZ44Y97jxCraxJOSE1dmLb9MlwjZajpbs5mKa
         VBZooP0vV/tUV6VagOmK+m8FTDYNbwsOygi65dVgTy7Jwb0pGwYKqv9JHrK1/wVA+8h7
         DX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDltIPJSGuVnCChROWE9gzNGEGQyIgEYlNhRg+8OmAnW06tImtMbItSE39tfwzBAnJ2gQoD+KfxKIi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvsx543+s7vjTl3MxU/EOdIxzNDRxNAsq3fqMHLjZtYbvw+VJz
	H9HQS6s0TwdHYZwRGceBToBTdwcjA0TSsSnaMMGqgn9khKlTz9x8Ccnci+3E3HBd4J3ErqWWyoY
	KmTPOGEMrjyQOPIlIHISNiJNlqNXxEkln6r5k2d0amg==
X-Gm-Gg: ASbGncsoMb6kqfkHpsrccN9O80UX13mH5RVSTiId5WYgXnLVEXah9Fz1s4UOy5QEEuZ
	74o76LsAsTqbT+Uc36lKWZo1pFXPngCaTZL1r0XXfMzC6O4UVsYwJ5mO+g3xfuC7QRMGh/d2BVu
	JG98s4CZd3Ks1CoTrPxtWEzteF7js0AQq/HyRE1qdnAtBzMjE5i/okgAm3KppnXvAexqjwSfn9m
	jfbnrQfQIOkFSOO5br5TWzsNztbkhCYrsmauBfPU6HeQAIC7awOFKpFWDGfkFgL9+gHyaZQz1Tz
	dVS3xK1tef2KuTfbJFjmiwY=
X-Google-Smtp-Source: AGHT+IGWnwcbDjhWT0x9H7sIzIa+WZkvafF3BehhPLR1uxm6/AMNVV3pUklD/QKk8hx3Gw45sSksLu6R8c7rGcUXEQo=
X-Received: by 2002:a05:6402:5113:b0:640:980c:a952 with SMTP id
 4fb4d7f45d1cf-645eb228d07mr27645261a12.11.1764665675613; Tue, 02 Dec 2025
 00:54:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128162928.36eec2d6@canb.auug.org.au> <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
 <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
In-Reply-To: <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 2 Dec 2025 09:54:24 +0100
X-Gm-Features: AWmQ_bkF5XtGr8F9ahjDdeghwGPaVkXlZCwEv85iEB2fw7LzWAo9ryRojtgxNZU
Message-ID: <CAKfTPtA-wir5GzU7aTywe7SZG18Aj8Z9g1wjV-Y8vKoyKF1Mkg@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 28 (drivers/pci/controller/dwc/pcie-nxp-s32g.o)
To: Manivannan Sadhasivam <mani@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-pci@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Dec 2025 at 05:24, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> + Vincent

Thanks for looping me in.
>
> On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> >
> >
> > On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20251127:
> > >
> >
> > on i386 (allmodconfig):
> >
> > WARNING: modpost: vmlinux: section mismatch in reference: s32g_init_pci=
e_controller+0x2b (section: .text) -> memblock_start_of_DRAM (section: .ini=
t.text)

Are there details to reproduce the warning ? I don't have such warning
when compiling allmodconfig locally

s32 pcie can only be built in but I may have to use
builtin_platform_driver_probe() instead of builtin_platform_driver()

> >
> >
> > --
> > ~Randy
> >
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

