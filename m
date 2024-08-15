Return-Path: <linux-next+bounces-3330-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12985952E3C
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 14:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72033B23020
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 12:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A087514884B;
	Thu, 15 Aug 2024 12:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hu7zM216"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7950B17C9AA;
	Thu, 15 Aug 2024 12:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723724927; cv=none; b=bySIka8xr5RsXAovg6AmOo4TGEPchC8fwms5kE2iV4QozTlCLE15sepQhaICfnbaDsGLtjwHzM4WhmKZkHK8OiAf0XFjEPD1uAQOmcGsUenwpB8dasGnXxc5Uq2/SdY2H9r23jCMDa7enEvLYiFLjCu3UzAUIDLXUK1QlZZyM4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723724927; c=relaxed/simple;
	bh=JrFPrJ87Ftrhx6cgiCBPw22H3cmXQRsRa5UrN+y10r0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CM4g8IBqOfL4VXGSR/iLDZ41DXPM03LLEBS8NsGIg+vDGtUxpsLncW7Q6UQunTa2vIqDjq/zNLaUoDpZo13CBhl4YTyR6u2hY94k8RwR6Ofuq5EjxcyoDm87kSJDFAT7j7dkyXI8xjBRQuqKVcL0Xko/E1e1AojkdMJzdpDiDMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hu7zM216; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so13657151fa.1;
        Thu, 15 Aug 2024 05:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723724923; x=1724329723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7ji7Xbpe0QiRxrQIY6BjYXQUxvS4UkrQQS8Vvk9NPA=;
        b=hu7zM216OM0x8KR3yKzO9UWjXjESPdYx/q5xNBScKxQ2QCxa5lPGvOSMF2Wm3hUkf7
         t4cJRJNjD8/xH3VsqmBvw87KiV+mtEfZap39BydiauW7tykqc0J1/F0W+bqBNPyxIKWQ
         UtYmiBYdCHkB/c/JEAUTlAi6+d637Vwb4VvTHxPZESQe5BxjgM99K+HFSatZP1NdD4nF
         vk+rWHXCeOAhDKlIe3BUxLMZBoQmzwWEbpq7xUnGm4vhBcDRgQ/B+ty3tAMvrvkWL7ED
         cI3e4rZXSyBl66eRK1I2Kt6Kh7Uc3hJmMwoPJbzOUMdsxqN9NUqS+mMXL7k0FWIGu0UQ
         uEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723724923; x=1724329723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7ji7Xbpe0QiRxrQIY6BjYXQUxvS4UkrQQS8Vvk9NPA=;
        b=loCBZJFffiVBZpEu8OhFNp8pgx3feygFCs6MHFJ5WOGIVjenikF4B6VHqa6b0z4+5J
         wVZdiHV8s+4+GQSgN7Xv06hL3TjqG8kzd7U0x3XDby9f0FfFqqRoa2N0ghAdcZIhTMEj
         w/kQ0ZIDV0uV8UW3SO+8aX4Y6FwmARzj6+822TvT/oG0/p3WVWPh2E8a9C1BzNqxZJ3e
         FhmS0MFTFygEZ2/LnJrMM09ek32xKL5MsuANw+12rR5VPNukTKjdn1hE6EWkR079Ozxm
         kh/HyO036Uu99TQrrFMmxazjSrS3ocYaTv/yQ8TYNj585Cj4M6GSYHAHtp7qruGBjB3H
         m/xg==
X-Forwarded-Encrypted: i=1; AJvYcCUXcAGSW5d3foLN/lRiJnUSL3g+Gd7mq2jZDSfwumvqFThJvWmiM+Xo8tk3/0+xVxm1Qb+X6DaE/WnAU92eTkcKppWZj3eH59cu1Nv8xb2NuecXcqf104nJpkzRZwvjClyPSMciEH98Jw==
X-Gm-Message-State: AOJu0YwBkORz8NVovizOwLoDXtfa4Qo/mxh9iXgNGoJKUwLA7kE4XNkA
	vl2MbABbaYkPTtmOBCJ3zw+UK8vwcP2ReJlwxxxFQtg3ePtwfxD//UqGOKri+C3cSKOJTqX4TUl
	TUCZyz2aJVOURBzg2u2a7EVf4eO0SlQ==
X-Google-Smtp-Source: AGHT+IFN3/Tti+ht+OVwgF6hTjfmaJW/vXQBGY6af8yYnxegYHkbgG7upb0ZVxtChhPola27NZIHH2nQ1+KNsjdzpBs=
X-Received: by 2002:a05:651c:510:b0:2ef:28ed:1ff2 with SMTP id
 38308e7fff4ca-2f3aa1d8164mr49731521fa.9.1723724922972; Thu, 15 Aug 2024
 05:28:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815093829.275058c7@canb.auug.org.au> <CAFULd4byjR7fF2wBUJMH=8_p5sE2vK9SkG=O4sUOjS4x9MUyRw@mail.gmail.com>
