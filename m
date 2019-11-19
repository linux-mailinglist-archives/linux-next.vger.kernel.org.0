Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C93C6102BBB
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 19:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfKSSeR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 13:34:17 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33357 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbfKSSeR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 13:34:17 -0500
Received: by mail-wm1-f65.google.com with SMTP id a17so3162154wmb.0
        for <linux-next@vger.kernel.org>; Tue, 19 Nov 2019 10:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Bn+l2Wf/udyhGlzXiaSqVzyU1KUJVXlbjswoz1SSVPI=;
        b=LJwr2bvbV/j2pKgFg1ivR/Cl9JD7Nj7DSYfCANE/CkK+qtGi5DLB9WxTt0HXwN90lG
         9eDo7bbfD5r+Q7K5te8zJUwQ7c/4sLZ4FEMxZxcnC46QN5y/CGbFgDgFYx7YCGBVJEDu
         QZT4lrUcwgKV6x8Z/Tbrp6M8xTI13Juvyep88lWnnH3lGu5+6DtrQVJSosOGB15JROO2
         1BW1s4XvC0d3OdxDE2OWKckdxmy9wCxiOXihH5k1vEHf9NGxyq8ZK/OTMdEhvhCp3n9/
         nT6eoOwHu0zc4nOS6vSyrs1AG4YU2HxZ5z6RXpIaeHaNk4i9kH2sxEFJPeSQhL4caLFm
         PrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Bn+l2Wf/udyhGlzXiaSqVzyU1KUJVXlbjswoz1SSVPI=;
        b=iObkW4FyuQQy8fM8P401AvyXmzUckUk+TEBImnWThgZHGynSb727e053+4Hw0BebkQ
         ShfjW3XjJaLZSzHCqP+Lf6hzVqn7bKAfSHiv+xnVcmQ0TigMjIuKQtB74QJHjBGEMXx+
         Qv1b/OtNJsPnWjbCLY/puFQFcDpUfbtBwZEDmjYWE+z06z2RkHm08ikrSIhAu82insPn
         pyrrK2AWc/09JbYo6924ZwhbO5Ce9Wn1wfEA3JDGGB7ndH42Ea2a/Bl4Ws++Kx4mm3gB
         WxiKoCMtSmx3DrcQRvdIewobjcVqs2CRUKUdw1K+OV/Hhszq9ngtn3v439EkgAj+CkhP
         Y9zw==
X-Gm-Message-State: APjAAAVQAhUh2U2sW06sppgxE/eNmqvBJH+eVwX7vXFs/zakH7FH8B8B
        a1r8GnxJrHmeFJkJakJTJ23RCg==
X-Google-Smtp-Source: APXvYqz8IHkZ+KMun88d98El+sWtlJ2+nFsVuMX3hoNljvu/FT5dVZKPbVu8aRFB2F+eF7342Kfzsw==
X-Received: by 2002:a05:600c:295:: with SMTP id 21mr7306267wmk.43.1574188453718;
        Tue, 19 Nov 2019 10:34:13 -0800 (PST)
Received: from google.com ([100.105.32.75])
        by smtp.gmail.com with ESMTPSA id l10sm31930113wrg.90.2019.11.19.10.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 10:34:12 -0800 (PST)
Date:   Tue, 19 Nov 2019 19:34:07 +0100
From:   Marco Elver <elver@google.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: linux-next: Tree for Nov 19 (kcsan)
Message-ID: <20191119183407.GA68739@google.com>
References: <20191119194658.39af50d0@canb.auug.org.au>
 <e75be639-110a-c615-3ec7-a107318b7746@infradead.org>
 <CANpmjNMpnY54kDdGwOPOD84UDf=Fzqtu62ifTds2vZn4t4YigQ@mail.gmail.com>
 <fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 19 Nov 2019, Randy Dunlap wrote:

