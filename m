Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA3B102903
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 17:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbfKSQM3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 11:12:29 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33008 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbfKSQM3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 11:12:29 -0500
Received: by mail-ot1-f66.google.com with SMTP id u13so18362683ote.0
        for <linux-next@vger.kernel.org>; Tue, 19 Nov 2019 08:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=93xPAx0kr8oA76/KRE4IYmxNgzvAosH5EkrlivRRC2U=;
        b=ClXF5T0QxswAmDjTXcrbHV0f5l5bHz9bFxuqQNGTRVsW8inASFtA15n5Q0gITA42Of
         WgZN0aHjFmC6TN6uc8Gib2Pd1f01ywaANFiRL7pkzhH3jBHjqPKLbp6v+zlMlV1Ec3XN
         oRRrF7om7Wdk9uZtEojsxLcJ61ZUtzGYbriIOnJP4/9zx44D0YJ9RfxA+RjXf8MLdLDx
         yqRapjPsXz/Q+H56teNhxpYtQHXNVs2YDiNfANeT3MsEeYYBfn6Ws5BdP15QGgT5R5aT
         5ryXoz2JRGvyekdRsLNFqq7IaU0O0IUd7jjMqDgDzF9lxfNQvNOb1DzOyxZYm46JPxsZ
         r0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=93xPAx0kr8oA76/KRE4IYmxNgzvAosH5EkrlivRRC2U=;
        b=GjJgfNf0sI1eoVoIkJLfCMlIjZRj7QFgXl9mUC6IJydE8ZjlZ4E8qEO9XiyfN4U9Ni
         N4zzwCzrcgrNTEDQML7PmvoGsRxG4S7MYZnssiZvqWz1m+Th7HsuEksYJRDGVtEJKoUp
         J7F1LmQ4YxAMU7SxT0qICr1FSTLg2EPFPSa26wPTx8F+vIlMcmgpaZ2OJ6Dg6nJsq9pI
         TJ+bsPZVGzyM0mB0p9KqVhFv1+x+D7vc6scP7eKZnTK9tliuunf7GJpfiQmQtumv2AYY
         sV12Y+dQvOH3qNWmAaeTaXiVAsb3/hsuSnLt9jUVxp++8IoB5qTX/47xs7jU+Eb6HPkh
         qpNw==
X-Gm-Message-State: APjAAAXfFZ1xhoHmlkT8azaEr8r7++R/rLpiS68ZR5D3bAdn1Vu90caB
        6OSKY8PI1ZoF3J8zONmoD/P9P4FF1PWrbnWrEt78sQ==
X-Google-Smtp-Source: APXvYqyNp6UfNZXhM0FdbL81rw15qBOyGaU0VI2pZSScFreylKhSOdolblkQZ/c92fphjqt26+PkucVplQLTOd86c1c=
X-Received: by 2002:a9d:69cf:: with SMTP id v15mr4108901oto.251.1574179947889;
 Tue, 19 Nov 2019 08:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20191119194658.39af50d0@canb.auug.org.au> <e75be639-110a-c615-3ec7-a107318b7746@infradead.org>
In-Reply-To: <e75be639-110a-c615-3ec7-a107318b7746@infradead.org>
From:   Marco Elver <elver@google.com>
Date:   Tue, 19 Nov 2019 17:12:16 +0100
Message-ID: <CANpmjNMpnY54kDdGwOPOD84UDf=Fzqtu62ifTds2vZn4t4YigQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 19 (kcsan)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 19 Nov 2019 at 16:11, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/19/19 12:46 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20191118:
> >
>
> on x86_64:
>
> It seems that this function can already be known by the compiler as a
> builtin:
>
> ../kernel/kcsan/core.c:619:6: warning: conflicting types for built-in fun=
ction =E2=80=98__tsan_func_exit=E2=80=99 [-Wbuiltin-declaration-mismatch]
>  void __tsan_func_exit(void)
>       ^~~~~~~~~~~~~~~~
>
>
> $ gcc --version
> gcc (SUSE Linux) 7.4.1 20190905 [gcc-7-branch revision 275407]

Interesting. Could you share the .config? So far I haven't been able
to reproduce.

I can get the warning if I manually add -fsanitize=3Dthread to flags for
kcsan/core.c (but normally disabled via KCSAN_SANITIZE :=3D n). If
possible could you also share the output of `make V=3D1` for
kcsan/core.c?

Thanks,
-- Marco

> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
