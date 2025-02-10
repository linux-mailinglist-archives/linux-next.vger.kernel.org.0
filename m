Return-Path: <linux-next+bounces-5407-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B862A2F041
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 15:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44C8916634B
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 14:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D3420485F;
	Mon, 10 Feb 2025 14:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="UnhHZACV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E7F222575
	for <linux-next@vger.kernel.org>; Mon, 10 Feb 2025 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199126; cv=none; b=ej0Ckm43hNb7OEvl2tIyi8Zj/udEU5gnWhA2jzh8gC11NxpN40L1Xlw6nzXzD3kuab/e5D+ukmwnPILpYS6m+4GIwcAi7gbaqJBrZIocUS56g6F1gbuQ7zLRadKJzBHjFAHNWm3UERpRjpywJqqvuBxpDEoVE/bhqG2OU61Cl1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199126; c=relaxed/simple;
	bh=/v5PPSWlU3IEFZUdbmztgo/okzDY7JDD7SBqMYbdFeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/Z8TmFOzRDNXACq4Z+NzmNMmoSASQ1W6LMPLYiybf6evl5aHyN+lzTFf2eabSGGD9XJN7OjdQxDIBX76GqQkIAP+ppPXgNQ5GE1q2yLXL4XYJKogpX39xHq1UIHI1UFUkiPL+MvXGRiU6YxrZOp6xoRBnZnBSxLbBPsZmImGhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=UnhHZACV; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6f74b78df93so38869047b3.0
        for <linux-next@vger.kernel.org>; Mon, 10 Feb 2025 06:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1739199123; x=1739803923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjfZXALDYB4ETPXFgXxY3hZahw00lYb4//F7N6j30P8=;
        b=UnhHZACVy3tj1mt8AlO8F6On38PwThItMQxutxmZV4ubPeegNynLZbycESjx/7vpMC
         egOwi/Z67+eYhagZFFT5YYVGT3P80fpSuVOYe9MvvkXThlGGNn99oFxx+haQcCXjRtaX
         7AQekLwIQZCIfhbMpTlKeP/1otlk6BSEEMEr0ImPwjERovlhtgK2nQFPh0ApJxHfR9SH
         8xiqkqhZhxcBlkQVMNm0kZ35llojdfeOdbC7TrUgo3LToJmGUYS+VMzMHdzO3H8P8WG1
         mV2hu0AHMjciCV/LFdI58uCbOjmINPz2HHM/5P/SuKPlkoNwWr+h86SWv9BrvH2wf4p1
         oong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199123; x=1739803923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LjfZXALDYB4ETPXFgXxY3hZahw00lYb4//F7N6j30P8=;
        b=pyX7wj2j78XvVsGKxw+led/4ZL3sQ+Y+XH1Z1rl4ozt38jUkIxDyunv5bPDYTq+QQw
         5elQsEq3fb/8IBxvqOebCPCE6LtzmSzfZg2Cx05AeCfCJVIoUarFkbRbKoNKLbekPP2U
         VuihUXMLKGNZwlldiTExrYApeoiKtTKktx2qG6HHJj5QJV1TFhHVpqQrLbNp/KIo6FTH
         /GN9cqbDTtGKQtEs5ApyuSTMh0qn4r5oVKQry6ozd1n9ob5CLVnodkreHGQxLCHI799g
         PXC9TX9Eq9EQXrrECSmaoPaanJ9ctR8MOYgiOMz9R0ViSKwjmxOG1+y3+4HNLxvwUIha
         XBRw==
X-Forwarded-Encrypted: i=1; AJvYcCVEsVi5C7svYoSoOzIKONaKJEV1zTokAYuXlLw4UijlGi81u6rErtHUvLoMaLdaKjbuC9azft/Twzbs@vger.kernel.org
X-Gm-Message-State: AOJu0YzVS1jsvrS5fKwin332SHmyizJViEuBqVJcrcO5SFFBzA+yp4ca
	pWrsmaJWITXQHE945zhm54dygdEg7IL9syxnWCv2b9hQ0z2Oy0rhliUif2LNS/WOkiABs7bSBz1
	E8QYx4CtL0hz2B4JrqJL7GXcc+VWBacoDCYzW
X-Gm-Gg: ASbGncvbhr0HU1/zwX2xmZi8OCdTi6WjAXHgURvFdyFotoN3UjIzvj3H/kEA/uOvCfY
	Nj85oBfysdTl5v8arV4+b7TuV3rGDIqBLJHhs/d9aZNDnCAytdpRrU94zXmByqvq57DVjO6E=
X-Google-Smtp-Source: AGHT+IFzXSd7ibb0CAgiwQzwzU7LFjqQaX3S91BP3O0YNEUTmQ4CejI1PmhG7JZltxlR0Kq6JdXdhbKFCYacKugvDXA=
X-Received: by 2002:a05:690c:c14:b0:6f9:a023:5df9 with SMTP id
 00721157ae682-6f9b2a10387mr119998027b3.30.1739199123384; Mon, 10 Feb 2025
 06:52:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210121813.3e24cdaa@canb.auug.org.au> <CAHC9VhSJceL2PmFw1RiQEd9B3c7wjt6i_KzFxUjVdHV-Zxdyzw@mail.gmail.com>
 <20250210145348.59791103@canb.auug.org.au>
In-Reply-To: <20250210145348.59791103@canb.auug.org.au>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 10 Feb 2025 09:51:52 -0500
X-Gm-Features: AWEUYZlGcB2VFTrogZWDBNFePh_32U2VBU7wfeq4hJekB2LT_Mld08LdpTBJWaE
Message-ID: <CAHC9VhTH97P54tFYt92OU5058By2WMm12nMzTW+H_ofmnVRiDg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the security tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 10:53=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> On Sun, 9 Feb 2025 22:44:42 -0500 Paul Moore <paul@paul-moore.com> wrote:
> >
> > On Sun, Feb 9, 2025 at 8:18=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> > >
> > > After merging the security tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >
> > > In file included from include/linux/perf_event.h:62,
> > >                  from arch/arm/vfp/vfpmodule.c:21:
> > > include/linux/security.h:2379:12: warning: no previous prototype for =
'security_uring_allowed' [-Wmissing-prototypes]
> > >  2379 | extern int security_uring_allowed(void)
> > >       |            ^~~~~~~~~~~~~~~~~~~~~~
> >
> > Thanks Stephen, I just pushed a fix to the LSM tree, it should be
> > fixed on your next pull.
> >
> > https://lore.kernel.org/linux-security-module/20250210034132.8448-2-pau=
l@paul-moore.com/
>
> Shouldn't it be "static inline" instead of "extern inline"?

Yes it should :)  Evidently I was fixated on the missing "inline" and
trying to fix it before bed that I missed the "extern" staring me
right in the face.

This will be fixed shortly.

--=20
paul-moore.com

