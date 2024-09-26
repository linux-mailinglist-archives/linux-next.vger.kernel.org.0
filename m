Return-Path: <linux-next+bounces-3974-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94204986DD0
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 09:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BEB2282134
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 07:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210CE18D64C;
	Thu, 26 Sep 2024 07:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PVP76Dn9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B12A188CCB
	for <linux-next@vger.kernel.org>; Thu, 26 Sep 2024 07:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336233; cv=none; b=EsTjp4tcAREfGsFxZRMo1UeUU4t446AaXi5NUf8wuW+r+OVxbLNYOBORhh2lr/L1KUFDjGUZuJ1GqES1+DAwTjslJNIeftNT/74DFn5SIfKA96b7lD4h09Y70377QmbUUbs0QBDQOeOP3U1o8Jwb934mOZVAI5nchdyp+f1Jy6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336233; c=relaxed/simple;
	bh=RcJnQ+Va5uwmY18u8gGASnzZoDfDfKh1hWxTp5ixJf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pnie5zROrVWBDW/VLcDD9eiLUT2eM4RPTO61kvIod8MYWNPLFmy520ecwTa3iH2b+DAncyEo4CIjbgcpDvHSVdTpTsMzqTFeefJCxN3Nhj3wGptmYatRHGOk5v69sZjyWCZBZVlOnFn5oB+r6naRkitxOPmH/THcrZR4bA+hCLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PVP76Dn9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37cccbae21fso432408f8f.1
        for <linux-next@vger.kernel.org>; Thu, 26 Sep 2024 00:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727336230; x=1727941030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2I9Hl869UwdNpovhua6T4gls+nQCdHFTpbD5sHKSYF0=;
        b=PVP76Dn9hkYIyC+gb3pFBv2XrjW8NgpdFggQdECWF6DuHvp8d4fGHSBVFft3Ac6CiK
         UdsXeH5aO60W+qYwoCBDcGtwzW1E1whEbphKW1lvPPhyKHQwjrZhoDDf1CbjM6mAH2/y
         ek/GpIrX4JUGSWC3DETUiVEicmByD0uWKcwuHuaGkZLX2OjSm86ua9s9DmPSDD6LCUoe
         hgEaV57vadSC0uExgDEKgMeRfTRAioHmy5R6HEQ68VBNPsd63nJ5DaL7P5IySMXTZNT3
         ieUvTAO+Ry8NptPKQefgGHpjww1/cXLZgB/eiGIe/Q3XiYRzDKb24xV0cJGnCrchc5SF
         nDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727336230; x=1727941030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I9Hl869UwdNpovhua6T4gls+nQCdHFTpbD5sHKSYF0=;
        b=fOInQs5/iVRUvtjnOMADQ0/Ivq9c+ft8ieAAXMlOFnVl8a1d4c4nbTPxjp5SAb60EG
         NWKzgEjtVcThiBXxHBXSo9nePj8PBriyQPeW8jKyIsopECMav/vhS67aPDaoOPdkxKru
         h7d2KCaW60VXo10glcfIBl1deUWtV4afJh+06lana2R0UT2//bp/l7RfH+vxq10N5Fhl
         WVm+WMxQSsi7wIjBZHTZaVoZVuPDh2yJKKtstGrMDkxR6q3EhLf0zMZIAPWIqYTMVHoy
         jr50mPgqbvtiPM2o+u/qcHWUIqG+CQ/iBU6eFATc6rilfQuwRbTx7OkHxt3LbdBF+3my
         mWcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCHYymB3QGlPfe7gcQr2TPj3P5/jiRNCpdn2EcXEtD/cvZMc+BcZpevxTMieCa8y5UEJeINQYw57E0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0rQdwqMUywUDS6RpV/81uJH27nnGH7XBtZ1auJnLYErAhS5hG
	T9E8ix3KbdrflaO7c/wGbaAAhVBZwlfwngDaZjWreiLmDWuPcFXGvVFNH+B5/tYcE0HWYWMB0WG
	XCMwzkJ4btKZXNXDPC6Nf2ZikQTZ0WwMf+Q15
X-Google-Smtp-Source: AGHT+IH1i/L0nwR6E6SaZHg+ypnhlwAc+VfMZ2FIAxoi5eLy8L12CAFApWZvarpZ20fJGmLmh7L8pvSMaNUU1KWbH9s=
X-Received: by 2002:adf:e50f:0:b0:37c:d001:856d with SMTP id
 ffacd0b85a97d-37cd00186bbmr655739f8f.42.1727336229528; Thu, 26 Sep 2024
 00:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926100434.45d58861@canb.auug.org.au>
In-Reply-To: <20240926100434.45d58861@canb.auug.org.au>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Sep 2024 09:36:56 +0200
Message-ID: <CAH5fLgjRVZA3Gmb7Ogs+Y65T38EpNVeVEqmg93ZB4dn0Y7J3aA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Gatlin Newhouse <gatlin.newhouse@gmail.com>, 
	Kees Cook <kees@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 2:04=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging Linus' tree, today's linux-next build (x86_64
> allmodconfig) failed (very quickly) like this:
>
> error: unknown unstable option: `patchable-function-entry`
>
> Presumably exposed by commit
>
>   1f9c4a996756 ("Kbuild: make MODVERSIONS support depend on not being a c=
ompile test build")
>
> Which allowed the rust parts of the build to happen in my x86_64
> allmodconfig build.
>
> This is a cross build on a PowerPC LE host.
>
> $ rustc --version
> rustc 1.80.1
> $ x86_64-linux-gnu-gcc --version
> x86_64-linux-gnu-gcc (Debian 14.2.0-1) 14.2.0
>
> I have reverted these commits for today:
>
>   a2f115470520 ("kasan: rust: Add KASAN smoke test via UAF")
>   e3117404b411 ("kbuild: rust: Enable KASAN support")
>   f64e2f3a66e3 ("rust: kasan: Rust does not support KHWASAN")
>   c42297438aee ("kbuild: rust: Define probing macros for rustc")
>   cc1d98f9fe30 ("kasan: simplify and clarify Makefile")
>   ca627e636551 ("rust: cfi: add support for CFI_CLANG with Rust")
>
> Basically for the latter one (as a guess).
>
> And the build works.

Sorry about that! The fix is here:
https://lore.kernel.org/all/20240925141944.277936-1-ojeda@kernel.org/

Alice

