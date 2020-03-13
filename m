Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84FDC18497A
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 15:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCMOg6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 10:36:58 -0400
Received: from mail-lf1-f44.google.com ([209.85.167.44]:38247 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgCMOg5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2020 10:36:57 -0400
Received: by mail-lf1-f44.google.com with SMTP id n13so6269112lfh.5
        for <linux-next@vger.kernel.org>; Fri, 13 Mar 2020 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=mgh/LtawAyvtzo4cEDEYIHcPGiQwM8KZegFqOkKa+BY=;
        b=eId94T6axz3/a2w6OrytW+1TJV06pQ6vCwYZc7fT1UDsv0xse5UukW+83WS19sxUF0
         h5GyfS7fZE6Fw/zZF+n8v7Ee/2pq6zhTixijCSI4DIc23tUiGy9fFSIJV2LV0VbqUFQr
         1b2dTBt587iHOvXIZRSPEQz+PkH40xvLtIAtkHZeqUqsMJD27f0PgPjRkZwQytPYz5jF
         f+hOK53jia9RMUFJqfv+Vq/PpMWZDlNXI9oiuywpfH8Vjqc4KLYJE71F4UK52LWsw3c+
         /wKML9ELR41LCt41AidEfttjpdxUf4NwR1KvV9Pl4Vybc8bzfRl7s5M0qe0ht3bRaZud
         UElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=mgh/LtawAyvtzo4cEDEYIHcPGiQwM8KZegFqOkKa+BY=;
        b=knM2QTpc9rme21vaOL4SWCtRmUDLVADiXV7HIqKRoEAIN/TirmgNwaecxiXine6Q4s
         eKWjjo/LvhE1ikgVRdhWsFDtwh0vjpGmri/bjgQQjDn5wSOW7t/pObA1o25HCcXSrtUY
         LqXynBMNdhTeEpq4zcdPTaWQfue4I+CPVH2MFe0dpUXBgd2yBX2uV+A9e9SJHoA78/kZ
         YsgMtBtyOdf/01OY8JPwCkDOGMicFFU3MbuDW5GxU+REAmmBLcKEXfkA8kOJN2afdrz5
         R47ub2bFnaEsK4dNaPpDcCQHIYGeaBTosq1tvnP3kLqWITyfQQlj3/RdsE9DHMBnNFXn
         lekw==
X-Gm-Message-State: ANhLgQ1ReywnMfxOCP41RwpMjW0lC8yLRtZhPh1zCF20uBlf7poicuLU
        uO3f9+skc45YP+HnotTbnsZqza4vAqawrXcK9JtKsSvI43dc4w==
X-Google-Smtp-Source: ADFU+vtpi7SjAlNDkLzhS+6D+P783QQKHNf3Rqik1y/mFUVrj4WEJxPwQ3nUjmXyNDd/1759jAKsuhXafhkRvGazGQI=
X-Received: by 2002:a05:6512:3188:: with SMTP id i8mr9084499lfe.26.1584110215584;
 Fri, 13 Mar 2020 07:36:55 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 13 Mar 2020 20:06:44 +0530
Message-ID: <CA+G9fYvTmoge3esSO-gDU=jLwun-f8hs9-CgXUdGaysVge21Hw@mail.gmail.com>
Subject: =?UTF-8?Q?include=2Flinux=2Fbitfield=2Eh=3A131=3A3=3A_error=3A_call_to_=E2=80=98=5F=5F?=
        =?UTF-8?Q?field=5Foverflow=E2=80=99_declared_with_attribute_error=3A_value_doesn?=
        =?UTF-8?Q?=27t_fit_into_mask?=
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     lkft-triage@lists.linaro.org, elder@linaro.org,
        "David S. Miller" <davem@davemloft.net>, kuba@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The following error noticed while building linux-next kernel modules
for arm64 with CONFIG_ARM64_64K_PAGES=3Dy

# make -sk KBUILD_BUILD_USER=3DTuxBuild -C/linux -j16 ARCH=3Darm64
CROSS_COMPILE=3Daarch64-linux-gnu- HOSTCC=3Dgcc CC=3D"sccache
aarch64-linux-gnu-gcc" O=3Dbuild modules
#
In file included from ../drivers/net/ipa/ipa_endpoint.c:10:
In function =E2=80=98u32_encode_bits=E2=80=99,
    inlined from =E2=80=98ipa_endpoint_init_aggr=E2=80=99 at
../drivers/net/ipa/ipa_endpoint.c:544:11:
../include/linux/bitfield.h:131:3: error: call to =E2=80=98__field_overflow=
=E2=80=99
declared with attribute error: value doesn't fit into mask
  131 |   __field_overflow();     \
      |   ^~~~~~~~~~~~~~~~~~
../include/linux/bitfield.h:151:2: note: in expansion of macro =E2=80=98___=
_MAKE_OP=E2=80=99
  151 |  ____MAKE_OP(u##size,u##size,,)
      |  ^~~~~~~~~~~
../include/linux/bitfield.h:154:1: note: in expansion of macro =E2=80=98__M=
AKE_OP=E2=80=99
  154 | __MAKE_OP(32)
      | ^~~~~~~~~
make[4]: *** [../scripts/Makefile.build:268:
drivers/net/ipa/ipa_endpoint.o] Error 1

ref:
https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/470723504

--=20
Linaro LKFT
https://lkft.linaro.org
