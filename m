Return-Path: <linux-next+bounces-9491-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B84BACD1797
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 19:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86E1530102A2
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 18:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C672848A2;
	Fri, 19 Dec 2025 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaSy4Qyv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E32475E3
	for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170529; cv=none; b=BgHb3CuCuUs2zblEtsxuS2ekjR9P3vrO4ffMHK+0G8gMwusb+BFQPcLCavTnwdkifDTM8NXvkyKMbLDh4FZ5mim+48UW8nD6SkTSK2nsbBYRN7w1tWLOMm6TP3gukkndiQ6NQLCerjCKVwZTI9d5l6srUj7hFi8GuyEhqNHzDSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170529; c=relaxed/simple;
	bh=y/ANPTrIKijtyRak0BQDg0VWbPDDg2kUNv4Ts9b72KM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3snuh9yJgVvyI717YhdT4jK1DiyvrWuNTb9HV3D9gxGzUDeBjTtcI5ARWj3H/oruTGOE6YLSi3kG1M2O0nDI1OptaaVaAbRxOo+EWnRq6vlvHtNoDZzfUEpzr6Dy91LxFnWwKoM6/Kby1ND80xOTNtJzSL62UpkNoG3U+vKivw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaSy4Qyv; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29efc031eddso5574385ad.3
        for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 10:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766170527; x=1766775327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lostcG6C51WpWatxb5FnWPlDYYQmF8t3/6JliHSTHkg=;
        b=EaSy4Qyv/pP56iLFjqKSat5qLwbNFZwIQk1gaJmJ+en9+bRRUDfU0D1UMlfcNNG+0/
         lB36u4DusVb5KDJVspG8mN1nqiEesYjR3M4A9XAWRdEBEf83BJVX/Ykti1zywcA1HIkO
         4xXpd9m2StH0zvRSHH5UcQsRiSNerXrxT0/pAMmZootWCcB6ou8p3bP98xmNcVppToZS
         DXIlU2puo7qEnXUEyHf9Mf8vPukHGIiA+TIYawMMlFmT9Lk7TbkrMZIEP/9iV2ZUZBeZ
         +QDrW47fpXpTEicjdVAJFrYecqSaowdtUTazR5ZWqwTk1Dsy7Qpd1Rmb3cpUYEzmzgA7
         7Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766170527; x=1766775327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lostcG6C51WpWatxb5FnWPlDYYQmF8t3/6JliHSTHkg=;
        b=H6HCM8FXyP/Bt/5ArUYId0zDF23bF+9niyEpCaxiNg1EGhyZMbFeok/ZJEy3Rez+dw
         tQat4oqw6Qs9d0/y1cxr40vtEJBfXobhmR2O8jAwE5FwpGo4yDAnAf3Jdpd+bLUZA/Dg
         Xv/w/WFwkL1zj3Y0Yw3NcUVXQwzZy2Yp3qzgsYGtP1UJdsusF1g8HmNF+YDNb5z6VCIM
         X/nLAX19WckVBVyZkKDHAaOKzQrH3yOP7E5prV1qVjEt96vhl/vRh2Zviqy/arNeRuAk
         998C2tZxmXTyz9feStdJywtkxVMp0NKVnuscY536eSNnmsi3CajL82aDc1OlfByFSjsr
         6Ypg==
X-Forwarded-Encrypted: i=1; AJvYcCX9QSLekdnlV/YgmTsY135a9wrp/ZiLAvwhzz87AM6vHUgU+mNqHReUsnGIRcgx2P0Smjwzx/5C1Cd8@vger.kernel.org
X-Gm-Message-State: AOJu0YyDpGVS8QnWHdk4NJGxM9WIp9nReTpl2ku75BqkL/RbLUadZ8xQ
	Ncb88/1LSvsRbkK3MlL84JsH1fnb/GtzCHy05TXhsa7D55OkqpshMuARIqcr0BOpDzj6vmrr737
	ghV6srk6tTPjc30qJaGNGTnNLgVchVzO9aw==
X-Gm-Gg: AY/fxX5I/ybnvou+35kptXK6bP0LB4/KbPlS/2JgHyEYbkF+JLLYIhJ/IS6h72z0bAP
	9MAVy2CPH8z4SB80rnPN+PX5A0ThfuClvcpqw0DcYvjex52AAsoO3Ozf5bpq5Qsvxh3xDBM4bUe
	bbf4+Bag3fFxVJPlpiCH7w3Xs0Un8M46+XlLf0ChVBqjefM1LNu4de1B+q/0hi9kyTJTIoj9xF2
	ADAHe91P4TZu0JzX2LyY8eNqkrJGrv427BWARMAC6q8/J1TmI/PMnuSOVzlItiLbqNd4s3B8RPg
	fdM6+Vo=
X-Google-Smtp-Source: AGHT+IEYSe2rf88RNR50COMzAo25/+MoiXWahuSFAS+jPucPHa7MTiknQ5gnKI1kfCJRQTJnNzzQBvdJbtBUX8EiAFc=
X-Received: by 2002:a05:7022:3705:b0:11e:3e9:3e88 with SMTP id
 a92af1059eb24-12172306353mr1646695c88.6.1766170527326; Fri, 19 Dec 2025
 10:55:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219120559.60710-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251219120559.60710-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Dec 2025 13:55:15 -0500
X-Gm-Features: AQt7F2rLSW9lzEVGWOmorHF2__kW7Jjekn3rmRAqFzSHMVPgFkMjAB9bawskfoM
Message-ID: <CADnq5_ON_u-qZv_rFzOWX+Si=c=8fc1pU2J2fBGmeRd+knhFqg@mail.gmail.com>
Subject: Re: [PATCH] accel: MAINTAINERS: Mark the subsystem as Odd Fixes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 7:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> The git tree mentioned in MAINTAINERS entry for computer accelerators
> was not updated for three years (last tag or branch pushed is v6.1-rc1)
> and is being dropped from linux-next [1], thus should not be considered
> official maintainer's tree anymore (patches appearing there would not be
> visible in the linux-next).  Also, there were not so many reviews from
> its maintainer [2], so it seems this subsystem could use another pair of
> hands.  Mark it as "Odd Fixes" to indicate that subsystem could use help
> or is just not that active anymore.

Would it be better to just fold this into the DRM subsystem entry?

Alex

>
> Link: https://lore.kernel.org/r/20251215184126.39dae2c7@canb.auug.org.au/=
 [1]
> Link: https://lore.kernel.org/all/?q=3Df%3A%22Oded+Gabbay%22 [2]
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0dbf349fc1ed..d97e5b41b998 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7740,9 +7740,8 @@ F:        include/uapi/drm/rocket_accel.h
>  DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
>  M:     Oded Gabbay <ogabbay@kernel.org>
>  L:     dri-devel@lists.freedesktop.org
> -S:     Maintained
> +S:     Odd Fixes
>  C:     irc://irc.oftc.net/dri-devel
> -T:     git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel=
.git
>  F:     Documentation/accel/
>  F:     drivers/accel/
>  F:     include/drm/drm_accel.h
> --
> 2.51.0
>

