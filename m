Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661B63CF975
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 14:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbhGTLhw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 07:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236874AbhGTLhv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 07:37:51 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1767EC061574
        for <linux-next@vger.kernel.org>; Tue, 20 Jul 2021 05:18:26 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso1442289wmc.1
        for <linux-next@vger.kernel.org>; Tue, 20 Jul 2021 05:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eTijAC92BASbp6onR/tdT9tmeDry4Y5P+Ya/pFQIIGE=;
        b=AH6k5DgzptILTA16eakmLDvpwqZb0qvTihWMYSKIz8SwGGeDkv+3MNd/DlHSyzaAVb
         lQ1r2WrrQ4tpgwh8KcZJaGc9zmYxqi5zExDFdS/KpJmounLg6f1E0gEGlMbsfLe6ifPh
         Fcd6TK1wGocD2MNRrCDXtLB23SRchKx10Hhu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eTijAC92BASbp6onR/tdT9tmeDry4Y5P+Ya/pFQIIGE=;
        b=Y+feeqJ55RnjyYxN2rLbLp+9rjh6Ekit1tcdv4R9uPRO6Cwe1BeR0p+iF43IStlgHb
         3F6bmT2xs66BgXETcDR0iaB4ZyvKU9nLgmhvU24pyQr0jMFIQzPJIaVeGDu/J57BftzW
         42VUbSS1Cr98SCDFkWsji8+MERSdeNSfZI4u28F/d19UvxO1Fm2abDk+jrCXXNFopZV+
         tD81kMeKIrQ8WsQHVxncrCzS6P7yc0D7+5GGXAFEM56aUP6mqmxOrm3KyEF0DKmBkG4+
         JZMhno5dmBJrN3T/+kw5LJpo+uabLvOFzDUPqecqhoF0MH2wASKjKRg6lbhBWYtRsUHs
         KttA==
X-Gm-Message-State: AOAM533vuNCXJPjfweoOZ6Qlucz+Uf1bX9Af/Ma0Ea6o/biMierDk8P9
        nRPruYvS2FUShEIBvIVKEUFOuaxcRJE+Z2ww
X-Google-Smtp-Source: ABdhPJwg3KdrScWn6r4GXbDxoanSrci78oPPeyAkQtl8dMSHEAp9e0j2zgM16Lx88CpCzzI3SZqwaw==
X-Received: by 2002:a05:600c:8a9:: with SMTP id l41mr38119388wmp.152.1626783504668;
        Tue, 20 Jul 2021 05:18:24 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:d571])
        by smtp.gmail.com with ESMTPSA id i15sm25447589wro.3.2021.07.20.05.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 05:18:24 -0700 (PDT)
Date:   Tue, 20 Jul 2021 13:18:23 +0100
From:   Chris Down <chris@chrisdown.name>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the printk tree
Message-ID: <YPa/D8tSyk7dw1/l@chrisdown.name>
References: <20210720162423.75f61ce0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1KxdTYZBrk6pcvz6"
Content-Disposition: inline
In-Reply-To: <20210720162423.75f61ce0@canb.auug.org.au>
User-Agent: Mutt/2.1 (4b100969) (2021-06-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--1KxdTYZBrk6pcvz6
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org

Stephen Rothwell writes:
>After merging the printk tree, today's linux-next build (htmldocs)
>produced this warning:
>
>kernel/printk/printk.c:1: warning: 'printk' not found
>
>Introduced by commit
>
>  337015573718 ("printk: Userspace format indexing support")
>
>I presume that "printk" is referred to elsewhere in the documentation
>as being in this file.

Hmm, this is an interesting one, because I think we still generally just wa=
nt=20
to refer to the API as being `printk()`. Changing it all over the place see=
ms=20
wrong. As you'd imagine, there are quite a few references to this name, so =
it=20
requires a lot of noise all over the docs and inline comments.

Jonathan and other docs folks, how can one tell Sphinx that when it sees=20
printk() it's referring to a function-like macro, or otherwise squelch this=
=20
reasonably? :-)

--1KxdTYZBrk6pcvz6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEECEkprPvCOwsaJqhB340hthYRgHAFAmD2vw9fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDA4
NDkyOUFDRkJDMjNCMEIxQTI2QTg0MURGOEQyMUI2MTYxMTgwNzAACgkQ340hthYR
gHD6Ug//WlpWID3GVcxKVK3fh7gHsKjYBgxXYkdVQnF8KTuQZAvYm/hvkKOMcheS
RV30K9xfK1CzS9FVbgQIFQSO2DO0Ygm6LYu6vEjs0z0FMMv8K3JqxhZvRNkUQSz6
0PP+guHIClMKWRx69UcoWbaz/rF5SGKoajfoJfr6z7FSSuMoQOODsXyQs7FyS59W
63Bb2DwWtn4QxENxoNH1YltpGfUz0GxayYTlOyH5L4xxnJuXzgtrr+dawyDgYjHi
rLegnA0Z6Kd43ovAR0GAmb4Xvpk27qsBaOnpeu/n3C9Zt0yPsmE8f2Yb1uvlAAG+
GgKBimPARAREllwiHYhyGDu8RC7yTkY3RsDpLPCpKvAgSgig+NBo9uvY7oszVVYE
mv8XZDGH1u7Qe+QmF5JWKYHbYmNY3QFaKjnov52Jdt3noaWTBWesg82/1OYa6svP
H/U1GIqak8JYK2N25Wnwa+q4RYr1mXdxukBqsJajgDlSXibQFT1MqD4tywA+TFAq
szdzxJEG5rtXvfz9Z9/UZoMmHFu+mjh8V83Tip3CjTFVKkIxy9ZMzeWleDBSd8Rb
ZxdaCFfH4+Go30EZRdo1HaaPwRfGaIg+CtYxlHzJq1T6LFBd6p8bAubeJjXruFeF
8QhbJm13Shfgo2skhrBWjYaE+e4k0TdFZVOt1s48FJXxic2ETKI=
=QxWM
-----END PGP SIGNATURE-----

--1KxdTYZBrk6pcvz6--
