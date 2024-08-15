Return-Path: <linux-next+bounces-3329-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B32952A14
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 09:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58BFBB233A9
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 07:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A0C1990DA;
	Thu, 15 Aug 2024 07:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHYtvJof"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785611990C5;
	Thu, 15 Aug 2024 07:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723707783; cv=none; b=mSqBWWi11atNlLbMOeFDZCGZAyjwCyz9Fe9LJNsF/VYwLfSPlsxemrBR4cFSCH2LHs+4g/7Tqdq1SOhLPcYMkc1ov+4fCrFXZX3Xw7VKkTBfYUYX7G0barhI6nfITqePwz2t8pEkhsKvfFBS6KPtRbtCh+jGloh1NCI6qRyQXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723707783; c=relaxed/simple;
	bh=o1dW7ypAYhHcBxmv9nYdPUA024IKAYMyzQ64aTwM+us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=psaQ1vLm0YRMF6Imj1XsIn6KplzTim3O8642whKuKD2nhtJgvtQef9NIs6lVcEaxw9F3CdhBUodhbVFzVgDG+W40dZVV5mczaQ0tc+hSifkhLiQkHjXKokIzyxzYWezH01X3elEus5aqgciQ59RpiW92RGtvxGA7TiSU/qhToxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHYtvJof; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f1a7faa4d4so5922601fa.0;
        Thu, 15 Aug 2024 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723707779; x=1724312579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLDqJpSBtqQS3dd0TfBTNDeavhGUybFXYsJBx/0p5II=;
        b=IHYtvJofcKrYoGvnIZ8WF+WkDixmqhVIcqE/vXAii1pdYXL4ewbfbftTjTmfrgIirc
         AdGj+TjH8qma2fGouYgkXrXjdIyQQP8P86S5o/aBTv4F6qtOfk+tnJJptJZf4MWGp0HH
         tuE6FXsbxZaH6Q1znUZaI5d2oK1moDR0riGsSDQZzNUTLVrm9lDg7rJwqOqOXjWKPE1t
         e3nAQslPRSGYxFiwzc596Jr31XqX0nfKe9p1V1MFMs/WIImU95817H+4tPrPZoOtSOC+
         itNr2NSxpUEolVJvZUwJZy/+OQ6vu+FKqED7qJsnsc3RhVuj7pxe1wN3en++D+jAdewC
         05Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723707779; x=1724312579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLDqJpSBtqQS3dd0TfBTNDeavhGUybFXYsJBx/0p5II=;
        b=FFilaOvDlr6rNcbTbdqceEQwyuSECojUc2Ax5a/6jpwie3BCnqT0Dwv0n8ZJ1bSWTl
         gB9hPZzwxsfAfpxASOhrM4cdW4twMKrIrYsZo7ZqaqfQxQZiM3S6BY8UHXhrueiY9Vsd
         tHA/n7DPfcN8yIt0mmWDWbSUfLI9t+JOABI6vWxylbOUfsuhlbeV5FEAFMTDlx8Ki9Gx
         KYfoFhw4F4dhAaBIdJx8kk1ibJ5DnYA7EV+36DXFDQEegUbwQZN8mSgGDtgJSR6QPqHm
         sWFyW6Wk4YjsR+W6Kzyjv77U51rY2axUN0fPB/8CWTUJgrtl2wLP32S2R/BXQmG/hQgV
         TQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTEJHmNYpETExpOBtFStAlTPg1PVh0lbJCncU4z8yqhDi2gsTjGRJJdSV5v4ImVzXH/hGFmJfreqwL0dwjD6HA15d4vixCravHU67oDiBTaohqcoLWNQ8jg2Slb2iM4+NsYChrT+5Hyg==
X-Gm-Message-State: AOJu0YzLMA6W9LOndRAT08Xz6dD9XhyWRKI3PyiLpfiv8w+HuWLHLl+K
	HiMJFPEPuGSkuEiULx9A7yu5GL1I7OqFUjBJwgsqrCcNOSaEX+eGFzv6XCkLhWZEa0www/uMFfJ
	vevtiDld/U77VrfdlpXWZCPbZ9x8oodgG
X-Google-Smtp-Source: AGHT+IHlRp5dcItvdGPhE0fIjPa2WN7gLq+73A+qygO18tWPzGl6adf1qnqgy4sqM8bO1BoOZR1u6kH5JSzT2jFxO8M=
X-Received: by 2002:a05:651c:2109:b0:2ea:ab3b:fd89 with SMTP id
 38308e7fff4ca-2f3b3b9076emr6031931fa.10.1723707778860; Thu, 15 Aug 2024
 00:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815093829.275058c7@canb.auug.org.au>
