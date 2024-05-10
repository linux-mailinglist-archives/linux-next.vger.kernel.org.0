Return-Path: <linux-next+bounces-2269-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F00418C2803
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 17:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9694A280E4E
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 15:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C509A17166E;
	Fri, 10 May 2024 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct/jClQ9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C45171666;
	Fri, 10 May 2024 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715355665; cv=none; b=WLJ8SgkbcUR5KvV5dsDFObjtHy0T0UqoZ0yku9+0prPREuskNVBepWv/kaNfF5dCiPyTJWyYUMy1447Q78OQbcE6pG89lgBF3cUsJMbe/n4msEnXdHid2aDfRz+HzduC8Mgr7yKBHAtE5jiOU74zMZ+ToDX9YH7BcCymZDB5TqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715355665; c=relaxed/simple;
	bh=CKunOYXyn/VAhDnWGXGmiC49CJrlDoM/ZPQJtbdNQ60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/eIlFhLvqepoePoIjnWu7pxJG2Qz6hIygNVrOuwZ3y0pe0i+DZcKCRWbZUzM53cYmRD1skkxPMT3FOaQydEpoHgeB2rf6I+2vY2XF5hPjmTUMzzexU27+S+Qm6pX8R/qtrKeln3adc8ENlUjsIj1ie1pjAwF3nh0H/HRe8toGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct/jClQ9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so15012135ad.1;
        Fri, 10 May 2024 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715355664; x=1715960464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1NMq9il33+y9mKx5YlkejFWAQlsQ5vAdnhUq+IEfAA=;
        b=ct/jClQ96Rh7rRXZ0RbsHyTgAN6Y1hYLYSclyyhqbmzBYnT//+fWN9+GiWBUCqnIrO
         U7hCz690mOZtEF0O81vj+tNrz3uCBvXg4NBt5vbVbECssAhVDtsHHqwe8BBvy63GBAHW
         5EWlOvqab/A7yJFMS9ECgXPQmS4jbt3ikJCKepNKU3mx3GFVcH+ZVr0zuVrW3ttr7F3t
         kGbSrJrBYxiSfAyiUVfdeWfsePwfbJwyLlP2zWUiLsxIcKtbnKAYRGIDEJ4QINOaRQF/
         hFKy+OOZkC21kflWIVArW6TQp75QKoQXgO3vhe+l8A0NIrlYFZTvrAaKFyk3kW6Ic+4k
         CyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715355664; x=1715960464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1NMq9il33+y9mKx5YlkejFWAQlsQ5vAdnhUq+IEfAA=;
        b=Q08uv4IPEBbbasXqb5jtaIXNescerEsksryVP8hWGAo3sXHlit8pknYuE2HzV/7N3d
         at2DIsVMFTnLMcEqr5m4rAJnZkS/Nk7yA1F4JXWxatMxB7kpZ2tBtXRS8Kv00BaplQzF
         COdPUG8MNHtbyaJp4MkQmvoytDQLsDoSN2VOmT+Bhs8VqY6TseSPQREKzl74NukgZeLo
         E+f6hsU8TYbt347cfD6SGo3Vuavm1llGLIWnBtSQQViHM1DbsI33dAynORvxpSFx9On6
         2RQtjTejUjF1cOV+9t1W5zSZPye4FM/nLCoJc9S+G6GBu5ac1jrYuj+rVIaJX/tergs5
         nPaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRjurvK5NYR4v0MpjUI3rLa9hwHRnKD5rOcyu6i788GBxW86MHmCT5VQlfQPFqceX888QZ/lFFeQ4AKw6x6X3wqDhdr9YAeVRGvFnQZgNZZddKEqigM8QEUDk+bfmsdRtLGcwPdog0ZA==
X-Gm-Message-State: AOJu0Yxr5lDNKFlaLOYajSxuoa5HcMk+PHOdE/I4CnHvmHx1rg88kWSb
	HAXYthGuKZ3F21XaOrM8MJZzlSsN4uo3U4P5J2wuDhS3PNTY64NQAoQCtLD0NHgCuG+Vn6X9Zq2
	PZ/x4wR/fNnAmuuubV67mnuVOfj8jOg==
X-Google-Smtp-Source: AGHT+IHvCUL2yFY+CKv648nymXOwAlvwARkChLmD6Po+/oRyO/ys64x2+bkPNCubPXo3hR2sP6eaRkPoFy6xR/uRLC0=
X-Received: by 2002:a17:903:41c9:b0:1e1:3300:702b with SMTP id
 d9443c01a7336-1ef43d1558emr34534465ad.15.1715355663609; Fri, 10 May 2024
 08:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509082313.1249dabf@canb.auug.org.au> <2b3ea2b9-1959-40ff-b8f9-5ad1569f72be@redhat.com>
In-Reply-To: <2b3ea2b9-1959-40ff-b8f9-5ad1569f72be@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 May 2024 11:40:51 -0400
Message-ID: <CADnq5_Nk0qZzBPJaBYVBjuEOxaTDtXu2tosGyZigum5rnz2fRw@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the amdgpu tree
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 4:56=E2=80=AFAM Michel D=C3=A4nzer <mdaenzer@redhat=
.com> wrote:
>
> On 2024-05-09 00:23, Stephen Rothwell wrote:
> > Hi all,
> >
> > In commit
> >
> >    27557a840463 ("drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible"=
)
> >
> > Fixes tag
> >
> >    Fixes: a6ff969fe9 ("drm/amdgpu: fix visible VRAM handling during fau=
lts")
> >
> > has these problem(s):
> >
> >    - SHA1 should be at least 12 digits long
> >      This can be fixed for the future by setting core.abbrev to 12 (or
> >      more) or (for git v2.11 or later) just making sure it is not set
> >      (or set to "auto").
>
> It wouldn't have helped, since I pruned it manually from the full hash
> (from gitk). The intention was pruning to 12 as always, apparently I
> miscounted though. Oops.

I've fixed it up and repushed.

Alex

>
>
> --
> Earthling Michel D=C3=A4nzer            |                  https://redhat=
.com
> Libre software enthusiast          |         Mesa and Xwayland developer
>

