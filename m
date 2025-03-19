Return-Path: <linux-next+bounces-5877-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E7BA68707
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 09:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312783B6AA0
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 08:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24422512FE;
	Wed, 19 Mar 2025 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5Kty4YT"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798092512F5;
	Wed, 19 Mar 2025 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742373511; cv=none; b=pEziPHs8t9yLEViu90zAyNGvhMqdM5V5zgbXeprGaOLlD/ie50A/xqW3EecSjGTV0C5/JatGgDEL15o+4PQ+2ZftxfhTgGD9C8yzOJENECe7pHD8Fh0iRHvbvT18UwausB8H1h6tNoMpXUCeUp1K/vpS6bFZN0z3vBWE1m2zW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742373511; c=relaxed/simple;
	bh=ievVbUAi3XaG8KKFxAZRoaEhX4nigxZ+7FrxcjLYGUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOzqCeYFmnAmNbcuKDMlKo7fZgh8kDhn1gMNKTIQoP/lTygt6fdQa+s2hgiHGf/Pm4dzNbq20H7Ah9s7xEhE4FnHVhoB5xeLmen1BBhQmgPOurG54eDi72SDX2zWQetwXruAJN6HZnuaGLK/1xSj5sHlf0TTPAElWaZEdmujhls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5Kty4YT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E436AC4CEEA;
	Wed, 19 Mar 2025 08:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742373510;
	bh=ievVbUAi3XaG8KKFxAZRoaEhX4nigxZ+7FrxcjLYGUo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O5Kty4YTSwFrb7gMF4W37Gh46Lez+KsBNRR4piL7V2aMHzxOm75OZ0NAyx79Aw2+w
	 n1avxxGbov/idMipwuFIJsSxb4yoGwfJVuvTYbHdWSG2ZyGP1drpCbLl1/gRDsFI/f
	 4lS2n9JCbmTkLkRwaUMvGaR0tWSnAU6r07Y3APnbKTP2cWqruoDUcxJYXJH6UBkM1j
	 gkjwuBF3u81s7Zr04pkJlwDFL8p6BJ0iNaqURSFOgC4oulDotn9zDlmv6117+8mXTw
	 Lx+07A/0pEjjRuInP/zAc16VnHU/4eziaAdeH6eDAZlM9K+rPpPIYhpxOJxO8RG+WP
	 ahdFi9ISo0wcQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-547bcef2f96so7294487e87.1;
        Wed, 19 Mar 2025 01:38:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFW/u3vs5SR6AL/ahXq0zSr3XHZxI59yDJhqI4OfyxPl6rr/os3jrf2L5ELEdjObePfAo0FMbI/2PytQ==@vger.kernel.org, AJvYcCW7cs5SRQooHWSeDkO3sAcjYa9UojB4l4zEXbIKvTeSzCquBlUbluLxLreYqInponNRZhrJUkQtwnz6OdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz14/DrWKk7Ok/a6s5XETQP4Tgho6p0WLHnlgw4Skd8GKwVsIdl
	Voe5BCI9c8ePB1G1UCKioN3Q6LOhaRofAILhK9HkHemc00aQMSMXkoA7WfCenfe70DiHUvtbvPn
	pbUvtLlotPhEJBH/2NvLRNZW5ytM=
X-Google-Smtp-Source: AGHT+IEX8R1IAsDIIpwOQTrRaHYVLBWqksclVFT2coT/UbsLQIdheCvRK3piRIyPj79woDLXOZosQKkrQVaN4vqWueI=
X-Received: by 2002:a05:6512:4010:b0:549:8f97:dd6a with SMTP id
 2adb3069b0e04-54acb1baca5mr606144e87.16.1742373509230; Wed, 19 Mar 2025
 01:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67bab9f0.050a0220.bbfd1.000e.GAE@google.com> <CANp29Y6MOsEyXmR8Z_aA+3xQMQQFSWzsGfJUXohdeN6fG6EwRA@mail.gmail.com>
In-Reply-To: <CANp29Y6MOsEyXmR8Z_aA+3xQMQQFSWzsGfJUXohdeN6fG6EwRA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 19 Mar 2025 09:38:18 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH2JUWsxgd67+EHPgbo++OiGkx6TAu+8YcOcKjGR7ShRg@mail.gmail.com>
X-Gm-Features: AQ5f1Jpm251oz7-tEO49EiCn9uqTgWEZ9zc99AR8u7TCbsK1FUi5mUR-A3PJ6ls
Message-ID: <CAMj1kXH2JUWsxgd67+EHPgbo++OiGkx6TAu+8YcOcKjGR7ShRg@mail.gmail.com>
Subject: Re: [syzbot] linux-next build error (20)
To: Aleksandr Nogikh <nogikh@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: syzbot <syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com>, 
	brgerst@gmail.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, 
	Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(cc Sami, Masahiro)