In-Reply-To: <20240815093829.275058c7@canb.auug.org.au>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 15 Aug 2024 09:42:51 +0200
Message-ID: <CAFULd4byjR7fF2wBUJMH=8_p5sE2vK9SkG=O4sUOjS4x9MUyRw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 1:38=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the mm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from include/linux/kcsan-checks.h:13,
>                  from include/linux/instrumented.h:12,
>                  from include/asm-generic/bitops/instrumented-atomic.h:14=
,
>                  from arch/powerpc/include/asm/bitops.h:321,
>                  from include/linux/bitops.h:68,
>                  from arch/powerpc/include/asm/mce.h:12,
>                  from arch/powerpc/include/asm/paca.h:32,
>                  from arch/powerpc/include/asm/percpu.h:30,
>                  from include/linux/err.h:9,
>                  from arch/powerpc/include/asm/ptrace.h:22,
>                  from arch/powerpc/kernel/vdso/sigtramp64.S:14:
> include/linux/compiler_attributes.h:55: warning: "__always_inline" redefi=
ned
>    55 | #define __always_inline                 inline __attribute__((__a=
lways_inline__))
>       |
> In file included from include/linux/stddef.h:5,
>                  from include/linux/string.h:9,
>                  from arch/powerpc/include/asm/paca.h:16:
> include/uapi/linux/stddef.h:8: note: this is the location of the previous=
 definition
>     8 | #define __always_inline inline
>       |
> include/linux/compiler_attributes.h:91:20: error: missing binary operator=
 before token "("
>    91 | #if __has_attribute(__copy__)
>       |                    ^
> include/linux/compiler_attributes.h:104:20: error: missing binary operato=
r before token "("
>   104 | #if __has_attribute(__counted_by__)
>       |                    ^
> include/linux/compiler_attributes.h:107: warning: "__counted_by" redefine=
d
>   107 | # define __counted_by(member)
>       |
> include/uapi/linux/stddef.h:55: note: this is the location of the previou=
s definition
>    55 | #define __counted_by(m)
>       |
> include/linux/compiler_attributes.h:116:20: error: missing binary operato=
r before token "("
>   116 | #if __has_attribute(__diagnose_as_builtin__)
>       |                    ^
> include/linux/compiler_attributes.h:139:20: error: missing binary operato=
r before token "("
>   139 | #if __has_attribute(__designated_init__)
>       |                    ^
> include/linux/compiler_attributes.h:150:20: error: missing binary operato=
r before token "("
>   150 | #if __has_attribute(__error__)
>       |                    ^
> include/linux/compiler_attributes.h:161:20: error: missing binary operato=
r before token "("
>   161 | #if __has_attribute(__externally_visible__)
>       |                    ^
> include/linux/compiler_attributes.h:198:20: error: missing binary operato=
r before token "("
>   198 | #if __has_attribute(__no_caller_saved_registers__)
>       |                    ^
> include/linux/compiler_attributes.h:209:20: error: missing binary operato=
r before token "("
>   209 | #if __has_attribute(__noclone__)
>       |                    ^
> include/linux/compiler_attributes.h:226:20: error: missing binary operato=
r before token "("
>   226 | #if __has_attribute(__fallthrough__)
>       |                    ^
> include/linux/compiler_attributes.h:252:20: error: missing binary operato=
r before token "("
>   252 | #if __has_attribute(__nonstring__)
>       |                    ^
> include/linux/compiler_attributes.h:264:20: error: missing binary operato=
r before token "("
>   264 | #if __has_attribute(__no_profile_instrument_function__)
>       |                    ^
> include/linux/compiler_attributes.h:283:20: error: missing binary operato=
r before token "("
>   283 | #if __has_attribute(__no_stack_protector__)
>       |                    ^
> include/linux/compiler_attributes.h:294:20: error: missing binary operato=
r before token "("
>   294 | #if __has_attribute(__overloadable__)
>       |                    ^
> include/linux/compiler_attributes.h:313:20: error: missing binary operato=
r before token "("
>   313 | #if __has_attribute(__pass_dynamic_object_size__)
>       |                    ^
> include/linux/compiler_attributes.h:318:20: error: missing binary operato=
r before token "("
>   318 | #if __has_attribute(__pass_object_size__)
>       |                    ^
> include/linux/compiler_attributes.h:342:20: error: missing binary operato=
r before token "("
>   342 | #if __has_attribute(__uninitialized__)
>       |                    ^
> include/linux/compiler_attributes.h:388:20: error: missing binary operato=
r before token "("
>   388 | #if __has_attribute(__warning__)
>       |                    ^
> include/linux/compiler_attributes.h:405:20: error: missing binary operato=
r before token "("
>   405 | #if __has_attribute(disable_sanitizer_instrumentation)
>       |                    ^
>
> Caused by commit
>
>   8e53757638ec ("err.h: add ERR_PTR_PCPU(), PTR_ERR_PCPU() and IS_ERR_PCP=
U() functions")
>
> Does include/linux/err.h really need to include asm/percpu.h?  __percpu i=
s
> defined in compiler_types.h which is included in every c code compile.

Currently it is not needed, but with the proposed patch [1]

[1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.com/

that repurposes __percpu to also include percpu named address
qualifier, it will be needed, because per_cpu_qual will be defined in
include/asm-generic/percpu.h.

I looked a bit at the error and noticed that the error happens when
building VDSO sigtramp64.S that includes:

#include <asm/ptrace.h> /* XXX for __SIGNAL_FRAMESIZE */

The crash happens through this include, so perhaps XXX above marks
some expected problem with the include that my change was unlucky
enough to trigger?

Please note that x86 builds with the mentioned patch without problems.

Uros.

