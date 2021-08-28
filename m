Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8773FA4DF
	for <lists+linux-next@lfdr.de>; Sat, 28 Aug 2021 11:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbhH1Jwf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 28 Aug 2021 05:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbhH1Jwc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 28 Aug 2021 05:52:32 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A9AC0613D9
        for <linux-next@vger.kernel.org>; Sat, 28 Aug 2021 02:51:41 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id e16so7514207pfc.6
        for <linux-next@vger.kernel.org>; Sat, 28 Aug 2021 02:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=5LWjEJp7/vS3ArwbdFhnzFhxW1R+PX4BBA5dsIBBrU0=;
        b=TK4XyIxsfgng6T8+ES0iGLiNteEUHmNy6IlHfeWtS6Bwy8f2+B4T5+1/jG0IQTU968
         KuN9W5oeS33dgHuEhmnfsYYy5E9jYNmqNRzRgY3dCBh0+bIgiWkC+t/Mjk4dqi8zVdtM
         Tz9xdr0RO60cXD2rQuduE2aOEmHYSmTKkA/s6mUcjA7Ioxyl6mc1yhYzN8hnd6ZU7kpf
         kVUcMkM6Zdpkgwci4rtQTlTPldkTJRT/ycPW32ptxnqxaKCzg+d3yqRf9JKhmgVWfio7
         m+yVTHKhQ1F8uxacIT6cPd9goW6fmMQtD2XW2OXKebnTkLLoe43zVqRaGV7ZLg4ol3xb
         rfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=5LWjEJp7/vS3ArwbdFhnzFhxW1R+PX4BBA5dsIBBrU0=;
        b=FQqpHjCm3jnEAtlv/ZFNcRRVw+Cc3BJNiwALXM0zJ/H8LKKTrPMZv+iVkjuM+61vdu
         K915xlvhmX46MhxNK5a0o7IZI0ydOnBSlB0B/dHeBcUcNGH6iDBLY4A31JCHDuZbud5L
         qSi1RGlWQGB0DBO0UHIFV4mYnlD2dCn4Q+qJG23okP/KgIBj1XJQrYVY8L/8l2bkbQSa
         5hlS3XtkAbaCVA51GBc3+fSnHO99xf8Ssmuun8+8gCncqxwMunGFdPTHgRh1BV+qxdKE
         58BgkJyHniY01qNEaqBOUFkOgqJVmlH78Ue5HV3bJj6ii8LC1gzkXgshay9+IxKN3u2J
         X93Q==
X-Gm-Message-State: AOAM532YSh1ltohq/2xbt2JUxttU4Kf6UyIZ9v+X4saCVrCO3vRzui38
        Rl4ayGaVV1rEVCBBK0k2LMLL
X-Google-Smtp-Source: ABdhPJyPFp5JdvUCFQV/mxF6licR7NpKPwvfvB9buJ7zzUDNABwRaHKTUmQcqiuTBC8UomVIyr8NXA==
X-Received: by 2002:a63:ee03:: with SMTP id e3mr11765869pgi.386.1630144301165;
        Sat, 28 Aug 2021 02:51:41 -0700 (PDT)
Received: from ?IPv6:::1? ([2409:4072:6e0c:3a4a:44e3:35e5:d295:5b8a])
        by smtp.gmail.com with ESMTPSA id u12sm9679804pgi.21.2021.08.28.02.51.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Aug 2021 02:51:40 -0700 (PDT)
Date:   Sat, 28 Aug 2021 15:21:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kalle Valo <kvalo@codeaurora.org>, Greg KH <greg@kroah.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Jakub Kicinski <kuba@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: linux-next: manual merge of the char-misc tree with Linus' tree
User-Agent: K-9 Mail for Android
In-Reply-To: <877dg658rk.fsf@codeaurora.org>
References: <20210827164904.6b1d1f0e@canb.auug.org.au> <YSjkosA6yMrMmaNk@kroah.com> <20210827175852.GB15018@thinkpad> <YSk82+XbcRoBf37v@kroah.com> <877dg658rk.fsf@codeaurora.org>
Message-ID: <1B4CED49-0223-41C6-A0CF-92F1C9C86EF1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Kalle,=20

