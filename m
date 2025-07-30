Return-Path: <linux-next+bounces-7778-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED12EB162F3
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 16:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ED853BB1CA
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 14:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8172D97A7;
	Wed, 30 Jul 2025 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1TlXqUzk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C9114B086
	for <linux-next@vger.kernel.org>; Wed, 30 Jul 2025 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753886257; cv=none; b=bln245W5/pjOVI2GwC+sNP+Sndcx4skfoeAIblHnBLuOi1PF3LZKVKYmq5/7rGEtcfLqHFNSJHAZ8LYuzbeXtxHyM8RJjxADTqEA9SSsUNJY4SEfWgqyPpfVkxYHhuSk9DbwafFrv4DGif1ei9E7Mh3B/BaP3qmdKc/zdZNomJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753886257; c=relaxed/simple;
	bh=lXJ73jdHr5s/O4AsJ9vHXZKR5cKPhac21dmjQ/GtsgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+krFS1vvUo1MIhy7rFKeNjT3hSOaBf2jQ6VM+liLGDcFlZtWcMIjnjGB1PnTkCwSo/atF6DYii9xjG+c9bIvobG4IArb4qy7N693ojF02/NGxzOUjGjolxzb3mEjYzvd3hBafL7vPLFWu/hvUsPv+8bCEgS1ZoXfxYs8bUqCDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1TlXqUzk; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-33230f1347fso3157801fa.3
        for <linux-next@vger.kernel.org>; Wed, 30 Jul 2025 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753886253; x=1754491053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXJ73jdHr5s/O4AsJ9vHXZKR5cKPhac21dmjQ/GtsgM=;
        b=1TlXqUzks9/AvUHlc2In5g2M7Bq3ooD3MMhfdkH3pRS/lbFQxAdvEgU57iA8eqKPa0
         qzQZQcSY6+7Mulm2NoLribjNdN3WYKamoBc3t4RGx2Mac3wtke0YA3pSEUafIWWeWHQ/
         y2f2xaQaTIvwH9uEpJuoo+NpxkQ2xrrNkQO6q1MzO9QFd3woMgnzSf0XOlbfVeYNLTRL
         HqdaUhRAFncKnupMXoxkaU0pye58LCmqHTqbwAe8NbK/YQ24DbVP5RV44pR9fxTLBv7H
         I2RYkZotZsuurDvIakEqXI0LUyyVDt8EWqGKRjAlhyFRHE18SP9zkBDTAw4/Xn4+Lbxp
         NqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753886253; x=1754491053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXJ73jdHr5s/O4AsJ9vHXZKR5cKPhac21dmjQ/GtsgM=;
        b=NRf8WYXXGzDr7X0L+ZtKUKyIOUByT8gcvPSwYM58s2VCVHw1Zzm6bK1CJJq8EVlefR
         C1uYG7paHRcIvrfZfIe6aenM3dXwJLiGCZjtAYlygPT9ptbn4yHlmvV+rx8rS7uRGkcv
         QQDUTxSshNng1kfe7+SSRi+lhCIg7/FojfmdvzEI4Y+aWefzEmXC/jFzSMnujSVRS6n3
         WguovbZH/ve+mnYHivoOVfd2M5PToH/awhdeKwD4CPL/RP1em9HDU0Yxx7Qdmrw52kl9
         0bYRb1D7p8QxVVjbsi3siMRSzVd2tKBa7UqssrF1vpdy+J24CD2MxgXUGJghsrYi+faH
         TW3w==
X-Forwarded-Encrypted: i=1; AJvYcCWVO7JViejA/8/D+jskiCe86GjAXnRhQjUqtN52Q/G3ebW/o3EIdVIbyL5aIzRMLy4i2evFAbJWCVTD@vger.kernel.org
X-Gm-Message-State: AOJu0YwjaafJuYpSrl8kCMva7i0n7rFFjBmVcVycM7F3TKQkRfR+1iZc
	1iUlIwqfdtNVNMgXhV53+4G8WvXZyqhY4drWom7jIeFkQJtTD/ae7wSUhNiq6oUu9u/+fcfFmno
	etN01UOVyhwdqUi4BxZFjb2T+eJP9TAhZzaSEa9GAj1/Tr7Y7c610
X-Gm-Gg: ASbGncshmQXIFi2byh25hk7drdOrkskK+L3jcpgJ5VgNDFM8sRgEy2P/AyOgTFBcQW5
	Y3wbg5EgF4jJskd2Yj3Yzn1ELlYkMkayS0X+llefXVYrHV/R9ZXNsbsv97QKsY8JBVNgxm9tuWG
	FXYYUBEvEswTxf21hJITEgdSPGGVDur0wS1zatjeJRUo1Qr0mb/KYmDdcNWMAY2DckAksPPMF5T
	34tUKOxpWazXeOjmoz3elClxTKH6uyavWXPMd0=
X-Google-Smtp-Source: AGHT+IEHQwnB79u13ccn0v4jhSNP1wNv1SCqDLPqjR5PoLcasXYprdf/GeMcKzgEB2VCqotr8ZyorITapctIMNYkHD0=
X-Received: by 2002:a05:6512:39d6:b0:553:2e3a:bae with SMTP id
 2adb3069b0e04-55b7c05f18fmr984925e87.39.1753886253374; Wed, 30 Jul 2025
 07:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723094558.5bcfca69@canb.auug.org.au> <627cbb55-2a55-4124-8f6e-7b4ba0441558@csgroup.eu>
 <6eac14b4-765b-4a29-b278-364dba47e0e9@app.fastmail.com> <0b738b01-8574-49b1-b89c-3c96e9a56b28@csgroup.eu>
In-Reply-To: <0b738b01-8574-49b1-b89c-3c96e9a56b28@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 16:37:22 +0200
X-Gm-Features: Ac12FXyBTxA114Svy5Uj0ivWoSbrkrjvRPCa-JAMdMs5h4ChxTFMooUaMdouQsE
Message-ID: <CAMRc=Me=hNhER-EnvJarG-uig67cEPWfjuLyT1_F0WKd8jyLig@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the fsl tree
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	linux-next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 4:23=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 30/07/2025 =C3=A0 15:55, Arnd Bergmann a =C3=A9crit :
> > On Wed, Jul 30, 2025, at 15:41, Christophe Leroy wrote:
> >>
> >> Le 23/07/2025 =C3=A0 01:45, Stephen Rothwell a =C3=A9crit :
> >>
> >> I was going to send a pull request for this fix but I see the duplicat=
e
> >> patch is already tagged in the soc tree:
> >>
> >> $ git tag --contains 12702f0c3834
> >> next-20250728
> >> next-20250730
> >> soc-drivers-6.17
> >>
> >> Shall I do anything or just ignore it and drop it from my tree ?
> >
> > Linus has already pulled the soc-drivers-6.17 tags, so I think
> > both copies of the patch ended up in mainline and there is nothing
> > left you can do to change that.
>
> The one in my tree is in Linux next, nowhere else for the time being as
> far as I know, as it was not included in the pull request I sent three
> weeks ago.
>

Arnd kindly picked it up directly into his tree when you were on
vacation in order to make sure it makes the v6.17 merge window.

Bartosz

