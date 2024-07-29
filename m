Return-Path: <linux-next+bounces-3155-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2D59401D7
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 01:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5653E28311E
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 23:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB45418A92D;
	Mon, 29 Jul 2024 23:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CNICOkRf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E3D145B24
	for <linux-next@vger.kernel.org>; Mon, 29 Jul 2024 23:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722297484; cv=none; b=ZMqBQmcmKRYo/4OuIjyK89kLq8M7VUYugeTWED/coVTeIjkkgOb5eJP6qCMjR5TcdQLRidoXJ2c0VJAiYpr8Zayq21vMju55bZP+69FLoQs6XArJw8e0KFOq7vZRnwk0ujgVdYOYdDJuQ3pp5FZPzI5byH91TJYUhhmTX3fRmMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722297484; c=relaxed/simple;
	bh=HsTkYaQvLHEv35+aLag0xljxwQgmY5E7o11ogohLXTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpYWtf7NwmJ+eyzs57HiKxT1kJ4dW0BXAET5SC2xmqbBWLms695ss5Xmlr4UczcE9iF7fZ9xfwDXqe9yAERvPFOowRaS0eEvkb+CJmwOE4tkVKMDnSunFFWSY8WqupovZfaFSpj5tFlWeGNgujPCpet6F4r8smy6nxWdqOj4JCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CNICOkRf; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f025bc147so5573261e87.3
        for <linux-next@vger.kernel.org>; Mon, 29 Jul 2024 16:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722297480; x=1722902280; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M5OeD/TjdLdg6TWmjDcFFR5g1FHvQF1TaQWWZJWDtZI=;
        b=CNICOkRfwdZZsg8ZAdDwtqHxqAceZy1gATtyrc4LehVVaubq+tmn6pJckU6yk4r/t6
         MnA9DFERdzQhLsmNqJZ9J/YS8nsjbtZe2JvzynnqeWzopWVkTcopOnjhXEqkc+v3pACD
         jjDAvP1ByqJLajfFlBW9nRwntJLQZ0SiaAaCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722297480; x=1722902280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5OeD/TjdLdg6TWmjDcFFR5g1FHvQF1TaQWWZJWDtZI=;
        b=d6/hivd0ylCoAB5SudPAqlV/RVMWjUBzNm1SX2cnUlzIfIRYLeUUipd56FZsSM7kLp
         W1ZoxbaaardIx6u4edAR45UtIu0R7QIVFkUle1JJIBd5qGL+WzCSdhBe22gmaPrAoq9e
         g3KOwsmrzidNn7blFDKDfo90iBcVwGSrWrilc1poscdV72jvUi7aKQ2N/OgLcQoxZ8Kb
         RzKZIryZCQpKUpRfe8kb2Pkg4o7NHM4WbBURNcF020IhRDpPY1ZxuPUy4luKD1LmcdUP
         IauWfZLklioH5Qc1WvK6qPICfQEnfYSBbigznUA5fKzOXAPedOpQSflDbfbHfMj5Nvit
         YR2w==
X-Forwarded-Encrypted: i=1; AJvYcCVYroZXMpOA+lWQqVHRjRhsoVFl5w5ijBKre1A0Sgkp8Q0WCgcx1iqYhBMcIFbtE67LKFluLFv8/+MGL0kfzr4mqn3F5Cmf5IRjgw==
X-Gm-Message-State: AOJu0Yx4c7IL95tCSDkLzrOc72oLZkfQw6RmrH2avSo/Eo7SdWmqV5NK
	wLF0QSqk+RyqlAwLnAloa7ugiahYw/18gv5qu8ZyXQRcQAs/8pu55ioxoZzR/HFtEi20qDfzOHt
	We1ZO6w==
X-Google-Smtp-Source: AGHT+IH7qB7cQdqSP7O6bPcVnJJ6naFetaI11wmfpDtPmgOzGwCROWW3JHM6ZsgI+oV1lao08Qof8A==
X-Received: by 2002:a05:6512:3a8b:b0:52e:9f17:8418 with SMTP id 2adb3069b0e04-5309b269e16mr7304112e87.12.1722297480462;
        Mon, 29 Jul 2024 16:58:00 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c28ec1sm1649681e87.247.2024.07.29.16.57.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 16:57:59 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f040733086so45408571fa.1
        for <linux-next@vger.kernel.org>; Mon, 29 Jul 2024 16:57:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsxrD/e9KQCaHbhKw07pgSA0z8RXY9+jlSpSY1e/mJzwoBEPUksw6a5W9ZHfgWbFrK8FBTjvLPuIXRHyJkeVHleQhy0XHjh7sVDQ==
X-Received: by 2002:a2e:9ac5:0:b0:2ef:23ec:9356 with SMTP id
 38308e7fff4ca-2f12edef762mr60373271fa.8.1722297479131; Mon, 29 Jul 2024
 16:57:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730082204.57c64765@canb.auug.org.au> <CAHk-=wgEipN1BoDCG02m1XqvACCFLxj2SoEG8O4BZMAFXKifqg@mail.gmail.com>
In-Reply-To: <CAHk-=wgEipN1BoDCG02m1XqvACCFLxj2SoEG8O4BZMAFXKifqg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jul 2024 16:57:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3+tK5ndB0P3Yi2HOYFm6YMc-k-wBJjTEo__opsp51jg@mail.gmail.com>
Message-ID: <CAHk-=wi3+tK5ndB0P3Yi2HOYFm6YMc-k-wBJjTEo__opsp51jg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the origin tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jul 2024 at 16:38, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Does anybody have a clue-bat: what makes only the powerpc build show
> this valid warning?

The obvious fix to just remove the stale static variables has been pushed out.

And it turns out I see the failure too, if I use clang.

Interestingly, clang did *not* complain about the

  static DEFINE_MUTEX(profile_flip_mutex);

only about the static DEFINE_PER_CPU() cases.

So it looks like having an initializer ends up suppressing the
message, probably due to various historical usage patterns (eg things
like

   static char *rcsid="$Id...";

which is a common traditional pattern).

I have the same gcc version on both arm64 and x86-64, so I guess it
could also be some gcc version dependency that caused me to not see
it.

           Linus

