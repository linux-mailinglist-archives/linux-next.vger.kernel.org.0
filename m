Return-Path: <linux-next+bounces-8070-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C86D5B2FDC5
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 17:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CF9B5871DB
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 14:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910922EDD41;
	Thu, 21 Aug 2025 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwBekYe2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB76D2C11CD;
	Thu, 21 Aug 2025 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755788237; cv=none; b=MVd4hgk74OqT8m5Oq8eKdeJk7zX4OclpFHq6hi3d/H/4JvrUAGYWO0qjgDlyqnN+tkKYfPMgx0w4+BuIZGrZ9LO7mziwmf6d6EP8LJTXY0BXdB4KHQ/KDK1wO3NzpPwI9DB83afq8uwTKLm/+Kcqv1vSoIZzBSxd+Iy4VzckuDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755788237; c=relaxed/simple;
	bh=U8zBVgJT1MBW3uhX5im+ul+S/iSiCa3gtZJewr5z4Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABs6llcY+eimRifKWaPleAAwWW80YU8UugY7Xbu94XheBDnI854b2YXqEiuai9gIimX8pHYhkeh2fhlopyRCayeZhdI/h9PKM//+WpaxoGP/4JkCw9fRdKJo33AFyYhT0wNPyabsMaBoeRLYXCL60hFwzkFL5t0FeAbM+6XJiKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwBekYe2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-244581eab34so2205565ad.2;
        Thu, 21 Aug 2025 07:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755788235; x=1756393035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8zBVgJT1MBW3uhX5im+ul+S/iSiCa3gtZJewr5z4Hs=;
        b=MwBekYe2sHSczdYc/QHeqPH+aumTueYA/6qr8zN6b039rrTfcUW+WInlLCeS7BLUMq
         tUc4rKSvMOkq+6QLs+98s9wuqZyhWh2IqT2JzgoGV+1GlQkzGcLJb6cxx7eDSViyTTIc
         oROwuure5pH36BY8q0H8pgXRl8DZM3WAIYSFVkjuNHcnwo6upIIAYsf7bT+c1tkqJReN
         ukpJYqaDzO11aasjo9YsF8ul6j/xvCpWvWw5XoVAq34Ee/h3F15UJQ6IN7W4lYFtFKEA
         u5kJQASDMzU6bxwk7VF3WlP7OMFgGdxN4REYcU+pGfmuw0QylKnLbUh6caRZlKiLkqmp
         o2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755788235; x=1756393035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8zBVgJT1MBW3uhX5im+ul+S/iSiCa3gtZJewr5z4Hs=;
        b=sYlKBRbDKvp5QowP05V++T4T+6Nv21kw7D/ZBEgR+6AT325cP3BYgJBTA0I18Jcfzs
         LIykLMiWCbddHpNbEZ+QcMDKtLJnthJPYFsbbC8aERpMuBtMGwuFWnmn2W2Mc9JlTyKU
         sZOUaRDFshQuNhDdVz6YZHZZGwMC39gnXUpkcFsB/CJtL6L2/W6yI8UzMUuON/Kijr3K
         S9A54C7VJkf6Sw5h+MDvJkp2NC49fEHbjSf95pc+wTPcuQeOvmaUch3kvPygomfrR4jI
         gqFGO+YqQK5y9B1hH2k9sXjOBihZrbQMGDQaXgv5Y+3WW/VBdanzJS6twi+ifGwhtT3x
         w7rw==
X-Forwarded-Encrypted: i=1; AJvYcCUYaTsLO7l+bScseZYkSdSibzE5gTwR9LgQzVsJgHY/s8UCKFNVDAX7PxxfrzSjfZg7xkBF7NICv/hHKVY=@vger.kernel.org, AJvYcCVNDvmBbQ7wabJwGG+sJeFR0D6wojhJmbIAmWRtCxWD/FAx8l06x+FOiJoh9g/VL8rQHptGU34pzOWjVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxqv+3/ltEyDZzT4cl00h2kGA3PAWFl5sp0ohM43LKXU+NShn3
	x7Y5a1zWqwMcW+UwM5UAFwLAHP1wfPLLmaGU+m+SWxm1C0XNaZcyInh10N5/OuIi2WRCN6Ypdh3
	Vt5+gMKZ6Qnskn55yB+HTo5YtJ9Bjmgs=
X-Gm-Gg: ASbGncsIwtLvf2T2Jc/YmP/hi1I4cYt7FwPXRccfoK+NXNUNUbbLYATPj3HPuh+o8T5
	uvs/ElIavb8nCPCEty06EBBX1Xnv8NYAyK+u4F06+wZB5c5g90PqdMRxpEjFxUcnAQg1fsPNZac
	7jQqc+GW/G+3VZ3oSvWKt3/KHjHW+l1gSH0oXWeVqKPLYVWNGQBx8HmyUxtQPh2xx4WfU9OCkl1
	AcXQHJ7P4nYsB4gDcg=
X-Google-Smtp-Source: AGHT+IHFTuHF/h6I4XoItrkELxafG29TELxPRz8Z2qqXKS7BMlwb5mmzLCZh2G7JQPEp/8XnUu21KIhTcH7eRCIuyxc=
X-Received: by 2002:a17:902:f547:b0:240:9ab5:4cae with SMTP id
 d9443c01a7336-245fed5a1ecmr23497815ad.1.1755788234965; Thu, 21 Aug 2025
 07:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820113720.25631f7f@canb.auug.org.au>
In-Reply-To: <20250820113720.25631f7f@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 21 Aug 2025 16:57:02 +0200
X-Gm-Features: Ac12FXwypKnMx-2s_f_5w4LhU2sAdH7h-NK8CpDZKC0iHptS886h1LJcufTypcs
Message-ID: <CANiq72niVeL0CXmQndsO4QWDn3LO5vo66DmmTC+=f+MzM=DRNw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the input tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Liao Yuanhong <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 3:37=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (I applied the following merge fix patch) and can carry the

Looks good in next-20250821, thanks!

Cheers,
Miguel

