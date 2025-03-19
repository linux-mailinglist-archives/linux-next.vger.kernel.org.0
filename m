Return-Path: <linux-next+bounces-5893-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D38DBA69847
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 19:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89ADA3AE12A
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 18:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E911DED5B;
	Wed, 19 Mar 2025 18:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M7C8YYTX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6DB184524
	for <linux-next@vger.kernel.org>; Wed, 19 Mar 2025 18:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742409957; cv=none; b=u2t2F3kddyuhOZkZu7f/O9P6fZPt1L4zRz0Fkobl03nz8dikV248p2pKbslg/FZ1EgPcgAaYe7it+xzYxLk6tT7uIJ/SVq+V/PLlRr06YXnLTnsD0QzkUrdsBPzZAcFswl2/tdqte1JJIpfxKCc9uvACQXUblEz2JPwJShg2Do8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742409957; c=relaxed/simple;
	bh=UXiJSheHG32APdl3w7LPrJu9PqnU26FCXtZSCbxyCxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EosWDEnNSxZi3+UkzZOHykHmekhUcyqo7vmbE7edKVhnw5dXBy9yYXLXBsMRjrwZW6bW6l5ZJk8LNg+JMs9DS49YoUtpsJFuIOs+XH3qLHTU2lewQTbe3peeAMj/PPPxrbhmwjOra4S0jFMXDC2ZzzGtrzJBfEut5nV8eFuMmL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M7C8YYTX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so2331a12.0
        for <linux-next@vger.kernel.org>; Wed, 19 Mar 2025 11:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742409954; x=1743014754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ecbEbpemCNUdOmyna3XYF3XUix1B1tTekXhoJuXd4A=;
        b=M7C8YYTXU6a80eZH3U4gi0RE2DHczUUU66dSb+RvGkEFuOtkQ7xpg2zBZhu59Fmv5V
         yfWRfXMlnBO14I3trOGw1y+24dK6TriCzOXgfB0nwPcsmmLa9IBFppS61xvmC93yeEGv
         8xC1okaT6eITJE1HYXQHTupOK5NCN2D7ffm+azr0SDenCrSIaTxbhmvPhvqBl9XESg+f
         zWSNWImJdwKrOHMjz1xYx2utg8SdksfJJAPVWXut/NOGxs0P7npexAfYhcvU56uWJ4sO
         xoam1pavAGGSZ0S4itiCZnI0wFfzESsfFUkGuao+TJMRHRPp4BxuGdojAxuVVsj6IhZr
         kbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742409954; x=1743014754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ecbEbpemCNUdOmyna3XYF3XUix1B1tTekXhoJuXd4A=;
        b=GURyJIWwJw4sJ7JTjmdUn3+90HxbTUZeIxNkY3yIJUQDBv0dzBGhajB1DLy2/EtI5F
         1bSH9oq9N3I1JJE80N6v3GKhIBBzQ0Ckn8nViT4JsUFy0BoRkSB0coYahzKM1agQnr3n
         xXhgeUw+ydX4HhDRLm5CfTavKNEPjGIIdSlic8oz0/T5T0QlYBepq6o9rmHrL4n8d7Ju
         3ltINg05tfs1CwVXpEQklK9FVhTE7uhCIzLvMsUg+fA5y8ub+8RgvtmdxJVPuC1Had+p
         kKV4vNX7n4Jk8DzXWXIU6sXKEo2MDs5CLVK/gDEslITzrXRfRV5lgnKBH8EpynmWmHJx
         wHkw==
X-Forwarded-Encrypted: i=1; AJvYcCVsRDBtmWt8yEJDETpiR3xx/b1LCQcA69LHQkE01KVRd4kyky89gdqUs5ooMo68+87hlIqDAWl9loWA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc5bh0Z61Sl4VqLAnzyZRLixJAvtbCg6uwwTnnRnwyzO8X2Vmf
	yEWxx4KaBEXeBsXNev3zcE/FJS6dHWno93VLWPtk4n2q1QqYwaQVZpOm1hYsE2Zm7cGLnkBDk8A
	+asv6oWAeoVH3JeLjXsWk7MXfPSDr/Ymy9b3d
