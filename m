Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2451A39F772
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 15:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232775AbhFHNSg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 09:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhFHNSg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 09:18:36 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD39C061787;
        Tue,  8 Jun 2021 06:16:28 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id r5so32092631lfr.5;
        Tue, 08 Jun 2021 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/PdaUTb+rUg5ur++SpKYiw2joB3HKEA1rOqeSBAWksA=;
        b=CE8iuxgCHuRWaZA4qwJXJzCuSannhhSj9aCTl1MMTNq6V/CdbrhWdgv+aK7qdsMxLg
         YvMQbAvNAK1MJHg9qbdrmovmw+5Vi9tEq3xukBUIbbemu4lZMmMDqP4TLb1kKPON+rKW
         OMajHBbl+yM1T43eQCVQicXeZi4ng+g/h158E9Je9UR1dqpp4KAWatAwh/GGXLLDPqNR
         sH+L9H4RRu7m/yLcJtAYilX8MPxaC57aLx9xWoMg4nAkh7b64t+DmSDLfYohEjDV1fO/
         zEnatM82enfeAQASf9t6Zt7L5B1llg60YmiFyf4IcQOoaSDmTfYheqyeGrNTI2gTE4/b
         ejnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/PdaUTb+rUg5ur++SpKYiw2joB3HKEA1rOqeSBAWksA=;
        b=oAWaaClMkdxTLUqcrUkbgZ97+pjG7lSsJ95pxJugHGQcUe4fqCOKcxzAQ8MPrcW590
         /IsHvtgGbghdGexAktxlwNJs05xckzCgL+055cWNMxnL1gNaC8fz/bTa5Q5ouXOdu5SY
         cj/uTUt/w74pXu7D5nUJvfF7JVA5SZVE/QoSNi6dXedI2h+oBLiLFOJ046MmNyDrGS17
         IxMqVEE01y8+y0WgVEaare5SbJ+23LYfCV1umEDTvE+nK1TJ69XtJcAsf5crdSWN/Bbk
         MKS/Oj9RhQJuxOlXeI7ocS0W5XBBNq53SRoGpSW6wcMs4J9ugXpeUxdL8rXbp0YsTvQO
         /Vfw==
X-Gm-Message-State: AOAM531WdwhcqFcP6EGvExmJKrhkfqaWsNl4ckzBLOk9kkNFqqisrQW5
        j46UeKno9JW5EQSuQsv5zK3ZWXz9M4K6iLgKyyQ=
X-Google-Smtp-Source: ABdhPJzs5yqBCi+TgT2UUYjGlHJMzPQdqh4UeFmvSO/k955CS4DBYYpx0sgXMyKI1rfLg6kS1kh578vwbydxab+llqI=
X-Received: by 2002:a05:6512:3694:: with SMTP id d20mr7234682lfs.184.1623158185318;
 Tue, 08 Jun 2021 06:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210608202748.06334136@canb.auug.org.au> <CANFS6baQi_PDM+4XHNn6MnFtmvbP3JUDJJgw7fvkGDYja4=ELg@mail.gmail.com>
In-Reply-To: <CANFS6baQi_PDM+4XHNn6MnFtmvbP3JUDJJgw7fvkGDYja4=ELg@mail.gmail.com>
From:   Steve French <smfrench@gmail.com>
Date:   Tue, 8 Jun 2021 08:16:14 -0500
Message-ID: <CAH2r5mstMzq78NydjbkX4goJD1j0pzsvi1fAnLfTZbuNvuFvog@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the cifs tree
To:     Hyunchul Lee <hyc.lee@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Namjae Jeon <namjae.jeon@samsung.com>,
        Namjae Jeon <linkinjeon@kernel.org>,
        CIFS <linux-cifs@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

I will back out your patch to cifs.ko

On Tue, Jun 8, 2021 at 5:53 AM Hyunchul Lee <hyc.lee@gmail.com> wrote:
>
> Hello,
>
> 2021=EB=85=84 6=EC=9B=94 8=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 7:27, =
Stephen Rothwell <sfr@canb.auug.org.au>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
> >
> > Hi all,
> >
> > After merging the cifs tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >
> > ld: fs/cifsd/spnego_negtokeninit.asn1.o:(.rodata.spnego_negtokeninit_de=
coder+0x0): multiple definition of `spnego_negtokeninit_decoder'; fs/cifs/s=
pnego_negtoken
> > init.asn1.o:(.rodata.spnego_negtokeninit_decoder+0x0): first defined he=
re
> > ld: fs/cifsd/asn1.o:(.opd+0xa8): multiple definition of `gssapi_this_me=
ch'; fs/cifs/asn1.o:(.opd+0x18): first defined here
> > ld: fs/cifsd/asn1.o: in function `.gssapi_this_mech':
> > asn1.c:(.text.gssapi_this_mech+0x0): multiple definition of `.gssapi_th=
is_mech'; fs/cifs/asn1.o:asn1.c:(.text.gssapi_this_mech+0x0): first defined=
 here
> > ld: fs/cifsd/asn1.o:(.opd+0xc0): multiple definition of `neg_token_init=
_mech_type'; fs/cifs/asn1.o:(.opd+0x30): first defined here
> > ld: fs/cifsd/asn1.o: in function `.neg_token_init_mech_type':
> > asn1.c:(.text.neg_token_init_mech_type+0x0): multiple definition of `.n=
eg_token_init_mech_type'; fs/cifs/asn1.o:asn1.c:(.text.neg_token_init_mech_=
type+0x0): first defined here
> >
> > Caused by commit
> >
> >   4a957ba6daf6 ("cifs: decoding negTokenInit with generic ASN1 decoder"=
)
>
> I missed functions and structures generated from the ASN1 compiler
> aren't static.
>
> Steve, and Namjae,
> We need to rename *.asn1 files and decoder's callback functions. Is it be=
tter
> to change cifs's code?
>
> Thanks,
> Hyunchul
>
> >
> > interacting with commit
> >
> >   fad4161b5cd0 ("cifsd: decoding gss token using lib/asn1_decoder.c")
> >
> > from the cifsd tree.
> >
> > I have reverted that cifs tree commit for today.
> >
> > --
> > Cheers,
> > Stephen Rothwell



--=20
Thanks,

Steve
