Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2122D1E801F
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 16:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgE2OY2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 10:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgE2OY1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 10:24:27 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7169FC03E969;
        Fri, 29 May 2020 07:24:27 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z18so2789646lji.12;
        Fri, 29 May 2020 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=FvrC0WJ0KivD8f2HPnZsHQw+LYkbnC1cHlTkqmakpMQ=;
        b=UNJs6vx6Ubru0lfykjx60teWsgEV39/ePSrS+evXyXhVbfd+6P34XfmP0QO5v6YhYw
         HFXKq0orBz5jyuH0SXiLs2Awc1esFipFpPN85COyLodNTGQNd3mAVKSnOMr3zX+c+E4u
         FoEoaYkphfbBdU0XIC3QOoXsShsl4kq6HZe7RNNjyHcQMoX34psTWauvsof/JDLlmxDC
         3VGp7R7HlQH2pnONVCdyHy5NWNbzx18vX4vmC+CS4x0qrFgas5pSNiOqpDQU9u9I8aO2
         oEO18fpKzPrWEly96xlRebt34cwFKBWjzwwCuodxEmmMcnyJjv2hX+kA7T2nh2jQpf8n
         8i3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=FvrC0WJ0KivD8f2HPnZsHQw+LYkbnC1cHlTkqmakpMQ=;
        b=SCp8pX3vUtD8hkiYUpNhrJwOERTvYbueRjt3Lilt1AZTFBFIloUsz4XRutxB3fkS1q
         9Wpj1Yneo9XjerjCgBTy3sqeHAdGKZdo8ti/G05ucd8NG2OIf+RcNziEkou2Ar6S12/9
         uR8/w3CIbJCBmYfSyRb7fWx1G1xsZtYHbDGRivUFspl5j6J4wDIs+NS6YHMyr/FEC3PQ
         VbsMJ8W3JlN1pHH0CP1D80BHRTFZpQmuYpdeGp0Oo70teMgTYGSV+GSg7f5CBlIBIrg4
         9R/X1yi4FAXOlxoxue8k+sLOeiBfBBzHiChrvD4nI2fKteVbEWkHIiz6trwJbb6ZEOAE
         n+Qw==
X-Gm-Message-State: AOAM533ffPQR3dXd8ordhaxHBLRXVEe7qGK7h3EdrisibCOcCyqdvhjd
        qlFXIs3HTURW0ELSWiaY5V7ItM9C
X-Google-Smtp-Source: ABdhPJz2X1ZSXOB383b5MkWLSdaoWu4P1J9aGICYrCZQnp16FpD+7+Xt8D4OL+qHdVTlH8D9JNk/0g==
X-Received: by 2002:a2e:8682:: with SMTP id l2mr4414296lji.179.1590762265815;
        Fri, 29 May 2020 07:24:25 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id v28sm2303124lfd.35.2020.05.29.07.24.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 07:24:24 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: linux-next: manual merge of the usb tree with the devicetree tree
In-Reply-To: <CAL_Jsq+cKXO71U_HVG0nZzbQ_B4GwrmcyzkECSTJUAuBzQgcZw@mail.gmail.com>
References: <20200528162215.3a9aa663@canb.auug.org.au> <20200528104916.GD3115014@kroah.com> <CAL_JsqKYUOPFS=0rWuUL2HLNz1DdKbYULckAWnCq-0v96-1S4g@mail.gmail.com> <20200529082641.GB847132@kroah.com> <20200529082840.GC847132@kroah.com> <87pnan1677.fsf@kernel.org> <CAL_Jsq+cKXO71U_HVG0nZzbQ_B4GwrmcyzkECSTJUAuBzQgcZw@mail.gmail.com>
Date:   Fri, 29 May 2020 17:24:20 +0300
Message-ID: <87mu5q250r.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Rob Herring <robherring2@gmail.com> writes:

>> >> > > > Today's linux-next merge of the usb tree got a conflict in:
>> >> > > >
>> >> > > >   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> >> > > >
>> >> > > > between commit:
>> >> > > >
>> >> > > >   3828026c9ec8 ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 =
bindings")
>> >> > > >
>> >> > > > from the devicetree tree and commits:
>> >> > > >
>> >> > > >   cd4b54e2ae1f ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 =
bindings")
>> >> > > >
>> >> > > > from the usb tree.
>> >> > > >
>> >> > > > I fixed it up (I guessed, taking most changes from the former) =
and can
>> >> > > > carry the fix as necessary. This is now fixed as far as linux-n=
ext is
>> >> > > > concerned, but any non trivial conflicts should be mentioned to=
 your
>> >> > > > upstream maintainer when your tree is submitted for merging.  Y=
ou may
>> >> > > > also want to consider cooperating with the maintainer of the
>> >> > > > conflicting tree to minimise any particularly complex conflicts.
>> >> >
>> >> > Ugg, I fixed up a warning on my side...
>> >> >
>> >> > >
>> >> > > Sounds good,t hanks.
>> >> >
>> >> > Greg, can you revert your copy and we can get rid of the conflict.
>>
>> Did things change recently? I always got the message from DT folks that
>> DT changes should go via the driver tree. Has that changed? I can stop
>> taking DT patches, no problem.
>
> Not really. Mainly, I've been taking some schema conversions as they
> tend to be standalone patches and to make sure they validate (this one
> had a warning which I fixed up and that caused the conflict). Most
> bindings don't see multiple updates in a cycle, but this one has
> obviously become a mess.
>
> If it has my Reviewed/Acked-by, then I'm not taking it. If I applied,
> then I've replied saying I did.

fair enough, I may have missed your reply and ended up taking the patch
together with a bigger series.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7RGxQACgkQzL64meEa
mQb5DxAAmFm3e7ynkdXSt/X9FVThbhvh3HcbR1VJ9BymE4Q+1cymsBKTdgG8ZqBe
PMpE35+5pqVO2eBnyD7QdrvgljWMC/DiXWf8a82QlZ1gdRlFQwQvcBUxsrDKPvaR
+MlG/mUfXEMEJuFmmJ4bFsmKoJoO+A5S4WOtZuKDfjnp3U+hb3VhTHjiVIS1irbd
AUlNnfBKOtRr4EqMM6OTQUvCG0aaKoV7lRNM4rQXq9pX3NNiBmHpvSXwMAIvliKQ
4jjf6a9yHdSuwstJ81yiIBqXFXeR3EUBgZ3UDXn+3CIIMzqv7xn8kzZSHDoVVrRb
BAwmfyJwMVSNUWiVkqJUQ26rzAQyt0u0Ax8hCFzYWcCeXeM7Iu42SL4jGK86oPO4
MHqZEpFfmgbO+huLq9FaEzfaGRkS1UUG2u8qiICmkIihnGLlpRAFmeVD4XfQoFow
NP8lzzn+Ej+4nYGAoiLuNpzxsIMlIEpKrCd1phgUxFfhUk5qsaZuttTsds4jczKO
O+6InQX7Oi6XAE8oQoMd1JQ13USJGlSZLdPpjW17ZIrUnzP9CoN6YwaWnEI/T31B
ex1HP4u4qKRH+UW1UHoYAqD7OezcoyO6TFtKSLBl+OiJOY3d/Cvye0ke3WD97O5U
iysbWSq4iUE8qEgNp6wcaqtCjxgikju/ktfxRmZA1NubW3PQ5yg=
=53ps
-----END PGP SIGNATURE-----
--=-=-=--
