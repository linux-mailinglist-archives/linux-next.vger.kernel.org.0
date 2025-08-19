Return-Path: <linux-next+bounces-7993-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52691B2B67C
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 03:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 370C42A5200
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 01:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1180F253F07;
	Tue, 19 Aug 2025 01:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQrfUWVn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FCE189F20;
	Tue, 19 Aug 2025 01:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755568528; cv=none; b=uQpadmhzA5xApRJh1fPcGjAKsIKGgRkmq1iOf8zyBbQGrFIhLbtMWA6iRqEP2EzgpMM9mbUwWiBVDZGt0ogxYy+wwHAHNd1LpnIAva1bqPW7NxKPGpxlNi6DqZBdzlaZb0ly3/IxdCXHEasAKKJ7V16nTWRcE06y7VOVUPBZt+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755568528; c=relaxed/simple;
	bh=Uf2bdUQcXQiZlTnVrcqxrv3L8hzz9TVV2kJhByOpdG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOFKOJ3ihMVRrrfRC0hzypC2GmXj+PBoMWc2eQEU/9cYzNjQ17cnpMaw3/JhMD0j/5tKu5ytGb/H8kS5Vzz33Hzg8Il8H6C5U9nAOcRlrRUCTz+CRn7c+U+kWwedaU88I4vWAmqLcf9lXybqFNKQzBaiXAbjzDsxzbv4sDQQr9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQrfUWVn; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-30cceb749d7so1747563fac.2;
        Mon, 18 Aug 2025 18:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755568526; x=1756173326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJMJ6dacuQcrTuefoos/aVqFZnvM2uVx8FeqZ0y9N2s=;
        b=MQrfUWVnRdvWc0vnqZxcpBb9GYhrVeHZmPIcVBNk4rEGJCaGUKmDlqcNCl2byWaIhw
         ezcEZ04NXPvwRLodhucmgQaYFXYplMalAZJa/eELIDESoopoFzgdUYU6iH1dRm0FJox7
         eQ+CDPIC8KG59ofntj+lZAPi3hJeBmXH7NLgRxaZHO4ZQqf8bqD7S3J2PtX6SjMAtuKN
         7gwMq+lYWZ7EPSlEk3eEmn6mW27YqAqMyXq4llOVBqa5fg1h1rMUWyX8gvWfE8nkGWVS
         EzxazrHbVXp/tYzBip63wnCyGzjyG3vh1ViPgOiEBuuXssYFoGeMlqeMcLUofr4qCed/
         QBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755568526; x=1756173326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJMJ6dacuQcrTuefoos/aVqFZnvM2uVx8FeqZ0y9N2s=;
        b=IlisL2mM4YbFB3EbxCbiJIs8tj7qDepXmOp4UEJotxTLRHW8ARUlC7Z6fuZEKQnCJU
         LBCwW8zUkE/JtgSIxVtf4dcGKwqawYUbTyihKxwyifmMM19qTXjtNLd41cFR6Oem+Ndo
         hTASa83/f+pI3BdxtsyL8GYn8OHpn/Smizd21s2wgikr3enrizFazJtho0J5/f4b0fpv
         UupuUXv3MAiXO66OGDHHnH4MkZNWokG559FAoTCy0FFSKmXh7PJNy0cjWUMzXAAH9SZ/
         ROkbAJ+RddWZH36eSwB70AlAoBLx3RGpC7iBIaP04SdYxv2OmgOmJjAQO9E43bS52LgD
         buPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfn2SwtTFNe6oAzzmwUj/8r3VUFV/nAFveJjCX3p9jfyaL1DaFfQ0mjQt3YxR8hlDS83aEiuujuSFdmx0=@vger.kernel.org, AJvYcCVa2XX18D4BdzsDvJ4wRGk1cBOvkfqPyqrgJLlNl2uAsaKh6UvzqUu/Aa1axRP7XA3eTTKXQXAlMH2NMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDiNyYGTMQBb2DIYKmQngmUXygEAsqxw7VWVx6+RnhRERgAoS
	cZ3veaJrz2S/6MAv6sw18Ju72LlShZwIiKnZGJTxXGPyWtDWQPoFvtR1DLgrmkYBaVhCnISUNY8
	efFeMS3XDyjjUpOuTjCYBbVfw2VnvDcA=
X-Gm-Gg: ASbGnctRbXsxpH9tSjaWGCleirk85tQfyqnOC4zI5P8i663MTTy9DxbZONRELlwnin4
	16vIAy9l8bBaaD6EFvwsngoCW0BWYFsipSrVSTC5Spuh4FzyYisQl6niWcmIcimz1haSo8DU2sz
	8MZyPz+bApci6jeLUMsBX4ewt5tDM7S8QEl0omAFfa7lMsDi1KRVv2LmabUDD1WRsIQCjUMu6pg
	pyJ
X-Google-Smtp-Source: AGHT+IEO+KH8ZfH+LTyyIj3zt8ZkwEiy6/g5gQG3r1Dn1OhX5oCHAE4TxoblHW20tB2/dLHNsnVeSNAfinTa8fydVuM=
X-Received: by 2002:a05:6870:cc81:b0:30b:522a:71af with SMTP id
 586e51a60fabf-3110c21c5efmr674613fac.20.1755568525677; Mon, 18 Aug 2025
 18:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819072328.509608a3@canb.auug.org.au> <CABFDxMHSkmH3LLmZYZN6-Ymj+yRNoaA3=9zg=4P7ZrOxrBs8bg@mail.gmail.com>
 <20250818181437.318ed154f87f98946203a993@linux-foundation.org>
In-Reply-To: <20250818181437.318ed154f87f98946203a993@linux-foundation.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 19 Aug 2025 10:55:13 +0900
X-Gm-Features: Ac12FXw6eEpBVkXdyhn0dm9bQwQNxBAEeiBUISKV1OcO6FPaLi0kukAbg0c5fpM
Message-ID: <CABFDxMFpzS9ynd7OsJWdKwZD-kW0-nu9=HhoFUmiOm5Jkz_QzQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the mm-unstable tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 10:14=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Tue, 19 Aug 2025 09:59:20 +0900 Sang-Heon Jeon <ekffu200098@gmail.com>=
 wrote:
>
> > > has these problem(s):
> > >
> > >   - Target SHA1 does not exist
> > >
> > > Maybe you meant
> > >
> > > Fixes: a0b60d083fb6 ("selftests/damon: test no-op commit broke DAMON =
status")
> >
> > You're right. I think it might be changed at the point rc1 -> rc2 on
> > the mm tree.
> > Is there anything I can do? Or maybe Andrew can help?
> >
> > I didn't mean to bother you guys.  Also, original patch is from here [1=
]
> >
> > [1] https://lore.kernel.org/all/20250816014033.190451-1-ekffu200098@gma=
il.com/
>
> I deleted the Fixes: tag.  The quilt filename
> selftests-damon-test-no-op-commit-broke-damon-status-fix.patch means
> "this will be folded into
> selftests-damon-test-no-op-commit-broke-damon-status.patch"

Thank you, andrew

Best Regards
Sang-Heon Jeon

