Return-Path: <linux-next+bounces-7500-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 793E4B029EF
	for <lists+linux-next@lfdr.de>; Sat, 12 Jul 2025 10:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E61F7B3BD6
	for <lists+linux-next@lfdr.de>; Sat, 12 Jul 2025 08:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D73248879;
	Sat, 12 Jul 2025 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9ugBNdf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1551C248894;
	Sat, 12 Jul 2025 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752307900; cv=none; b=ctEgzzPJg1yuz6d6ur0tvOB4Zom/VAGColELLuBXEhAoatN1CGRL1AJomoGOIieR2pXLI8EkKLqx7X9wY3DVW2icf91rO97KpO1MHNQNO912idoTzpPBCdt6j6NL4tZJeiG/I5iXvImLMHmpeq2oW7JYd7vtga0qVBC/UPejIag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752307900; c=relaxed/simple;
	bh=M0n92FcTqzxD9YeHFJxTHRvgITvHYvvbH72QN1CTSu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGnb9LCUE37k7V+AAwJYBV6FFcNKYu0dXXoqAcZlbgtVkiiz1fieen+fvy/TfueIk9sUhRCLmTdoqiyBC1efp5LZgBTsGpYQttSgML2hkJ44+MNS0NMZwK+iKOUdnnSfXznleT4i2xw5n6eaMVQJO5p3LDc8vO9W0kF0jATwCnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9ugBNdf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B379C4AF09;
	Sat, 12 Jul 2025 08:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752307899;
	bh=M0n92FcTqzxD9YeHFJxTHRvgITvHYvvbH72QN1CTSu8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W9ugBNdfydbOLIKlk+6K5EhZDOCPSx18O63LZLq5cbLg6UnzExylj3HscqNYMbJ+8
	 ruiQvMxK096vWfsGSJzLi5BDfPLtKIU2o5yCvrpVmYhOiUki0Jqpo2YbP2tN91rpq/
	 eUZKlzqzBdMGXiC+hFJnwvL+jC6AtVyTmcF4NvFjlEZv9xD8ywznmgMSIcZpGb43n1
	 Tj7i/8iGH0+ArQ5XQaylOuz+8oiTfHRbPVANuLnoMhBhbZMPFo2zKey0GhHxyvQsgu
	 IP98kdNscLYTqY2cgrziuWf5/n21utwFD/osmjPST0dmktPPcOV6/GvqJkwFPyHhvp
	 /OTItteBnUFzw==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2ea080f900cso745549fac.2;
        Sat, 12 Jul 2025 01:11:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4yVbKr9nQwhWDZKHRdXaisUDNf70V/g4UGBSvcvawjHFkgjMWry8ZzyxWf/uIz5OJAK8bo2RDCJXvCWE=@vger.kernel.org, AJvYcCWg1kuTaJq9CLH78f2ydbXU7wLcQKnQI7JRjcLFdFvJSZDNPmqWdx1ROQXhstTdjewjQK/pw0Q0Sk2bCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN7bMv9zfjB2Cri0eKHBvJ6NLYtR86Wc/pv1xbBMSdts75q2tl
	sqzRMi0MTJRrV0P3dSplRgNnU5N+WA2w+aIFUjFbhY5i2vwt3kbIyX5OrmfBKxY3wjA1h/GYa5r
	NsbiDTj3cK3KbJv3fU601/dDUCrMMnkY=
X-Google-Smtp-Source: AGHT+IEiN2LU02BAfA89Hs/UW06NBjK2j7kH08irqWESSxDDvgGoIPpqaacKXmE76Z5kG+oGme02fcs3FuX9z1+G08A=
X-Received: by 2002:a05:6870:b4a5:b0:2e8:7953:ece7 with SMTP id
 586e51a60fabf-2ff26a255ddmr4426856fac.24.1752307898784; Sat, 12 Jul 2025
 01:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711191014.12a64210@canb.auug.org.au> <49080a96-2c7a-4eea-a64c-deac0b7a665b@infradead.org>
In-Reply-To: <49080a96-2c7a-4eea-a64c-deac0b7a665b@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 12 Jul 2025 10:11:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h1CX+aTu7dFy6vB-9LM6t5J4rt7Su3qVnq1xx-BFAm=Q@mail.gmail.com>
X-Gm-Features: Ac12FXx4LfQ6l-D4lPteNJxpkOdlBcXTlnxfu1w13kDAC4KLOvvFfs5hIbBsH7o
Message-ID: <CAJZ5v0h1CX+aTu7dFy6vB-9LM6t5J4rt7Su3qVnq1xx-BFAm=Q@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 11 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
To: Randy Dunlap <rdunlap@infradead.org>, Mario Limonciello <mario.limonciello@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux DRI Development <dri-devel@lists.freedesktop.org>, Samuel Zhang <guoqing.zhang@amd.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 11:25=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20250710:
> >
>
> on x86_64, when
> # CONFIG_SUSPEND is not set
> # CONFIG_HIBERNATION is not set
> # CONFIG_PM is not set
>
> ERROR: modpost: "pm_hibernate_is_recovering" [drivers/gpu/drm/amd/amdgpu/=
amdgpu.ko] undefined!
>
> caused by commit
> 530694f54dd5e ("drm/amdgpu: do not resume device in thaw for normal hiber=
nation")
>
> Rafael, is a stub appropriate for this case?

pm_hibernate_is_recovering() is not supposed to be called by code that
does not depend on CONFIG_HIBERNATE_CALLBACKS, but a stub returning
false would work for this.

Mario, it would be good to fix this up in your tree.  Also, it would
be good to expose stuff to 0-day build testing before letting it go
into linux-next.  I use the bleeding-edge branch for this purpose.

