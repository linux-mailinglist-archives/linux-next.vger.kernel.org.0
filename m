Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12421B24F4
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 13:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbgDULVw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Apr 2020 07:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgDULVu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2020 07:21:50 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C85C061A10
        for <linux-next@vger.kernel.org>; Tue, 21 Apr 2020 04:21:50 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id bu9so6301120qvb.13
        for <linux-next@vger.kernel.org>; Tue, 21 Apr 2020 04:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=kNM2KRkAMSsc+pYLKtlKu09j47YU3pGF6ToSVV1GC2A=;
        b=j/6HQPLHk6ynL/FoB4R7yMl5t9W90U39EGGlAjJdv3xTVLAGO1U3fwtR876zviUMgS
         8h19VkOF136hk6Kyq+tM4kn+M4lYQ5SozOlH39NpV9v5nmttnocXoC+YaoiEJE5/p02I
         1iSnlkan6Hr5DiOqZoHCgxS5KWE0xbJ6uSN73gAhfr7MuJBmDX8J4oldsj9jWdCiK/BQ
         BITOyFoOFwJuRR9ZpmxV7fI7yEIX2/C19JDFdOKYGaCavcKouLbSOWDD0gJq4NShxH3I
         YSzGbmqOUGUhXfIowlrMH/xBmwuVg3pcvOEKpTteoYRaw5IPqLzES5e2e7ptjMBWlOFB
         Gltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=kNM2KRkAMSsc+pYLKtlKu09j47YU3pGF6ToSVV1GC2A=;
        b=TEALr90EZp6WzPcivTbXTBOnUqxvvC566NTLCqS0mC0qvVb18B/k68F4rayIq/o0Qv
         +MIPPOR6xCSlBpb32NMLcFVxXoZmAnITvdNzNzUwrwMvZ6rh7yxqWxwARQ5nhlccCCZ2
         3/+0Ju0xFOy0iVjTxz0gUIJbzRzH3eLqPaM0xG5gtlpqNGpJHcKnby5pI0494iutrdbS
         +6vx5MxW1OioBhskINtuKa5Ys5x7fMEmFf/nXlveZaTvHxgd/AYqn/KxfPgPwKgalfmw
         0B5TjqFzRJs7jpV7/UtlW5f1JGxxFjsJTofNWOSiEifz2AgcEC/DNVNjf41y3hse1Dkj
         +xvg==
X-Gm-Message-State: AGi0PuZfNmm713/wWX+td/K7D7fcbwJGf1D+cb1X/PGS4Ajdkukm1Xht
        1IbY59vlFQj7/r7y3x3MgzAvaA==
X-Google-Smtp-Source: APiQypIz8KpdLC2geW/BC+9l/tMpLTLdQdGdy4IFB0lhF2Q+hFfDhzRYrnPW8u4g9GZV1E2ef7eESg==
X-Received: by 2002:a0c:b501:: with SMTP id d1mr31042qve.63.1587468110010;
        Tue, 21 Apr 2020 04:21:50 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id i56sm1625973qte.6.2020.04.21.04.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 04:21:49 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: linux-next test error: WARNING: suspicious RCU usage in ipmr_device_event
Date:   Tue, 21 Apr 2020 07:21:48 -0400
Message-Id: <36C7F018-510E-4555-BC6B-42DEB0468CBA@lca.pw>
References: <CACT4Y+ZuGaeyyVsCkqJRo4+0hoMP8Eq_JTuU0L-NFqTrQP_czA@mail.gmail.com>
Cc:     syzbot <syzbot+21f82f61c24a7295edf5@syzkaller.appspotmail.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>, kuba@kernel.org,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        LKML <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
In-Reply-To: <CACT4Y+ZuGaeyyVsCkqJRo4+0hoMP8Eq_JTuU0L-NFqTrQP_czA@mail.gmail.com>
To:     Dmitry Vyukov <dvyukov@google.com>
X-Mailer: iPhone Mail (17D50)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Apr 21, 2020, at 6:51 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
>=20
> +linux-next, Stephen for a new linux-next breakage

I don=E2=80=99t know why you keep sending the same thing over and over again=
 where I replied you just two days ago for the same thing.=
