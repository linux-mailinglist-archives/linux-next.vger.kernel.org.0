Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84AB928AA70
	for <lists+linux-next@lfdr.de>; Sun, 11 Oct 2020 22:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbgJKUgf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Oct 2020 16:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729168AbgJKUgf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Oct 2020 16:36:35 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553CEC0613D0
        for <linux-next@vger.kernel.org>; Sun, 11 Oct 2020 13:36:35 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x7so8151938wrl.3
        for <linux-next@vger.kernel.org>; Sun, 11 Oct 2020 13:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=84qNkUPaBTMQoFRuOw7Z4b1y2BLHPwq5m8Z0s1EN7Cg=;
        b=Ian7UrwJlJrxfZzyyV1HnxoG0BcL+g5zsIMBI0XemjDO8yWGFqWUWlchB+RE9d60YI
         qNuBRf3QwD9lfpheHSTWUGvjaahjotyS6116rZoKg3O2BVcG6nhE8TUUaPYJDg4CHcWC
         8au4RbQNcPFU4Hz3b/TxnhWYG14rlT5IfX20E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=84qNkUPaBTMQoFRuOw7Z4b1y2BLHPwq5m8Z0s1EN7Cg=;
        b=HjtCV8w3JR6Tkm7eg/5t5eTmjnglhCbtaOamQIf9ql5M6jIGtKbfwa4K9KRp3vcyin
         xvCdupdMN9o85IC3b72GcNscdyv1OYtCnGr41w9qB7q0Kcaw3lJc1zJPM5sUwJtYQqcu
         Bq1l9OViN3uyKLRAdZeUAk0ljYJP95zFTzUJj/KGLdqgPN32N3jVhd6a2RsWJ+yTbDhy
         NYu1lgIJF+ywxHFZkhkWy7YubxVCSdBqDu9qv6/V+8HM02pFruo4LWw0q1fDSY32Xe1x
         4v26qYjjUeXly9StPvI2knyAqYBMk89wC6ptCKNsLO964dkhzd6RNlcYv3NKx3cFNBwu
         Z6lg==
X-Gm-Message-State: AOAM531MQtEgMrBZHAfGGRSEXjs/U2IStaH423PIJ2nEe7FmWz+B2gfX
        AjPhFbyxqr1G4RlRC6CmAHnVjGSIYarGdh1kXWAAKA==
X-Google-Smtp-Source: ABdhPJxZP5LWFVb4yeIdexz6d4JDTHAAGiDr46SFA89oBFMpIh9W7HZg4zpkTx6+AWoJ7WMGUmJqpCDMhEMh2dt05nw=
X-Received: by 2002:adf:ea4d:: with SMTP id j13mr3714971wrn.345.1602448593669;
 Sun, 11 Oct 2020 13:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org> <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org> <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org> <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
 <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com> <20201011055258.22337d66@canb.auug.org.au>
In-Reply-To: <20201011055258.22337d66@canb.auug.org.au>
From:   Jim Quinlan <james.quinlan@broadcom.com>
Date:   Sun, 11 Oct 2020 16:36:22 -0400
Message-ID: <CA+-6iNwpFeJaa7CisS-DD2q45uaV8Jz6YU0kPucqpZAAK3ojuQ@mail.gmail.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Poonam Aggrwal <poonam.aggrwal@nxp.com>,
        Rob Herring <robh@kernel.org>, Joerg Roedel <jroedel@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
        Will Deacon <will@kernel.org>,
        "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>, Christoph Hellwig <hch@lst.de>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="00000000000038007305b16b23e5"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--00000000000038007305b16b23e5
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 10, 2020 at 2:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Naresh,
>
> Just adding Christoph and Jim to cc]
>
> On Fri, 9 Oct 2020 19:26:24 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Fri, 9 Oct 2020 at 19:24, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > >
> > >
> > > On Thu, 24 Sep 2020 at 15:26, Joerg Roedel <joro@8bytes.org> wrote:
> > > >
> > > > On Thu, Sep 24, 2020 at 10:36:47AM +0100, Robin Murphy wrote:
> > > > > Yes, the issue was introduced by one of the changes in "dma-mapping:
> > > > > introduce DMA range map, supplanting dma_pfn_offset", so it only existed in
> > > > > the dma-mapping/for-next branch anyway.
> > >
> >
> > FYI,
> > The reported problem still exists on 5.9.0-rc8-next-20201009.
> >
> > [    1.843814] Driver must set ecc.strength when using hardware ECC
> > [    1.849847] WARNING: CPU: 4 PID: 1 at
> > drivers/mtd/nand/raw/nand_base.c:5687 nand_scan_with_ids+0x1450/0x1470
> > [    1.859676] Modules linked in:
> > [    1.862730] CPU: 4 PID: 1 Comm: swapper/0 Not tainted
> > 5.9.0-rc8-next-20201009 #1
> > [    1.870125] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
> > [    1.876478] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=--)
> > [    1.882483] pc : nand_scan_with_ids+0x1450/0x1470
> > [    1.887183] lr : nand_scan_with_ids+0x1450/0x1470

