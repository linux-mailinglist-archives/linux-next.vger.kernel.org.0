Return-Path: <linux-next+bounces-3976-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D43986EB5
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 10:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AB59280FB6
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 08:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA9C1A4B71;
	Thu, 26 Sep 2024 08:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bt0ziwDs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1071719F123;
	Thu, 26 Sep 2024 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727339066; cv=none; b=Qbw55fjjtmVvUpnJHvRf48XfHV+IgU1F2HbwwDVzzw596BObDR29PRtZgAiwVCPWZUDlHm3wMPQa2GiFXiXe51pynU6fl+Xpju308i9ka/HShNO1whR8OGzQDFY1l2U43C07t4jqm2XARVpPKEbBXEv0/ieo7+YEXs43qyZ0RRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727339066; c=relaxed/simple;
	bh=/Z2XIG86WdY+jEgqJgqZCAMogLmoLb2+X5zN5NeXU+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNPCgLvcTaXahXst58qk8a46WouMQLy+pM8Hgw/tu8k3Ky0VVuqEu7Jwklhmo9VB3MueoV13Fy/VlvGkvTVCr3vEkDVmJXLLT5FT86QGXNtCGbzsZQYdyqb60Y3BmP0JlB0S40GUUaA7EEujGjEO1qA32P7GLHxiPV6YRFEEBC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bt0ziwDs; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e0a4eebdcfso44496a91.0;
        Thu, 26 Sep 2024 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727339064; x=1727943864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Agw4mfcYu0+felgqBCno2VGLAfNAP2sDrnMAdk9QiyA=;
        b=Bt0ziwDsxoSvr/KEs7a+sGVgpi2F74+m5NZzlu47AoK0ffmWS+LU2bKeZ2wfz7FICr
         lNOcotj3aiAIwOdMxuu3vmVXJ28N6LbUfpE/awmYQK2VnbaLKNxVmad433dP07625k7g
         /WiRLo4nhvDf6rmsEIsK5IXHVkhtenGzGe6XnbxpHEjZLCdQN6D7j2n0CYbWi7mozgkj
         IPHcumD1gTuVoz8XxOqIIvwSOS6Gr7bxOTnjLNMU/imHXrng966SrDRsGyyt5HwHE57Q
         vXr7qeT/qUH1wQSeBqgRMuYhhWLZO0L0lbE0N4DwJFAe1h8q0JXNP6ihmKAZkjpIcSy2
         AkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727339064; x=1727943864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Agw4mfcYu0+felgqBCno2VGLAfNAP2sDrnMAdk9QiyA=;
        b=Nnzj4ry+tD2fwHQqXpQ7NNSre4XDCXmhQZGjvbPVPiQKceh7616w2IP8DudQKNVNIe
         uEOLVsgneeMHpvmbmI9pRLp8t+xBOVdnnwLW+i53qDiyA3gZPrVpnWIAtguFcVUSJElf
         Eli1D3L73ygUR2/LFSx9nyo1fTUtO1KBJNc0AZrob3ZgT3VerumzoIDrU/+NL+p5NpHg
         UmKLGN6p7fHFEFdv4Vits4oI3c0MkjMA6SKIncAbzqzjGP++WNnkjGq+PhCc+OZ09OwN
         4YDIdDgKgexEgf/+4UgR8xChbxXd3Hk/m7XwkCCAEJ6mgqp4f3UJH1S6Utr+s9eb0j/A
         7nNg==
X-Forwarded-Encrypted: i=1; AJvYcCUq2nWsX3muimgBnETK/z72U4ORmj7vE9BZPsYvLznhX7itis0dn7vdnMKcgiVz2aoNRVeU5azK7ivDpA==@vger.kernel.org, AJvYcCVG12Ul00rHZ5ZJ3NkpQSiidoGXHP3P2G3zPsE/HFTJ7nfezbtmZK35Q7OUe+piKymRIhHPzyCc/o+M+Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHUy57ij6U6gy/R1uxIAgL3nhst/VlwDvu6Kvs8mpXud49PtW9
	K1P091cajX07dccxCwtJ4qNAMVfdB3q1xksbZUKQIUD25xK411GGnNIHQQVMZwrQWVeYdWgviQ6
	409LPJRbQSMpm+/49O1EdSHk5STc=
X-Google-Smtp-Source: AGHT+IGN5a2LjedSz/nV25OOsTamVwRf6epN8mrSZq263ZT0rjnM/n7nBjLzueNprcFSVf79mIDhHgqRY74DdBkDVn8=
X-Received: by 2002:a05:6a21:6d82:b0:1c6:bed1:bbd0 with SMTP id
 adf61e73a8af0-1d4bed1b9dfmr3876946637.0.1727339064378; Thu, 26 Sep 2024
 01:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926100434.45d58861@canb.auug.org.au> <CAH5fLgjRVZA3Gmb7Ogs+Y65T38EpNVeVEqmg93ZB4dn0Y7J3aA@mail.gmail.com>
 <20240926181348.3965b040@canb.auug.org.au>
In-Reply-To: <20240926181348.3965b040@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 10:24:10 +0200
Message-ID: <CANiq72kFH125Pk6K-JaswWDFmcvtP2GKx2-3ZAULF4PmpW7M-w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alice Ryhl <aliceryhl@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Gatlin Newhouse <gatlin.newhouse@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 10:13=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Thanks.  I will replace the reverts in my fixes tree with that until it
> is applied to Linus' tree.

Thanks! I will apply it to rust-fixes now, so in principle you will
get it through that branch for tomorrow, in case it helps.

Cheers,
Miguel

