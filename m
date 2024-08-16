Return-Path: <linux-next+bounces-3341-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C568954201
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 08:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24B081F266EC
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 06:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3023584A35;
	Fri, 16 Aug 2024 06:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgOb/7Am"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F9383A14;
	Fri, 16 Aug 2024 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723790768; cv=none; b=FDco5PCaC2fy8vOQcxwDAHEMxX/M0RUb46Scw7rudVwamvWk80IJvHjYGnBVeDPsjyLNONeIgxyDxLLKLgZbzkB5rPolGqMkduIoX7+ZaMBlPfP/JqLvzYcPXIJfnpgcPwtuK97VMPKhQFrNoKBbsUsw+BFs7SC5wE57TmUHiH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723790768; c=relaxed/simple;
	bh=VMU7P8QmKbMMhNUiY97L8woQficyZDMokO1QN0TJolE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/CLxpsoCheN94c+hDsjQP4Dx8ENvjWpCV7N95TGudLBvx0HVuDexgKOzRNI5fLxF/zTD+K64/1F373hvyNHUw1EnN+pFaHmcgxyktQMn4YIlLmEFWWjCwngMLcRVkxmpZhZs2+eF0PBW9pE7ijGWkkcdioIJEtu1/TUdCeRkDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgOb/7Am; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f1a7faa4d5so20306071fa.3;
        Thu, 15 Aug 2024 23:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723790764; x=1724395564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWIQyjcwxwxoozdDDNrNFsJfSUc6vmm3ZKaTMYQeOzU=;
        b=MgOb/7AmOqdiARBORhs94cEhVrhQsU7jWUIeo/QqdvfZK+OksABNg4Es3teueZVnzm
         UVgQIMeE/ChdLqcBJ/H9aqbY0nE5NonC1VIL9LhPBy3gltD3yOpfjEiDYkEbdNol9dVO
         3k59pcXO85Ulf7xhjTJYok/l4qqPFMWRbWkwWq1Rr66a+8Ro9vFJuEG0M9QShWNi42P9
         qJoLIpsVIYUVADWYEchIG4EqsxCTc912Xd5UNdNhjkZi/sKs0IGZiUYbZbbuocmOOmbC
         BqpIkSMy5q+QCg87zArWNfhFLGQh0QEaDbDcdYb0vz5+ABQKIOH2xgyW/jbuLlgVpVLl
         /G/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723790764; x=1724395564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWIQyjcwxwxoozdDDNrNFsJfSUc6vmm3ZKaTMYQeOzU=;
        b=llgETwlHe86EYc+W4A0HCcZyqruCVIaEgOtvYvU3KI2+CBmNnHwGKc1daEOpUaP6WA
         ZrpPeW95OW3/ePEXj/3IYohtFq67NmdDp/3nuzZMHpi8ZXS/bjLemZQfFtFjm5AHQEOS
         lfwX/UQIFoAcdAShgZqqprBwfiE7fDuUyMbNBrpJmnYp8qTFx9SuelTLeFFKTqerTdLc
         8YuuQjwAAJxvNoSLVEurInudUD4eVul7FOe2dk+czSMqgF34RWlUBGB4L0I+7WM0dss8
         udxnZ1q8TBevgoFq+FRNfeHHh4g7pTm24f8wMKcQJ6D4vkHTP1TMl4yLrAmfNQ1OFo/R
         R1zg==
X-Forwarded-Encrypted: i=1; AJvYcCWV0a4B60rMkb3wDKv6zxckcO+50HSyvNwjKtctRsyIY0y2h1dpUzflGuhS3EScF/RBj/JXxjzSUlEsa64o3mnZPUJAyz18o4XK58GEo782WiXG+7zkmSnMhd8iKbrC3mtYX+SWNSPwYQ==
X-Gm-Message-State: AOJu0Ywmxj/CJgm2Nh0XxxazhHq07eMZI/RNuxQw3vOf3qv+XQtZ1tvD
	9oXCcJ1XAmPeYONoWAyAHA2a8XeWjN9NEDcs38GeXKIurmZ5cQXAgOUFXY7UdB/SQt6DpOzpgnv
	0KRBGSz3Te713vBQ8Ey3lR9FA40SFIA==
X-Google-Smtp-Source: AGHT+IG/eNNOu+whyDyjsgW/pbkHGvmXKdlkP9ta0vlPu2j71YhjedFmapO9netpEcZc0nbBSOMMvYcuDXVP/n1Ps0I=
X-Received: by 2002:a2e:9e18:0:b0:2ef:2b6e:f8c8 with SMTP id
 38308e7fff4ca-2f3be61309cmr12000611fa.42.1723790763809; Thu, 15 Aug 2024
 23:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815093829.275058c7@canb.auug.org.au> <CAFULd4byjR7fF2wBUJMH=8_p5sE2vK9SkG=O4sUOjS4x9MUyRw@mail.gmail.com>
 <20240816112920.55d293bf@oak>
In-Reply-To: <20240816112920.55d293bf@oak>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 16 Aug 2024 08:45:56 +0200
Message-ID: <CAFULd4ZkueN0UHYu+mJCCgRfyYQLg91tMsccXo9u071fjvRcgA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 3:29=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi Uros,
>
> On Thu, 15 Aug 2024 09:42:51 +0200 Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > > Caused by commit
> > >
> > >   8e53757638ec ("err.h: add ERR_PTR_PCPU(), PTR_ERR_PCPU() and IS_ERR=
_PCPU() functions")
> > >
> > > Does include/linux/err.h really need to include asm/percpu.h?  __perc=
pu is
> > > defined in compiler_types.h which is included in every c code compile=
.
> >
> > Currently it is not needed, but with the proposed patch [1]
> >
> > [1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.=
com/
> >
> > that repurposes __percpu to also include percpu named address
> > qualifier, it will be needed, because per_cpu_qual will be defined in
> > include/asm-generic/percpu.h.
>
> How about putting these new functions in a new header file
> (err_percpu.h?) and including that where needed?  Are there going to be
> many places that need these new functions?

Actually, there are only 4 files that need these functions, but some
of them mix generic and percpu versions. I
have to rethink this a bit (I considered asm/percpu.h as a "light"
header that can be included without much problem for every target, but
for powerpc, this is apparently not a case due to paca.h include) and
will definitely consider your suggestion.

Thanks,
Uros.

