Return-Path: <linux-next+bounces-1723-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E30F88B75A
	for <lists+linux-next@lfdr.de>; Tue, 26 Mar 2024 03:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6F721F3F9A7
	for <lists+linux-next@lfdr.de>; Tue, 26 Mar 2024 02:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C91256B66;
	Tue, 26 Mar 2024 02:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hMKZIuKS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149C31CAA5
	for <linux-next@vger.kernel.org>; Tue, 26 Mar 2024 02:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711419727; cv=none; b=NFgv2FF53BHw6APH3sUdz/s3cbva1ZDfXJC2JpTUDTsYx6pIV+u02F/pU6TvKGycoFIsmi3WOdP/Ddr89ZgKytPu356pkk95gnun/dYpt3eXPBEPP0H82bErT0MvmoqqIzlpSOhpYThPrLhe+v5z1SjapnfhGMo63iqWGcnWs5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711419727; c=relaxed/simple;
	bh=oWW3styOUA5P0B+ryLw+EUTBtxFvFF46PeCkmDW7XT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtCbwb+5Q2K8SaaRqI8YY5JC4F/pT1b5p7dv2ec4qV4wKbkU9/l1JIuZFg8lZkPm3yeX2lDhcu7MgoXC8cm4n4rXT0vgtCSyt6fvejs4au1MtsmGOFRffytPgwB7y9i2LuTBpFLTIDPAQriJRFF8FKrgkqGsmapY/iGVCNWSU5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hMKZIuKS; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so5053242276.3
        for <linux-next@vger.kernel.org>; Mon, 25 Mar 2024 19:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711419725; x=1712024525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTPjE88Kmtvbu12Qel97M6QMO/75XMfszQTW3mH8I1g=;
        b=hMKZIuKSvfvEYKmO5+38+4qx/Ol9OMjVu8F5+1uvLirxpdPZ+nfS/Pf76ovEGfTyDf
         ZDwLiDgi2Cxig7ZYc/tvAvDA8tFVNm1k884U8VOuSDwqYPieQyuPcgRlZWiG1kCKXqoR
         Txr2WVX79R5Fn5S4KegGDv34AsTQ0BCuodWlUIcDfQ8epLDfuuCsTzljdsXbmGXrsQnD
         2xyuWxeAXHs4deaVZ9y+lrBtZ8pO9hHZKtzwvow7zIjAhRwptsMVjZksovcQhsRZByhZ
         I3FyvE3yynXYrNBkpmtzll+4P4MbSo3o7pn8ukvb+6V1yHiPM6Qo+3pINLMGkRFsKnPG
         2Sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711419725; x=1712024525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTPjE88Kmtvbu12Qel97M6QMO/75XMfszQTW3mH8I1g=;
        b=EDTsPYiH+kr9NfcyvCZqptG+RvcOtz+r+Vq1trCLq4VKeNqY0ic72KThdAjzsGwsP5
         dEt4YwYdmm71wEYCuPemsHLq5g1Rzo1EfMTYSkDb+ul/iIMUpsgw7JYRDcaPpRh055Tg
         FDU08lMwi2H59DWkBDCrsz0AABgtkEgBSftp3cZSxPhzyutKpS/yVke4IMe4wq6htu0u
         HuTLQggyz8Qxleaw22SugjXang0jG8prrOWf03nnVxLNBiZoLgyJ8fIbWCp5U4EH7TAa
         vRcKGjiBfv5ZKpPLVcQ0G0p4HIumpuT8ds+YMJbAgfsZtNoA6KBGSEwbR5IBtt/PSTSg
         8yPA==
X-Forwarded-Encrypted: i=1; AJvYcCVaBXmypRedzmZ3uiKPo28YeVEscZLJGLxSAH4sFRwfO1GXprnrSNv+5iu70xRCJHGLgmxbEYGdvMjXlBWmBBFMv8FDpc5tJR5UjA==
X-Gm-Message-State: AOJu0YxyjIQzEY2d7g/ygL2ccPVlNUs3xu/k8ANNn663FAAKqvF/4l/L
	XGmBultt+XUyzU+mCCIvblI/SyeF3TNLwpOco8qSqqhvJmvofelhKEDGqj7r+C48+J3Zt1iZvNM
	tq8K29xUCN0Q3uLjZf3frpjHqUk8VDIjLiLxll4cAd602EwbvyQ==
X-Google-Smtp-Source: AGHT+IHSoMSpNTzqMHCg5QsTwg1AefarF5WUToxGdaGVWfeb9A/dyetvKDSoRHbIs+FmF+hPpehXodJ2+ajME1xY9ac=
X-Received: by 2002:a25:aa0a:0:b0:dd1:48cf:5c8 with SMTP id
 s10-20020a25aa0a000000b00dd148cf05c8mr6479203ybi.2.1711419724858; Mon, 25 Mar
 2024 19:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325122504.6f46a5ae@canb.auug.org.au>
In-Reply-To: <20240325122504.6f46a5ae@canb.auug.org.au>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 25 Mar 2024 19:21:54 -0700
Message-ID: <CAJuCfpEHdrrym1gGHj6imzNccRYfCLH1JMaJ_ZWSkv-U5U7xOw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 24, 2024 at 6:25=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
>
> Documentation/filesystems/proc.rst:958: WARNING: Title underline too shor=
t.
>
> allocinfo
> ~~~~~~~
>
> Introduced by commit
>
>   d08b311b6d49 ("lib: add allocation tagging support for memory allocatio=
n profiling")
>
> from the mm-unstable branch of the mm tree.

Thanks! I'll post a fix shortly.

>
> --
> Cheers,
> Stephen Rothwell

