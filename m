Return-Path: <linux-next+bounces-6042-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E4A72D7E
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 11:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCEF07A1C42
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 10:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659C51F583D;
	Thu, 27 Mar 2025 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P0j22AjY"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9153B20E01F
	for <linux-next@vger.kernel.org>; Thu, 27 Mar 2025 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070417; cv=none; b=p1M20W3c+wStwUHP1cCjKZ0yuu+TVX0Rz5APsQ8c80rqPyUEByyVnUEjq3puZjO7Fzx1Dc9n6WNLnVDg0AyeVolnqjUBhYyP6gk+8cfvfCcPsvr8Vz8vo0/u5CX/cKySeCX9rkXhEmxA9r1jtUDCp2laae5P77eRyMJjrV5HsSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070417; c=relaxed/simple;
	bh=H6nLXwiIEvSFqpSB3wQ8ExOnH42MrNk+uWhZm9orWyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5D+1k0OrZlKKxT55pqXpktTgc4z4nAsaAyzhfHq41eYe8/GIWH/uN0qLtQ3yKHOMtAYz+OKH1VAYNDOIreFOS/HZDQnyzw8wHPYpl/Ft0D+5ZQG89o4bkc1yDgKBggi9Qla2vfI7V3t6B+dmce3AM2aSok2DBKygsnspRcjSXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P0j22AjY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743070414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z1V7Tj5XppP4TZCf7Oi5My5u1vfz1nFkHzifF2QtL7E=;
	b=P0j22AjYBULR7U/KhymCqZTJHJFZ7/uyBlP1fCwGyHHX5bAKBQKM6ixsfHRylqd2FnPnDi
	oqba/LV0AVV0l1WajopAEpEuRVseFmSC+3q7x9MJRZJ0hi4oqDlK/W8+T6NDNVTzfqPw8a
	LYss/9pz78Ep+QV1aDrbsFsVlhizQeM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-fafbE_nrNWGazkbalHNDaQ-1; Thu, 27 Mar 2025 06:13:33 -0400
X-MC-Unique: fafbE_nrNWGazkbalHNDaQ-1
X-Mimecast-MFC-AGG-ID: fafbE_nrNWGazkbalHNDaQ_1743070412
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff799be8f5so1402616a91.1
        for <linux-next@vger.kernel.org>; Thu, 27 Mar 2025 03:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070412; x=1743675212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1V7Tj5XppP4TZCf7Oi5My5u1vfz1nFkHzifF2QtL7E=;
        b=S/ictsUGqeabAs5KLyMIGX06D9UorBX9GWCMTPBtBF7fGS65bjcpZtFkAHlaaZaehw
         G/HMS+Z3H7LZ4HdCZEwqqvOaVcMrkkhBMlB0jCodE7YeW61rpXGXWAKbVw8RE9JgRE2L
         plutqKQ2cfbMlpojRfYxNzJGHnFfv997ixitCYep3F93kNSD9pJ3yXVDL4D/8CMpwdhE
         VUvANOzfPstkF3Q5nDJZiFkdHabxiJR2MKLLQK6Xb0apDDkitwYtxs2sZ0qfViyGlAiG
         WiRAav4VHbVEYdr12BBY/i0kS0j9X6ktrc4GQ65JiUrkhPaRK/An7PYoOkOWzPp0z/pL
         CuPA==
X-Forwarded-Encrypted: i=1; AJvYcCVihRfd0l9w6gQ822fXU/a6+FC+CwYyCysLVZ3JYMOmKsuamIu22mvQnt9FwVlpRFAQS3zHZwORGHrl@vger.kernel.org
X-Gm-Message-State: AOJu0YxXw8m78oMG9YFOFx8VubnMmDIYn/g/isrDVYplhoJND6gplrrV
	L7+5quF7BmSWRhzZkuygCVL4uMZ38Y86w/hYipfOHXD8D6dE/mfxvSJ1Hv2LtYb7k/rEKM/FzqF
	85ZhtOvqu5v5R9pJy+XLirVd2tPFI9O889i+/U2MX7fODtEmr6bIxpT9NEs9JmBtLZwufUiMOZ2
	3STnQ6Bg3xKKf4kaYZQyDOt8Tk5IeUkX2UZg==
X-Gm-Gg: ASbGncvjlANFNWlvB+ZuXokkBG1ESVag3CYIOqy3Pf37SvGQm/E29TF3qUL6QWNRSks
	zbjP+TPVlM1xt1N/4s6/YdnScSTabjrpHjTsfZrF+4OpYwFDqjWj1OsibrwYMlfJN5XaaHLw=
X-Received: by 2002:a17:90b:1b47:b0:2ff:6e72:b8e9 with SMTP id 98e67ed59e1d1-303a906c30emr4333009a91.25.1743070411734;
        Thu, 27 Mar 2025 03:13:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo6BSnN/7DnWwsrPKsPzsp5vwYeekx/yw1uXydp3cTFY2lLZ6RC9pAe31IwHQYeL/C+jGIXOHxziJ1HikRcBo=
X-Received: by 2002:a17:90b:1b47:b0:2ff:6e72:b8e9 with SMTP id
 98e67ed59e1d1-303a906c30emr4332968a91.25.1743070411193; Thu, 27 Mar 2025
 03:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324103048.3d8230f9@canb.auug.org.au> <20250327101610.45f13473@canb.auug.org.au>
 <e9c50bf0-e85f-4c71-b46b-b9b919955045@oss.qualcomm.com>
In-Reply-To: <e9c50bf0-e85f-4c71-b46b-b9b919955045@oss.qualcomm.com>
From: Alessandro Carminati <acarmina@redhat.com>
Date: Thu, 27 Mar 2025 11:13:19 +0100
X-Gm-Features: AQ5f1JpEcUZC0l9g0TEutF6ljQnWodfEfcECrFj9kOh5Fz3DBBEkrKeTMe2-9MY
Message-ID: <CAGegRW7ONApvTPMSvYfpvH5=r06pPNpUAo7zBLfAhr-qcycFMw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Oliver Glitta <glittao@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Mar 27, 2025 at 1:20=E2=80=AFAM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 3/26/2025 4:16 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > On Mon, 24 Mar 2025 10:30:48 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> >>
> >> After merging the kbuild tree, today's linux-next build (powerpc
> >> ppc64_defconfig) failed like this:
> >>
> >> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/kunit/backtrace-su=
ppression-test.o
> >> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
> >
> > This is now lib/tests/slub_kuni.c
> >
> >> Caused by commits
> >>
> >>   19f3496e6241 ("kunit: add test cases for backtrace warning suppressi=
on")
> >>
> >> from the mm-nonmm-unstable branch of the mm tree and
> >>
> >>   1f9f78b1b376 ("mm/slub, kunit: add a KUnit test for SLUB debugging f=
unctionality")
> >>
> >> from Linus' tree (in v5.14rc1) interacting with commit
> >>
> >>   6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")
> >>
> >> from the kbuild tree.
> >>
> >> I have temporarily reverted the latter commit until the former are
> >> fixed up.
> >
> > I am still reverting that commit.
> >
>
> Guenter & Oliver, can you add MODULE_DESCRIPTION() macros to your respect=
ive modules?
Yes, sure.
I'll do it asap.
>
> Context:
> https://lore.kernel.org/all/20250311-moddesc-error-v1-1-79adedf48d0e@oss.=
qualcomm.com/
>


--=20
---
172


