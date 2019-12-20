Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE86C127A4B
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 12:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfLTLzX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Dec 2019 06:55:23 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34388 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbfLTLzX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Dec 2019 06:55:23 -0500
Received: by mail-lf1-f67.google.com with SMTP id l18so282704lfc.1
        for <linux-next@vger.kernel.org>; Fri, 20 Dec 2019 03:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DPm8u606XYLiFYRzZPxYwiipRU6meoWwaOXT6w0bjOM=;
        b=LpLIk+iWEQmCJKmxxQtjOBI5VPgYmQDAki9aDGhAS5pRI26oTknEGVSkm+aWTsM91S
         2433nhpaTvJk79vRxSNlSJbZLx0VzRRaWvNq5tQ7IGd84VjyDNNlRaObga3xfNmsLXml
         o5leSv2l4rwD1xzRNn5TVD/86OC/oBRDoxYT0vjK2jVgBZotNnqBraKgqsKOTYaU4NIz
         kchm8GamnHjLnQRBycri25rloiDJTTfcRfDjHc+EWQZkCO7HXrxAQKaSs9Bqo7coBPP/
         DI9veVI5XkDQfIK+TgJePmtO3gMnAUdW0vsLpuat50vIMmgswqIQnfRZKBC2KusAxdUn
         uZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DPm8u606XYLiFYRzZPxYwiipRU6meoWwaOXT6w0bjOM=;
        b=Kqf4LThhMVwd7UQkfs8yOuEl8n1rAAZMpSFFp7mQd88Whmr5SQ11xSwEohsLbAATEd
         Z+hEuxcQkLDmcy9+cPEibSo6ZXbuTH+MrvXd6HHoVFp38r9OE5NK53SZZVkCHm+y6Iop
         E6ZZgLFNaRniaj6bLLD3oScCkGzurAb4zTkFa1PgFTY1TVkPl2wrYkaE5bFiiti7wbqU
         8frTji/f9kyRUKevWwb8f7Mih0Q4/YLs9ah7Md+CM+2dGl3BzUty7m/LcU0i8JuvDopv
         8PnMpwBLnRjbYE3FNcELQFLYJOcvYvnchKKZeN9zaWiqZPpT69iaw9qYCO8I/xhdZT9O
         BcUg==
X-Gm-Message-State: APjAAAU+TO1CrqUjn1eO3YshqM5LPx5aKtCMy9C9SZiNtHhbEnB+UdU1
        u3xCt5ho0/qEXv8e6xGiEQIUiO0vZ87/TtFAKU2lOA==
X-Google-Smtp-Source: APXvYqx1g+drEwy2vCmHS5tkE2wiSoi/HAfHYDfVNuMQEs0wR3lCx84+yKxERoWVh28TXKUehXa2+CgnbmkpWleGBuo=
X-Received: by 2002:ac2:5147:: with SMTP id q7mr8670447lfd.87.1576842921377;
 Fri, 20 Dec 2019 03:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20191220160639.3406a5de@canb.auug.org.au>
In-Reply-To: <20191220160639.3406a5de@canb.auug.org.au>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Fri, 20 Dec 2019 12:55:10 +0100
Message-ID: <CADYN=9JjqvNWEsHLW5+GgSvkUkuz_6iMpD=X4Vk6nLQXtXa2Dw@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 20
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        martin.petersen@oracle.com, Stanley Chu <stanley.chu@mediatek.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 20 Dec 2019 at 06:06, Stephen Rothwell <sfr@canb.auug.org.au> wrote=
:
>
> Hi all,

Hi all,

>
> News: There will be no linux-next releases until January 6 (unless I
> get very bored :-)).
>
> Changes since 20191219:

on arm64 I see this:

../drivers/scsi/ufs/ufs-mediatek.c: In function =C3=A2=E2=82=AC=CB=9Cufs_mt=
k_setup_ref_clk=C3=A2=E2=82=AC=E2=84=A2:
../drivers/scsi/ufs/ufs-mediatek.c:93:23: error: storage size of
=C3=A2=E2=82=AC=CB=9Cres=C3=A2=E2=82=AC=E2=84=A2 isn=C3=A2=E2=82=AC=E2=84=
=A2t known
  struct arm_smccc_res res;
                       ^~~
