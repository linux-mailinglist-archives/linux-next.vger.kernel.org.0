Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9285E39F44E
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 12:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbhFHKzZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 06:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhFHKzZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 06:55:25 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89A7C061574;
        Tue,  8 Jun 2021 03:53:21 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id f11so10622454vst.0;
        Tue, 08 Jun 2021 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f5hP7X6WI56JdWoZLZrHxXTsaf70BoFuMh2uY4QI6S4=;
        b=LtYm5V66dJuNk679QaZ5fIyWD337d6fOpiB7Y4mezsS6QugxkFtku5M3hyvsbX5Sys
         ivbLuZ6i2/nMGWsmHKJNaSOBCmLHCpT05UQnAJw+efD7BdKE32+PqvT32ao4q7hE2WAX
         KGXDuc+25FVyAS5YCtByzAyirgdTi/6D0woMJfCDWown50xIYpPig0J/3k8NBOXqYQB8
         E3r05M3F9s1So1sPla51axX4PgtHU831zjeKxu6XOgOpUyYgvOdNn/p68M7umNKjkA3j
         D5IeBzchDKc5uxGVLqNr9kJvMFu6+O+eayxssP+McNCQ5EG9Lf+cRHBNZLlyPuKd3hz0
         owtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f5hP7X6WI56JdWoZLZrHxXTsaf70BoFuMh2uY4QI6S4=;
        b=C/MhfI3vqlJ9qi/enNwyPw/uaEEHwX1Eyc+TTU2BUcTOXHiSpRNE12adcXoB42qpLD
         kIJrtG4Rz9OFqpxT9vIlG/HzBPNK5rLGMlbN2bmFeualn9+904g4q1Vm8KI4FupAINAj
         CgG+uZXHYFGuqaSsICIE5XWjbMQiwPY1bn6DGEgwECZKuocSThiK5NyIRpBMzUZU/isx
         AOJLbRqIrCj7ISKwDuFZ4LTMvwjxeul5mM+tDtK6P3SnMbSLY3CKRj9R2UiM9PAvsDCv
         T+HAWuKYBWBuDGgovdObXsYAR46/60dk6HQ5oMbCM3oWNNoJz4nwrT/Tdwg6lte30ZSt
         AqCQ==
X-Gm-Message-State: AOAM531GyC+GHXonoIQXldth2VQExUsnRqGm/ySMHPFjyFREiwpDkD7E
        iNBqjj1ObAy1UOtTd35GH6BsMkxXqH2gwIBd7vksL1Bqa7A=
X-Google-Smtp-Source: ABdhPJyG59a8KqGRbarb/eR+TeduAtdCFsrlWRNdkI+s3hH8Asm9jcZu7gVPVmO/VwH+PCpBU4daVYl/UUx849iuVMs=
X-Received: by 2002:a67:cd08:: with SMTP id u8mr3988866vsl.18.1623149601020;
 Tue, 08 Jun 2021 03:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210608202748.06334136@canb.auug.org.au>
In-Reply-To: <20210608202748.06334136@canb.auug.org.au>
From:   Hyunchul Lee <hyc.lee@gmail.com>
Date:   Tue, 8 Jun 2021 19:53:09 +0900
Message-ID: <CANFS6baQi_PDM+4XHNn6MnFtmvbP3JUDJJgw7fvkGDYja4=ELg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Steve French <smfrench@gmail.com>,
        Namjae Jeon <namjae.jeon@samsung.com>,
        Namjae Jeon <linkinjeon@kernel.org>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

2021=EB=85=84 6=EC=9B=94 8=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 7:27, St=
ephen Rothwell <sfr@canb.auug.org.au>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi all,
>
> After merging the cifs tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> ld: fs/cifsd/spnego_negtokeninit.asn1.o:(.rodata.spnego_negtokeninit_deco=
der+0x0): multiple definition of `spnego_negtokeninit_decoder'; fs/cifs/spn=
ego_negtoken
> init.asn1.o:(.rodata.spnego_negtokeninit_decoder+0x0): first defined here
> ld: fs/cifsd/asn1.o:(.opd+0xa8): multiple definition of `gssapi_this_mech=
'; fs/cifs/asn1.o:(.opd+0x18): first defined here
> ld: fs/cifsd/asn1.o: in function `.gssapi_this_mech':
> asn1.c:(.text.gssapi_this_mech+0x0): multiple definition of `.gssapi_this=
_mech'; fs/cifs/asn1.o:asn1.c:(.text.gssapi_this_mech+0x0): first defined h=
ere
> ld: fs/cifsd/asn1.o:(.opd+0xc0): multiple definition of `neg_token_init_m=
ech_type'; fs/cifs/asn1.o:(.opd+0x30): first defined here
> ld: fs/cifsd/asn1.o: in function `.neg_token_init_mech_type':
> asn1.c:(.text.neg_token_init_mech_type+0x0): multiple definition of `.neg=
_token_init_mech_type'; fs/cifs/asn1.o:asn1.c:(.text.neg_token_init_mech_ty=
pe+0x0): first defined here
>
> Caused by commit
>
>   4a957ba6daf6 ("cifs: decoding negTokenInit with generic ASN1 decoder")

I missed functions and structures generated from the ASN1 compiler
aren't static.

Steve, and Namjae,
We need to rename *.asn1 files and decoder's callback functions. Is it bett=
er
to change cifs's code?

Thanks,
Hyunchul

>
> interacting with commit
>
>   fad4161b5cd0 ("cifsd: decoding gss token using lib/asn1_decoder.c")
>
> from the cifsd tree.
>
> I have reverted that cifs tree commit for today.
>
> --
> Cheers,
> Stephen Rothwell
