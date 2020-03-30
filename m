Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E240197478
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 08:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbgC3G1T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 02:27:19 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]:35184 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbgC3G1T (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2020 02:27:19 -0400
Received: by mail-qk1-f169.google.com with SMTP id k13so17870151qki.2;
        Sun, 29 Mar 2020 23:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t47gcuqTFK7s3DI+xrgE2ZKrt5AKzwvcbEh0WHn2Ajw=;
        b=eG1NiZfe8l4bA13OnsKG9GKukoCxAH5PPIkFRqIfBNSWuFIz/2qXMicSguHclIy8xa
         V8MDB5TyYkunBKhaBQqJ4VoMuyssqV40h+SoSUKlK+AzlL+qFDsownnKMb4XQ2z3aPW8
         /Z5xQ7d1QCvPzwQikZ3rvZrOzVQENa6iXkHVCXLoSXocxGEngE1Lk0pNYWmXeElmwu5D
         DPcW6AF2qaWhnOZT49nmR0MBdHdAMlMs02b/Bdb9iYaIT8wXcPZ0RQE2foqSuyIPyX+w
         WuBSH6lpSPVmT1pMfaJOesE1b8m7uCvc7HkpGcBmFsdci2lm6cIbbOluxQqAWpIbhYRZ
         OnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t47gcuqTFK7s3DI+xrgE2ZKrt5AKzwvcbEh0WHn2Ajw=;
        b=Uqpn67UPwPIIJPRGr3/lghKkiBa2wMk+2T9fvX5CqHa0wRydSX0GCpKOIq4BgViR5v
         fIUz8ozo0P1xJ/lHAvQ6h2elAfSsV+FzNtDcHy159xl85jNIVlAOqyvGzBkHTQPSPLni
         8qanbO8FrCeqsriYswwIW0WJI/yxaC88FSD3WXFQI1bLGhuchIfUlGkq1lP8RpQ0y3KX
         dmEMSHV2vvWroXpe5tAKcM5IUG7Zg3T2girWEg74Guy4Q0oSco39KRCq1/PbljTkZylb
         1dEL4Fd24PAtWzX2kk6m0Jy96I3dz/iT271Tfl3E3KC4lssnzznKLYlhCdJxYcC2Xwn0
         Nv/Q==
X-Gm-Message-State: ANhLgQ31y6dw6+wKUa25fb9BwI2V9vvnD+rCFat+QBAmuGIdGXwvO0Q5
        M38pkH6nfSGadZk26OpYXppSrm49DwNruZhpIxM=
X-Google-Smtp-Source: ADFU+vuoWaOR1MXLekqRzEjpggzKbzunjPgEg+dxtrF+fgkuxG6wXkMkBmbkrtNmJBTPKGhZaIC16pequNvbrWB4DZo=
X-Received: by 2002:a37:49c7:: with SMTP id w190mr8394956qka.402.1585549637903;
 Sun, 29 Mar 2020 23:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200330081935.5bd8364a@canb.auug.org.au>
In-Reply-To: <20200330081935.5bd8364a@canb.auug.org.au>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Mon, 30 Mar 2020 08:27:06 +0200
Message-ID: <CAFqH_52jUCYYRn=NQSQ6aL-5m+QnKDVN5Wbq7bJpAzxsAsscDw@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the chrome-platform tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Benson Leung <bleung@google.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gwendal Grignou <gwendal@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Missatge de Stephen Rothwell <sfr@canb.auug.org.au> del dia dl., 30 de
mar=C3=A7 2020 a les 0:18:
>
> Hi all,
>
> In commit
>
>   5ca22c7cae55 ("iio: cros_ec: Use Hertz as unit for sampling frequency")
>
> Fixes tag
>
>   Fixes: ae7b02ad2f32 ("iio: common: cros_ec_sensors: Expose
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over more than one line.
>

Thanks for the report, fixed.

Cheers,
Enric

> --
> Cheers,
> Stephen Rothwell
