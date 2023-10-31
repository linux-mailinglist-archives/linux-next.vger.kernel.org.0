Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8B357DCD1D
	for <lists+linux-next@lfdr.de>; Tue, 31 Oct 2023 13:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344290AbjJaMnf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Oct 2023 08:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344275AbjJaMne (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Oct 2023 08:43:34 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B97DB7
        for <linux-next@vger.kernel.org>; Tue, 31 Oct 2023 05:43:32 -0700 (PDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C28DF3F129
        for <linux-next@vger.kernel.org>; Tue, 31 Oct 2023 12:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1698756208;
        bh=TWlHvfqzW08hhviWU907m+JvbPrmK9OV3LEKQy9qTqk=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=X1Yxp6Nbduw78mjXk4T79OCXPAn0cR9uqmp38Clh+DZCvWQJ41rDdPULYn9OcccYS
         EjMjn7ELGapEZ7Cre4/lbLLv6hCDTbRaVuExPgj/+7VyBXsOZ8dvyZCE1nzY1f2eIk
         CZJB+VqyxBlVwEBWhDrepzQNq6fQh4xtkKZiMwQlB3H81tgPbKs51JyjqfbKKUHLoC
         T900jWG9uV+dqMREX/Vqg3fZqA3xNzO0Geh43pBVWhcbybHzpf4J0kg15NgIE6/JIb
         fLIV1tj+20hw5AanBu1DP1bqyrZXoEYkN4bEmZbv57IXxXdSDf1vO6+zK+8vFKX3mt
         eLsAzBwMNkUxw==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-407da05ee50so39969105e9.0
        for <linux-next@vger.kernel.org>; Tue, 31 Oct 2023 05:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698756208; x=1699361008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWlHvfqzW08hhviWU907m+JvbPrmK9OV3LEKQy9qTqk=;
        b=qKt85Npm2NFnQ0prdyySTxFx2vWTB9oTI778e1v4cU4DC9QNDgVqXx/sDVfWeCyFgS
         DtdAx6AIOyri2Hzg6YR1EoAQvDWTNW7QIjs4Rb/Ls8sYOnqTkOzL6wCxhFIryd4KIIT3
         48uQHpTxeStdY8+S4kAYdnEIzX1UH4gyEKDEKL3xkiwZx8yG+9UGwGdaZ7h8yQdzVjne
         PyePG/hCQvp4WTuu9quyZ0O/KyENamGZwluOmC3ywOS+b35fGdtVV2r71CWgmFmmfA6Q
         S6XJu+vmgyEmUseMrx39CQAW7icqJRzTa0jTMIb9DemnZv66zZc3TqAEWDT3pJxT1Xfw
         4ISQ==
X-Gm-Message-State: AOJu0YxqCOtJKcWeXiXx7TbATznj2XIBwwGTQC7k++84WMa2VubocmsD
        xp7Ucg4zs3+fcSfFjoKLh9FZ+0+lXq8f5MWM/ueEUZPAxlXCaNy3pHcFfpAczc6Yn0BiWOoq/ns
        Uta43RuqJqqgTWMGycs7x+3WShLOBYZYXKbIskYfr5mfbkBhPdCTTfGg=
X-Received: by 2002:a05:6000:2cb:b0:32f:7f2c:de2e with SMTP id o11-20020a05600002cb00b0032f7f2cde2emr7611014wry.36.1698756208345;
        Tue, 31 Oct 2023 05:43:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Bt006mBK17Bc+TrTxp8GQwF9PfVFIAW7TfjXGIuFHSfstzZosDHrkRwJhCuJGaEX2N4iuuxX+GvsjnIAIR8=
X-Received: by 2002:a05:6000:2cb:b0:32f:7f2c:de2e with SMTP id
 o11-20020a05600002cb00b0032f7f2cde2emr7611001wry.36.1698756208055; Tue, 31
 Oct 2023 05:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <2721FCA5-6113-4B2E-8DA9-893105EE966C@linux.ibm.com>
In-Reply-To: <2721FCA5-6113-4B2E-8DA9-893105EE966C@linux.ibm.com>
From:   Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date:   Tue, 31 Oct 2023 14:42:52 +0200
Message-ID: <CADWks+a9UJM9trjJf-VOi21rfA9eetXP8KPyThqP56kKpZ-yug@mail.gmail.com>
Subject: Re: [ppc64le] WARN at crypto/testmgr.c:5804
To:     Sachin Sant <sachinp@linux.ibm.com>
Cc:     linux-crypto@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 31 Oct 2023 at 14:09, Sachin Sant <sachinp@linux.ibm.com> wrote:
>
> Following warning is observed during boot of latest -next
> kernel (6.6.0-rc7-next-20231030 and todays -next) on IBM Power server.
>
> [ 0.085775] workingset: timestamp_bits=3D38 max_order=3D20 bucket_order=
=3D0
> [ 0.085801] zbud: loaded
> [ 0.086473] ------------[ cut here ]------------
> [ 0.086477] WARNING: CPU: 23 PID: 211 at crypto/testmgr.c:5804 alg_test.p=
art.33+0x308/0x740
> [ 0.086486] Modules linked in:
> [ 0.086489] CPU: 23 PID: 211 Comm: cryptomgr_test Not tainted 6.6.0-rc7-n=
ext-20231030 #1
> [ 0.086493] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 =
of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
> [ 0.086497] NIP: c000000000765068 LR: c000000000764ff4 CTR: c00000000075d=
a00
> [ 0.086500] REGS: c00000000ed7bb50 TRAP: 0700 Not tainted (6.6.0-rc7-next=
-20231030)
> [ 0.086503] MSR: 8000000000029033 <SF,EE,ME,IR,DR,RI,LE> CR: 80000284 XER=
: 20040002
> [ 0.086511] CFAR: c000000000765318 IRQMASK: 1
> GPR00: c000000000764ff4 c00000000ed7bdf0 c000000001482000 000000000000000=
2
> GPR04: c00000000ed7be60 000000000000000e 000000000000002f fffffffffffe000=
0
> GPR08: 0000ff000000ffff 0000000000000001 0000000000000008 000000000000000=
0
> GPR12: c00000000075da00 c000000aa7cec700 c00000000019da88 c000000006df9cc=
0
> GPR16: 0000000000000000 0000000000000000 c000000001309f98 000000000000000=
0
> GPR20: c000000001308d50 c000000001308d98 c000000000ffeaf0 c000000001309fb=
0
> GPR24: c000000000ffb330 c000000000ffdf30 0000000000000400 c000000019bfd48=
0
> GPR28: 0000000000000002 c000000019bfd400 c000000002bcf633 000000000000000=
e
> [ 0.086547] NIP [c000000000765068] alg_test.part.33+0x308/0x740
> [ 0.086552] LR [c000000000764ff4] alg_test.part.33+0x294/0x740
> [ 0.086556] Call Trace:
> [ 0.086557] [c00000000ed7bdf0] [c000000000764ff4] alg_test.part.33+0x294/=
0x740 (unreliable)
> [ 0.086563] [c00000000ed7bf60] [c00000000075da34] cryptomgr_test+0x34/0x7=
0
> [ 0.086568] [c00000000ed7bf90] [c00000000019dbb8] kthread+0x138/0x140
> [ 0.086573] [c00000000ed7bfe0] [c00000000000df98] start_kernel_thread+0x1=
4/0x18
> [ 0.086578] Code: fb210138 fb810150 3af76d20 3b80ffff 3a526d38 3a946d50 3=
ab56d98 3b380040 3ad837c0 2f9c0000 7d301026 5529f7fe <0b090000> 7f890034 55=
29d97e 419d03a4
> [ 0.086589] ---[ end trace 0000000000000000 ]---
> [ 0.086592] testmgr: alg_test_descs entries in wrong order: 'pkcs1pad(rsa=
,sha512)' before 'pkcs1pad(rsa,sha3-256)=E2=80=99
>
> Git bisect points to following patch:
> commit ee62afb9d02dd279a7b73245614f13f8fe777a6d
>     crypto: rsa-pkcs1pad - Add FIPS 202 SHA-3 support
>
> - Sachin

Patch to address this was submitted at
https://lore.kernel.org/all/20231027195206.46643-1-ebiggers@kernel.org/
and should address this issue.

--
okurrr,

Dimitri
