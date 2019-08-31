Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA9EA4168
	for <lists+linux-next@lfdr.de>; Sat, 31 Aug 2019 02:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbfHaAnV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Aug 2019 20:43:21 -0400
Received: from outbound.smtp.vt.edu ([198.82.183.121]:42256 "EHLO
        omr2.cc.vt.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728271AbfHaAnV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Aug 2019 20:43:21 -0400
Received: from mr3.cc.vt.edu (mr3.cc.ipv6.vt.edu [IPv6:2607:b400:92:8500:0:7f:b804:6b0a])
        by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id x7V0hJEt019116
        for <linux-next@vger.kernel.org>; Fri, 30 Aug 2019 20:43:19 -0400
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
        by mr3.cc.vt.edu (8.14.7/8.14.7) with ESMTP id x7V0hEiR026889
        for <linux-next@vger.kernel.org>; Fri, 30 Aug 2019 20:43:19 -0400
Received: by mail-qt1-f200.google.com with SMTP id e32so8923276qtc.7
        for <linux-next@vger.kernel.org>; Fri, 30 Aug 2019 17:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :mime-version:content-transfer-encoding:date:message-id;
        bh=XFBHH54+3ZzAcvBGzpCHat8WRpPliDlxuP5sjSOAoEE=;
        b=MLeeoiMdkBDaETF6p+T+m/VxKW07M8+srNW9DgdXijc+6dYuLVjaSqakmI+eJ0WWiN
         0l70ykZStfXlJ5oT1yIjV/+ZSFLsvP94vwdk5EV9VzGJYvUmAo8JXbZ8QhzxTNbtB2xi
         9HBWjyVINjADgCCnZ3z41r/pb5EklUsMatvtHCT76PH2EJG3dVDsIfwIVGwKFV5WZ21o
         p6aEJZAqADq2kSeoz7DouiJwgRo2mbyjTfGRF0Gz+HpHEpFHAYH03wSwAHQofjZ9FOB1
         ZuKhfTL1pU/LLoRX1wB7ipewEIztw5LJvgG50gDCMzM4JkFO1Qa0+yA2WrhNl3KizGHa
         OP4w==
X-Gm-Message-State: APjAAAVx68dBR0vY5TD//hn+1YZ7MDhsJWzbffIIXDiUhGo7wkVkpUYb
        fSJL55ie0kUbhwT2ZMshRwk911tYiLsBV/bF9NyfhuP98X8S/j1sHRUbceDr7/dncnu2dcafUjP
        7sxteiTTqK4rPQG8AqIVKWuYhPFqUcdXc
X-Received: by 2002:ae9:e90a:: with SMTP id x10mr18129149qkf.392.1567212194525;
        Fri, 30 Aug 2019 17:43:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEJKukI1TSTm7w80vUWRep4DXRbiZaP5lYn/CK/s4Vokrau1EEUkE6Nbuat3rFOod0XUEznw==
X-Received: by 2002:ae9:e90a:: with SMTP id x10mr18129133qkf.392.1567212194286;
        Fri, 30 Aug 2019 17:43:14 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:4340::ba0])
        by smtp.gmail.com with ESMTPSA id n187sm3734502qkc.98.2019.08.30.17.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 17:43:12 -0700 (PDT)
From:   "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for Aug 30 (exfat)
In-Reply-To: <8ef40504-ba29-5325-9cb6-0c800a7b03ce@infradead.org>
References: <20190831003613.7540b2d7@canb.auug.org.au>
 <8ef40504-ba29-5325-9cb6-0c800a7b03ce@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1567212191_4251P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Fri, 30 Aug 2019 20:43:11 -0400
Message-ID: <267483.1567212191@turing-police>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--==_Exmh_1567212191_4251P
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Aug 2019 09:52:15 -0700, Randy Dunlap said:

> on x86_64:
> when CONFIG_VFAT_FS is not set/enabled:
>
> ../drivers/staging/exfat/exfat_super.c:46:41: error: =91CONFIG_FAT_DEFA=
ULT_IOCHARSET=92 undeclared here (not in a function); did you mean =91CON=
FIG_EXFAT_DEFAULT_IOCHARSET=92?

Thanks.  I'll fix this tonight....

--==_Exmh_1567212191_4251P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXWnCnwdmEQWDXROgAQIU5w/9FKqubpI3arBOt6EHREOF5sp2IfpJPOww
UWzmjO1MWpYdcVzI8/1fx35oOpA3IMsfSrVuX4v5ctoM6s4P6ut1EKs7O5eTt+UB
2mlhMGupqvpfClS7GMXNYeDaGJ4Br8N69W19+z0A7YHHJYFpHUYNfYwsPsi3tFrn
LTOx486+FHopNDwRdx5cHpriY2AlHMuuu6R8cGzMCzyOV9BWkZecWR33BO2cv4qa
TShEj/tnPqDa4rKePG94bmHExpsHh4l8sI0vPT2Mji4t7zVji0PcdpiEwaRcNCle
IBUVYHdrrSYftj1m2ja1xeXmRXYofTOldoPIZ/6LOkFKalDhC0CN+zyOlDeXuGW2
GgLWqmATH5+Fqsv/2IL0OYRN9zxrbzQYz/kZApYdj09VqzA5u0YyiZTFYxNGPWhp
mOhCCrwOxo0FieehscjqIEA3sYu/OefMqfRWnPdU4+/7D3au2wpMS0sdB7PiBcoD
ry54HxlrWiMCuGQR+jwRm20b4QJz4RPOoYYalID7R3/2jLYpn+zKytHenYMrFT7U
iIyAe5OcTf45e8avSNy8VZk8qLU3HEPbsWKWBeW0kUa9pqQxmaXN8Ld3EVncz5Zl
GOKQqNbZunHN9J8St6KYB2evsd3U1YlE7kz9cU9Ux96RIgEN7RWZBiPlhuhsWwOR
CgEF3NPkIzM=
=dqqB
-----END PGP SIGNATURE-----

--==_Exmh_1567212191_4251P--
