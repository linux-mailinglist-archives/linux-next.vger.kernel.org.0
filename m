Return-Path: <linux-next+bounces-2806-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF59247D6
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 21:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B78E02823C4
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 19:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0843485298;
	Tue,  2 Jul 2024 19:06:37 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF8F82C76;
	Tue,  2 Jul 2024 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719947196; cv=none; b=BQUTPq3svma7EkToDc5Ir4TGCQDmPVf0XIYMtZNXqNxbAITZQt8xlSm9ayH+G0U+EEUP3AxZTVFmdRdjkBvGbf5R5rW96beFuzpWZs33PmfF0VpO6Rd/oy+dvvWdgprPeDBP3Kxu9S6tGDvwaFnrkUxmnP8YgyIe2+riVliKsz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719947196; c=relaxed/simple;
	bh=q7+wG+b9gxlSDc6Eqd0NHJ3CXS6OH3hQTqH6wE7Mkp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbDXxmp517LijcFWZ0f0xV9/dm4BnSiORFI5tkbRhy9Fy0UjwNn3YYewHu4g6na8/NH093KHJQFHa/HN+W52i0CPKqfMdmuKDsLdOS1i5SIiaJoRwUVb8akaaam+ipYF/1dVFz1Jw3UK9mYsNHKnib72TjqIDd9ncVWIkz0ASZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c7dd4586afso3421555a91.2;
        Tue, 02 Jul 2024 12:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719947195; x=1720551995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4l4wrLrwHQUBz/nGXSYnlK3Nzjrs09hIzfvhqYHSUA=;
        b=Ju8YADyB6XVWOoIBR0xfxcr3LsucAZU5+mziN9cUbrPJTlM4uFNd0Qb6XYqCoH0pGX
         xR4EYXLJzmyyeJutBo+Lf8s3MVOF2cIXYiFQMpD36L8bTR6mc3AR8x2ZfF64+RyPlWj4
         zgvEgcMnh/oPnRjbWRecD/IkiAjLEv5bmNEeqMdOOipjWtXI9BxSKIeOpkbkIg89NmbU
         4q556QUTE6vxOU2v4SWZ0ZzEzt02+iLDiKEUnwVOcIY/QxMFGy1v9lp8yUW8Cig6F+kO
         WtE5LjWB1KYkCrCsy36vCZ7h8OXwtRG/lowcWjSnb1gbCzCD5ePUG47uPapJ2XTIjKQh
         0khg==
X-Forwarded-Encrypted: i=1; AJvYcCXafb+tsBbDcVk5UZ2kvtv/FEDHqvAYT/9ndkNc84qzbGZS7upk5Ck5eWS6DDm9cSN/KuMJcOHMlctpLC+WG83ZD5DzsxB05t9Gor/06Zn0Yp+1OtgJVIeNRPenwwA69ewv3URwpVnLRA==
X-Gm-Message-State: AOJu0YxgYBdXEbGY9iWBpv5ag9AUeHOn+WmwyZMl8yHhhEEvtBO2ZLbp
	jnqgu7KBZtoNAlneo40zDJ7LN3IrUFLTf1hG+RZWs+szVKTaBJR8cyML7qdVw0chufORgrQO31R
	Ve2uGvD4igY0TwfbytSpEIdsjaIY=
X-Google-Smtp-Source: AGHT+IEMAdEOjFFQo3J4MszCH6o0T1XFraS1FfYW45SSOkJGwH4YJinD05hQmKO0JmJAvKQ6FA/pDrrPK6SRk/tOlDc=
X-Received: by 2002:a17:90b:4c4a:b0:2c8:6118:11a8 with SMTP id
 98e67ed59e1d1-2c93d785fadmr6855706a91.49.1719947194703; Tue, 02 Jul 2024
 12:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zn8HeRRX3JV2IcxQ@sirena.org.uk>
In-Reply-To: <Zn8HeRRX3JV2IcxQ@sirena.org.uk>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 2 Jul 2024 12:06:23 -0700
Message-ID: <CAM9d7cisEqDuHOS-8CPwCvacREKZWOtGDZ4ucvgaNftWAKwE0A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm-riscv tree with the perf tree
To: Mark Brown <broonie@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Shenlin Liang <liangshenlin@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 28, 2024 at 11:57=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Hi all,
>
> Today's linux-next merge of the kvm-riscv tree got a conflict in:
>
>   tools/perf/arch/riscv/util/Build
>
> between commit:
>
>   e467705a9fb37 ("perf util: Make util its own library")
>
> from the perf tree and commit:
>
>   da7b1b525e972 ("perf kvm/riscv: Port perf kvm stat to RISC-V")
>
> from the kvm-riscv tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the fix, it looks good to me.  I'll remember this
and report to Linus when I send the pull request later.

Thanks,
Namhyung

>
> diff --cc tools/perf/arch/riscv/util/Build
> index 65ec3c66a3754,d72b04f8d32bb..0000000000000
> --- a/tools/perf/arch/riscv/util/Build
> +++ b/tools/perf/arch/riscv/util/Build
> @@@ -1,5 -1,6 +1,6 @@@
>  -perf-y +=3D perf_regs.o
>  -perf-y +=3D header.o
>  +perf-util-y +=3D perf_regs.o
>  +perf-util-y +=3D header.o
>
>  -perf-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
>  -perf-$(CONFIG_DWARF) +=3D dwarf-regs.o
>  -perf-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> ++perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
>  +perf-util-$(CONFIG_DWARF) +=3D dwarf-regs.o
>  +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o

