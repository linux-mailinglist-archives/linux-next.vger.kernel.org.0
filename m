Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B72D30D3D3
	for <lists+linux-next@lfdr.de>; Wed,  3 Feb 2021 08:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbhBCHGL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 02:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbhBCHFm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Feb 2021 02:05:42 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C15C06174A
        for <linux-next@vger.kernel.org>; Tue,  2 Feb 2021 23:05:00 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id l18so4004526pji.3
        for <linux-next@vger.kernel.org>; Tue, 02 Feb 2021 23:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gKZOcDhfXnFXqnKqDlQ9UXmyGdMx/grYINFkCv8mdt8=;
        b=IgUkx0gYfzPr8eTrklb9NuTzfUdBaofL2ZNjmfnSf03PZJr1WCLSvrEfZ/eK0u7js/
         b9okj5Ba/mUT56qal1j8RStgmAqtCSUB5h9lLad012RkX3fbaC6WGLZf5leDXzgeOYDK
         q+q+3s+xHy3hdBy9X12S/+3p4dCk5AzrgRmqXvlmZGVW5FVCAz/GWDTGNEyJm/9mPTuo
         84R2RKTfXLrooKKlyLwZqSddlpgwxfDzWlH5Tle8ZpPNt2R4imOvVhb8TozwN5P/Pc49
         Mj0powX3PD2QNev14M3bu/UoYQgUFrEoSF3qqxrFOYaXNNsxXND33HB511rqI9Xo9A0J
         A6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gKZOcDhfXnFXqnKqDlQ9UXmyGdMx/grYINFkCv8mdt8=;
        b=JIkWu7DFJ5jU5TaNib4SCqTaT6ZGzP5Q0x4k7m6Dx0TNIGnVp9YZY1gSqGEdbLemPL
         Wl5aiSqQZK2bk0rNLMuQycWziBcq0W5Jbm2diPxP/ym7oxdNdawvQN2vVcV9pMiPcOcV
         fwpigXyd0N2KkUCCPuRenGkTkTZW/xj+JoATvtE5sTjLfy4QwQG6z/SZynWGMH1uncvU
         /UKIM22I8LGTBawryGdVuJlh6jMoZRiDshI74yT9sm/xbYOixcqntB9o3fWZn4UxiuBQ
         J/Ai3lqEkRWMveNRAvUb1X6jXzxBvaIPXqEt252VBzy1bkOUV2Sn1aNOC9NlBr6ZAfUv
         70jA==
X-Gm-Message-State: AOAM53285g3hmn3rbjTBcVbtJkt2a2bGnhLT3JFaLxITQv5hRhdHqWVL
        /yzjWmt4kBtniOUwgrjdctETjQ==
X-Google-Smtp-Source: ABdhPJz4XcM6cbEyvmmUURpt4mxND2T1uq0Fq/urnlxGUNBd+QgtvnCzbgUS3cOZxBkS+VOX08dRkw==
X-Received: by 2002:a17:902:6b87:b029:dc:3402:18af with SMTP id p7-20020a1709026b87b02900dc340218afmr1812366plk.29.1612335899569;
        Tue, 02 Feb 2021 23:04:59 -0800 (PST)
Received: from google.com ([2620:15c:202:201:dd26:2871:d4dd:eb32])
        by smtp.gmail.com with ESMTPSA id x19sm1162839pfp.207.2021.02.02.23.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 23:04:58 -0800 (PST)
Date:   Tue, 2 Feb 2021 23:04:53 -0800
From:   Benson Leung <bleung@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Benson Leung <bleung@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        kyletso@google.com
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <YBpLFdkXqpM8T44B@google.com>
References: <20210203161300.57344f63@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9hhO9SPpJMFov6eg"
Content-Disposition: inline
In-Reply-To: <20210203161300.57344f63@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--9hhO9SPpJMFov6eg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 03, 2021 at 04:13:00PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the usb tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> drivers/usb/typec/class.c: In function 'typec_partner_set_pd_revision':
> drivers/usb/typec/class.c:763:6: warning: unused variable 'ret' [-Wunused=
-variable]
>   763 |  int ret;
>       |      ^~~
>=20
> Introduced by commit
>=20
>   29b01295a829 ("usb: typec: Add typec_partner_set_pd_revision")
>=20

Will be fixed by https://lore.kernel.org/r/20210202095512.761214-1-kyletso@=
google.com,
already in Greg's usb-testing.

Thanks Kyle for the quick fix yesterday.

Benson

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--9hhO9SPpJMFov6eg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYBpLFQAKCRBzbaomhzOw
wk1FAQDWVMz1HspioddT4xgWPzZjs8dj1NKByO6VwY/Ya/ZjIAEAgRIX8yyQEAuf
MEhuQI7xn6Gqqv+YubKIs1IRSnT6RAs=
=2lGT
-----END PGP SIGNATURE-----

--9hhO9SPpJMFov6eg--