On Wed, 19 Mar 2025 at 06:10, Aleksandr Nogikh <nogikh@google.com> wrote:
>
> On Sat, Feb 22, 2025 at 10:02=E2=80=AFPM syzbot
> <syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    d4b0fd87ff0d Add linux-next specific files for 20250221
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D17a5bae4580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D76d7299d728=
19017
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D06fd1a3613c50=
d36129e
> > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for D=
ebian) 2.40
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
> >
> > <stdin>:4:15: error: use of undeclared identifier '__ref_stack_chk_guar=
d'
>
> Manual bisection pointed to the commits from this patch series:
>
> [PATCH v5 00/16] x86-64: Stack protector and percpu improvements
> https://lore.kernel.org/lkml/20241105155801.1779119-1-brgerst@gmail.com/
>
> Brian, could you please take a look at this syzbot report?
>
> The latest build log (for next-20250318) is here:
> https://syzkaller.appspot.com/text?tag=3DCrashLog&x=3D10a745e4580000
>
> It failed with the following error:
>
> <stdin>:4:15: error: use of undeclared identifier '__ref_stack_chk_guard'
> EXPORT_SYMBOL(__ref_stack_chk_guard);
>               ^
> 1 error generated.
> make[4]: *** [scripts/Makefile.build:335: arch/x86/entry/entry.o] Error 1
> make[4]: *** Deleting file 'arch/x86/entry/entry.o'
> make[4]: *** Waiting for unfinished jobs....
>

This appears to be an interaction with gendwarfksyms:

# AS      arch/x86/entry/entry.o
  clang-15 -Wp,-MMD,arch/x86/entry/.entry.o.d -nostdinc
-I/usr/local/google/home/ardb/linux/arch/x86/include
-I./arch/x86/include/generated
-I/usr/local/google/home/ardb/linux/include -I./include
-I/usr/local/google/home/ardb/linux/arch/x86/include/uapi
-I./arch/x86/include/generated/uapi
-I/usr/local/google/home/ardb/linux/include/uapi
-I./include/generated/uapi -include
/usr/local/google/home/ardb/linux/include/linux/compiler-version.h
-include /usr/local/google/home/ardb/linux/include/linux/kconfig.h
-D__KERNEL__ --target=3Dx86_64-linux-gnu -fintegrated-as
-Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument
-Werror=3Doption-ignored -Werror=3Dunused-command-line-argument
-fmacro-prefix-map=3D/usr/local/google/home/ardb/linux/=3D -D__ASSEMBLY__
-fno-PIE -m64 -g -gdwarf-4
-I/usr/local/google/home/ardb/linux/arch/x86/entry -Iarch/x86/entry
-DKBUILD_MODFILE=3D'"arch/x86/entry/entry"' -DKBUILD_MODNAME=3D'"entry"'
-D__KBUILD_MODNAME=3Dkmod_entry -c -o arch/x86/entry/entry.o
/usr/local/google/home/ardb/linux/arch/x86/entry/entry.S
# cmd_gen_symversions_S arch/x86/entry/entry.o
  if llvm-nm-15 arch/x86/entry/entry.o 2>/dev/null | grep -q '
__export_symbol_'; then { echo "#include <linux/kernel.h>" ; echo
"#include <linux/string.h>" ; echo "#include <asm/asm-prototypes.h>" ;
llvm-nm-15 arch/x86/entry/entry.o | sed -n 's/.*
__export_symbol_\(.*\)/EXPORT_SYMBOL(\1);/p' ; } | clang-15 ... -c -o
arch/x86/entry/entry.gendwarfksyms.o -xc -; llvm-nm-15
arch/x86/entry/entry.o | sed -n 's/.* __export_symbol_\(.*\)/\1/p' |
./scripts/gendwarfksyms/gendwarfksyms
arch/x86/entry/entry.gendwarfksyms.o >> arch/x86/entry/.entry.o.cmd;
fi
<stdin>:4:15: error: use of undeclared identifier '__ref_stack_chk_guard'
EXPORT_SYMBOL(__ref_stack_chk_guard);
              ^
1 error generated.

The issue here is that we deliberately hide __ref_stack_chk_guard from
the compiler, because Clang will otherwise generate incorrect code.
[0]

I managed to work around this issue using the hack below, but I'm not
too familiar with the gendwarfksyms code, so I'll leave it up to Sami
and Masahiro to decide whether this is the right approach before
sending out a patch.


--- a/arch/x86/include/asm/asm-prototypes.h
+++ b/arch/x86/include/asm/asm-prototypes.h
@@ -20,6 +20,7 @@
 extern void cmpxchg8b_emu(void);
 #endif

-#if defined(__GENKSYMS__) && defined(CONFIG_STACKPROTECTOR)
+#if (defined(__GENKSYMS__) || defined(__GENDWARFKSYMS__)) \
+       && defined(CONFIG_STACKPROTECTOR)
 extern unsigned long __ref_stack_chk_guard;
 #endif

--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -311,7 +311,8 @@
 ifdef CONFIG_GENDWARFKSYMS
 cmd_gensymtypes_S =3D                                                    \
        $(getasmexports) |                                              \
-       $(CC) $(c_flags) -c -o $(@:.o=3D.gendwarfksyms.o) -xc -;          \
+       $(CC) -D__GENDWARFKSYMS__                                       \
+               $(c_flags) -c -o $(@:.o=3D.gendwarfksyms.o) -xc -;        \
        $(call getexportsymbols,\1) |                                   \
        $(gendwarfksyms) $(@:.o=3D.gendwarfksyms.o)
 else

(Note that simply #define'ing __GENKSYMS__ here and relying on that in
asm-prototypes.h doesn't work.)


[0] 577c134d311b ("x86/stackprotector: Work around strict Clang TLS
symbol requirements")

