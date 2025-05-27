Return-Path: <linux-next+bounces-6939-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E3AC4BE7
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 12:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2400189C96B
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 10:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F5E1F8722;
	Tue, 27 May 2025 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deWvU+w8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C1E1D63C0;
	Tue, 27 May 2025 10:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748340200; cv=none; b=JOltZiZjprP4nS5/mbI6lNqD8iDE/1XfzmxxdHMYgcEd9MsvhRiq4QzXQgKcsbNwzHBrMYcMhVKasICBts0dknYfOxTrge+o6mNyjtE4Res0C0oBKg5dca27suDtFAWLfbGZfQGIm1Ypd1ZRQgqdrY6/I1lSgGuj3KGhjZzCQHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748340200; c=relaxed/simple;
	bh=N7s/zNlfZnvcb62ku95UbrsRQHe2RxZlDVfjCFV3oi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MlO2RkQ0D/va8To1985CIJinFzCTSMZBMRuCyT1iUbIXlckMaZSQNLOcWjrnb5TdYB51q36CHltZRljUMlxnH0638LL8zjlTUPX0A99Vf6RyscGQmjkWebIZcG669ePkgA6NuJhgilmaUG2SOlHXyvyOAFAQ3pdd50ZWNFlIh1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deWvU+w8; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30f1bde0399so491294a91.2;
        Tue, 27 May 2025 03:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748340196; x=1748944996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7s/zNlfZnvcb62ku95UbrsRQHe2RxZlDVfjCFV3oi0=;
        b=deWvU+w8FH/WoYErUPtVwetexbwScCvKLLmEkKz/s1zKFPQe5uyWl0Hf912EkE+j/w
         EUATz1hR8k0U6a5kGJGQgCQDcUr7ry/h1SkJ3KWk4vtQ3HD15fRzK3z4TIeNSHp5EGtg
         kTLZrWwRr43aClJnfvBoVVOWW+ct5N2p/ieez3wRdzWOn9V56LquTImYaioIZ6YK30SY
         IkG0D9uFitKjJj7NSPqMJZjutX8tSJc34pQqg/DHXtHks1mIy9+pSue9SZF7/cjpWn+Z
         IBAAsO/KDUycScxXw5Zo0dwENaNuiY0HF3MU24zSBIIoWe98afOsDq6NI4NABrucJRG0
         vUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748340196; x=1748944996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7s/zNlfZnvcb62ku95UbrsRQHe2RxZlDVfjCFV3oi0=;
        b=cpvcdys8jPZFtvLRiN3NKDG7VMGXEJHGSQDzFwVIGY4Y9KRD3DJrQOO0A9fGwNVoo0
         QvfwVePffY5yfsV1pmMRlkK/3I4xAjcUoaJb1hX75eCMMyl9jw/311qcp6IT9LM4pY81
         38kjQavGlmDB16Ih9PGaSLh8Tlk25+yxwtpK4mSjiM0HE2BETXZoA0LrTps8Jizp1Q5c
         UUYuj+kpz5aaP+rX8BxPTAQQEtov+GBc9N2TmDquHHPh7Yys9IEs1YG6ar9qYytBfjqy
         Z0+QfouMXaUnaWlpQQ/uac+VOaGsuIWOZG9uyUWwoXWJsWkjoyEE/7SfkI50FTqAz3PR
         YvBA==
X-Forwarded-Encrypted: i=1; AJvYcCUAfEnUYf2q5X6eZaIrRXk9y9kGMIgdZq1ig8qsrXPSQXZ8WN9smX7vp9Yh+HNwI6wlQQcUWdB8q98Fedc=@vger.kernel.org, AJvYcCWwIb2Hparyk4RNZSH+mTAqbpSWnGfvBiT8ejXV/oxWw+DuPKN9Fv142UbgdmhGyrGL8mZoD/0hkVfEuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/D0hm07LdGXmaR0Ll25bFJI3ceadzkXEeDZ1oECeSXaeucFr
	BUIMatcnI3SgzKHAWf5Uj5VDMnCE480573A8LzFNn/L4Tgj7GtfT88uazGd8zGGio5BCtGcNQBj
	j3MnGqognZlijui90afGyGSHDGWs8jjg0BQcbQUMWlA==
X-Gm-Gg: ASbGncuf4ps1He+zH3UVUBmPnVgqBRD+OsHhARnc/K4H/T4493VL9zG1QZvAi9RRU54
	fYX77YgnfHrbgPGJpna7AI85hCekFJHYLsmgwQUKDueKtJpJx1kOhkU9p7u8t1HYtnDv/fyD2DB
	IMxiW/wEH4r088b/WIBzUvxzd7wNnTPW1/0QG++VZ1K7w=
X-Google-Smtp-Source: AGHT+IEPIq/u4taIawq5xqwkC4StHrnzxeZSAh1GW/jdRY7ozvteC2mcyDegw4nKZONma+w6QdKxrmct4hiNSaTlJAc=
X-Received: by 2002:a17:90b:1b51:b0:2ff:7b41:c3cf with SMTP id
 98e67ed59e1d1-311108a4f4amr7538237a91.4.1748340196317; Tue, 27 May 2025
 03:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527194233.552bf9f5@canb.auug.org.au>
In-Reply-To: <20250527194233.552bf9f5@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 May 2025 12:03:04 +0200
X-Gm-Features: AX0GCFtun3ukeO9dEXScaNFcLEqCDkD4bVsXzZLbwJmHriUHLRmYUArQ6GleKbM
Message-ID: <CANiq72mmVNzWsYByWTVU-Dd5XcrmSLOZbYohqxEjVKL0hEp=4w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 11:42=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> After merging the rust tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> x86_64-linux-gnu-ld: vmlinux.o: in function `kernel::alloc::kvec::tests::=
kunit_rust_wrapper_test_kvec_retain':
> (.text+0x1bd7194): undefined reference to `kunit_unary_assert_format'

Sorry about that -- I did my usual tests (several archs, Rust
versions, etc.), but not an `allmodconfig`. I will take a look.

Cheers,
Miguel

