Return-Path: <linux-next+bounces-9698-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EF7D3AE31
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CFDE30133E6
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 15:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A5B369218;
	Mon, 19 Jan 2026 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB6sWJP0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C889E3644D3
	for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 15:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835078; cv=pass; b=sMRffoEwepv8tGhZKWw5CvWClZnR5ifTiSXH27TPutnJdD8RLvrQHo/HRO7aPsiEZiYrdGfTQK+tHsUSQRoumCX2lypqUD8Voo95QMyGGxIY2et1IiolQVLUDubOyhQwDgpe6FcV5CCrpQjTfPiWlFYoI34oBaVoeZYTY/6itdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835078; c=relaxed/simple;
	bh=W9/ZpavaTlZs4pPAcrZTo1HZTe22ehNdJPE6KqqbHYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmL93aPYIzQxKdSRB9HuzBV1x7IBqSTNNxORBWLUDwVFHaA/fAn6uAnbYIpvBS0QBy18jHrh3zPM7ueK6zCAdMwn2aec9AyE+J3yxQmKge5ZR0rEVhJgIzvoHZ+n73EKxHHGga6GG4+e4TT2ERrMa2uObJKMnQXYSix+mr4tQYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB6sWJP0; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2a44d954c24so191783eec.3
        for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 07:04:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768835076; cv=none;
        d=google.com; s=arc-20240605;
        b=fDh8syI55bKD4BVfiSnni1+DtjYteHa6m4Sr98PoRtx5CbeEdX6m8zRxbybJbJsMm+
         CPe2y0OVkhw8GM4qIhAF3qVGKZGhsgw8R7kf5IeKGiMwX4M1NWe5ttAcRYR/8tkxlO+W
         3mzTHRfJr1RV8Ao14P1c5Uim5a5EVtio7DFpi7Xwa03FBT9LhlZ3be/vRV4F8bNrDq8/
         Q1bE3pxLnCnjTyojN14CFx2nM+SKwDLvJJ6vWx3IdBVUt6swGiHI1gy5K0j9SnfIMXwU
         SHmvFoVihiyiA/6W7fFk6MKYZ6DWapVhuBno0xsJ4WZO7QcUa3bbkwuiYXIfaqoxn/75
         vFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hrJ0ZMKRM0bc2IJAKVBqS3KkPu0UBuiwGZW0wnw7Bic=;
        fh=MqeA5GTbQu/fTHLPY6wnuv1bvwEgpm1rwH3ChJRrhVw=;
        b=fNtDmhfLtVzmoCUoNN/9vzhcj4vbUYtXoCJvYgrRSiB1rdzZZiEICLL3xkck9rbUny
         zqHv/372ExjVOfy9CrsYyg8bYSAMdnBDA6JzPh+iGBYCuR0/RaeRe5wp5nNTi6BJnjp+
         Ko+JClqtv5eF5wKZq6ksEEP4qCXLq8DvWK5o6JmJJ+UXR7aMUZrLY3TSuRVoWPWZTRTf
         ZVxFLWmqEwEpfJWaAuWIRPFSy6CwGtq3rpMTMKTR1WToDeOJDNepVuQAZT/6y8XgOXKb
         wPIgB2hGR45d0LeWDRvugv17nCIPSxxN7rMsWIMXvyDeo0LWwbduLWSIUBY5B/tP8NoW
         JQ1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768835076; x=1769439876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrJ0ZMKRM0bc2IJAKVBqS3KkPu0UBuiwGZW0wnw7Bic=;
        b=OB6sWJP0LKPoGoTM1tN20h4j7sG+HBlEsQ15QvlZs8am6RTBqBPuvvOlO4Ky8GZ4Se
         MuMYXQZSW6YwuDpf+EteKWsFJEMcCk68bo4uFYUBY7TyXKS2hkOfBBsRY73MWMipgVRC
         JYtHeauBx1E9PNfrK+IjvWg8N3dh700y6i20+jKIA2Z1+i69oq03CBkLkAvsiQ14JjiL
         N8cvcuS0I3rMBexGegV2UF0QHkjhBcNolygES5wxtsz1hTPaPyYgdHoIawV+jxuVfDD8
         SScD5/MDYC6IRKnaoVCmAHKR/Pr2OwzwQMMR24ElGX9HFwab18RDmtu9CQytFiRIB6yX
         HKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768835076; x=1769439876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hrJ0ZMKRM0bc2IJAKVBqS3KkPu0UBuiwGZW0wnw7Bic=;
        b=jMFhtWrl4tLU+WEgJ1LJoc5HImt0FeDbyGS0bdrrMspuCuoWmgZOCsLpmwStjIw4+G
         CFD/GUxz//WlCXJ0aRqb87Nac+EQb7VwMgWmY3G15gCiGsPWt9r0yXuiv5zPCGckYPbP
         CVhypvNTbsJ1s5eaCPGrzK8evhcdIfe1EBDX53hiTWJjenZPIQvoCm+uXLLoPjs5amDD
         lxDQGn3E2TxiC0m9XlFWcEU/wYshmg8vq8445ezYAgTJwv+38eQtD5PzOmrhns2MjFdD
         B4bQ2MRCkz6mpvZIv2kl5fWpqAvLpxc7oLcxHYFVxwR2Q7tYTj9/rPbUCc0iDHIXdGwh
         bM9A==