../drivers/scsi/ufs/ufs-mediatek.c:21:2: error: implicit declaration
of function =C3=A2=E2=82=AC=CB=9Carm_smccc_smc=C3=A2=E2=82=AC=E2=84=A2
[-Werror=3Dimplicit-function-declaration]
  arm_smccc_smc(MTK_SIP_UFS_CONTROL, \
  ^~~~~~~~~~~~~
../drivers/scsi/ufs/ufs-mediatek.c:101:3: note: in expansion of macro
=C3=A2=E2=82=AC=CB=9Cufs_mtk_ref_clk_notify=C3=A2=E2=82=AC=E2=84=A2
   ufs_mtk_ref_clk_notify(on, res);
   ^~~~~~~~~~~~~~~~~~~~~~
../drivers/scsi/ufs/ufs-mediatek.c:21:16: error:
=C3=A2=E2=82=AC=CB=9CMTK_SIP_UFS_CONTROL=C3=A2=E2=82=AC=E2=84=A2 undeclared=
 (first use in this function); did
you mean =C3=A2=E2=82=AC=CB=9CTX_HIBERN8_CONTROL=C3=A2=E2=82=AC=E2=84=A2?
  arm_smccc_smc(MTK_SIP_UFS_CONTROL, \
                ^~~~~~~~~~~~~~~~~~~
../drivers/scsi/ufs/ufs-mediatek.c:101:3: note: in expansion of macro
=C3=A2=E2=82=AC=CB=9Cufs_mtk_ref_clk_notify=C3=A2=E2=82=AC=E2=84=A2
   ufs_mtk_ref_clk_notify(on, res);
   ^~~~~~~~~~~~~~~~~~~~~~
../drivers/scsi/ufs/ufs-mediatek.c:21:16: note: each undeclared
identifier is reported only once for each function it appears in
  arm_smccc_smc(MTK_SIP_UFS_CONTROL, \
                ^~~~~~~~~~~~~~~~~~~
../drivers/scsi/ufs/ufs-mediatek.c:101:3: note: in expansion of macro
=C3=A2=E2=82=AC=CB=9Cufs_mtk_ref_clk_notify=C3=A2=E2=82=AC=E2=84=A2
   ufs_mtk_ref_clk_notify(on, res);
   ^~~~~~~~~~~~~~~~~~~~~~
../drivers/scsi/ufs/ufs-mediatek.c:93:23: warning: unused variable
=C3=A2=E2=82=AC=CB=9Cres=C3=A2=E2=82=AC=E2=84=A2 [-Wunused-variable]
  struct arm_smccc_res res;
                       ^~~
cc1: some warnings being treated as errors
make[4]: *** [../scripts/Makefile.build:266:
drivers/scsi/ufs/ufs-mediatek.o] Error 1
make[4]: Target '__build' not remade because of errors.
make[3]: *** [../scripts/Makefile.build:503: drivers/scsi/ufs] Error 2
make[3]: Target '__build' not remade because of errors.
make[2]: *** [../scripts/Makefile.build:503: drivers/scsi] Error 2
../drivers/staging/wilc1000/hif.c: In function =C3=A2=E2=82=AC=CB=9Cwilc_pa=
rse_join_bss_param=C3=A2=E2=82=AC=E2=84=A2:
../drivers/staging/wilc1000/hif.c:574:45: warning: array subscript 2
is above array bounds of =C3=A2=E2=82=AC=CB=9Cu32[2]=C3=A2=E2=82=AC=E2=84=
=A2 {aka =C3=A2=E2=82=AC=CB=9Cunsigned int[2]=C3=A2=E2=82=AC=E2=84=A2}
[-Warray-bounds]
    param->akm_suites[i] =3D crypto->akm_suites[i] & 0xFF;
                           ~~~~~~~~~~~~~~~~~~^~~
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/srv/jenkins/kernel/next/Makefile:1694: drivers] Error 2
make[1]: Target 'Image' not remade because of errors.
make[1]: Target 'modules' not remade because of errors.
make: *** [Makefile:179: sub-make] Error 2
make: Target 'Image' not remade because of errors.
make: Target 'modules' not remade because of errors.

Cheers,
Anders
