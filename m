Return-Path: <linux-next+bounces-5149-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F25B1A0908B
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 13:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA14E3A1317
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 12:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C34920E00A;
	Fri, 10 Jan 2025 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RbemWps/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C45520E6E5
	for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512335; cv=none; b=BuxUK4olyknAHhNgpGThozWY367Kbhfbj6gphG0xlQLca8trhWs6t/6smHuIozQfZNkDtzKvKEQ23LhZk0DGaAyGrl4Fh3TBTykXlBw1MYhp86eq8lswC/THuNq3w4OBxVpvrBknClFb6aeXLJErrjlhSptbB//y6vR1K3U/lHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512335; c=relaxed/simple;
	bh=eDh9o1qGPkcUZATPcQ3Pcf/KwGwjNnVxyW73OiUDjiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BA1vs7sZrxgPCu3B3gaS7mRKj9VGhvIC750VVexUoXeprbZWwu/ejdyUZE+iLj04SnACqOr/FPGNEtVJgHNovqzb7FoKNMsqWpFallYXygIOPgi33cKGj9lOO9YcJFmw6BTGkk8hjK4aP5C0xrug0rMOinRyltJUbGbh+7op5fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RbemWps/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso14987295e9.0
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 04:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736512333; x=1737117133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDh9o1qGPkcUZATPcQ3Pcf/KwGwjNnVxyW73OiUDjiM=;
        b=RbemWps/zlj2nIpM2CWWA1427qegA/boY+gB6UGiaqetrFISeSDGjedoPCffOHhjzD
         1vnxHqltLPT+2j173YJptMCetTT2M42h0hb7lX5Tq6VCeEUJ2vDjCS+Io4XaF61NnGCs
         o5Cm0Fpapo9rmpVivLsq+sXzDnIZg92Y7my70X3eIrBVHATGraurCSypH+nYRFrVeoKu
         kg0vA1Pn6tB8ACbOadL71W9yQahntCuUF2xI1DWDlqLiCPNjVG8NoraBaJSib2df6pC6
         gw9vsjPskW0gL81k+yirlY+Q1mYZfJxU8CBr3IdO1r6saM3gIXhGHvHKcRKhzYPV2WK3
         Wc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736512333; x=1737117133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDh9o1qGPkcUZATPcQ3Pcf/KwGwjNnVxyW73OiUDjiM=;
        b=Rw7VAV9YOzbmJ5+tZILEV2D59N0Or2LulT+lQT/Sk2qWedIhdQqmgONe5htQvoKGrV
         BGi02BZqnwX+/ffJ5H5A0t2Dg0DGTFoWfbDIi+MFTqFhU9/KWItG6G2rQ0+X4QQ8xZXe
         Xuprvj3B0bZ6eUvpYW4N4PAPASCIAuzNu2a/fLPD1KLp/X3Iivx/fwpLo9jT2ia7g3F7
         mBxPTBfdiFYSFVDoAz4sM/XcHSRhSlkKSn3Edy3pr8X+U5bE/kW5HG/p209jYgpWLyeE
         EZtVBJX27v67HWSPe2seu81DYsZjoDaQYEEpxPYM6sY8UgwRC+S/uWrKlZLI6gDswj8T
         8OaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHAq0joC2H/RhAiycLbts44FBP1KE1e5jCAzxl6rBXklIoHUAKlh4Wc1J302yhRrr49f0pIzSwQlu/@vger.kernel.org
X-Gm-Message-State: AOJu0YxK+sfv+9HHv7FhSKEEgZTvDLP16LBpxKvA2a/3E43IrrSaS2SD
	m312ZMMdGsEs6LkCETeWfiSKyTRV4Wh27WBnw/V8ABCROQoNAFpevD/MO/T0DxzWrWjsWVzrrfk
	kjRID57B+27WHZetYVljMAz6bjzY+QhnCOzZigCNZo9vzmMhO9A==
X-Gm-Gg: ASbGncuLNGqF3r8CV+bh6TblV/UmAY1NXiWoJCJFIa8wECDsIU1n6gF/bg/EHn5q8mx
	XNxiiwucDnDzez4pS+gdDjvt2olX4Pt+cH/Ah7hkOYsuNeYzgsr6fKfokAJkJ25l2
X-Google-Smtp-Source: AGHT+IHqz40+x7E17NRnbXEoAo1L7bBK6dScpoiRkMTQeXtmEdnLgXp2mYgGvPl1LIdmUmx/k7b8fq0/qhsq4fyUHX0=
X-Received: by 2002:a05:600c:1c28:b0:434:a734:d268 with SMTP id
 5b1f17b1804b1-436e2699dfbmr107787835e9.14.1736512332660; Fri, 10 Jan 2025
 04:32:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLgjgEeGbd5NUhG1tEKKoj5+cKkuiq25BdeApjtx7SvnkEQ@mail.gmail.com>
 <20250110101459.536726-1-aliceryhl@google.com> <CANiq72=N9RMKRBtEuf8qr1oaNVVtfto2S1wXLPRxzfH5N4q=uQ@mail.gmail.com>
 <2025011022-nemesis-scorn-6772@gregkh>
In-Reply-To: <2025011022-nemesis-scorn-6772@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 10 Jan 2025 13:32:00 +0100
X-Gm-Features: AbW1kvZdKvLdSdBuYCVy8VuIUQMBoTAXiPt2Rmn-x4Al3fbgheJgoenDGZOABms
Message-ID: <CAH5fLgjeFH73DOmihQdBLnB8tDfTsQHEi=4nzVG=isifvOZ7gw@mail.gmail.com>
Subject: Re: [PATCH] miscdevice: rust: use build_error! macro instead of function
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, ojeda@kernel.org, sfr@canb.auug.org.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 1:23=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Jan 10, 2025 at 11:38:10AM +0100, Miguel Ojeda wrote:
> > On Fri, Jan 10, 2025 at 11:15=E2=80=AFAM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> > >
> > > The function called build_error is an implementation detail of the ma=
cro
> > > of the same name. Thus, update miscdevice to use the macro rather tha=
n
> > > the function. See [1] for more information on this.
> > >
> > > This use the macro with the kernel:: prefix as it has not yet been ad=
ded
> > > to the prelude.
> >
> > Typo: "These"
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> And I'll add a Reported-by: line when I apply this in a few minutes,
> thanks!

Good call, thanks!

