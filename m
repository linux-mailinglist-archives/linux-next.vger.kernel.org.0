Return-Path: <linux-next+bounces-5794-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B27A60E02
	for <lists+linux-next@lfdr.de>; Fri, 14 Mar 2025 10:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCC5416C6F3
	for <lists+linux-next@lfdr.de>; Fri, 14 Mar 2025 09:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908081DEFE8;
	Fri, 14 Mar 2025 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xScv5mFy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B27139566
	for <linux-next@vger.kernel.org>; Fri, 14 Mar 2025 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741946265; cv=none; b=ENb8x7wDTkOZS5lmSRdIX51UGGeVAcvh3+lKj7DH7tdyfW299VQdF8HCId/sdSLxtzAa4anV/FgMN/yMVFcFvO/VXRT34Swx84JAPTxM8Te+2Ba99scmWiTrZGx1RZTlyexPort9xQdHT1Cvu62qP3YiHNcQRAhfZzeFi41N82g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741946265; c=relaxed/simple;
	bh=LWKYNIbfHrf2dIs2Gr9oQspYlrFLbqyZwnqfyCC9sp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDrpSLsURqJ3mn3LS4kYdqVVOYlG0NoTwrfLkA7AjrEdikz58iMZfwko2CHbjUInoog0cycddUmqKJhD/KeQnrcw/Mx2hoO3lPb6atk/sLBEnX5IH7U0M3bLJ0xDqBUdOdDlHCQ8XU+xAgZMpVYn8OC84t9EfB+3UXXIYCV04s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xScv5mFy; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30b83290b7bso19373701fa.1
        for <linux-next@vger.kernel.org>; Fri, 14 Mar 2025 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741946262; x=1742551062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7B97j7QW4aEhOEY12AmZMGHsvdqRoWdmKy6CRQeoK0=;
        b=xScv5mFyLQIY1tnTmmxQ7RVBkIH62/5zrfBLn3QFqfc/X0c0wqTl1Nu7YsPc1tXe4u
         zJoa4CBUAQVhvF/r+yb/OJ+gP1A0F/DGXLiItVbLOfQ1uwVETI0PTqJyEOfeCyjQxWaf
         4kHSX41yjOeiPF7UT8bn+ABo/P9TU/5228fIr6tSstkWPJ7GmJr8B1JUK7+/lfv7+y74
         KXidsliQiDmlg0OFpXLPM01ukg0MaZAjFNiujZM1Kr7slvxg5ZWWRVW9iyZqRDSK2sN/
         zwCg3z5mcBTXAPHEpBU3dlKa6NtmwCCyMNCNeR3EwzqWBxksQ7IN8wnIXWf/ImVArDTJ
         E6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946262; x=1742551062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7B97j7QW4aEhOEY12AmZMGHsvdqRoWdmKy6CRQeoK0=;
        b=hmI6OxZ9ccyxkiYZWOr55VM1VQiOM+bDICElm3C0rX9V+tsu+NSgl+9l5s6JaRA9Mx
         vlelsLGED6l7FSHFwXWJ2z4UsRiR1jJRuPX0PtI4Ei6RR1J9yErbF5UGh18VNZCxgBT8
         u/pZ3ffFRLTddkXdB8fU7BAfQJCJkT7F7SohOc66nfsGTUNlmBNguDkM1RD1/HrrNl1T
         cJmQztIixgMo9Xn0FjTRvGmIFjuSHmMyoOJc9fjIxTMxfWvCTjBpDDgBkwu83tAvzw6W
         rAwQV3eZUfSLFnIpdzslrE/HcpB1VxRpDCt1en8vTvIJBXL3kvxqlyeSaqpcWoG0Zqgd
         6L1w==
X-Forwarded-Encrypted: i=1; AJvYcCWXIsHZXYwVlXFro03WaBZA51jT4PIQc7jYrO/D1/NndqQfex5kES/4KsDKtynO9mEP5Jb8mkLRE0RM@vger.kernel.org
X-Gm-Message-State: AOJu0YwiJlYfB59awBCrJpoYnosvWfz9Gn5LGq662QjPfp+WxDtN+1GI
	BjED6PHfHXklcrctfPXAQ+TZpbQjX675fUlxe3L2sH1v8JN4DpKDDMv8JtrPlgy6cvElSTVUKNC
	4BbIsNvOdmjejT/48VDUNaRTpsoRAZZlG5XWhMA==
X-Gm-Gg: ASbGncvrnseML6MiV3MHkwax4k+BISSwZe161ijNa50KStB27l7y/tgWRS6+NaMhGjY
	le4m4lVgNHPEkX8UyMLHu6aEGyrJQLvamHHu7eyI357oOH8RUPbJAy/NHm6jVDmJy6gXlJ8A6u9
	QRAHMkkXpOO0K3mVJu35DGuQ5AkkdV3lJoW8ji4g8pgLWQ1SP11u8VOUSldBsnz7l/70Ej
X-Google-Smtp-Source: AGHT+IHUkL22puzejCWdSfcyfhQgtgP41R6mY2yr83XR0Bby6654IFiYrZrKZL88lqND0syAtI3FL3xbo6lkvTl7yC4=
X-Received: by 2002:a2e:a582:0:b0:30b:b9e4:13cd with SMTP id
 38308e7fff4ca-30c4a74d14amr5326571fa.2.1741946261461; Fri, 14 Mar 2025
 02:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314160641.75afdc79@canb.auug.org.au>
In-Reply-To: <20250314160641.75afdc79@canb.auug.org.au>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Mar 2025 10:57:29 +0100
X-Gm-Features: AQ5f1JoIA53xACAJX3Z1UhX3wGqrZSlKJbDOiiubrXipf4lApJl9HrhvdnbqVQA
Message-ID: <CAMRc=MdcjeP24n=Mo9bisBw+qjz+jmv2NK0WtSCqYa6FHJgSUQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 6:06=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   drivers/gpio/gpiolib.c
>
> between commit:
>
>   0102fbf52b93 ("gpiolib: don't check the retval of get_direction() when =
registering a chip")
>
> from the gpio-brgl-fixes tree and commit:
>
>   9becde08f1bc ("gpiolib: don't use gpiochip_get_direction() when registe=
ring a chip")
>
> from the gpio-brgl tree.
>
> I fixed it up (I used the latter as the conflict was just in a comment)
> and can carry the fix as necessary. This is now fixed as far as linux-nex=
t
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
>

Thanks,

I will pull v6.14-rc7 into my for-next branch once it's tagged and
resolve the conflict before the merge window.

Bartosz

