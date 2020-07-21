Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3E82287A4
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 19:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730824AbgGURmM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 13:42:12 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:29964 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730804AbgGURmH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2020 13:42:07 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200721174204epoutp03e4a4cf497f3f1005432d6cd560db3fda~j1WVNIpEE2679226792epoutp033
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2020 17:42:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200721174204epoutp03e4a4cf497f3f1005432d6cd560db3fda~j1WVNIpEE2679226792epoutp033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1595353324;
        bh=jjP9Yogd6RPQu0KtJN58TDx/6/d93a8jjg+K17x3bAI=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=IM0ImzkInVStP3hSOG/Qk3XmMpXbqvws4PfzncHL1VFiirR2aSNifKdS2R8EWpiRf
         NIH82hryfsTDaStjUmzFRwaet+LC5DFhPH1XL8qIRmzN6dq/fjoFQOeBJYrsxLJbea
         dhDH2G0pGv8fwU9xdOxVVR9YhgH9X1KdaHxJAgHg=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20200721174203epcas5p30337de22dce96877606a12f2feede272~j1WUPOFFE1008610086epcas5p3p;
        Tue, 21 Jul 2020 17:42:03 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        62.9E.09475.AE8271F5; Wed, 22 Jul 2020 02:42:02 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20200721174202epcas5p1cf62a9357c8c8fffa978946005ebf551~j1WTZqnTo0836208362epcas5p1S;
        Tue, 21 Jul 2020 17:42:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200721174202epsmtrp2976177db6d3fdf6bad357ca2a8f31fd3~j1WTY6MIP1506815068epsmtrp2g;
        Tue, 21 Jul 2020 17:42:02 +0000 (GMT)
