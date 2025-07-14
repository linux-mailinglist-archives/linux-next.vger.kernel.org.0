Return-Path: <linux-next+bounces-7524-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AD1B044CF
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 17:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F2FC7AC59C
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 15:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C151425C83A;
	Mon, 14 Jul 2025 15:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ToQWeWnz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BD623C8A1
	for <linux-next@vger.kernel.org>; Mon, 14 Jul 2025 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752508493; cv=none; b=h7TqeK51QZno0Al1x35b/raN88WjgimWlIvwaC+2RczQIlfzCDrVa/fvjdPSzyrQamLU8F7J+owSu+AwJTE2TLX/IWlQsEEjKeDD4Ah3+WIBwx7fny6AaoKwvwKe1UfW/BI+v1qMJHRLVdp4DuUajfowUQ+ZDDCj+ZM/OmfEQuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752508493; c=relaxed/simple;
	bh=7urBbC1NysPMXQOqJYTgImAU6AMJ8gvAIZARt1v7K54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUZ3aN/LEBxsOOfF4MlS4Ef1umSW+KeKb71fnvzOdBX3eDEtNPdPTIXXyHn+Rri/ywoozfUoWOQORYtXRPK5rciR2RuZRD+3EdcN4uE2gtCGutUBcovPd5BI15ZrhM/bld9pqaKz9l1914v1KTulAiss41n1cnIZ/bhsbGwXoXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ToQWeWnz; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55622414cf4so3655359e87.3
        for <linux-next@vger.kernel.org>; Mon, 14 Jul 2025 08:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752508489; x=1753113289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vl+T2liedzRtoZmf1zhQsu14QQt2+MQ88BOC/gvd+Sg=;
        b=ToQWeWnz7xM/WODc7uABJWkZ1tQYOsy38BdEAsCmpKo7iK5Ik8u1cX0YSIIsBQVGah
         9B3uOgkrNSKGCXUj/0JhF1+M9OhA1nawBAgxnQjaD5iENWqLWbDaj+2L7xm+AFMVRPso
         r2iaps1x+RdywSJ6kELIWa6ZAeDtySN00Vuhq8OHi7ougkwRCBo9BF+o2KBh/FinmaA3
         jTf0ApjAHQdqF3AeWlRr54hN+fSWWDMQmmBJ/JVkDQfx2UaWKW8iHgrLq2XZyCFZCkm+
         twJgj5ss0DWz+mBNlSFHhfoPoyecFS0KrYPsu1AbU0HcvqxFWPHs4i9U/7BEHf0rrTyt
         WPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752508489; x=1753113289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vl+T2liedzRtoZmf1zhQsu14QQt2+MQ88BOC/gvd+Sg=;
        b=fm9e8aswh2FL3VClyuTGAm+Guu0JrMtfikqnJ8BBeEc15vvY9HgosCIxVP+IjuNDht
         sIM4FF8IH2czLaH2IInt+oWn7kTsg0x3hiYOw/HcPPDFXBwVn+Xbdu9Ah4vkP5zfwWKH
         B7cHtfMgYW04dxX/ZB+9DjYWomeS2WJxxiC6/5Ay5sFtJLYF9D5kCXuPL5VBSdQPq4kD
         JlQ48drZQEyzqjrTxz8UOGMNAbJaQUFug8DXlFSaOASsgkttHzzt5Aq1ePBaeWMZXg62
         ahUwpMnIR9Mfio02h/SjpEj1dO0VZgqBkKWO3oqIa4U68GSvaSkizIjzrMrCbtT7Cbo5
         PH9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4F38Oxm/5ypd0MlvzyJGW+o7ghZesM5xF8jN1GcwR1xxjW7pqB6ixHVqYLM2rCEtdXiQq18Zn9neY@vger.kernel.org
X-Gm-Message-State: AOJu0YzWFODcx0igv0umQyycFuTmBygDN+oKebyoqSIeMoYRXWjnFsL6
	0NJ8Q+QGb23rYMiFMQ/nP6chKGR3rC0ltqCyip2TaVIU/F0hGdHDnDyCIeB7CMNP7jhG5UDsO48
	xqv5lQqB+UUXlN0jgQbA+0SDEHVCVuQZ1Rd99OyrfZA==
X-Gm-Gg: ASbGncugpBGY68jqNWnqav0dwOE+YZrxM27DaC9Yfv4+tcoEeqaUuFr/8zRJ84xX2nI
	trzm/HGhqaJbXsepzj/47RkAZsY0BTLb34Bm8Ypibqx1V0lDX+bEKjsAnCwhEAr6wNYqjKvZov5
	gbZDZo81YI4AW81LDL9jcLiA5bQuYRxU/Cs2Rg7KARRd28XWdn1/9SDM6MDZwOYTaqid3qjO59S
	B4ze2A=
X-Google-Smtp-Source: AGHT+IHaLn3+Udwsa8sFc8d/9/aHQq6wB9mzYzABB1MIG5NegxyR63z0rfh4I5QsjPYZbiAIbQq3zUht3HuZnxGcUFs=
X-Received: by 2002:a05:6512:220b:b0:553:a456:a0d4 with SMTP id
 2adb3069b0e04-55a044f0096mr4449856e87.15.1752508489020; Mon, 14 Jul 2025
 08:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714170848.0fb46353@canb.auug.org.au> <DBBN42KD0D2L.10BGEGJJ5XH0J@fairphone.com>
In-Reply-To: <DBBN42KD0D2L.10BGEGJJ5XH0J@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Jul 2025 17:54:37 +0200
X-Gm-Features: Ac12FXx1I8rP_VVQDL4JOaDWYJ2npnkK3d0_UajlkfvmD0v0z0SiJw_Z43iS2BE
Message-ID: <CACRpkdbED6fi_XupJimEBwhiNoon109wYPtranmCPdx9wBpiJA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 10:37=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:

> > drivers/pinctrl/qcom/pinctrl-milos.c:1323:19: error: 'msm_pinctrl_remov=
e' undeclared here (not in a function); did you mean 'msm_pinctrl_probe'?
> >  1323 |         .remove =3D msm_pinctrl_remove,
> >       |                   ^~~~~~~~~~~~~~~~~~
> >       |                   msm_pinctrl_probe
> >
> > Caused by commit
> >
> >   b614f176b308 ("pinctrl: qcom: Add Milos pinctrl driver")
> >
> > I have used the pinctrl tree from next-20250711 for today.
>
> This seems to be the for-next/devel branch not containing a commit from
> fixes. I'll let Linus sort this out, just needs one line to be removed
> from pinctrl-milos.c as per
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/=
commit/?h=3D56ec63a6e107e724619e61c7e605b49d365dfa07

I went in and patched out that line, thanks!

Yours,
Linus Walleij