In-Reply-To: <CAFULd4byjR7fF2wBUJMH=8_p5sE2vK9SkG=O4sUOjS4x9MUyRw@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 15 Aug 2024 14:28:34 +0200
Message-ID: <CAFULd4Y3sqaRZeOGpEVDSi4NWA2OHR+rpiqz0syLWjHrcQQE4w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 9:42=E2=80=AFAM Uros Bizjak <ubizjak@gmail.com> wro=
te:
>
> On Thu, Aug 15, 2024 at 1:38=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
> >
> > Hi all,
> >
> > After merging the mm tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > In file included from include/linux/kcsan-checks.h:13,
> >                  from include/linux/instrumented.h:12,
> >                  from include/asm-generic/bitops/instrumented-atomic.h:=
14,
> >                  from arch/powerpc/include/asm/bitops.h:321,
> >                  from include/linux/bitops.h:68,
> >                  from arch/powerpc/include/asm/mce.h:12,
> >                  from arch/powerpc/include/asm/paca.h:32,
> >                  from arch/powerpc/include/asm/percpu.h:30,
> >                  from include/linux/err.h:9,
> >                  from arch/powerpc/include/asm/ptrace.h:22,
> >                  from arch/powerpc/kernel/vdso/sigtramp64.S:14:
> > include/linux/compiler_attributes.h:55: warning: "__always_inline" rede=
fined
> >    55 | #define __always_inline                 inline __attribute__((_=
_always_inline__))
> >       |
> > In file included from include/linux/stddef.h:5,
> >                  from include/linux/string.h:9,
> >                  from arch/powerpc/include/asm/paca.h:16:
> > include/uapi/linux/stddef.h:8: note: this is the location of the previo=
us definition
> >     8 | #define __always_inline inline
> >       |
> > include/linux/compiler_attributes.h:91:20: error: missing binary operat=
or before token "("
> >    91 | #if __has_attribute(__copy__)
> >       |                    ^
> > include/linux/compiler_attributes.h:104:20: error: missing binary opera=
tor before token "("
> >   104 | #if __has_attribute(__counted_by__)
> >       |                    ^
> > include/linux/compiler_attributes.h:107: warning: "__counted_by" redefi=
ned
> >   107 | # define __counted_by(member)
> >       |
> > include/uapi/linux/stddef.h:55: note: this is the location of the previ=
ous definition
> >    55 | #define __counted_by(m)
> >       |
> > include/linux/compiler_attributes.h:116:20: error: missing binary opera=
tor before token "("
> >   116 | #if __has_attribute(__diagnose_as_builtin__)
> >       |                    ^
> > include/linux/compiler_attributes.h:139:20: error: missing binary opera=
tor before token "("
> >   139 | #if __has_attribute(__designated_init__)
> >       |                    ^
> > include/linux/compiler_attributes.h:150:20: error: missing binary opera=
tor before token "("
> >   150 | #if __has_attribute(__error__)
> >       |                    ^
> > include/linux/compiler_attributes.h:161:20: error: missing binary opera=
tor before token "("
> >   161 | #if __has_attribute(__externally_visible__)
> >       |                    ^
> > include/linux/compiler_attributes.h:198:20: error: missing binary opera=
tor before token "("
> >   198 | #if __has_attribute(__no_caller_saved_registers__)
> >       |                    ^
> > include/linux/compiler_attributes.h:209:20: error: missing binary opera=
tor before token "("
> >   209 | #if __has_attribute(__noclone__)
> >       |                    ^
> > include/linux/compiler_attributes.h:226:20: error: missing binary opera=
tor before token "("
> >   226 | #if __has_attribute(__fallthrough__)
> >       |                    ^
> > include/linux/compiler_attributes.h:252:20: error: missing binary opera=
tor before token "("
> >   252 | #if __has_attribute(__nonstring__)
> >       |                    ^
> > include/linux/compiler_attributes.h:264:20: error: missing binary opera=
tor before token "("
> >   264 | #if __has_attribute(__no_profile_instrument_function__)
> >       |                    ^
> > include/linux/compiler_attributes.h:283:20: error: missing binary opera=
tor before token "("
> >   283 | #if __has_attribute(__no_stack_protector__)
> >       |                    ^
> > include/linux/compiler_attributes.h:294:20: error: missing binary opera=
tor before token "("
> >   294 | #if __has_attribute(__overloadable__)
> >       |                    ^
> > include/linux/compiler_attributes.h:313:20: error: missing binary opera=
tor before token "("
> >   313 | #if __has_attribute(__pass_dynamic_object_size__)
> >       |                    ^
> > include/linux/compiler_attributes.h:318:20: error: missing binary opera=
tor before token "("
> >   318 | #if __has_attribute(__pass_object_size__)
> >       |                    ^
> > include/linux/compiler_attributes.h:342:20: error: missing binary opera=
tor before token "("
> >   342 | #if __has_attribute(__uninitialized__)
> >       |                    ^
> > include/linux/compiler_attributes.h:388:20: error: missing binary opera=
tor before token "("
> >   388 | #if __has_attribute(__warning__)
> >       |                    ^
> > include/linux/compiler_attributes.h:405:20: error: missing binary opera=
tor before token "("
> >   405 | #if __has_attribute(disable_sanitizer_instrumentation)
> >       |                    ^
> >
> > Caused by commit
> >
> >   8e53757638ec ("err.h: add ERR_PTR_PCPU(), PTR_ERR_PCPU() and IS_ERR_P=
CPU() functions")
> >
> > Does include/linux/err.h really need to include asm/percpu.h?  __percpu=
 is
> > defined in compiler_types.h which is included in every c code compile.
>
> Currently it is not needed, but with the proposed patch [1]
>
> [1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.co=
m/
>
> that repurposes __percpu to also include percpu named address
> qualifier, it will be needed, because per_cpu_qual will be defined in
> include/asm-generic/percpu.h.
>
> I looked a bit at the error and noticed that the error happens when
> building VDSO sigtramp64.S that includes:
>
> #include <asm/ptrace.h> /* XXX for __SIGNAL_FRAMESIZE */
>
> The crash happens through this include, so perhaps XXX above marks
> some expected problem with the include that my change was unlucky
> enough to trigger?

OTOH, powerpc percpu.h includes paca.h that further includes
linux/string.h. AFAICS, nothing in paca.h requires linux/string.h
(which includes many other headers), so perhaps removing "#include
linux/string.h" from paca.h makes the header "light enough" to be
included in err.h.through percpu.h.

Uros.

