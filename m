Return-Path: <linux-next+bounces-7458-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09953AFFCBA
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 10:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5356017D5A8
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 08:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7598428BAB0;
	Thu, 10 Jul 2025 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JGsJS6qB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBAE28BA86
	for <linux-next@vger.kernel.org>; Thu, 10 Jul 2025 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137200; cv=none; b=OPRgBxzzClKBwxYzvM7ruM38iAexyP7n7vzQkgKaueIUFGpZk/vMsNp9by8cokfcgRueysATzNetbdYOnUrBMFQIVVm0uLockf+wHUf6MVEJEmeOxI/XSMoJn5LywKd3ZXooQcBh4UE7sIUK+2PWd+EYe8k7F16ps2pjonQ7Sxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137200; c=relaxed/simple;
	bh=jZ9tb3kmRljZdKMUmc3wzKmJKbtkb8kt9lw3he8NX74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuroPWF4wBeIAXioVGF6SMhPcnDKrguXxUMCxQm2+dscgGZTSrZI2lDEff1J2M7Qa12G36QBE9jY6QBv22gupUPyleLjtf7DXMbcwl9+XbeiC/OCIptpgDTgUpC+ESPBD3JcQieTQQM6gcYNlei3Jjoti6pSuunMzXxpz+fDt3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JGsJS6qB; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-71173646662so8209527b3.2
        for <linux-next@vger.kernel.org>; Thu, 10 Jul 2025 01:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752137198; x=1752741998; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bHAnQOxY5JSgp++lOA2MBZVlz8nQpSg6AegRz8Sc8/c=;
        b=JGsJS6qBtcXPK+T22dpGRwY+ad5oFK+xYdhMrzstOVrLcWLzCapF5anVe9H54lWGxa
         hBkOF98qcdAtJ6cMjBnRTG1TiON+VF5bHJsGKJNIdlTEwgkxA0iEWoDDStMGcKSnBcPL
         X5QiBkmdBEU99CqzTs20RcRj7wxpnU+/94ND1+bH55xq1b3NzSHiq+4S6Yr6JPq+cY5n
         1yw9bSus6qthTz7al5fKoHSFtWqUSfkZtS7e5cYNiYVvytmGp/M1AfXj6RPmNClen6ha
         MTv2nw0XDIcDJTQeEqf2PbpppKOulaY6hGL7TsoXAVQhftIoLclprEoNhgjwJRYLEuNi
         nylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137198; x=1752741998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHAnQOxY5JSgp++lOA2MBZVlz8nQpSg6AegRz8Sc8/c=;
        b=Vw9XTjcqp8Q3dabhTetGLVbLgDFIA96PKeVgHXLyMH66z+r1HnrO2rDhpVhaFQjCr5
         z6kunnP97Nlu6aquoOydmS4xT0LgzvWh7gNKci/mIa2U76QPvum6OybR9NO1DFxCJ/I+
         KRJ/fWNbN88/B21cw//7KZdyX5BtviPQAgGdI1wXjVcJ8kdIMulT/hFu83GVLZtugi+U
         IWmk590LQLQzdvYGuQ1IF1F/zpZ5VWB38CRWAdlQgFcwRxEAFUYZL7TKAo5Pv5DC1QAj
         xEMXdea7QB1R7H+z1P8lVIxSQFBO+MkAo6x//8tqgPjkUFoIPv+WFFcV+KHAhoRJEJxG
         6bkw==
X-Forwarded-Encrypted: i=1; AJvYcCW1tT9qhT5ztrwykslckwGS13w457HEUWB2dgt03M0HtX3WjSjMzdQ5e7cZsN1b8GT7/S713WipSuic@vger.kernel.org
X-Gm-Message-State: AOJu0YxVfVi1V2arUscO1w7mzBNim6/yuy2dCTgJxnmBkCOgFh4MwPi2
	+0yF9YCxzHSUAfrzJxtgNzbugKNgik3redEqxhP+TAopFA+QLDQaBspJajY/Pq5hPd+MvRppUbQ
	lCsqJOaJcLTY4T0G/eRSGQ94iQPnp0JJ13B+7u5Ga2Q==
X-Gm-Gg: ASbGnctuI4hBiZQyBWfTGe9283BZkLQwBrrePOWKgoSPvPamwzU7mfvTw2bDzYV+yOv
	JIm2GQSp6Eh33miJEF4wWeaVEgLD/h3k9WNjDlODbx3bvVvnGSQ0Nv2OIFSWWB87qFcuJ6Dpf3a
	Iz0bj870qIlrqdAfZBSU9Z+frM/y4S/AsN/pipdC+KVSM=
X-Google-Smtp-Source: AGHT+IHdlfhPyX+OjyhFDfcK2Tf/2WlJ0Pm/4PllIVcHIxkdvh8YX9xwc+9IgW7VehxJ4Y0KK0wue7uloSG3yQmNK74=
X-Received: by 2002:a05:690c:3606:b0:70e:326:6ae8 with SMTP id
 00721157ae682-717c462388fmr28972247b3.2.1752137197471; Thu, 10 Jul 2025
 01:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710081027.318d1d83@canb.auug.org.au>
In-Reply-To: <20250710081027.318d1d83@canb.auug.org.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Jul 2025 10:46:00 +0200
X-Gm-Features: Ac12FXzai64AXDdsKcAN7_mnqxA9C1l_IxypTf-7Ca0QS7Cl_LdN4DA3eXN1XrQ
Message-ID: <CAPDyKFpm=HxW5ygj27VaweSbvQpW6d4zSoPDQG+9u2K-Xfx9=A@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the mmc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sergio Perez Gonzalez <sperezglz@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Jul 2025 at 00:10, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   7aada8ecf66b ("mmc: loongson2: prevent integer overflow in ret variable")
>
> Fixes tag
>
>   Fixes: d0f8e961deae ("mc: loongson2: Add Loongson-2K2000 SD/SDIO/eMMC controller driver")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'
>

Thanks for reporting. It was a small typo, I have amended the fixes tag.

Kind regards
Uffe

