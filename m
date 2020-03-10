Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA09A17F6E1
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 12:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgCJL5r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 07:57:47 -0400
Received: from outbound.smtp.vt.edu ([198.82.183.121]:55756 "EHLO
        omr1.cc.vt.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726497AbgCJL5q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 07:57:46 -0400
X-Greylist: delayed 2012 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Mar 2020 07:57:45 EDT
Received: from mr4.cc.vt.edu (inbound.smtp.ipv6.vt.edu [IPv6:2607:b400:92:9:0:9d:8fcb:4116])
        by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id 02ABOCnb032088
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2020 07:24:12 -0400
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
        by mr4.cc.vt.edu (8.14.7/8.14.7) with ESMTP id 02ABO71q004021
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2020 07:24:12 -0400
Received: by mail-pf1-f199.google.com with SMTP id f14so4402643pfk.5
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2020 04:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :mime-version:content-transfer-encoding:date:message-id;
        bh=OesXhfFfB1ZZgxnRfuwwLM+t7VkmSIoWuSuAcfzfaQ8=;
        b=potPHnQy6CumueFfg6GAyFT/uzGh80WrVPfh+LT/kHxU0iX649LZbnJ/uRI9AR3RGX
         E0Mr1c0YrQFq0ginDv4XGsjejkFjAlwcgi62PNUg5QO5LiQS73QmilHrQ2pR75JH9fss
         deeSgIswR9MQoNQdlN9rZhuyfJBDNzgNfXhUOSroPGjf/sVxHhq5Oea4tzuSyZX9o6h/
         JghCZRiFD8RyNheWrlZ5/xLzCZQAai2VmFWzmEeM0mcwuVOjg3hOtyZ8mEF157JoWd+9
         oyxpX5JqrUwLOaLCs+ZNRIhnnRaJa9iqZfljDF1uWj/JbUUe4zfkWMa0X90v/WXACevL
         MCnQ==
X-Gm-Message-State: ANhLgQ0Nu41xaZ/kMAG+oBSZoFfAyOv26IoOmq/8eA6e/QFi6CEce8WK
        GM69PWIcFmbRwVenK1vEeUqriRKtGtdU7VQT+uRyupG6Ju4ALhUr0Gs/zVzanJ0wTUdRmtSJs7X
        pBvpqoFWiV1OB/IHEbqN9M4iNkLtHM3CT
X-Received: by 2002:a05:6214:60d:: with SMTP id z13mr5971522qvw.183.1583839142736;
        Tue, 10 Mar 2020 04:19:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vto9Cc/inOPkYfcSZLmhvSxM16DJD9Z9E7y4/q01ZrjcE60oTAT3RepCU3XjTs472qHoHtnOQ==
X-Received: by 2002:a05:6214:60d:: with SMTP id z13mr5971506qvw.183.1583839142428;
        Tue, 10 Mar 2020 04:19:02 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:c9e1::359])
        by smtp.gmail.com with ESMTPSA id w2sm23859201qto.73.2020.03.10.04.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 04:19:00 -0700 (PDT)
From:   "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "'Linux Next Mailing List'" <linux-next@vger.kernel.org>,
        "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Namjae Jeon <namjae.jeon@samsung.com>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] staging: exfat: remove staging version of exfat filesystem
In-Reply-To: <20200310105421.GA2810679@kroah.com>
References: <20200310105421.GA2810679@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1583839139_13328P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Tue, 10 Mar 2020 07:18:59 -0400
Message-ID: <35151.1583839139@turing-police>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--==_Exmh_1583839139_13328P
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Mar 2020 11:54:21 +0100, Greg Kroah-Hartman said:
> Now that there is a =22real=22 solution for exfat in the vfs tree queue=
d up
> to be merged in 5.7-rc1 the =22old=22 exfat code in staging can be remo=
ved.
>
> Many thanks to Valdis for doing the work to get this into the tree in
> the first place, it was greatly appreciated.
>
> Cc: Valdis Kletnieks <valdis.kletnieks=40vt.edu>

You can stick my Acked-by: on that. :)

And thanks to Namjae Jeon for graciously offering to take it off my hands=

by providing a better version, and to all the people at Linux Foundation
and Microsoft who did a lot of behind the scenes work to make it happen..=
.

--==_Exmh_1583839139_13328P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXmd3owdmEQWDXROgAQIhLhAAkEefL8MqDbPRHTLSuvJEcgA0wOk3+Y5q
NaIlQZ3VNZQkIguUEEKq4Ic+mpBl9+r8rWIbJiDWYe2gZRq+b4BFi8Dlc9T46yst
rW9YWLIGLsVwnCjvVRyZRO/S+6oSzFh6yTdkxQIBBOmWhhITLvIKoJozoSFTOwwn
I0G97lwb9++mH2r9n87/3NHOfTyUB061TU3l5/fk/a3bpWWYrR+NXEuEli8QGukl
eDwRMUvegpPBt/iPN7PTznuwbVKSYigB17Wopr+gAEnS3rZ2YeG2lkQFe7vnoevl
6FNTcq2W5hJU2Jrb2eAuKMrW4LVg2rSis8jHmM7Eeoi/Pkyko/Cdfw1TD5L0Uqc/
QYnofVkQrni42j8gCSTTHvzeag+rjmeSK/YEsjyYzVGnK3Hc+27mmMoHYTYQo7JI
k2r4nZCZINc67E/DeBb1hWEnlbjdfeKwQLrW5qAm/x9jumGPto+nfqyaNHKwfmW1
OMq9FCU+7HW9lG/FZHbOY/l0+yMlBeg3fM5YmiC0+aotmHPZiQoVMYDOThdG0ukc
z91DNBW2rsqmrfc83U8nxnNxfnYyfWuNJ03IuLIhRY6BsrsUXLKZiFRQUPjGAs7i
u+oBYngj9OUyw58ks8S5KYgoFZbqe1oWKBQ+fiXXKXqRt4CbagiSOeYcaVQPcctT
Sy9zO5MRsa0=
=l13Y
-----END PGP SIGNATURE-----

--==_Exmh_1583839139_13328P--
