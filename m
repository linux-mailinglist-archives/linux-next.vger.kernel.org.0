Return-Path: <linux-next+bounces-7915-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F79B2296F
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 15:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37E5B681F61
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 13:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B93D287252;
	Tue, 12 Aug 2025 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="K0THCnpe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67159286D44
	for <linux-next@vger.kernel.org>; Tue, 12 Aug 2025 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006457; cv=none; b=FMwPWCG+CDWyHECF0QWbHNS2nORD90ntMnvBdeKaqQnWOTsgTueoNj1YkYChY/37hwTy6nGAU/MJgYJKhoWbrRub4O3M2Z6Rd9Vlyu4HzJuzgrKsOT/+zhgBbRkd3LdjVtwUBKKd+QnWo8ROLxdc+bg/U7tXFVvm1kRLLmOVu0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006457; c=relaxed/simple;
	bh=ZEQS7dHy4bqa5xEK/OWh6tiW9JpSTnxX7NCQEJRoP3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/MxDyVd+sjIh8bTcLhm0FgdDEV+AjbnhJyfdqGsNpU8kbRyi1nQ+Jcki58j8rFxO2W7xZouY0rghTVCbkDTjXNyyBTtZGeJ3YmGcJvcRSzZL6QhXmWJc6otAMZHQKpMtBWC8Q8mXpEHGOjN34FQGf5hYpsy67Vn2D0VbjPvM3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=K0THCnpe; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b0a2dd3a75so58913701cf.0
        for <linux-next@vger.kernel.org>; Tue, 12 Aug 2025 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1755006454; x=1755611254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiaiHLfj5U8yaY5aeIgIVQg9pcSst1kk2u6M/Lgbw4w=;
        b=K0THCnpeTjOMO+wmtK6BXCJiNqGiOI8E/zYggQPT5DSu/DlHxQylnBcBWtAujk1D8I
         IdRRq7AK0to8H5ZxTlXUo9Og85GnOdqb5eUXv0/u4FZL1eiORkLaoQqpzYqHImicS2O5
         iIzYxIKTWl4Py9CFJcnK27fyl8Po+OERdIbufRP7fru/9fCyR13XnRCXJHGl2gmKR8t8
         dRKQVst+PEfSiFNwgAjXZk5XaXBRrZR6/gvLokiX60z8fKHTqmM6tY4OdIttClwQEJ6v
         qaSLzjdgu0/vLz7wcdutWb0JCH7SjJQCuDSwzm5lYrLtpAizlZ9DFHS3vEUHdPfjZHmc
         uV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755006454; x=1755611254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiaiHLfj5U8yaY5aeIgIVQg9pcSst1kk2u6M/Lgbw4w=;
        b=Db8EcFgBs/BszWxbj0J1+5ZxglC8PLoB5+qqwUBlzvz/a3qYx3gqrEcAIQXG+QrIyZ
         E/w8bYruh4zFRnomK4Hkl89DwuirVjGxo2G774W4AHnAlGP0f1dV2D0w6WaVXkpx+4aw
         rFp1OZNG4ljw7Usj5OUxdTI3NTUpsv0kjEDQ3J8yv8FQ18k5BGEFYrDa2GAs5BeAXfJ/
         rgUeE4ZGuMNTM5IuzrlqxGp82OzFObA11Y0X5b3GeRrvTyQvkXqZHzt6bLBi8/cEHIKx
         Ix1U/0IGG7wtrcrPNZ/bFsY86sy/5TVy0Ds4wZaTEsWEqhgQb5Upi5ftqv3kMhsyI4VH
         XcrA==
X-Forwarded-Encrypted: i=1; AJvYcCVfZS55bz6jvw7fGi9BebHyU/jEp8wnYf0aBqBhli1SPVLIjamwm4fkTig25AW+poQ4ooZV6AjL3Nle@vger.kernel.org
X-Gm-Message-State: AOJu0YykJF2kK2xneWqqhKqaMomH2iFwPt+bQG3pL2qWkloqhfigbqFU
	FJPHEc2s0fpfl2VCXkhJOVBduXObnfm1pRniZCNKUiWtvx1BryLQJUE4Q2GZ+Z54J1fDpneHQF/
	w0WyE5h/gGODvNDJr/P2Ya6LrrwtKmxzjCTiWfkMjmA==
X-Gm-Gg: ASbGncvCghMMbiBp3C5ASJgeLumyzKTuKepwjQXkqg69z2KUPYjL+nXaWODTxLf9MyE
	GFAvROLR7QEmeqEvBuV5uw93ohiqXMx47GZUde9Nrpk7kktv9XXKR/SAerKGxEx3OboUBMqzdIB
	g3wELG8GqmZGppuD8xrlv3KypMoOYDj3kilpkbOnaxXgGbrfb5XX2+/rXdK3GvsVRxxbg/0mqRg
	gPd
X-Google-Smtp-Source: AGHT+IF9FZQj5pw4nHAwLVl/go1Y++Pq0B8DDhdGaT/iuEWOeTWwC7Lzx4CQw7oh7nPUzVFMmTtXLbUtj63G3OrsETo=
X-Received: by 2002:a05:622a:230d:b0:4b0:a098:1f75 with SMTP id
 d75a77b69052e-4b0ecbb0bc3mr37690691cf.8.1755006454033; Tue, 12 Aug 2025
 06:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812164436.557c805f@canb.auug.org.au>
In-Reply-To: <20250812164436.557c805f@canb.auug.org.au>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 12 Aug 2025 13:46:57 +0000
X-Gm-Features: Ac12FXzdOr9gxDZaTKBaBDu-lCxDswcINL4uysL5NReZ5kaQL2LOxR3gFpp4Bto
Message-ID: <CA+CK2bA=thKfEuiFZ-Nmr1ZNALC7ZcKv5uPVy2RCgc-Jy96Now@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the mm-hotfixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 6:44=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> In commit
>
>   25ee3c404f35 ("kho: mm: don't allow deferred struct page with KHO")
>
> Fixes tag
>
>   Fixes: 990a950fe8fd ("kexec: add config option for KHO")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: 4e1d010e3bda ("kexec: add config option for KHO")

Yes, this is the correct one. Thank you!

Andrew, do you want me to send a new patch version to update the commit log=
?

Pasha

>
> --
> Cheers,
> Stephen Rothwell

