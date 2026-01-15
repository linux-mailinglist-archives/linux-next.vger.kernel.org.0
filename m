Return-Path: <linux-next+bounces-9673-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFDCD23BB6
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 10:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD538307F923
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 09:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E0135C182;
	Thu, 15 Jan 2026 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RibPwSQL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC3352F8A
	for <linux-next@vger.kernel.org>; Thu, 15 Jan 2026 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469881; cv=none; b=fdufRXkgV8sVSWAHEAA6yuzRuzDJGdMGHGf/ZgzTozrtYLzvhDzGq3mcS9qxZrvL0prmI+n5uHGz6wExhH6zyk5+hueHL8ilBVRP14NGttMyEhsvcsAqsvm3iEzTl99753EztqQrvGT2G6Bo9GGawxU2okySR6hclz7iEflh3fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469881; c=relaxed/simple;
	bh=31MXXW+XLDByV39jfilLyK7/z4pRRPDoHZIo2UpSBU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKzGCHNNKJ6XmBqGbSELgD8bn3auPvcRUCV86TZlF3fylvvSD1xRo9ebt1ykOlt9C+j/13El2Rv6RVJaIq5wXUgSWkb8UqEULWlspKXk7jOne4vn6LnLMuBKaJk9XLcd0IPP/qv07fpOiRRFHCncJyw5CH5W6YUFkEjgvAwM0jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RibPwSQL; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-3ece54945d9so274410fac.0
        for <linux-next@vger.kernel.org>; Thu, 15 Jan 2026 01:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768469879; x=1769074679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kS+DE3VvLL37Zs5JnUtHjQiVJ4RJntX5JOD6AzfXMlA=;
        b=RibPwSQLuSqocHQ4alDwWwCysniVe4Si9DWdZNySzWAn6fuebth8CWI/E7vfaOMNoo
         JwglXKUYX3yhHSsaDa2OlgY9NGiHUVJHGCquHDc7GXxD7oGohVhpQaPgXh7igHNEmdMl
         BrREVAtAqdymick5paMeGw6ba3udKgcxH7qsTAmGaj0ryD8bQmILz3opOni7mte9bgnt
         9ljVdbSg50tGUwr626EUIcL3u/QlMsslxqGo2IhXFSMbcGwX5jSSemw/Iv2FIsoKnkd0
         AyZ8oFFFvzQs0hdUlf4tY1PnT7/POrS9rydOWO0omiDwYGav04PdjXzcRLzpYIYvOsEi
         F/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469879; x=1769074679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kS+DE3VvLL37Zs5JnUtHjQiVJ4RJntX5JOD6AzfXMlA=;
        b=iVGg/3Cd6V2fIS9ysI0i+3RE7ezUctj5b5xoh2s8oMSx85Xk26tvLaolFzz12+hFby
         2AtlmFn1C+l+Pvl/sKJImECIRHPtr94jxW9XdMPNxLQeloDil77G707t1MhImaIlhZUi
         UWLtx2MwweWwhrQR6NOYaUAII9cLxnfrARLVzuaBOkBuvXXaRP71aolVGTheqSy/iHbw
         YZQgVP7YtCMmHQfVkpHWoiWDoAeACgFzEKH1Qx8oSd3yz2+EpQT4EEXC/Zmb6Sdrh0MS
         1gLcaKxkX+mg/XJ1QzG1P9F8keoYqPGEsy2iQU+ztLk0yXu3ISS1yXcUQUpox1tfhh+j
         oSpg==
X-Forwarded-Encrypted: i=1; AJvYcCVrKZ9HQwsyn4vvy11lyI9yhIBCD610Atp5mUCL89wtwdf550e8ANR432W/1AXoGS/rbtOEEApeE7tC@vger.kernel.org
X-Gm-Message-State: AOJu0YyzCyFgJw4W7mlo6GzczF2Vjob78pA21gInulIOMwKxuX/6SEo/
	pfAK5zWMQInEMCeq2p4VL6dtpdAdEBMmBKAGLafI7VqTGRrWURsGfW77QXEw4HHlwTxm6KNZ0QM
	Tn7jFWwrbhF0ts5GdD2wd2n5LT4deMY+QNeb9CDREKA==
X-Gm-Gg: AY/fxX50+mC5og0IcPsu6f9UbH1yxjPy6p3pHenGyAuktduitV7A/OaWO0g6XH9XEm7
	79e0q6KHSUlyEhl5M9Y/1Bbb0hzUAsu6lUEoeuvqShTX5co+WqzRCK/5HdGrYxfrNnWM48cVGd1
	+Fpgw6QWW0Ctod/xiaRbV3lwH1bhQjS/7jLF76NC1McuRwGt04kfwUooZu3w9UUDAIDbeW/fMeX
	jIfTrmkEX4jsIrIPVJyuDTn0IfspVNhml2XTgHSgF1uadsETHHaBgbs6XW1KEGX9eil/e4J4G7h
	HHDOL85haEUUyJ0VmY38HAkAHQ==
X-Received: by 2002:a05:6820:c00e:b0:65f:7470:38be with SMTP id
 006d021491bc7-66100700a94mr2686776eaf.61.1768469879020; Thu, 15 Jan 2026
 01:37:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115075340.72b35a93@canb.auug.org.au>
In-Reply-To: <20260115075340.72b35a93@canb.auug.org.au>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 15 Jan 2026 10:37:47 +0100
X-Gm-Features: AZwV_Qhd8NW7dCfiPBRpz5zsD0CzVbecM3UHQ51eTvXFLKPF25QrzbTmiuyK0Jo
Message-ID: <CAHUa44FWsVw8maFFkj5WxnuoEQJbr_X19rmz+YvPdbhRKxCcMg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the tee tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Jan 14, 2026 at 9:53=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commit
>
>   e4280e3ec728 ("tpm/tpm_ftpm_tee: Fix kdoc after function renames")
>
> is missing a Signed-off-by from its author.

The commit is updated now.

Thanks,
Jens

>
> --
> Cheers,
> Stephen Rothwell

