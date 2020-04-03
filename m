Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC0219E109
	for <lists+linux-next@lfdr.de>; Sat,  4 Apr 2020 00:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgDCWXW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 18:23:22 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46771 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbgDCWXW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Apr 2020 18:23:22 -0400
Received: by mail-qk1-f196.google.com with SMTP id u4so9789119qkj.13;
        Fri, 03 Apr 2020 15:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=sSck8JhV+jIQbioy1Nn3TbSFlNWpLXikp924rokJffo=;
        b=h0UT0tpyOtQyO9ZMpNa6Q5GREMZD+XGY0z9tZWRF73HkEuCNuGSN7jRqasoIoQGh8z
         EwdvGRgvv39scxxinA9fG8YG+8n8LWMBihjh3KukIDbeOeM5tVkFa8DA8mVtPnfLY6he
         J8DK2vJSN79YNhJm12FMhDeHGTHPAaLjnz2IeiXSNvvz77N7dyH5SKSVJyTT0X9heuYU
         2gawRMlLCPBSl3oJx/bpyH2LOjY3QyJKSS5PzkeopynDwkH9Kab1F0jHlnFQ6ikEi5/n
         mYh1fvUTqO25phaNfK/AFqTEg4oVqkXotbnwM8eq0ubepr530S/cWFOjV1ltuMAL2xUV
         VqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=sSck8JhV+jIQbioy1Nn3TbSFlNWpLXikp924rokJffo=;
        b=EhFqxdQwwXZ5r+lA5NvGw13B9bVDpXOZ3ofY2DiXYNhDe9EBKePx0shHBFGfpKPk3o
         rDedVDkkcW4oMP5zmY50fRJEGZ3puroqcoaFVitjLNz2mTz2MK2eFEKr03xGXmFW2RrU
         0CubZqMQpXhqR61IQRoQJruJxPS8ycfHkigRwUrzR/43+JpRoqGq2m/Zdlvr91ZQxSIH
         wtOj/SrDwLX8Obhx7ZhJ3NVfdLoKkgfHsk+6pHdzMWBAuaEeAM4bUhSSJNx/silkKtZv
         CO0Ri2guAFvah0HpmCNB/cRHSY/12zPsBfxR8bdmWO+giX5govuRbcXoJSUgrbJaYdK6
         O2aA==
X-Gm-Message-State: AGi0PuY6R4qrsS3ntAoVpKjkQytQFYufC+BbbkWJw7Sp26CrHzZlGREK
        ddqVEvmViK7VqdJoMxupoNwuAHU=
X-Google-Smtp-Source: APiQypJ7oYWm/NSRhaHT22daUDuYb5SOgdw4IN6XANeKnTWxWz40CCCvMkJW0OpNWz2zCWNzhMW9Xg==
X-Received: by 2002:a37:8781:: with SMTP id j123mr11330513qkd.308.1585952601103;
        Fri, 03 Apr 2020 15:23:21 -0700 (PDT)
Received: from leira (c-68-36-133-222.hsd1.mi.comcast.net. [68.36.133.222])
        by smtp.gmail.com with ESMTPSA id j15sm7450254qtr.40.2020.04.03.15.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 15:23:20 -0700 (PDT)
Message-ID: <4cd16e845f5709a7ae09809d2d96929901da3b61.camel@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the nfs tree
From:   Trond Myklebust <trondmy@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Fri, 03 Apr 2020 18:22:51 -0400
In-Reply-To: <20200404085512.5ac25c61@canb.auug.org.au>
References: <20200404085512.5ac25c61@canb.auug.org.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-HejcYmcPolK4iSOv46yS"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--=-HejcYmcPolK4iSOv46yS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-04-04 at 08:55 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> In commit
>=20
>   52381893a2be ("NFS: Beware when dereferencing the delegation cred")
>=20
> Fixes tag
>=20
>   Fixes: 5f4adff16fa2 ("NFSv4: nfs_update_inplace_delegation() should
> update delegation cred")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Maybe you meant
>=20
> Fixes: 57f188e04773 ("NFSv4: nfs_update_inplace_delegation() should
> update delegation cred")
>=20

Doh! The price of juggling too many kernel branches and backports at
the same time. Thanks Stephen!

Cheers
  Trond

--=-HejcYmcPolK4iSOv46yS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEESQctxSBg8JpV8KqEZwvnipYKAPIFAl6HtzsACgkQZwvnipYK
APKZDQ/+PMhc615O0hQAljLajXVGYUzoKr7Nu2/iMvjJb/oJe003RR0LMSzuUi8l
Osjk8fkGV8FT6sbHOTPWlj85HB0H9ShY1a90uQTE6mNxYmyGoMg3i4RRF1q35ML0
JKMfgEc72htInJBCw+5nkXp31xK/KD/vF7dof+4/TKE/MT8qWX05Gs+gYdTmKB+H
LF4uEkMdEXSMdf9yRGduJqKc6jEd3dcc1zgRVSeupzxYnipUrwkpAx9kTZv1LyK7
mMoCCHHrDaGrencH1oUFU3SJvBD45hdufzv8X2ona//iRZ9jeCtxuFBzybTcUdMu
j85Ig0COLm8bEK4HyeQit1rYugqjfMu7s1TOKWuNxEchRNFxnV22gljGODjfV6xU
w5X+tPgmDL2st+VIHnODWsZ4Pikh986qLbCfWri8WhRt/QJX3H1B2dMcKot0gzMz
WycxTure9ioXRANapzThLUNK0kXk5rnvsIuKyr8gz/JHxGaYMzbtOaQgmBpWh1b9
5KgEtJrIR8EE7nUUhS+3bi5vruLcrvNc7r8POY4DH2C+t74LuBiaR92+jHYG3/Nr
R8vwTRmOfApLvW+rW9Ahm3Dc46wSxEzNTZXaSOnyrUI+Qb5xdt9aZ5CEjdsJQ/BF
IhvmpnE/u4Nte+a40h0DYtnZpDUYk4xqOJZMUmZ5LJBIFlxPtig=
=r4x0
-----END PGP SIGNATURE-----

--=-HejcYmcPolK4iSOv46yS--

