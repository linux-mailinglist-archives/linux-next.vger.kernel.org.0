Return-Path: <linux-next+bounces-183-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8963800A7D
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 13:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2885281C40
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 12:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F57219F0;
	Fri,  1 Dec 2023 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJq8zE9u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7801B4;
	Fri,  1 Dec 2023 04:09:58 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-548ce39b101so2494644a12.2;
        Fri, 01 Dec 2023 04:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701432597; x=1702037397; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tM0n3Y6xTLUW1LbC1sKWoxZFHKPZzl3gYbwXIj2nkjs=;
        b=UJq8zE9u6Yj77mATdCnW4CDVnDP58lBlZSf2EHDMqIrLcrifWjMZzf3E0zUEOa/SRw
         2UFQuwNXs+kTfu8PTnqAclpYEeYdNgHuqjXdFgRHmcHWrYUHBTbfzMf0Is/CiRivYbAu
         a2O7K+B42BVd/cPBI48Bd0jeKfgg9s0H9mvA0Zt3p3Nn9FABwLiF21nqqfoSg0RKUIsP
         psLAX6Qi+T9L8U0S1tb0103C1b1Pk+kXPFHyj+izeMuEeusFKS5SPy8hSG9cn18YkUw4
         bx4o9QU+eCwHqn16ArUigP7FFcQikJ9zc5On4qGU3UsORAiboZoYu/rlpbIRGND3Ctv1
         eMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701432597; x=1702037397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tM0n3Y6xTLUW1LbC1sKWoxZFHKPZzl3gYbwXIj2nkjs=;
        b=d6fXC20ar7Pk1NIwRMGQnJymad/VEuR0jfSL99/WqluKL1uwZkhvdytJZRnEnMD78h
         o39t3i95Z6ASAAhemGOaSXt4a5dD+QM56UZ18x1v0No0/eEjUMArzsxe8+EN7yzgC6qA
         25EwtHyoW8oaDIta/JC036kZNrgUy0A9WXavvmtT3tKx/TRFQiCgma26MpJ6A1EP07lk
         cq6jcIl6bGmqlUnFo4PZIEHtOTv9S7O4nY6iATKfke2QFLQDz3nKQm5X/jN9vYbk8wo9
         y0clnEqSfissqSPG7D2BzkFfHbFB5u+ZJ29sFg5fQZ4gQI5SFx6aj8JKFd65XOFrEX8f
         DRAw==
X-Gm-Message-State: AOJu0Ywfer4kTgQ4MJ8nTiSmYIfSRdx4Q/zXcwfUalXIQmifWeeZ+GuE
	uilcnJLdZtIkESz5PSxaoOHQSmjf8R+Khnvvja711VsrYgEI6Q==
X-Google-Smtp-Source: AGHT+IG6l8CydT+xlPioZMr6PI74LaHtookwuNw8jD5Uv1PVXOGK34DCfwK/7nFg+2QoJEcDF9Fh72X6nRhX8bmdE9k=
X-Received: by 2002:a50:bb46:0:b0:54c:5f4a:3129 with SMTP id
 y64-20020a50bb46000000b0054c5f4a3129mr271962ede.90.1701432597222; Fri, 01 Dec
 2023 04:09:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201112918.294b40b1@canb.auug.org.au>
In-Reply-To: <20231201112918.294b40b1@canb.auug.org.au>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 1 Dec 2023 13:09:45 +0100
Message-ID: <CAFULd4Yfh0=TkhoevuJP1kghP5VLFj2zP9av68_s2pez3n2iog@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000912e8b060b71a583"

--000000000000912e8b060b71a583
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 1:29=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig=
)
> produced these warnings:
>
> WARNING: modpost: EXPORT symbol "const_pcpu_hot" [vmlinux] version genera=
tion failed, symbol will not be versioned.
> Is "const_pcpu_hot" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: "const_pcpu_hot" [arch/x86/kernel/msr.ko] has no CRC!
> WARNING: modpost: "const_pcpu_hot" [arch/x86/kvm/kvm.ko] has no CRC!

My build doesn't produce any warnings. A defconfig + enabling kvm.ko as mod=
ule:

...
 AR      built-in.a
 AR      vmlinux.a
 LD      vmlinux.o
 OBJCOPY modules.builtin.modinfo
 GEN     modules.builtin
 MODPOST Module.symvers
 CC      .vmlinux.export.o
 CC [M]  arch/x86/kvm/kvm.mod.o
 CC [M]  fs/efivarfs/efivarfs.mod.o
...

Does the attached patch help? Or is there anything else I should do to
trigger the above problem?

Thanks,
Uros.

--000000000000912e8b060b71a583
Content-Type: text/plain; charset="US-ASCII"; name="p.diff.txt"
Content-Disposition: attachment; filename="p.diff.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_lpml123g0>
X-Attachment-Id: f_lpml123g0

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9jcHUvY29tbW9uLmMgYi9hcmNoL3g4Ni9rZXJu
ZWwvY3B1L2NvbW1vbi5jCmluZGV4IDRkNGI4N2M2ODg1ZC4uMTI3N2Q0ZTBhYTQyIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L2NvbW1vbi5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9j
cHUvY29tbW9uLmMKQEAgLTIwNTYsNyArMjA1Niw3IEBAIERFRklORV9QRVJfQ1BVX0FMSUdORUQo
c3RydWN0IHBjcHVfaG90LCBwY3B1X2hvdCkgPSB7CiAJLnRvcF9vZl9zdGFjawk9IFRPUF9PRl9J
TklUX1NUQUNLLAogfTsKIEVYUE9SVF9QRVJfQ1BVX1NZTUJPTChwY3B1X2hvdCk7Ci1FWFBPUlRf
UEVSX0NQVV9TWU1CT0woY29uc3RfcGNwdV9ob3QpOworRVhQT1JUX1NZTUJPTChjb25zdF9wY3B1
X2hvdCk7CiAKICNpZmRlZiBDT05GSUdfWDg2XzY0CiBERUZJTkVfUEVSX0NQVV9GSVJTVChzdHJ1
Y3QgZml4ZWRfcGVyY3B1X2RhdGEsCg==
--000000000000912e8b060b71a583--

