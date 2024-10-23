Return-Path: <linux-next+bounces-4388-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FD89AC32D
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 11:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5C311F2185F
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 09:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A03315C158;
	Wed, 23 Oct 2024 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mj/oj7gc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A804174A;
	Wed, 23 Oct 2024 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674744; cv=none; b=efjjDr0OIlr7gBZzs5BYGu7YEkCO9uQWkT7OToqV+5iV6uMe1C2I00ZSy4g0Kdyh4EeV+vUzeHyscbMHG5qYJHHeobO1VCv0NIeg5DopLFRR0/uyogVC6MqtF4ERQAnIErWT5mKU7VW/cxFhoBKLR854zQ63wLqb6Ae6/ixw1ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674744; c=relaxed/simple;
	bh=Y9W/IGkq/6VTaJWlTg5uMiE6i0eATrlMiYx3vQVvnFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bICk5FAEWGOtcIwYO+8cq5UanhgKZdgcwCoO8h8BCChSpSPKivgeRJD0+eDMD/wt6UvSg9lvrDWRq0VD1JOTYm91w5EmV0LeQo/DF41mkuf+13/d2DlSrS0f5LmYexaduOUOSzwJ6GR6GGLRW12N7XJmrBeJhrgfsTmSktO4cSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mj/oj7gc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so7135116e87.1;
        Wed, 23 Oct 2024 02:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729674741; x=1730279541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuoSnsDmzRj9vPxKfrKP+BnZf9mADbFs/kbaEovRXgY=;
        b=Mj/oj7gcpXIsCVZzcIk15KfZqU0FYiC0Ac/2ZEGH0ZnjIClPRnLNEAwytFndQX2v2a
         ZFdowknOrhDXncsqKQhOy3vJrmDJLAVoRWoB7tMcAlBbet/oxhm0CzXyEY/iIr6hQJy9
         C1HLnM8Dhc2a6XUyVPSDLLvlW1Z2xNE8AcUeVhc/SB5bwlf+CaLAxS/OUZ1tzZb5ugD3
         QdtBAZfdAzWC9dNGDYWzN952tKqSrC3/6zAHTp7Asa9jHoQNbhPE39HTWQ+xh5jHn6iZ
         3E1XTlu5E+Mx2mDr5MbYDh7i0H0zh0X3U9T79Yu8tJFCR9NSrw2Fjl2HgIY/qps3zXSj
         v+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674741; x=1730279541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuoSnsDmzRj9vPxKfrKP+BnZf9mADbFs/kbaEovRXgY=;
        b=K8zNGCF9y2ezs/o29FMU4wxvNswtSrdJAtcBiYkrfcLsugTL+le3uYEqStQnOKlOC0
         qZ6NoLAc1gM31VG5B4KUnBre8Nx4fnw/JxANQT6z53qDPu0YYARQLg7OcyMtu8zUuVeC
         747SRCxYuSrIqmzLKXQZa8j8sEJyLtL4OsiIA0GYyZ1lP4Qj8UK3eaxwo0BlCh3xo9yp
         c1nY4RDKLK5WYDp4WYf5ukgVOUMw3jxHHvTRIZURUHc510O250bGEwBbvMmu6N6tId1q
         ayZ9NiSpUiN1r4F6c82giXa6zmgxJ/Vkha9YbV1uDU0Pcrz5jm0EjTs14cGVzVCwJdOr
         06Sg==
X-Forwarded-Encrypted: i=1; AJvYcCU3RkUBDayjyxRsejJiYkxK5Ssd/xmCO4eFxROxBX/pMBfrQK5Ce5Iaiw+ifQHJQya5ONj/+X+MYIDQxYQ=@vger.kernel.org, AJvYcCXUxjoSJnPHXI1CpbHud7A0FrWAzbgAZ19ezhHdDq8GxVCHNszUGH+Vdt2UpPPfA/JdajjpeKHCq9QTyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGPWqNZf+AbMHi1VNfqnFRQJgiyBF2+WNsYDdRvJ1V7E1u49Rt
	oxuF2VtyojhuORvGiRpO/xPTN4OhmrwyslEUzEyLZZwUmNt0nXcqb1Ze9SG/v1mDLdkWj2kKYEY
	ahNEGNfqKWYKyUS5Pkt04sRcQEc17Bmjd
X-Google-Smtp-Source: AGHT+IHSipzfUFB+cmSCK8+D5Fw+QTn8Yi+KB981VoRb12ZT6ztJfBePd8h4FUFpMnfC+UndL3V0oJLesADvYNjT7Tk=
X-Received: by 2002:a05:6512:224e:b0:539:a353:279c with SMTP id
 2adb3069b0e04-53b1a31367bmr780546e87.28.1729674740675; Wed, 23 Oct 2024
 02:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023173549.043d4ce6@canb.auug.org.au>
In-Reply-To: <20241023173549.043d4ce6@canb.auug.org.au>
From: Steve French <smfrench@gmail.com>
Date: Wed, 23 Oct 2024 04:12:08 -0500
Message-ID: <CAH2r5mtb7DyKZZEnP=fV=_tQd65kcEJm389Z=OOD6J2R=Ndv7w@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fixed

On Wed, Oct 23, 2024 at 1:35=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commit
>
>   0c0a5a79a9cc ("smb: client: Handle kstrdup failures for passwords")
>
> is missing a Signed-off-by from its committer.
>
> --
> Cheers,
> Stephen Rothwell



--=20
Thanks,

Steve