X-Forwarded-Encrypted: i=1; AJvYcCUCEIza1ZxS3H85kzvgCYg7p/oYexCrtvyxP7KA7R9yoJcC1YL4PkseJetCY8VMr0O9jdj8T/K06Esj@vger.kernel.org
X-Gm-Message-State: AOJu0YwvmtpKJ3SgUgYwfYmxDvrTaBoa3mAAWZCB9K1A7jHq+kmQrQzU
	lXWaYbHQTxvJ3HQb8Qvi55ycpfbnMfsqeAOpJ7udWLXTFPd/8PxdRTXJMn58ufvLffSN0/4hpAM
	fDfmvnNUD9ULYShHH3a1rR1dPOud6GbQ=
X-Gm-Gg: AZuq6aKJlZtUXKJXN/MCQJ9uwvaGhE3oBGuQyAxiXv17JuEN7CBv/aZooneuLE3nNke
	yFpc6DY/fIGvFUwGQnm3PQ5nJcGhDPuoudZ3bYM1ajV1JO/XtNxreQyojWF9v2Lmuxa5m1KQnxg
	xk5HUqzVyWacD/N5nzSe3fZrH64f8tdoy2rLpxbCTnjW9o92PgTPNypwz0VgEo3oGPlVzf+Llge
	KCgf75i8BcFxO3/IjGZ66Rv1bRNofitw/Zvm2adyLO1eBVSgEnrtptGisyOEIAzQSTTwCfqs7Yf
	2AliEjbQUvrf9PDul+fuO0P3/NUzVNVtFPhwDnptfwRGz0pF1r9kOTOm5uHwYf452npfUGb9qqR
	KoJUtO1nVgbJ0
X-Received: by 2002:a05:7300:6d1f:b0:2ae:5b01:bf9e with SMTP id
 5a478bee46e88-2b6b4121c10mr4607877eec.9.1768835075712; Mon, 19 Jan 2026
 07:04:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW5GPwfJPrQjm-wC@sirena.org.uk>
In-Reply-To: <aW5GPwfJPrQjm-wC@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 16:04:22 +0100
X-Gm-Features: AZwV_QiyQz5Tu6TU-58o664bgx6gzKyAdGC5rqH2CvLlDV2LhrK4RUr_uVUR6jE
Message-ID: <CANiq72=d-U5HJjCogdYdkFsN1B_rkkc2H6zy7TEtwG4erAG_7A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust-pin-init tree with the
 rust-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 3:57=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> diff --cc scripts/generate_rust_analyzer.py
> index 3b645da90092c,d31d938886589..0000000000000
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py

It seems the diff is empty :)

I assume you kept all the union of the dependencies from both, i.e.
just using the line from 514e4ed2c9da9?

    ["std", "proc_macro", "proc_macro2", "quote", "syn"],

Thanks!

Cheers,
Miguel

