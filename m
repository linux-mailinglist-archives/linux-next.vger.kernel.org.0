Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC7D3CF982
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 14:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237535AbhGTLmz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 07:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236462AbhGTLmf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 07:42:35 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1DDC061766
        for <linux-next@vger.kernel.org>; Tue, 20 Jul 2021 05:22:31 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id m2so25814620wrq.2
        for <linux-next@vger.kernel.org>; Tue, 20 Jul 2021 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ksJ7uSYre48A5Z7zQktjRchxiOL4w4I/1HgeIzUItlA=;
        b=ndCld4jhIDxVjs7HgMEcmj8aOHrSU7apEUj9+c/96MWypPqQ4DLLaudBAdx8qDhjRU
         EnRWhNj1hjJNySeadR7468x5WNDTfkLGjY9fyOxDAwabhSDmI7GZT8RKj4HAqxOVy5eb
         V7JXw3ikiwb85gB7i2wWWB3wOVNTE/B7cWPDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ksJ7uSYre48A5Z7zQktjRchxiOL4w4I/1HgeIzUItlA=;
        b=WVUFCfwovxOrG0iFGf/HDlH+l7Mef72suAwnzWEk8p4rkjsFomUoaSuA8qFr4rJjBC
         AKbaLLdSgSsIH1pZGh33EDU5HrWTb/coMiwGYDO9iFpH9OerrBcuy7+9lUEcT8owNakw
         VAjKzTkQVQGCxH9LnJapFOfAb8Jc3zeuLivzqeb7TCItEM4k+eDIel/KGGUFocLOgEY9
         ixZb5Ui3ediVOd7gDTX1TlROIMxcNAkK6L+keHnbN7lKCizovW/tZ1nmk0ORNBz0A8Rw
         /3ta5t+iRzRMGD7ptXah1GtqdTVfn5QoyT/58QBcGUQ5qF2KWYgYRygYkTHSCY4FQ7Oc
         Zkxg==
X-Gm-Message-State: AOAM532SANMK9cHtA6N889CfQYO6Ba5jGK/Gbe77G3Rh68hdZVMQMsRZ
        Ym7pPFKnDlVptKchBd1YDl/R5g==
X-Google-Smtp-Source: ABdhPJw2SeFJ5qG/3zEIy1OkLFkh1ex3OXzZCiHOaa9CuK4hdVjKWkggxbglKSNW/nta4pdn7+Cu0A==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr35468419wrt.46.1626783750329;
        Tue, 20 Jul 2021 05:22:30 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:d571])
        by smtp.gmail.com with ESMTPSA id b6sm2296488wmj.34.2021.07.20.05.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 05:22:29 -0700 (PDT)
Date:   Tue, 20 Jul 2021 13:22:28 +0100
From:   Chris Down <chris@chrisdown.name>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the printk tree
Message-ID: <YPbABBSTkN+xNY0w@chrisdown.name>
References: <20210720162423.75f61ce0@canb.auug.org.au>
 <YPa/D8tSyk7dw1/l@chrisdown.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6qWCzA76C1K43s0/"
Content-Disposition: inline
In-Reply-To: <YPa/D8tSyk7dw1/l@chrisdown.name>
User-Agent: Mutt/2.1 (4b100969) (2021-06-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--6qWCzA76C1K43s0/
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Chris Down writes:
>+Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org

Well, let's actually Cc them this time...

>Stephen Rothwell writes:
>>After merging the printk tree, today's linux-next build (htmldocs)
>>produced this warning:
>>
>>kernel/printk/printk.c:1: warning: 'printk' not found
>>
>>Introduced by commit
>>
>> 337015573718 ("printk: Userspace format indexing support")
>>
>>I presume that "printk" is referred to elsewhere in the documentation
>>as being in this file.
>
>Hmm, this is an interesting one, because I think we still generally=20
>just want to refer to the API as being `printk()`. Changing it all=20
>over the place seems wrong. As you'd imagine, there are quite a few=20
>references to this name, so it requires a lot of noise all over the=20
>docs and inline comments.
>
>Jonathan and other docs folks, how can one tell Sphinx that when it=20
>sees printk() it's referring to a function-like macro, or otherwise=20
>squelch this reasonably? :-)



--6qWCzA76C1K43s0/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEECEkprPvCOwsaJqhB340hthYRgHAFAmD2wARfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDA4
NDkyOUFDRkJDMjNCMEIxQTI2QTg0MURGOEQyMUI2MTYxMTgwNzAACgkQ340hthYR
gHBJPg/9FofzESIRIFMJw31dlL3MkNdldr6Q3dhJOOcB5y9OazjDUv8wZjVaoyor
feQz6IsjdtcWLYRzzq+42CsQEyLfRChPOBUKWJw9aQrlDlLv9bZfLGYaYlNNc77H
naEq+gX4pNWepLcg5rFE8gVh9cQzlCYJHLIqHl/EJhN2Ql3yu34JowtTeOfbEBV8
s4LX55PvjHbjpODD40WtENJB9t9PsT038QkoJNtRSn5TIwtoh+pyYT+jhVDBX7OV
lhQPz8g7XUB44JdVinjX1KTfzQ1hxhycXjnh8JDqkdeeQEA7yJeGfC4rUZJVqQBe
CcQg7Z+NJZhvySqDULxk9nvaep3r6wT1EabO6DcXmOLUfVW2MNfwLuyvnBq6cUxL
YOE2/Annbr+YudIamxW6xoz2SndnP5RpwAOy1odqpaVDEtWi0UuWY1RD8Jo+NRUn
sieFrKlssa6khSnGhsTok8bUqut249XKYOmVxA/wAfY6pgrXqVwoEEygombE+GLQ
6xSn5otVN4u7KX266joNvuglAlrRBvnNiSA3u1JvlTBRkQBtSAvjfKwkEfcqGcTJ
bpWJP3/1cx0qoXo75ldhAM1A+ItI8iQ6ndcWLwXFXqw1xCzm2rtCO1o3ovbAuFBz
eqVd8AxOw12bSeEpZLjmtlIGNmW9G9hzq8xpsii4URyjMAu/k2Q=
=52+O
-----END PGP SIGNATURE-----

--6qWCzA76C1K43s0/--
