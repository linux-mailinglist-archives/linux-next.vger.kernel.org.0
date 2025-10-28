Return-Path: <linux-next+bounces-8739-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A60A1C13DC1
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 10:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2B3D1A2800F
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 09:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324152FFDC2;
	Tue, 28 Oct 2025 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BndvowXS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7AF277C96
	for <linux-next@vger.kernel.org>; Tue, 28 Oct 2025 09:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644337; cv=none; b=HdTWMOI+XqitLfhN9K4pqw3sFrz1nLrl+zkxIzk/lvpk83J40oafpbF6b3RmHNCE84sD+uh63SDJgrSb9QXJwgIm//cRMh1oyMukxHIdG2n8mNo4Xjhod74WBSIvFTivW3lnFrfqKWhBPi7hNquWxj4kNQyqurdQyvibK4FVRQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644337; c=relaxed/simple;
	bh=9XT29P5nG6ybcTWqNLWy6LyojXTlR4aBnuox8K8qQ7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3QcGVvUFYsIWGcUtqU0+UnI4U5ggW8ZqKMw+EdXnzaqK93PFXUA1lwXQE+swkqzWFdAu4YSMwStxHSzCpCev5b7WpVdMJyG9U1yr91A8WMJcFjDWS66RTWQRPUxDxG6qK3jiXdFT2PIrquRnUjprtpWbVGLME4v5tyunHs4jIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BndvowXS; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d60157747so55459207b3.0
        for <linux-next@vger.kernel.org>; Tue, 28 Oct 2025 02:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761644334; x=1762249134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVeiwoRqAoE//vzYcx4vZTWn79lwOq5iCXrye7CBQN4=;
        b=BndvowXSbu3KzjeuIB0MEYIVBvNE6b8Zj4Vh1fgkB02AOG8Ms/fWPrPpNqzIvouwH6
         FESsvfOVT7mkSFypOjjIcs2Q/wI3feXYTBQxIz2hk97J5roJvMhtvnENUurBj1vp+jfJ
         TVR6lBXKHS9EvxVoTXz3j+66fOVX5uSWjKNXidpJJzOFoWL14r6j14DgnaEJ/rc+Mh+5
         wmyQHInB9nBy2QpRECGzHdOp8TXDMsCogCgowpLFmZuH6nQyk9PHSlcv5Kzn3mqsC+kJ
         ZTLvs64pn5bTAFs5f6kLb0Ae6xTIkhb3ZSI/OWH9LOo2zal6d+srcL8iuHJ3J0Kgf3LG
         NRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644334; x=1762249134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVeiwoRqAoE//vzYcx4vZTWn79lwOq5iCXrye7CBQN4=;
        b=FU/kcDylygcBHdyWCuj0/tDmMSuNe+U83o72ggUfcDDvFCVqKgj+oTEaLZSbc0TV77
         SDv3hoz4k4cz0QabvQt5Qj07BThrl2hxeBDpmW+bzKhmMibkHQaa8Xh9dzcIifC7mRlo
         36nZhPblfOTcC4ibWRIA5A+uViqUTiocsWbhlgW5hx4iedm4dv6RmMP48djD50tyKgZZ
         0xQpG6OHCSKwY9eJsggtDmz90HoHZenaUpItd6wB04FkxYT1EcEAXK9WMwEM3sVhFFib
         dYXUVWvoOonN7Fr/29OPqGR+Ofoa8XWexs4HU3k/RSwCsMdFR+PwycWLyt4NBqhOrvwA
         L4nA==
X-Forwarded-Encrypted: i=1; AJvYcCW9hB93kdS+VTGcf8ZXSbIOW+cOA1r1afcw0DtbJYpRPFhpcF28FlAgw0GPRBoqs2HECQJ7A8G8LixO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56CAiM+MmnFnPIA6hbRLKYrfL4npiFPONmX6PuOJSwXJa+gz8
	StMpXKGSXje6xV2Bm8seVV8N7DAo1bDp34FGTMfPgS8jFeYml+JFfcB7k6M+MetOxZHiqUNK8TD
	WrL8so+xLLGujHjlV8+X+NnwkZnO7Ofn7F8gOjzJWxw==
X-Gm-Gg: ASbGncv9/B71Mer131tibeSN/56yuUP5MQ8jdOCeNwuolz00UAY98E48Uaz76c16kFn
	/hOv9ohI9J0s00xntR3rxnJN3SL0pae3V5ygQ0G/GEP8QP4SVo8tms0b2BH7czMkeakg733AY/e
	3vaWfw2uTTLzcCz/ilv9diCZFhkA7Vlk6uKhSY9k9SPM5+30uu/nifgCmyIfDuXr/eRYgXhVSNw
	wg56FYF1vkUdkPERKB9qW7muY3kKF0IbSiz7YaSSEnPqnPcpzIgG1CEiVRPThnOklrg6MQ=
X-Google-Smtp-Source: AGHT+IFCKmnaPpXTAX3Mf+PwlXuMSXSX4zruOYSEiuVmo7Chb+u2cHajp0OhOA5+lkBXv4HGJcasVf0Bbiy3XKcmsAA=
X-Received: by 2002:a05:690c:ecd:b0:784:8644:27cf with SMTP id
 00721157ae682-7861838ebfemr27771687b3.55.1761644334550; Tue, 28 Oct 2025
 02:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028120224.1c7ff0eb@canb.auug.org.au>
In-Reply-To: <20251028120224.1c7ff0eb@canb.auug.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Oct 2025 10:38:42 +0100
X-Gm-Features: AWmQ_bmF0Xk_seuQOVeZSwLTJtUIYb86ntNFB7ktW8B0ffUwuT0Of865jbW7_mw
Message-ID: <CACRpkdbvU1LKdEqHQwZT5uk8yWz_F5mcn7CvnYBrb0c06PibRg@mail.gmail.com>
Subject: Re: linux-next: duplicate patches in the pinctrl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robh@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 2:02=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:

> The following commits are also in the devicetree tree as different commit=
s
> (but the same patches):
>
>   9760089ca4b6 ("dt-bindings: arm: Convert Marvell AP80x System Controlle=
r to DT schema")
>   0385f89a0cbc ("dt-bindings: arm: Convert Marvell CP110 System Controlle=
r to DT schema")
>
> These are commits
>
>   3fa6e2a0ce21 ("dt-bindings: arm: Convert Marvell AP80x System Controlle=
r to DT schema")
>   5024ac81c4cd ("dt-bindings: arm: Convert Marvell CP110 System Controlle=
r to DT schema")
>
> in the devicetree tree.

Aha OK I didn't know they were already picked there, or I forgot it.
(Rob may have told me in some messenger.)
I will drop them from the pinctrl tree.

Yours,
Linus Walleij