X-AuditID: b6c32a4b-39fff70000002503-50-5f1728ea0c91
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        35.77.08382.9E8271F5; Wed, 22 Jul 2020 02:42:01 +0900 (KST)
Received: from alimakhtar02 (unknown [107.108.234.165]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200721174159epsmtip2f651e157973aa10613138d5ff8901959~j1WRVSoUN2332023320epsmtip2C;
        Tue, 21 Jul 2020 17:41:59 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Randy Dunlap'" <rdunlap@infradead.org>,
        "'Stephen Rothwell'" <sfr@canb.auug.org.au>,
        "'Linux Next Mailing List'" <linux-next@vger.kernel.org>
Cc:     "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        "'linux-scsi'" <linux-scsi@vger.kernel.org>,
        "'Santosh Yaraganavi'" <santosh.sy@samsung.com>,
        "'Vinayak Holikatti'" <h.vinayak@samsung.com>,
        "'Seungwon Jeon'" <essuuj@gmail.com>
In-Reply-To: <e6112633-61c9-fa80-8479-fe90bb360868@infradead.org>
Subject: RE: linux-next: Tree for Jul 20 (scsi/ufs/exynos)
Date:   Tue, 21 Jul 2020 23:11:57 +0530
Message-ID: <06a601d65f86$3d8aeee0$b8a0cca0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIWmKFrqc6cTichonS6aOkZQnVssAH33GmqAhZA11+ocWkksA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7bCmpu4rDfF4g+nvLS2WX1jCZHF51xw2
        i4ML2xgtuq/vYLN4e2c6i8XWvVfZHdg8Gm/cYPPYOesuu8fmFVoenzfJBbBEcdmkpOZklqUW
        6dslcGWs7p/LVHCZq+Lo7bdsDYzPOboYOTkkBEwkpjSvYu9i5OIQEtjNKLH59V5WCOcTo8Tn
        aS9ZIJxvjBLXP21ih2nZvHkFI0RiL6PE78Nv2CCcN4wSr5b0sYJUsQnoSuxY3AaWEBGYzijx
        4WkXmMMs8JNR4uwtkBZODk4BR4mGztksILawgJXEnDO7wLpZBFQlvp05wAhi8wpYShx82A1l
        C0qcnPkErJ5ZQFti2cLXzBA3KUj8fLoMrFdEwEmi798uJogacYmjP3ugalo5JD6ek4ewXSR+
        zj7BCGELS7w6vgXqNymJz+/2At3GAWRnS/TsMoYI10gsnXeMBcK2lzhwZQ4LSAmzgKbE+l36
        EJv4JHp/P2GC6OSV6GgTgqhWlWh+dxWqU1piYnc3K4TtIdG+fQHrBEbFWUj+moXkr1lI7p+F
        sGwBI8sqRsnUguLc9NRi0wLjvNRyveLE3OLSvHS95PzcTYzglKPlvYPx0YMPeocYmTgYDzFK
        cDArifDqMIrHC/GmJFZWpRblxxeV5qQWH2KU5mBREudV+nEmTkggPbEkNTs1tSC1CCbLxMEp
        1cA021Vdo28F40TWWVn37Z9MmRCY4Barouy2817qJZUKl22bxMJ888yYdd7MrhaPU1q2tML+
        U8AcYVW13y7ZXhuuPozftF9p+yZx93Xu+7yvb9QQe5EXeKiB/VXhR92s1+/ZPiUnHTsnrK4t
        Wa267ZLfVJ7vm/lYG3qv+Mg6nBJTyuhkcK1kcSoTFj8t/yzI0PTmywMnbpxo/Bi9g9nt0Yf8
        G2snsp3mKNZ5MM/bWrLssmiy23KdoN9bZ/21UJcSvhhk4bmF/+DFF937VfeqeS+N99FuKWFP
        tjnFyu7xSt1JTD7z94fJWXria1P3zPvppKCxbMeEv24r9dccKWw+dbPpU+jWmqP9nFv2Ta9k
        uKzEUpyRaKjFXFScCAAzuE6aqAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsWy7bCSvO4rDfF4gxehFssvLGGyuLxrDpvF
        wYVtjBbd13ewWby9M53FYuveq+wObB6NN26weeycdZfdY/MKLY/Pm+QCWKK4bFJSczLLUov0
        7RK4MlbcsC/o4Ko49mYTcwPjIo4uRk4OCQETic2bVzB2MXJxCAnsZpR48WYZK0RCWuL6xgns
        ELawxMp/z9khil4xSvy4eJ8ZJMEmoCuxY3EbG0hCRGA6o8T5vi/MIA6zwG9GiVNtG1ggWvYy
        Shz4dBJsFqeAo0RD52wWEFtYwEpizpldYPtYBFQlvp05wAhi8wpYShx82A1lC0qcnPkErJ5Z
        QFvi6c2ncPayha+ZIe5TkPj5FOJuEQEnib5/u5ggasQljv7sYZ7AKDwLyahZSEbNQjJqFpKW
        BYwsqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgmNHS3MH4/ZVH/QOMTJxMB5ilOBg
        VhLh1WEUjxfiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6NwYZyQQHpiSWp2ampBahFMlomDU6qB
        Kb8mt6Pa8JLnnUfODx+GzFqzafcktbbE3+snyi35GT9n1THrnr8savLbFhz6sVxtBv8iT73L
        h9/tLCle+HvTizBLE0fR14/KOK8FeW2+fcxQTsnC/4mm85fXO2KUjuv9F8/5ZHhQOVGR66bs
        eYeX07fGeEkrFXneuNq+UnzC14fX5ZoePXrygneiMM/7pdqrdfu+cidaer/x071VfiK+NDr/
        +7vWtY1/+ho7JpWlnP26/9kWrq+BbE887pkX+02ofX79nm5Dqf4etiU1ntd+B367bjSltMZy
        wWq1ZR5pu7ZouIXc2Wi+V2rrkbCsb9ybly4OEb+TWre2omL18psdbwNEMiKrmB9bH4gyWfVT
        Ll+JpTgj0VCLuag4EQA4T0MvDAMAAA==
X-CMS-MailID: 20200721174202epcas5p1cf62a9357c8c8fffa978946005ebf551
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20200720164116epcas5p2021c67d1778e737d7c695f6bdbc5b2d4
References: <20200720194225.17de9962@canb.auug.org.au>
        <CGME20200720164116epcas5p2021c67d1778e737d7c695f6bdbc5b2d4@epcas5p2.samsung.com>
        <e6112633-61c9-fa80-8479-fe90bb360868@infradead.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

> -----Original Message-----
> From: Randy Dunlap <rdunlap=40infradead.org>
> Sent: 20 July 2020 22:11
> To: Stephen Rothwell <sfr=40canb.auug.org.au>; Linux Next Mailing List <l=
inux-
> next=40vger.kernel.org>
> Cc: Linux Kernel Mailing List <linux-kernel=40vger.kernel.org>; linux-scs=
i <linux-
> scsi=40vger.kernel.org>; Santosh Yaraganavi <santosh.sy=40samsung.com>;
> Vinayak Holikatti <h.vinayak=40samsung.com>; Alim Akhtar
> <alim.akhtar=40samsung.com>; Seungwon Jeon <essuuj=40gmail.com>
> Subject: Re: linux-next: Tree for Jul 20 (scsi/ufs/exynos)
>=20
> On 7/20/20 2:42 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20200717:
> >
>=20
> on x86_64:
>=20
> WARNING: unmet direct dependencies detected for PHY_SAMSUNG_UFS
>   Depends on =5Bn=5D: OF =5B=3Dn=5D && (ARCH_EXYNOS =7C=7C COMPILE_TEST =
=5B=3Dy=5D)
>   Selected by =5By=5D:
>   - SCSI_UFS_EXYNOS =5B=3Dy=5D && SCSI_LOWLEVEL =5B=3Dy=5D && SCSI =5B=3D=
y=5D &&
> SCSI_UFSHCD_PLATFORM =5B=3Dy=5D && (ARCH_EXYNOS =7C=7C COMPILE_TEST =5B=
=3Dy=5D)
>=20
Thanks, will post a patch shortly.
>=20
> There are no build errors since <linux/of.h> provides stubs for functions=
 when
> CONFIG_OF is not enabled.
>=20
> But new warnings are not OK.
>=20
> thanks.
> --
> =7ERandy
> Reported-by: Randy Dunlap <rdunlap=40infradead.org>

