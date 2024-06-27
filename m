Return-Path: <linux-next+bounces-2698-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAAB91B1AE
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 23:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E5BE1C223CF
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 21:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF8C1A070C;
	Thu, 27 Jun 2024 21:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htP5xern"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC9013B286;
	Thu, 27 Jun 2024 21:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719524933; cv=none; b=LoKHiFKXoG7j/DO/eX9MMN2KKyVoasGUdUCZ/EbM4W7JM3t4ZE79MbyKfFSpL3MeUbRbitnWiE9pYR/Xu14xFMj2CAVvgE4Cstgoo2MizgedW4SSxdiypVXUxGlfcVJZN60+gAQhibR56CajRhy3CDdnp3MGY4qzdr1L3/VSwAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719524933; c=relaxed/simple;
	bh=1ElI3rXfLi55//KrOSJoiJzCYJUBpefPvgNyTURFaGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksSDFqeAQrfYPFqymuOloabfjbxehPVmSxedlANwJ55S93wDHPm5rYT9hJjcWG4C/OGgLbLGzTlPIda6+wHyLpiQtxRc4jMLeazwxzJ2WpVyLtYgJeILyjllRj4t9xMCuHQ2MRYgQrI7+InAK1Dm6RNz6oq8r+ZIBW+McFOAYeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htP5xern; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57d1782679fso2478451a12.0;
        Thu, 27 Jun 2024 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719524930; x=1720129730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvcWPWbBwqzYeDqIw5utJrffIKs2IFkYEVA8lHtusD8=;
        b=htP5xernDrAS+QZic0CpIihY5qrdUxNU4kjt6ZgXd39GzM3cBIzCDhoO/m8weQPnaQ
         84M8PgE56mGni0UCdVZCT41mxkRi8sGbtfoFU5hQi4NEykUu4AbqbA+CBp34QCJ3Jc/U
         8I1JosJr+itIuiDwoRuubqjZ42Js37lWLeAcXzPJh4N5VkKFs15DRKmZ84IEHNrxZAzX
         kLDD4mG3zj30CdvUy0fomVJB+2OvzYFKUp062SbTalsZSS8111aEYbQEZUU1d1UXt5W7
         /Qj2IWi9++azJInsYYPJiy0diSFequNPKnszyUC4kn0ZS4rAuPxyfJzSJpx2NJjl/9yZ
         hlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719524930; x=1720129730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvcWPWbBwqzYeDqIw5utJrffIKs2IFkYEVA8lHtusD8=;
        b=ZH31ws2K3Z4YJ/qXDuitHbmn1buDdHmitYmemzRZweVr3w+sppV6Or8pE2cWSipZgk
         7Pq9YdUG3MsbY23AGrnIC91/RERSRS+YZ59c0WrhVzrX/aNgXnTHm3KBQmUW9L2CedZG
         JlOI89g8Xz1Eo3NfFKyK49HxWKBcE7aE5O+A/JATvUROr9df0NGQyp6QD9VXZGSNjg60
         ut/rFpFMSnZbc/HqTZ0mvNNeEsLnXy8Zte4OhJNE/KxxAsPQkSATPELtY31i+f28GN7G
         rDstmo2vRmM6zBHmMRTRgRPa1J6ZpUWkl35Z1Pt0nnxfPxuHkVxmsGojk2x70+VVjd/N
         1BkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpB3lc0zTwsbFFjSCpGCaflD6MPGR/FFtCKKkFiUzBmVWaYV63mJSVZGZE0KxzwFEQjuymjJ+apBeN0DbxbDuhl+GHpG9R4ewz6Tb+7azQB/MxYI0GOtmF1gJE+mWYcVJS+ymRK+h2CA==
X-Gm-Message-State: AOJu0YypI9Zp+kbeBh7fRzAsjzY8O5sU/C/44c5Z4I4AC8aGGsVyWCy/
	ueZu9kdtq7A2XPYI/X91j1gV1ZLBq1FpQEs00/QccEDuO7EqeJQ/lh9qwVvrfStKdhcQJPlrjeZ
	UUTecnozkYq3Rviu6ngjvhpfIccg=
X-Google-Smtp-Source: AGHT+IFpJU8uB/MBlWdlk571JSevPy7jsouP3iTjIUSJXgLnC6XZaJDjXM/sxBFN3lwwss1qcQJg/DUzwF44Pd3Iuks=
X-Received: by 2002:a17:907:1605:b0:a72:8b89:f879 with SMTP id
 a640c23a62f3a-a728b8a0175mr476175866b.68.1719524929687; Thu, 27 Jun 2024
 14:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612141239.141ce8cc@canb.auug.org.au> <ZnCMUEd9dQ6bLNet@intel.com>
In-Reply-To: <ZnCMUEd9dQ6bLNet@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Jun 2024 07:48:38 +1000
Message-ID: <CAPM=9tyNGA2wEgnsKdSyjHRGVikywZLdueZj=syTMFYEUNzxhw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, 
	Suraj Kandpal <suraj.kandpal@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Jun 2024 at 05:26, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Wed, Jun 12, 2024 at 02:12:39PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the drm-intel tree, today's linux-next build (i386
> > defconfig) failed like this:
> >
> > x86_64-linux-gnu-ld: drivers/gpu/drm/i915/display/intel_vrr.o: in funct=
ion `intel_vrr_compute_config':
> > intel_vrr.c:(.text+0x4e4): undefined reference to `__udivdi3'
> >
> > Caused by commit
> >
> >   1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
> >
> > I have reverted that commit for today.
>
> the fixes for that is available in drm-intel-next now. you should probabl=
y
> remove the revert.
>
> Thanks for the heads up on that.

In file included from
/home/airlied/devel/kernel/dim/src/arch/arm/include/asm/div64.h:107,
                 from /home/airlied/devel/kernel/dim/src/include/linux/math=
.h:6,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/kernel.h:27,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/cpumask.h:11,
                 from /home/airlied/devel/kernel/dim/src/include/linux/smp.=
h:13,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/lockdep.h:14,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/spinlock.h:63,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/kref.h:16,
                 from
/home/airlied/devel/kernel/dim/src/include/drm/drm_device.h:5,
                 from
/home/airlied/devel/kernel/dim/src/include/drm/drm_drv.h:35,
                 from
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/xe/compat-i915-headers/i=
915_drv.h:13,
                 from
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/display/intel_vrr.c=
:7:
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/display/intel_vrr.c=
:
In function =E2=80=98cmrr_get_vtotal=E2=80=99:
/home/airlied/devel/kernel/dim/src/include/asm-generic/div64.h:222:35:
warning: comparison of distinct pointer types lacks a cast
  222 |         (void)(((typeof((n)) *)0) =3D=3D ((uint64_t *)0));  \
      |                                   ^~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/display/intel_vrr.c=
:155:35:
note: in expansion of macro =E2=80=98do_div=E2=80=99
  155 |         crtc_state->cmrr.cmrr_m =3D do_div(adjusted_pixel_rate,
crtc_state->cmrr.cmrr_n);
      |                                   ^~~~~~

The fixes might need some more fixing, 32-bit arm build.

Dave.

>
> >
> > --
> > Cheers,
> > Stephen Rothwell
>
>

