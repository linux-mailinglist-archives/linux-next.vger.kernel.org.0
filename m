Return-Path: <linux-next+bounces-1189-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D1E856740
	for <lists+linux-next@lfdr.de>; Thu, 15 Feb 2024 16:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B09228C39B
	for <lists+linux-next@lfdr.de>; Thu, 15 Feb 2024 15:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894DF1353E0;
	Thu, 15 Feb 2024 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GAeDjyOd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90C9134CDB
	for <linux-next@vger.kernel.org>; Thu, 15 Feb 2024 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010294; cv=none; b=Zg049AkVU8/HPXCtmrHMjRzx5cXh6MCIEICoytGJhuE9QzqbkyJXLIUJHRbeVZKPmeoGGYjndMctrUGZzopjjgNqPF25+a36U7a2ERSDcIgitDnAeta7LOB0ZQm07s5jkTCzPC8gMPtJM0HxfHrLDM0L7r+Z57XkGggDZrjdRjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010294; c=relaxed/simple;
	bh=0moq0mcoUJnqJgfLCw56ofLM3dtVq9Kx/sgkFcuifvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/u4smlT7Ka8RenXttaz2uMmoaB0IMcCTMxi7DT+JRrgHdlGzDEfQ+VEg9NEbnSR92UVFV9BQzOA9iZKNm9yWzdUu7iesC6rR/r9qL/HdEBbnnwPDNBONiGc0ULGog86k9jsczcle/QH/v2OpVIi2TxA/rNNyLkRmeYhGUCF2bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GAeDjyOd; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78731e44587so62842385a.0
        for <linux-next@vger.kernel.org>; Thu, 15 Feb 2024 07:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708010291; x=1708615091; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kwWfU3Ro1z0XktmL8m4mtOaaeAQD2IJrZimJ0lbSENo=;
        b=GAeDjyOdKMyJoJq6GbpeUb8/TqUOKMqCPhyFu8i2j7JeDIxwxzz2zoK6jBmHc8IIX/
         kuTjxA8foaHtdZTfIR8+Nr3dJQs0Iv2mqaGHgw7oswz3JCKo7f1rlE+g+1sIHi3kweTg
         G3DVcyifGy30LRieDv7LDh9XddeW3luF5kZVhFsi0mH7OtE3O2tdd+t6au+i/Ic4DL2F
         2X6cOSDt8huWZJBDr4w+5w98O4E2i6GDZPpoVNaH60vHlI8FkGPy8vUgDZ3oECdll+Ph
         CouVGCVbh+Ojiv3tm1SMpPbBFIsacWMgoGwq6pKxSIYfHVdSAOiWMQ4ygzQMvvwaPTgB
         mRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708010291; x=1708615091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwWfU3Ro1z0XktmL8m4mtOaaeAQD2IJrZimJ0lbSENo=;
        b=JITqwsslq6FxxLVzd+1FXX39+meSnjT8cfNamvTa7rK1SHrBbp8rITgw/OyBKQEkRY
         /gY63xhrZxMWaNaKaMKbpFSJipI3vxLNvpAMA69SYIqRmUjR6bncPtsmzUz2uJznX17j
         ap0iqzLBhb5QPUT7mkueDQ/ETXpZd2JZK/T3nGkZGIDcWVO2d/XRqr7rAmeJQNCvQZ7a
         8gPPRs9/hRzFuFEdLOO7P0OVUnP/SiFacY1eRwmZ+ONsSItIOltLjgUKNrDepz9UXAHX
         NIeoip09dOxPiEdVJ/7tsFwkuB8cgtNbPABV6XgjICH6KqGA+im2np6GMogDXV1iC214
         1oSg==