X-Gm-Gg: ASbGncvH4OonYGZ3cFR0DXywWYGW2BC80DbtwAjcJA3NTPh9VW7Gd7fNeF2wMUdtnt6
	UOlcSqpvdlHhtGX/64IAMK9C4BDPndsNb+p1zXr2o+kFO1PhO4akXrzhAHK4DxxIFs7bUf7/x86
	O+r9IwypJN+eYtEiOmLsdivYE3Oqh4+Xbj+5DT6Kjq60R5gjB/B+U/1g==
X-Google-Smtp-Source: AGHT+IFQVFvJoLLYYGEpCQCrcpmJcgAjvu9lMlPw1Apq+b9AsPYUrSsWWyw8j004BwTFyagC58jmJdwZkqIXOfbzzQ0=
X-Received: by 2002:aa7:de95:0:b0:5eb:5d50:4fec with SMTP id
 4fb4d7f45d1cf-5eba06cb25cmr14678a12.0.1742409953588; Wed, 19 Mar 2025
 11:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67bab9f0.050a0220.bbfd1.000e.GAE@google.com> <CANp29Y6MOsEyXmR8Z_aA+3xQMQQFSWzsGfJUXohdeN6fG6EwRA@mail.gmail.com>
 <CAMj1kXH2JUWsxgd67+EHPgbo++OiGkx6TAu+8YcOcKjGR7ShRg@mail.gmail.com>
In-Reply-To: <CAMj1kXH2JUWsxgd67+EHPgbo++OiGkx6TAu+8YcOcKjGR7ShRg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 19 Mar 2025 18:45:16 +0000
X-Gm-Features: AQ5f1JqU9r27v2sT_VaPIO6dFeriwVbCMWMTGjju9UQ4rRIs0sxTRsZw-3WZHqE
Message-ID: <CABCJKuednNrveGz6tQqHj7bbnVzLJFgCLt0CuZLT2KOvt8aNrg@mail.gmail.com>
Subject: Re: [syzbot] linux-next build error (20)
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Aleksandr Nogikh <nogikh@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	syzbot <syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com>, brgerst@gmail.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, 
	Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ard,

On Wed, Mar 19, 2025 at 8:38=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> The issue here is that we deliberately hide __ref_stack_chk_guard from
> the compiler, because Clang will otherwise generate incorrect code.
> [0]
>
> I managed to work around this issue using the hack below, but I'm not
> too familiar with the gendwarfksyms code, so I'll leave it up to Sami
> and Masahiro to decide whether this is the right approach before
> sending out a patch.
>
>
> --- a/arch/x86/include/asm/asm-prototypes.h
> +++ b/arch/x86/include/asm/asm-prototypes.h
> @@ -20,6 +20,7 @@
>  extern void cmpxchg8b_emu(void);
>  #endif
>
> -#if defined(__GENKSYMS__) && defined(CONFIG_STACKPROTECTOR)
> +#if (defined(__GENKSYMS__) || defined(__GENDWARFKSYMS__)) \
> +       && defined(CONFIG_STACKPROTECTOR)
>  extern unsigned long __ref_stack_chk_guard;
>  #endif
>
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -311,7 +311,8 @@
>  ifdef CONFIG_GENDWARFKSYMS
>  cmd_gensymtypes_S =3D                                                   =
 \
>         $(getasmexports) |                                              \
> -       $(CC) $(c_flags) -c -o $(@:.o=3D.gendwarfksyms.o) -xc -;         =
 \
> +       $(CC) -D__GENDWARFKSYMS__                                       \
> +               $(c_flags) -c -o $(@:.o=3D.gendwarfksyms.o) -xc -;       =
 \
>         $(call getexportsymbols,\1) |                                   \
>         $(gendwarfksyms) $(@:.o=3D.gendwarfksyms.o)
>  else

The patch looks reasonable to me. Thanks for figuring this out!

Sami

