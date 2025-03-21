Return-Path: <linux-next+bounces-5925-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377C0A6B66A
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 09:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63CF03BD9CA
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 08:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C9D1F03D4;
	Fri, 21 Mar 2025 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NDMx7gzo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069681EFFB9
	for <linux-next@vger.kernel.org>; Fri, 21 Mar 2025 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742547217; cv=none; b=niww0G2eec397UzgH6gddvOZlsOQ5aCFuB8Xe96vYPyYhxnT02hJlKXewvNtVLx+SiV5pwCxpSiAvCOFXvdBqbBIfScLNHS++16ypuRCQ5WDVEOAD79B24n32k4JlgSvTREox/LW+csaQfoKvnnzLhucAUSoUo1IrgmzjU1V/NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742547217; c=relaxed/simple;
	bh=vIw+xo/RVlg0K7NewC2ds9CYeI22kvETCWi6z+XQAyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGb28KuoxH1sTM4XrypGEuLPYak96W0w0BCoLoOWIIxZeypReVBGJpaSGMUlspqTkVe8hBLNsatDO+fmUKgl4u+qRlW52EjBk9ld2FpMulllJ2/IjBAzuEux1x6Qg9PA5xzoohZzX3yuCZFqAadFfF5xJVtB4hse2L32SdCVG+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NDMx7gzo; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-700b17551cdso14937657b3.0
        for <linux-next@vger.kernel.org>; Fri, 21 Mar 2025 01:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742547215; x=1743152015; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rgcCLbhKsmIYAOgp/Js66iyzZCDf/tFpLepP96oubhU=;
        b=NDMx7gzoF2arimACgLXmWu/4aMLGWSlQ6LK8NNwmbWSyPeWAvl6qFUFAsh6Zg3WzOB
         By2XV12XUyegTE/TwGoKP7kYEyKuKdZPkDC5+1zTKL4JwbTR+WDSPxSS4TSR6079kEGE
         ZF7vaIknVYipfeheJUZj7rDp804VRPz2HWVg3Clt/H5ZJVpZR+Zvv5HLxd5CFxYVVvyD
         4+SYg4UpJVJF6JdqTUuEEroH1cEY3SasXx35s1Nlrhz13neY5wLV1qhNA4CJnJt3cuNd
         EjAX8BGGzrhC23eyHZXEkEr2by5RbF6NA8owH8B+KcuM+WTOv3Ay+3ZqNfYZcZKxG/db
         9eDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742547215; x=1743152015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgcCLbhKsmIYAOgp/Js66iyzZCDf/tFpLepP96oubhU=;
        b=pnx4GlCon/cm70b9BfoJwF9FLFUxw6VFtRDKj8LPXKoZfG/d0tI1IVX848qGm3NnrT
         g0cTliLndaPyFaXiLBenzMXHyMkXOX92KtjvjMhevx/H3vgex7hsdwlY1c+PdHhxl/Gs
         SkprG2O10AqSETygHfi7/jS27O9+uh+EfuIETG61HmdQwNB6LSZqUApbM6Nsgp0K0Fjg
         pXhqCh/OmSIowf377aGYbp5kX3Ygcz34Uo8bb3j6fFfAGWEkONumsnpq8a4Z2tADa2cC
         vk6GZXrQfdcKma+ZmncP9N9bJDec9Hm9Smi7W3h0suLQViT1ZzC6gg9cujgGXmzD2ssE
         KGGg==
X-Forwarded-Encrypted: i=1; AJvYcCVZwrBQtf28nwKZJDeJNbwa8TeyGqGYRgWble5cvWiYAwCq5HTpNavS/vJT53OtYTC4HofBkMmWQpa6@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUXUxvU/eW2rGZC13dGy70CRQdLMzZrrZ/vxOVMW3Ncr8sJjt
	pj8x3fz9V53OYmAeqRBkPPqbcxoP+cbEGSllI7TKj4nGVGx3BMHSbICZU1HMcZ2u+KLjKOaOPao
	asH2QCAcXsb1fbr5IqzndGyBUmLfykMozU1m/dQ==
X-Gm-Gg: ASbGncv/lC10gd+we1rsYjy7Fm7P+HEEEzQg/imLgeGSF8KpGf8IwyfGObj7lvuzQSr
	U7eusdCymiu72AUexie3T309u1qPC0JWOvxSVwIxQQvWCJHm40qif0egRq3EDHb6gO43vlIVpER
	yq+fHJS6abJqiQvLUil/iNE/eL8X32yMZCtbQQ/L99HYLE/dtCohVID5x5Wkg=
X-Google-Smtp-Source: AGHT+IGIA5O54XjDs3NqQwJeGdMi36x/C9LukWoKZoxYY9+RYJ4sWd1HYzkWqNeyhwHHu+idCoD8F4Fq7IsvO+NBSkE=
X-Received: by 2002:a05:690c:67c6:b0:6fb:9c08:4980 with SMTP id
 00721157ae682-700bacd6ac1mr34010717b3.27.1742547214831; Fri, 21 Mar 2025
 01:53:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321080918.1f8b90c4@canb.auug.org.au> <PH7PR16MB6196A1D9A7043FE4E69D8AFAE5DB2@PH7PR16MB6196.namprd16.prod.outlook.com>
 <PH7PR16MB6196B4BE63D7ED4D91E66BD3E5DB2@PH7PR16MB6196.namprd16.prod.outlook.com>
In-Reply-To: <PH7PR16MB6196B4BE63D7ED4D91E66BD3E5DB2@PH7PR16MB6196.namprd16.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 21 Mar 2025 09:52:57 +0100
X-Gm-Features: AQ5f1Joyy04hP5ZqLNHiPsqFX5pzDqdwo1UJMfxtCqFw2cJyFhvslvysOB8BsFc
Message-ID: <CAPDyKFoMZbr+CDf0LeyQ_WxpTW=b_gGp5q8y-PPo+0MBNnyJJQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the mmc tree
To: Avri Altman <Avri.Altman@sandisk.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Mar 2025 at 08:33, Avri Altman <Avri.Altman@sandisk.com> wrote:
>
> > > Hi all,
> > >
> > > In commit
> > >
> > >   79055e47336e ("mmc: core: Remove redundant null check")
> > >
> > > Fixes tag
> > >
> > >   Fixes: 737d220bb2be ("mmc: core: Add open-ended Ext memory
> > > addressing")
> > >
> > > has these problem(s):
> > >
> > >   - Target SHA1 does not exist
> > I was using Ulf's for/next branch, as I always do, and their the sha1 is
> > 737d220bb2be.
> > Should I be using different tree/branch ?
> I apologize.  Looks like 403a0293f1c2 does exist and presumably point to the same commit (impossible):
>
> commit 737d220bb2bef9efd43267c757faff003533b631
> Author: Avri Altman <avri.altman@wdc.com>
> Date:   Sun Oct 6 08:11:42 2024 +0300
>
>     mmc: core: Add open-ended Ext memory addressing
>
> commit 403a0293f1c230524e0185b31f69c02a6aed12c7
> Author: Avri Altman <avri.altman@wdc.com>
> Date:   Sun Oct 6 08:11:42 2024 +0300
>
>     mmc: core: Add open-ended Ext memory addressing
>
> I guess something in the metadata is different.

Sometimes I am re-basing my tree, so I am guessing the sha is from an
old tree/branch.

Anway I have moved to use 403a0293f1c2 as that should be the correct one.

[...]

Kind regards
Uffe

