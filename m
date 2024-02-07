Return-Path: <linux-next+bounces-1038-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4763E84C121
	for <lists+linux-next@lfdr.de>; Wed,  7 Feb 2024 01:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEEE1B21663
	for <lists+linux-next@lfdr.de>; Wed,  7 Feb 2024 00:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD11CDDA3;
	Wed,  7 Feb 2024 00:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TE+lEwt3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598E5DDB3
	for <linux-next@vger.kernel.org>; Wed,  7 Feb 2024 00:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707264140; cv=none; b=pKXrDRdNQn54IOaL/pXyTMQF9FlakXf0/wmMghy+fLCSmOPLf9acDCit3/FOQYh33bNk1E5WV/+FPzic4/u8k1Js+DEjbyDmjEy5A8Yl0oqrC4y4m1QmZsVnKjyAFiCZchEkxgZi6xAD1oevPtifKYRfHebAhMgp/ByMIOEBr+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707264140; c=relaxed/simple;
	bh=Wf2OpmMCOULavbo5BLkQ/DEbQS2tWJTf4yR43Lk5s2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCUrkJaC8gvmESRCk+5HfgMXpgGrSsHUxtkCGHUv2bD7lS5pBQbt1pRCuDehOPWNb73cO1lNAYlJk8ekUpg71u22IQAw69o0ekQlDPBFhYRAI9GfZM1P++qxjOoS9KUCEjsclvOtkfVUm7+Yzx+lVCyPixxk1DaBvbjVYcr0g4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TE+lEwt3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d89f0ab02bso24625ad.1
        for <linux-next@vger.kernel.org>; Tue, 06 Feb 2024 16:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707264139; x=1707868939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RDrFEmGkd14L+4GhZl9Qya5C2cB7LibalHbQm+9F7Q=;
        b=TE+lEwt3WIrxruU/ZJ6gL+Qr7n4gNB5dI9XAqrV7Hdd6C3r+G/emqIZzJ37X6R4Pz4
         bMPrLiFJUvNWKnnSyaJtn1g9JvT+6skvXQ2JUUYiVLLGpt5WQvRYi//VoMZUR78lcFko
         wro/IaQRpr8yNF62XsUwMszfSDwqDCc+gHikOG5ctle76L+I4Gb/kEC8KsuF9mqbXgKO
         KopZnGoadsJtmOp5qROPy1RUbTHZV5M0s+aFfnKjMRzIe46KDGDtamqMYOINdk2ByYXU
         smO8jyZf2nEjAOPGB7mafS8P4Dcts7lmIRXgAfVnMyCUFzg+Q+9BtNTuXMPsoKVasYNY
         IFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707264139; x=1707868939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RDrFEmGkd14L+4GhZl9Qya5C2cB7LibalHbQm+9F7Q=;
        b=oEHlgq1B/X17fModKftRSqtnestpOC5qYOuQhzIQYJ9T+8EzqbFe8g6Vxjtdb38ra9
         Ln5fbC/ZvEYXvbxI8rYwB1bLOVCMpIIEU5HGpWHXQ0Rbzoss3P9hX5F9vjzy0yqER8dl
         5+71cLfnEsmSsWY+9IlBeaSLzwFONlz9dEQdjyOIZ/C8/gISkr/rZaVZWyiBtROtLvIH
         if35oXUKPEGlNPHNg/2a9l4nzYXSSxPyZvdt1tU5k/PfCAsN6wAaE6y5Z7A7DKSnbJxx
         KY8+pVToNcMwCTLaGsmGXuEp/FYuBY28DvFCgBFvr9Nv4c2I1hpDCszUTjZV8775HUlc
         YYBg==
X-Gm-Message-State: AOJu0Ywj6If07Mj4uFsuzsQGH5OUcoaP1qQi0r/8IsgLto+al4PX98ip
	4ObR272XodzAvYYbfBntzBaAzrXqHJxI4SSHgaBjI8CpCc8WbeMQNpn1CoNRU+8N2VU1cBbYE9Z
	FSjq5sQ1KZoLLXvWSIqST8AtIBobmf7T9Fwlm
X-Google-Smtp-Source: AGHT+IF7VZYeQS5XiPR621BeHWSgCgciGgEsShlcSlKzEKua62nKhzxOA2/6oobCH23ppVyj2bAwvWrvv3oc8PCJsQc=
X-Received: by 2002:a17:902:f682:b0:1d9:8e37:56cc with SMTP id
 l2-20020a170902f68200b001d98e3756ccmr10205plg.10.1707264138369; Tue, 06 Feb
 2024 16:02:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207104000.40367799@canb.auug.org.au>
In-Reply-To: <20240207104000.40367799@canb.auug.org.au>
From: Ian Rogers <irogers@google.com>
Date: Tue, 6 Feb 2024 16:02:07 -0800
Message-ID: <CAP-5=fX+u-rNbdSH9z5-NceEh8Txn4OiowpshE5iYzonQYXohw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the perf tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim <namhyung@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 3:40=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> After merging the perf tree, today's linux-next build (native perf)
> failed like this:
>
> arch/powerpc/util/kvm-stat.c: In function 'is_tracepoint_available':
> arch/powerpc/util/kvm-stat.c:117:16: error: 'struct parse_events_error' h=
as no member named 'str'
>   117 |         if (err.str)
>       |                ^
>
> Caused by commit
>
>   fd7b8e8fb20f ("perf parse-events: Print all errors")

Thanks, I sent:
https://lore.kernel.org/lkml/20240206235902.2917395-1-irogers@google.com/
to address this. Fwiw, it is great linux-next is able to spot issues
like this early.

Ian



Ian

> I have used the perf tree from next-20240206 for today.
>
> --
> Cheers,
> Stephen Rothwell