On 28 August 2021 12:57:27 PM IST, Kalle Valo <kvalo@codeaurora=2Eorg> wro=
te:
>Greg KH <greg@kroah=2Ecom> writes:
>
>> On Fri, Aug 27, 2021 at 11:28:52PM +0530, Manivannan Sadhasivam wrote:
>>> Hi Greg,
>>>=20
>>> On Fri, Aug 27, 2021 at 03:12:02PM +0200, Greg KH wrote:
>>> > On Fri, Aug 27, 2021 at 04:49:04PM +1000, Stephen Rothwell wrote:
>>> > > Hi all,
>>> > >=20
>>> > > Today's linux-next merge of the char-misc tree got conflicts in:
>>> > >=20
>>> > >   drivers/bus/mhi/core/main=2Ec
>>> > >   net/qrtr/mhi=2Ec
>>> > >=20
>>> > > between commit:
>>> > >=20
>>> > >   9ebc2758d0bb ("Revert "net: really fix the build=2E=2E=2E"")
>>> > >=20
>>> > > from the origin tree and commit:
>>> > >=20
>>> > >   0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")
>>> > >=20
>>> > > from the char-misc tree=2E
>>> > >=20
>>> > > I fixed it up (the commit in Linus' tree is basically a revert of =
the
>>> > > char-misc tree, so I effectively reverted the latter) and can carr=
y the
>>> > > fix as necessary=2E This is now fixed as far as linux-next is conc=
erned,
>>> > > but any non trivial conflicts should be mentioned to your upstream
>>> > > maintainer when your tree is submitted for merging=2E  You may als=
o want
>>> > > to consider cooperating with the maintainer of the conflicting tre=
e to
>>> > > minimise any particularly complex conflicts=2E
>>> >=20
>>> > Hm, what should I do in my tree here?
>>> >=20
>>> > Kalle, what commit should I make in the char-misc tree now to handle
>>> > this issue, and make the merge with Linus's tree "simple"?  Or any o=
ther
>>> > ideas?
>>> >=20
>>>=20
>>> For making the merge simpler, I'd suggest we revert below commit in ch=
ar-misc:
>>>=20
>>> 0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")
>>
>> Reverting that works for me, I've done that in my tree and that allows
>> it to be merged cleanly with Linus's tree=2E
>
>Unfortunately this now breaks the build in char-misc-next (commit
>0dc3ad3f859d):
>

You need to revert ce78ffa3ef16 and that's already done in net-next=2E So =
once current net-next and char-misc-next reaches linus tree everything shou=
ld be fine=2E=20

I forgot to mention that the testing should be done with both char-misc-ne=
xt and net-next or in linux-next=2E=20

Is it mandatory to make it work with char-misc alone? In usual case I know=
 it is mandatory but I thought with current situation it should be fine=2E=
=20

Thanks,=20
Mani

>net/qrtr/mhi=2Ec: In function 'qcom_mhi_qrtr_probe':
>net/qrtr/mhi=2Ec:105:48: error: 'MHI_CH_INBOUND_ALLOC_BUFS' undeclared (f=
irst use in this function)
>  105 |         rc =3D mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_A=
LLOC_BUFS);
>      |                                                ^~~~~~~~~~~~~~~~~~=
~~~~~~~
>net/qrtr/mhi=2Ec:105:48: note: each undeclared identifier is reported onl=
y once for each function it appears in
>net/qrtr/mhi=2Ec:105:14: error: too many arguments to function 'mhi_prepa=
re_for_transfer'
>  105 |         rc =3D mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_A=
LLOC_BUFS);
>      |              ^~~~~~~~~~~~~~~~~~~~~~~~
>In file included from net/qrtr/mhi=2Ec:6:
>=2E/include/linux/mhi=2Eh:725:5: note: declared here
>  725 | int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
>      |     ^~~~~~~~~~~~~~~~~~~~~~~~
>
>To see this error make sure CONFIG_QRTR and CONFIG_QRTR_MHI are enabled=
=2E
>

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