Hi,

I'm having a hard time coming up with a theory regarding  how a commit
concerning DMA offsets can affect the operation of a NAND driver that
appears not to use DMA or the dma-ranges property.  Does anyone else
have some ideas, or is there perhaps someone familiar with this test
configuration that I can correspond with to get to the bottom of the
warning?

Thanks,
Jim Quinlan
Broadcom STB

> >
> > full test log,
> > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201009/testrun/3284876/suite/linux-log-parser/test/check-kernel-warning-92014/log
> >
> > > >
> > > > Okay, alright then.
> > > >
> >
> > - Naresh
>
> --
> Cheers,
> Stephen Rothwell

--00000000000038007305b16b23e5
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
mOxPm7sNHsn0TVdPryi9+T2d8fVC/kUmuEdTYP/Hdu4W4b4T9BcW57fInYrmaJ+uotS6X59rAgMB
AAGjggHRMIIBzTAOBgNVHQ8BAf8EBAMCBaAwgZ4GCCsGAQUFBwEBBIGRMIGOME0GCCsGAQUFBzAC
hkFodHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc3BlcnNvbmFsc2lnbjJzaGEy
ZzNvY3NwLmNydDA9BggrBgEFBQcwAYYxaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL2dzcGVy
c29uYWxzaWduMnNoYTJnMzBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYm
aHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBEBgNVHR8E
PTA7MDmgN6A1hjNodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzcGVyc29uYWxzaWduMnNoYTJn
My5jcmwwJQYDVR0RBB4wHIEaamFtZXMucXVpbmxhbkBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYI
KwYBBQUHAwQwHwYDVR0jBBgwFoAUaXKCYjFnlUSFd5GAxAQ2SZ17C2EwHQYDVR0OBBYEFNYm4GDl
4WOt3laB3gNKFfYyaM8bMA0GCSqGSIb3DQEBCwUAA4IBAQBD+XYEgpG/OqeRgXAgDF8sa+lQ/00T
wCP/3nBzwZPblTyThtDE/iaL/YZ5rdwqXwdCnSFh9cMhd/bnA+Eqw89clgTixvz9MdL9Vuo8LACI
VpHO+sxZ2Cu3bO5lpK+UVCyr21y1zumOICsOuu4MJA5mtkpzBXQiA7b/ogjGxG+5iNjt9FAMX4JP
V6GuAMmRknrzeTlxPy40UhUcRKk6Nm8mxl3Jh4KB68z7NFVpIx8G5w5I7S5ar1mLGNRjtFZ0RE4O
lcCwKVGUXRaZMgQGrIhxGVelVgrcBh2vjpndlv733VI2VKE/TvV5MxMGU18RnogYSm66AEFA/Zb+
5ztz1AtIMYICbzCCAmsCAQEwbTBdMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBu
di1zYTEzMDEGA1UEAxMqR2xvYmFsU2lnbiBQZXJzb25hbFNpZ24gMiBDQSAtIFNIQTI1NiAtIEcz
AgwTv2xmtR4KOmK4QvMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIB7mv0SNs5U2
fYHaAaaSQozTwtIgN3qzgvUu558A/Vw5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTIwMTAxMTIwMzYzNFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcN
AQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCL8G53lAQ5+iQ+hxVOqL7H0uFO82Dt
QuKMVRpfE9CbTMqFgfWQKhyt67y9s6Eb01eHLWNj0hZyQ4YrL9ErsGux35k7fRd+QgLztytvReKg
k7+NVJKuw1RH0jOMA+jfgW2r+cCxHP5qCUkPYykHdBZ8mJfZQklOtp9rDs7zToly6fprSxjc4/DH
+2vii+P26cC7m7aGZejprdssu+ixXU4Fh/TwHGU6YXzQXMzZM9sqL1JOgiKNXwEgul16olk0xaNR
F5aQwsqTdQldf41zf9j5CKxgL6LpwEvG3qPedeRHcuoaHSKEtuPOzR+2XfuDpAr5dK8fUVpt9CBW
lVimmoTj
--00000000000038007305b16b23e5--
