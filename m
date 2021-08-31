Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7813FC013
	for <lists+linux-next@lfdr.de>; Tue, 31 Aug 2021 02:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbhHaAlV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 20:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233980AbhHaAlU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 20:41:20 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67997C06175F
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 17:40:26 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so733487pjr.1
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 17:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WproMusWA2w4LG/nbR8yDEvrehNN45zhevgnzAfetHw=;
        b=WSfaiQmgu5HRYvEH2qwQVvA4WIYXcOYwaDnxmgQzoUX4x1FEk1gn6rNaSjFNr5yqDs
         jhrQ8na0JwFBBOkKJ6/MRuJo774rcUH4B/BrWBR5KNWUWaASp9CW6F9RxSK0fcoupwWX
         qoDQLV8rvcMiv4RkVsyoNJgDhPWc/X+n8VZGSwTg8Li7c1VXvy+CX1zNswSl+M/1Hq15
         SomkgOzLwigZw6/bfWc5ziRMqT9vaVD3l54WLLMRwezUwWmR2DzbuiVl8fRyNSccoei6
         ZxOqG6PlYrnvu3aJMYYnvIepqaA21/asoCGb94OwWqrkPkz+66waro+x4DWq+c99ldTW
         Xc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WproMusWA2w4LG/nbR8yDEvrehNN45zhevgnzAfetHw=;
        b=lffU38Qu8hanFN2FdSd6MKA+5+sqPccw1gfgSiVJtOR9/ZF1gAgv5sxhCM3ukmefKt
         8Iz54ygozrBdQqTIoUlA7oRoyaAfkAWBIc73+VhsSjs16IDJbKdNB8oMbqTwdYLNpwHa
         W0O76u1S5j/15SQAHzA2r7NQZClqbSoDzZOQiaNpGnDc/6Fi2PHTszw+vhHbaFRyuH+B
         H0SZ8fmOeDdbi4XSxxISZwsrA/jq8nqHpW02HzOA1xccdaTYZi3A0LMFtancA9Cj5sAO
         4ImKxbA4tCF7T9+2LNwaUvV3mqLQ1VmRKxHGwlCrdWgcdWWmakpSARzKanl24fH9V5k8
         UD2A==
X-Gm-Message-State: AOAM533yGsKuLLZKSlcE4LBs6pvNSJmgNyfAuza3JSY8zrSs5lUsGGbe
        iN/NBtwlI53PwbOYwFjLoxzejw==
X-Google-Smtp-Source: ABdhPJyzFUwC4f4m8kCH9+mUc2D+GTHP3Zp8J/i4PKwBLyznrfmXdzOubBq4LCSbexZb4LWVQIpnAA==
X-Received: by 2002:a17:902:7b8b:b029:12b:8d3e:70e7 with SMTP id w11-20020a1709027b8bb029012b8d3e70e7mr2093233pll.76.1630370425482;
        Mon, 30 Aug 2021 17:40:25 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:d2dc:2a51:77c9:8407])
        by smtp.gmail.com with ESMTPSA id b17sm5238396pfo.98.2021.08.30.17.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 17:40:24 -0700 (PDT)
Date:   Mon, 30 Aug 2021 17:40:18 -0700
From:   Benson Leung <bleung@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 chrome-platform tree
Message-ID: <YS16cmPYl72CnY1l@google.com>
References: <20210831103544.2193d4b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CHOwX0sBdE7/8D36"
Content-Disposition: inline
In-Reply-To: <20210831103544.2193d4b2@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--CHOwX0sBdE7/8D36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Aug 31, 2021 at 10:35:44AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   cf7f3ebb41d8 ("platform/chrome: cros_ec_trace: Fix format warnings")
>=20
> is missing a Signed-off-by from its committer.
>=20
> --=20
> Cheers,
> Stephen Rothwell

Thanks for the catch. I repushed for-next. This one should be better:
	c0b7bf380fa1 ("platform/chrome: cros_ec_trace: Fix format warnings")

Benson

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--CHOwX0sBdE7/8D36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYS16cgAKCRBzbaomhzOw
wjM1AP4+52SUQ6+HavrpuXg9MmqJnjdqbbwYFuPw59tFOaJcTwD/ZSEIkv/c1pZF
eExX4QWaRdLdSADFWA0sREd0y0OxPgY=
=MV7k
-----END PGP SIGNATURE-----

--CHOwX0sBdE7/8D36--
