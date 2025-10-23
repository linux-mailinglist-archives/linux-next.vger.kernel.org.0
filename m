Return-Path: <linux-next+bounces-8694-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 36978BFFAF5
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 09:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A332A4E252B
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 07:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F2C2D838A;
	Thu, 23 Oct 2025 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nLFFPHWQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1520D2D8371
	for <linux-next@vger.kernel.org>; Thu, 23 Oct 2025 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761205720; cv=none; b=RVb5iQCCTsfj11kudk4NM0h/C1xBTrg4DoJ24PMR4h5ueqZD+yxOATfK997/k06UuteWlJMJlAytZbzb/5B8STjvPP7CuCdyRyOsTMV2vkdbhnI6bo1CQG+8i9BssrumfaL/mAvcjI8tcgMzlR5GPTiUkqPLuYxdHyf+9Y4C3oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761205720; c=relaxed/simple;
	bh=51SI57AiSfQIQThPH8i+cF3kcc5ywJwczTf+U4eSObc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyFTY/ehR6JfYfg5+SwRrpQQO38tEQ0p2am8bJMs+IWn2sIcCeelU+LzODlmB2+43zjS5KMnBjURJUlfrXgNSpzEelJL4ZSjlzK9t2CJJFac65rmEheU8N2U2BvRVo3ryxNcnYFVI1/xuQrgPPgbnUEGAortTORIKRzjP/npa40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nLFFPHWQ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-586883eb9fbso557924e87.1
        for <linux-next@vger.kernel.org>; Thu, 23 Oct 2025 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761205717; x=1761810517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7gyQmSoIFGnp6/LgHViiHs5ENn4xVXNDZJRJIBkTig=;
        b=nLFFPHWQ/3DYy1BZItUYIgKQeVQSF3OxSEEVmPkbQUb6l3MnwQJyq5LiZ4tJowj78W
         O+O4oyTvRkHlwGWw4MpEy9YNM2dWWz0pCRqN1I0kmNfxt6EMLnQotRK5JhqwNrmvp1P6
         OeGR9G7P4kUR2LWSBSz2PZRPcra/QkXYabPpp7pJoNmmnAUHRoZa5I/MvnhUybQji5R9
         atNur9GcwlhKj/ltWesVogNmxKF9IFfDMabw1v/GE8u+6Eo+cFD13mE2b03T/jSKZ7br
         IZAe/DPkOkBZQcgdjrfZQ0NEdzAfy8gm3g2mReP5O3GNYfgAo2E2S9SIychjWDvd3CwR
         /oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761205717; x=1761810517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7gyQmSoIFGnp6/LgHViiHs5ENn4xVXNDZJRJIBkTig=;
        b=tp6Zu96iOpMz5j8Ba/UeUgiKvwexTnBZoIx1rP30aBiEH5nrYp8AtU7gcv+SgrmASz
         PEhXWxzPoGtHYvToAifQA0zTbPIm9IJtaSYfs4VHn4tKNTHNmbcW4HYRBlnO8GNUTnbB
         uweTalfpGJe5zfgMQ39B8STLAzKQjJLfFynIUWUeV+/T8CofQ44/jXENLxg2uCf7fxNK
         qHMCZersw4BBmCC6QvDqusfZGGsMAAGuEfsgwbzyoJmjUmjDJnafo6ff++78MgNnlPBO
         qouIGyiPGJMIMDgZmd9oUVZAqKNFrwyKmCvrFKI3X455ijqWR6b+CiCzvhzTTtLB6DCX
         0eiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgISsSLqtEdnA+UlG0PJ+CY6ydoN2a1+XzI874TEBhTLY+GpvLiuh+7slc0jDWZyHGhyRfnxo41uzy@vger.kernel.org
X-Gm-Message-State: AOJu0YzQR3chg4yMLp2LJKRCpYfcj9L971SVfo093DjloSVnJCif8yzv
	XWve5GVKZPK00ITTN1Ces3XhFk0fjYBbjppfFws4yIX1spYqQ5kuiqYeX9KxFua64fchzOgxv0g
	7UTX5Xia63q8AnzZnqUp8+DcosyuHlWB7H9TqPtjBvA==
X-Gm-Gg: ASbGnctJ5fgUr/uLcioatGJ6xhLOlqziKoPM64pHbsRoUypf+xUpLgbpF+9wSkwSd1i
	e0U+ypVoZAHDil1g037nI+H7WHe5N1g7tEzX0HHodn3Qsq5WmsKf6fPvxc9I/uAbvhOFdwLBrCB
	/WzoYrc7rjJF3qtEEEBdoNFCLQL8KTwG40REmcMk1NBuJ4waJfyOzU7jZEsMBCzxV8WIxkMOnGn
	sqtZ0G29EA6o9QZ2lOYIS66U5Wl/qpETnjD2J52dmBC1IKwYeic/aW3+8d10Q0Izt9I2O9sL7Vx
	3LEtBJcWONCiOX0=
X-Google-Smtp-Source: AGHT+IFZwPvE/kOUvHAzcXWi4uG7n7mMPrfkznuDNg40FXCdh4iIIOo0U31laY+QPUk5CoWhUh1e2qp9oW4CJekMjVg=
X-Received: by 2002:a05:6512:318b:b0:579:ec3a:ada2 with SMTP id
 2adb3069b0e04-591d84cf71fmr7923282e87.4.1761205717149; Thu, 23 Oct 2025
 00:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023125206.5555dccf@canb.auug.org.au>
In-Reply-To: <20251023125206.5555dccf@canb.auug.org.au>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 09:48:25 +0200
X-Gm-Features: AS18NWAVdusUZ6xyYaEwDzYvDe1WTlryEpGHk61IdMpdsnou4_bxSLvRljo7oIs
Message-ID: <CAMRc=McuH20BpVTLDaEZnrg+uic2byqnPc5VuuDOh59p6fp=dA@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the gpio-brgl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, William Breathitt Gray <wbg@kernel.org>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 3:52=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> The following commit is also in the gpio-brgl-fixes tree as a different
> commit (but the same patch):
>
>   ae495810cffe ("gpio: regmap: add the .fixed_direction_output configurat=
ion parameter")
>
> This is commit
>
>   00aaae60faf5 ("gpio: regmap: add the .fixed_direction_output configurat=
ion parameter")
>
> in the gpio-brgl-fixes tree.
>

Hi Stephen,

I had applied this as ae495810cffe to my v6.19 queue earlier into the
cycle. Then it turned out it's needed in v6.18 as part of a regression
fix. At this point it was too late for an immutable branch and I
didn't want to rebase my for-next tree. I decided to just cherry pick
it into for-current, send it upstream and then pull back v6.18-rc3
into my for-next and resolve the conflict. Does this work for you?

Bartosz