> On 11/19/19 8:12 AM, Marco Elver wrote:
> > On Tue, 19 Nov 2019 at 16:11, Randy Dunlap <rdunlap@infradead.org> wrot=
e:
> >>
> >> On 11/19/19 12:46 AM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20191118:
> >>>
> >>
> >> on x86_64:
> >>
> >> It seems that this function can already be known by the compiler as a
> >> builtin:
> >>
> >> ../kernel/kcsan/core.c:619:6: warning: conflicting types for built-in =
function =E2=80=98__tsan_func_exit=E2=80=99 [-Wbuiltin-declaration-mismatch]
> >>  void __tsan_func_exit(void)
> >>       ^~~~~~~~~~~~~~~~
> >>
> >>
> >> $ gcc --version
> >> gcc (SUSE Linux) 7.4.1 20190905 [gcc-7-branch revision 275407]
> >=20
> > Interesting. Could you share the .config? So far I haven't been able
> > to reproduce.
>=20
> Sure, it's attached.

Thanks, the config did the trick, even for gcc 9.0.0.

The problem is CONFIG_UBSAN=3Dy. We haven't explicitly disallowed it like
with KASAN. In principle there should be nothing wrong with KCSAN+UBSAN.

There are 3 options:
1. Just disable UBSAN for KCSAN, and also disable KCSAN for UBSAN.
2. Restrict the config to not allow combining KCSAN and UBSAN.
3. Leave things as-is.

Option 1 probably makes most sense, and I'll send a patch for that
unless there are major objections.

> > I can get the warning if I manually add -fsanitize=3Dthread to flags for
> > kcsan/core.c (but normally disabled via KCSAN_SANITIZE :=3D n). If
> > possible could you also share the output of `make V=3D1` for
> > kcsan/core.c?
>=20
> here:

>   gcc -Wp,-MD,kernel/kcsan/.core.o.d  -nostdinc -isystem /usr/lib64/gcc/x=
86_64-suse-linux/7/include -I../arch/x86/include -I./arch/x86/include/gener=
ated -I../include -I./include -I../arch/x86/include/uapi -I./arch/x86/inclu=
de/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../=
include/linux/kconfig.h -include ../include/linux/compiler_types.h -D__KERN=
EL__ -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-a=
liasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-decl=
aration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-sse -=
mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=3D1 -falign-loops=
=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3D3 -mskip-ra=
x-setup -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel -DCONFIG_AS_CFI=3D=
1 -DCONFIG_AS_CFI_SIGNAL_FRAME=3D1 -DCONFIG_AS_CFI_SECTIONS=3D1 -DCONFIG_AS=
_SSSE3=3D1 -DCONFIG_AS_AVX=3D1 -DCONFIG_AS_AVX2=3D1 -DCONFIG_AS_AVX512=3D1 =
-DCONFIG_AS_SHA1_NI=3D1 -DCONFIG_AS_SHA256_NI=3D1 -Wno-sign-compare -fno-as=
ynchronous-unwind-tables -fno-delete-null-pointer-checks -Wno-frame-address=
 -Wno-format-truncation -Wno-format-overflow -O2 --param=3Dallow-store-data=
-races=3D0 -Wframe-larger-than=3D2048 -fno-stack-protector -Wno-unused-but-=
set-variable -Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-fr=
ame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -Wdec=
laration-after-statement -Wvla -Wno-pointer-sign -fno-strict-overflow -fno-=
merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -We=
rror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-=
init -fno-conserve-stack -fno-stack-protector  -fprofile-arcs -ftest-covera=
ge -fno-tree-loop-im -Wno-maybe-uninitialized    -fsanitize=3Dshift  -fsani=
tize=3Dinteger-divide-by-zero  -fsanitize=3Dunreachable  -fsanitize=3Dsigne=
d-integer-overflow  -fsanitize=3Dbounds  -fsanitize=3Dobject-size  -fsaniti=
ze=3Dbool  -fsanitize=3Denum  -Wno-maybe-uninitialized   -I ../kernel/kcsan=
 -I ./kernel/kcsan    -DKBUILD_BASENAME=3D'"core"' -DKBUILD_MODNAME=3D'"cor=
e"' -c -o kernel/kcsan/core.o ../kernel/kcsan/core.c
> ../kernel/kcsan/core.c:619:6: warning: conflicting types for built-in fun=
ction =E2=80=98__tsan_func_exit=E2=80=99 [-Wbuiltin-declaration-mismatch]

Adding '-fsanitize=3D<anything>' seems to make gcc think that these are
builtins. So this is partially also a gcc problem, but if we disable all
sanitizers with the runtime, then this goes away.

Thanks,
-- Marco
