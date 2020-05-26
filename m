Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEC31E2212
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 14:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389185AbgEZMlV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 08:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388675AbgEZMlT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 08:41:19 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C36C03E96E
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 05:41:19 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id p12so15900654qtn.13
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 05:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=Xh3pExmVkt8bZc1uS7lrd2mrVek8AS7U3TEQw0JwpIU=;
        b=nv+sB7dOHnON86Ux7BfVzKeMq5qmWXYjshSbUtztHcV2bh39qOI9HHMCttzQo3Vcxj
         Nw9FcPfSGLSGV1UeGvj3Rv7GvqCLpsLamgDtJjek5Z2Q52Iqc3MkKcOtxMGXsz2OavL9
         Smk5TpwN71EQU/C85k3DJ+idsE+7BQ9RbeZnjQG04w9PKuXf3uO4qfLxznbGjlfuzIM/
         P0KeJFGCGGM/px+py0kVlwSVwPq13IWOkDDWa6ATE0gwkWuEQDnbsFufxflM+KetcI0V
         HGw3xqa7J7O6/q/Ol2dpbZwCYokki74JmM4/3+I8sk7zKjTwW1yKOgch3+PrbXxwRx5a
         LdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=Xh3pExmVkt8bZc1uS7lrd2mrVek8AS7U3TEQw0JwpIU=;
        b=UV/m1rTVqkqVBDEcLXIGUOn6+p1rXHPjmOtW84saFnOWPA0aFAPayXi2I/ShblcVIB
         D+6tUsaXnJkHKRA4pdwB0BRzrm9wR6k3dupvGeap+hSeUEuveKLiOwuSMXrpGGzDhdij
         1CpcZU+y7cWnZwWyhCppKr3Lrhmp0lYhyrFWq+gBFdccicoMmu32kooO+hwz85Ogr8wP
         PePOc1drUjaNhbNZ59lHlpDYckJ1/xWarvSX67uUXyEz97QBoxWl9Acy1S9dwDsa/mpa
         MBWi+7LDl8ypWX2JYseGWh/AiHzmKxZC8QUvFPTNF3MsCSww8UGK4ex/ZGuxT2eBk6Qt
         ue/Q==
X-Gm-Message-State: AOAM531+R8HIaZktrqldONtxf+Dl9qvopBy6kbO891zgLtJu6ucC3uua
        EkMGnbY625IDoiA2YoZQoD0frQ==
X-Google-Smtp-Source: ABdhPJxEcaN9Hb9GI1QllH3utZeghc1M/xXaPn2E8ov4F1V30C4zuMwrKaYqJYy/9gIcpyAPsSLN7Q==
X-Received: by 2002:ac8:2f64:: with SMTP id k33mr990830qta.105.1590496878831;
        Tue, 26 May 2020 05:41:18 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id k3sm16940389qkb.112.2020.05.26.05.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 05:41:18 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: linux-next build error (8)
Date:   Tue, 26 May 2020 08:41:17 -0400
Message-Id: <37C9957E-40A6-4C29-95FC-D982BABD26F6@lca.pw>
References: <CACT4Y+azkizw6QA0VCr0wv93oSkgaYCPc4txy9M=ivgBot1+zg@mail.gmail.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs <linux-xfs@vger.kernel.org>,
        syzbot <syzbot+792dec47d693ccdc05a0@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
In-Reply-To: <CACT4Y+azkizw6QA0VCr0wv93oSkgaYCPc4txy9M=ivgBot1+zg@mail.gmail.com>
To:     Dmitry Vyukov <dvyukov@google.com>
X-Mailer: iPhone Mail (17E262)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On May 26, 2020, at 8:28 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
>=20
> Crashes (4):
> Manager Time Kernel Commit Syzkaller Config Log Report Syz repro C repro
> ci-upstream-linux-next-kasan-gce-root 2020/05/22 01:23 linux-next
> e8f32747 5afa2ddd .config log report
> ci-upstream-linux-next-kasan-gce-root 2020/05/21 15:01 linux-next
> e8f32747 1f30020f .config log report
> ci-upstream-linux-next-kasan-gce-root 2020/05/19 18:24 linux-next
> fb57b1fa 6d882fd2 .config log report
> ci-upstream-linux-next-kasan-gce-root 2020/03/18 16:19 linux-next
> 47780d78 0a96a13c .config log report

You=E2=80=99ll probably need to use an known good kernel version. For exampl=
e, a stock kernel or any of a mainline -rc / GA kernel to compile next-20200=
526 and then test from there.=
