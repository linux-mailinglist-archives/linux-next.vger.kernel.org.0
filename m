Return-Path: <linux-next+bounces-8472-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD2B99F0F
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 14:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419B44C5F86
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 12:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FCE2FD1BB;
	Wed, 24 Sep 2025 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fzx5ZyJ4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1415D2DEA8C
	for <linux-next@vger.kernel.org>; Wed, 24 Sep 2025 12:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758718574; cv=none; b=Ngbs4lBJ+2xzg/i62bJS8UmY7JnRqWi+cm+Hv4aA+p0z6s2HQoYDrvBr31ztQLZ+G2rk7yT3j9YkkaAYesliiCeYGyv7dZ2gRmGNxZffu5gCa7TTimKC063/UrUzuRdUrGTjuPa+0ch3LR2CWdlXEx7rD1SbgSP0SqPlxOOfBmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758718574; c=relaxed/simple;
	bh=YGbqe9ZAFL3N5iLsnVD45Vj6XYPMwC5jXFUrKyVnjHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j++y6svBvfNMmDVL38NMg30RxU69vKDfAoq4UiCFwsv6xEe+eUsvxhpRLT8tTXPQni+eydjT4CgBBlANGxpbSiV1xlUp9UnAwSFJSOtxFpjqcxs1Zw4D5aRfiIzqdd0nDQRDksmJJzmOJCm489lojtf4l2IwJ/nK5ECT1WwEFvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fzx5ZyJ4; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f418df37bso90428b3a.2
        for <linux-next@vger.kernel.org>; Wed, 24 Sep 2025 05:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758718572; x=1759323372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSa1OETJ6PU6Q1MXWxYehsiy6u+If5pzrQWnK+jSTZk=;
        b=Fzx5ZyJ4j+0Rb52nAgFUZjrR66oZzUUt5ttrr98PKRKFfxdQToONtkaVtR4sDJsbp5
         fAqn1vzJWDOb455+D3Xrjrca0i4zofGaMhAlv25ipWLHYllfzZIFkgywzG1OuqPJtqUR
         Myfp+5UxtCXlBngjeB4XkgSYX9YiyRFte9nwMSOx1qSi98sDqShs6EWJCbeyx97LeyUe
         RWVOWdWvtv8WBuFi2QkoYd/ztNvhQosPtxXuXDCoegYc/1N2ic42TlJPzt7+XkvVe3j/
         1eCXu0HKjOiAN00blv6WeIep+a1YfuzVU5rceX/fzU2cutiidZlQ0lAEwaBntQuSr+Y5
         GPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758718572; x=1759323372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSa1OETJ6PU6Q1MXWxYehsiy6u+If5pzrQWnK+jSTZk=;
        b=dTHB10dgC0VRwbCbwfOkMA4ids5t98ZePopsTdyzfodpnn1B7VAEsd8NGtPRG0NV5C
         YWlzRYqCJVMrduUVHgmqUyx8jb7R/Uv9CjAkxuYdk7pMYTly4/zeadc4+Prmbds7/xZf
         sg7El8BGLgcLxgqTbbVgx9dbaL0LzaHCb4PJL/JhHP2Emf240zz152xqX8FnQ340whE9
         IShB0i+qh+QuIq897CMMiIe/uN+D5A9yRIQaQMqWhTMc89U8CNh/Nlvo7WTRiHtBufNB
         ad0PLgrC7iNZv87e61yKMCyXC5uhrMYbuEyqny2sr94rFRuH7G72+7Y9zPgkI9iyB0b0
         EqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoXqb55N54wouiI97jt+sR1iXIdDXo9GaTLDdztOF9oSARNgjfjYrsgUs7J2WpmI1AGFiKchNL4UeZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzxIMlIYnApVOGNuQtkuPPLXeUC66JjEafw85juhRJpRzgMULJP
	i+sjubUyn/Ln9H6BdaRI+g0UtZxDA+y8Fuy96mD+urpYQaorp/r3DFm3U5UFHwel4E+gPYdDpjs
	iWDV3YhqZjP5nnB3lA5zp0KonXD+kViY=
X-Gm-Gg: ASbGncvkz9HR90V8lrpibFzkcafkoeKCqE7H4MBhvnDeogWv9eRubaea8IMVAUIms3F
	fekSAS5Zet+j5UGW7MedvJiEu1lQ+vUPu2hui/G1Vh+l/eu4oP2o6n2IaVVS4+tpVWm6BH1FloG
	eGemEjlYpPSPvHRhWIP/+G/wC22U5wtjXKlj5FvAZrrXbAuRxl2wp1DsAxB2D8bijJE6O6xAYOa
	Bv0knmMkq/zguhs8wtE0FecqAUCJYgWC/t8/y7XD5P48TPcNb24nU/yPeffz+TsiZ8wTxf8Ixyc
	plWT+1S9303gLPWgsjRrw/BPoP067uQgrXy5
X-Google-Smtp-Source: AGHT+IH4job3PIEwg+n+ghlTlE1Biqa3K8KrolYDQtT4VmgH5e6Wty81d/Gwhyhag7z/wiwZKWJiEU2jY5ciEvxYfNU=
X-Received: by 2002:a17:902:c404:b0:265:dba2:2315 with SMTP id
 d9443c01a7336-27cc3a152a8mr41930705ad.2.1758718572411; Wed, 24 Sep 2025
 05:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMlfiBynRQrbW3BT@sirena.org.uk>
In-Reply-To: <aMlfiBynRQrbW3BT@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Sep 2025 14:56:00 +0200
X-Gm-Features: AS18NWCSyQ02d8rV2QturoMpZoG3x-M2lkSbgrSGVFu_GwtD7A6datCIzaf4A9E
Message-ID: <CANiq72=5JLSVFFZ9AZyVA+oCLjN5KVtwZVVqRYZL3DhZ39UC-w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the drm-rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 3:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> + use crate::util;
> + use crate::vbios::Vbios;

I think these two lines should not be added back; otherwise, we get a warni=
ng:

    error: unused import: `crate::util`
      --> drivers/gpu/nova-core/gpu.rs:11:5
       |
    11 | use crate::util;
       |     ^^^^^^^^^^^
       |
       =3D note: `-D unused-imports` implied by `-D warnings`
       =3D help: to override `-D warnings` add `#[allow(unused_imports)]`

    error: unused import: `crate::vbios::Vbios`
      --> drivers/gpu/nova-core/gpu.rs:12:5
       |
    12 | use crate::vbios::Vbios;
       |     ^^^^^^^^^^^^^^^^^^^

Thanks!

Cheers,
Miguel