X-Forwarded-Encrypted: i=1; AJvYcCXOhDLFxcNeiErd1IwQ1I9SFs/nVnILBKsimUUvt+Gq0cCDm7uVXc9U2C13DylTK31n47A+03emTgxPgaNlzpZnVWX5x52FmKzYsA==
X-Gm-Message-State: AOJu0YygqLFIZPleZAND2FppP4kAn4k4MtjauExtpuMR3sQtURbIZWJZ
	vrx4O6IfhmsezFS/DOgFeeWcwlCfa15ipE76OeGGL+LOs9OLA2960wuTXzvJx1W3wxkXJkepJz5
	4Sooy3kCoaNlyO7DNW/QIiUuJSC/LQRoz+yp6Mg==
X-Google-Smtp-Source: AGHT+IEZ6QB3M6um48zblbG5/nvFRICNI0XNyCLsrHF5dTGPKc3t3UmN+k1fe2w7rx+t0rUIY2qhxPuZ3tJEtf7DuNA=
X-Received: by 2002:a0c:e409:0:b0:68f:2b7:ae39 with SMTP id
 o9-20020a0ce409000000b0068f02b7ae39mr1704887qvl.40.1708010291520; Thu, 15 Feb
 2024 07:18:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYuHF34bSbN9ktKuMAv1eOFVrf+Gw1MC_rG5trUQv9A_Pw@mail.gmail.com>
 <Zc4UZkFp6Jr051gE@slm.duckdns.org>
In-Reply-To: <Zc4UZkFp6Jr051gE@slm.duckdns.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 15 Feb 2024 16:18:00 +0100
Message-ID: <CADYN=9KmFfQM9BxthsOYXraE=hVtydVbOXF8dH6otx_7aSafrQ@mail.gmail.com>
Subject: Re: next-20240215: workqueue.c: undefined reference to `irq_work_queue_on'
To: Tejun Heo <tj@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Lai Jiangshan <jiangshanlai@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Feb 2024 at 14:40, Tejun Heo <tj@kernel.org> wrote:
>
> Hello,

Hey Tejun,

>
> Can you see whether the following patch fixes the build?

This patch fixes the build. Thank you for the quick fix.

Tested-by: Anders Roxell <anders.roxell@linaro.org>

>
> diff --git a/init/Kconfig b/init/Kconfig
> index 8df18f3a9748..41be05a8ba5e 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -107,6 +107,8 @@ config CONSTRUCTORS
>
>  config IRQ_WORK
>         bool
> +       depends on SMP
> +       default y
>
>  config BUILDTIME_TABLE_SORT
>         bool
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 04e35dbe6799..6ae441e13804 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -1209,6 +1209,20 @@ static struct irq_work *bh_pool_irq_work(struct worker_pool *pool)
>         return &per_cpu(bh_pool_irq_works, pool->cpu)[high];
>  }
>
> +static void kick_bh_pool(struct worker_pool *pool)
> +{
> +#ifdef CONFIG_SMP
> +       if (unlikely(pool->cpu != smp_processor_id())) {
> +               irq_work_queue_on(bh_pool_irq_work(pool), pool->cpu);
> +               return;
> +       }
> +#endif
> +       if (pool->attrs->nice == HIGHPRI_NICE_LEVEL)
> +               raise_softirq_irqoff(HI_SOFTIRQ);
> +       else
> +               raise_softirq_irqoff(TASKLET_SOFTIRQ);
> +}
> +
>  /**
>   * kick_pool - wake up an idle worker if necessary
>   * @pool: pool to kick
> @@ -1227,15 +1241,7 @@ static bool kick_pool(struct worker_pool *pool)
>                 return false;
>
>         if (pool->flags & POOL_BH) {
> -               if (likely(pool->cpu == smp_processor_id())) {
> -                       if (pool->attrs->nice == HIGHPRI_NICE_LEVEL)
> -                               raise_softirq_irqoff(HI_SOFTIRQ);
> -                       else
> -                               raise_softirq_irqoff(TASKLET_SOFTIRQ);
> -               } else {
> -                       irq_work_queue_on(bh_pool_irq_work(pool), pool->cpu);
> -               }
> -
> +               kick_bh_pool(pool);
>                 return true;
>         }
>

