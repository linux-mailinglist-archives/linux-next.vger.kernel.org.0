Return-Path: <linux-next+bounces-8740-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700BC13E24
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 10:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB22C3A7405
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 09:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D16A2F619F;
	Tue, 28 Oct 2025 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oaeCN/Yc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2842DA774
	for <linux-next@vger.kernel.org>; Tue, 28 Oct 2025 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644529; cv=none; b=ZD4MryTm4XHVrW4pdH1/8q5WS5+SJSWXpOAe+ccwr+yZ2uSIO+BVmhWY/ybNKt7Ck2PC7ZW81v0J5/qThxc+9nXSOAX+PVzKDkmt4yWVT4wjrYyyOJy99w32/Gag90t5to+LYLsjV8J9tK9T3nQwKaLuKwFOECrAjQm28mwGjfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644529; c=relaxed/simple;
	bh=F1LlzPFukHcBQZtULXqC8ZLbFGzwCc57krplxma1xrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUdCKiT6h6jabxGWHeTNnRJ0uoGLHX3OwAnhr/QCjvWJF74KNDEmvx5hcrdTv+Zo0xjks5bV0V56kKP8Yw+pnb+GQFDWOJQeTICLeLOVISlVLHfUkDHPDn6jWn0To14wU+yXlrP3QMl4qmaeF/61TN0ZxcVW1+wcvLtwyFGR7Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oaeCN/Yc; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d71bcac45so59598467b3.0
        for <linux-next@vger.kernel.org>; Tue, 28 Oct 2025 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761644526; x=1762249326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ryO6rqNW3eQpZIb3tC0WKzyA4BnygSI6aKPZv1FgIo=;
        b=oaeCN/Ycd6aL6zDV6Fszq7RKKCrAyS0H/c6dUklaNNsq054R0cs/kaYmIm3aNBzkAL
         fEy+3M868nYbq5UE8mPmSmATnVbSijiZymcs3Bnta45h7k5W9Vsul1piHhGPYbTYgC/t
         kzBVGaYLhiGM7uLTRRC+JNtbalwNdlE6Qmt453Yi5Q9FMXDV1ZGN98ajF+O2oUnxk1Zl
         1Ple6GGAe98PN4IEGJ/IydCbfvhZ9KyarErVzfaewd7BxEm97Xz7sZUgz8wAnGnBf0zv
         jVjDWZ1poFXtytmT3/mkhdG1VxGfmyyLBRpK/bt0UZpzu73gkxAuPKJW7YiS6x7x9mH5
         6RBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644526; x=1762249326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ryO6rqNW3eQpZIb3tC0WKzyA4BnygSI6aKPZv1FgIo=;
        b=Yybsuw8uhobX5xyI0VstUFL/qRMMRknCFqcsA4/k1LWmAsE15uGe3bA502VO/x5f5f
         oVEDAfe6HfKFeBpJniBusou/5gWbO4zPREG3b1Hm4ltrUzAT6vN5L/tzZBsU2T6Gq7ac
         WzGyFAQ9k4YSFqp6E57+51T/sB+Lj5c3TJ2aeh8fh0RbkSm/xpIP+8mcBfIxFo94BMVH
         /nBwwKxWtCsYTaYjEBhL6OhgCCaP2K/PVtN+rcStsLP8aKDFIb5CRunAVcDX5foLHuRQ
         PbGrdkkIjykCOTsWi7HhyFkZESOP7tBHdnvsRKkbEWyA01XcN3Moy/tZama1ORMOqsLI
         yQCg==
X-Forwarded-Encrypted: i=1; AJvYcCUpjpbKH3jjhhFPdBqbLTua+gKndufkzqBikWGw65wXXxbBzvfyo8CtWLsMiy5CRUxVERBMuJRTuRBe@vger.kernel.org
X-Gm-Message-State: AOJu0YzPinJQnFhVTQKu+74SbbRbIYk7MNdWexwVs2tenTo7w5SFOZqw
	VvUYrDeMFUwRDOmAMBDIlHWDpJi+eWGXHQQERKMRqkuzAUxLk0KXQpuGAbBRXGd2HMfwN9A0i6f
	19alg9zqYVeHou9V6wjHO2Rom10NgxO6z7tGNmKr30Q==
X-Gm-Gg: ASbGnct1loYB23L+0F7DlOUVPPv3H88nmpJaU+aSVzbJOzYX1Y83MKG+3FTZZB4rdUf
	AfGdtkpLTymK3UPg26PJGTp4UR5NGTZ36kY9QWSb++GRq2Z+03iYNogj/PYAITsj0Odc3z4wPwm
	bQMmcddfNkpcU4MMUGaCwZqzYEzWhyuNKaLQyaWxzG4Qj8EEhKkjrYTUigGuBX/UI4er25UWlho
	+GZhyulJp7C5rIEOIC6AJxOW57cioufpw403En44ooM1VLva9Ps05gp6DmXSMJWLUlfx8U=
X-Google-Smtp-Source: AGHT+IFEiW0LGqj4GnK5zWx4ulZG1MC2jB5sUY2t5vbme1LGbExfjnLMlm3g66hE+Mh5sqv7L2cs7b0WaP/8DY8oqTQ=
X-Received: by 2002:a05:690c:25c6:b0:76c:951:83f5 with SMTP id
 00721157ae682-78617e81492mr25704137b3.31.1761644526263; Tue, 28 Oct 2025
 02:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028132336.66819cca@canb.auug.org.au>
In-Reply-To: <20251028132336.66819cca@canb.auug.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Oct 2025 10:41:51 +0100
X-Gm-Features: AWmQ_bmXW2ly6H9OO-pyXAZVpv4SH_iK0e7IfxVGRquiEeACii4_PqGPQ9ejOG4
Message-ID: <CACRpkdasr5x4KP5rETibMy3CKZOq_W84cKFBqwKsDog1O9xwcg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Gary Yang <gary.yang@cixtech.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 3:23=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:

> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: modpost: "pinctrl_provide_dummies" [drivers/pinctrl/cix/pinctrl-sk=
y1-base.ko] undefined!
>
> Caused by commit
>
>   7a97fa0eeff6 ("pinctrl: cix: Add pin-controller support for sky1")
>
> I have used the pinctrl tree from next-20251027 for today.

Aha how odd, I don't know why this call is there, I just deleted this
oneliner from the patch so it compiles, Gary can investigate
and follow up.

Yours,
Linus Walleij

