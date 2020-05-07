Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9DB1C9678
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 18:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgEGQ1L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 12:27:11 -0400
Received: from sonic316-26.consmr.mail.ne1.yahoo.com ([66.163.187.152]:33404
        "EHLO sonic316-26.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbgEGQ1K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2020 12:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1588868829; bh=xgEGGpHdlh6v17vp9QzvUwVuSMWdUGY2rKZWIGMKimU=; h=From:Subject:To:Cc:References:Date:In-Reply-To:From:Subject; b=G6RGfEJNa1m8PcwCJxu852MHsC0oxJjjhCw0o61H5Hdabx5nwOgCcV8tO+/Lpw4R8L8+zD/DzpZlxq+OAmT1bT2lV1NRRwVvn/7rYAGoDWzCqJC9gck5JibORNnlrXXYDNOVysGk/eE/vP0qo0ZPnh1g6yISjNGHAhyO2QWXcu6yABvIxEKFx0LfiX4iAZni3TGwSsQVUz+UR11IKSe5jbCDAmlr3jt8DfqzJE2Bc5m48VrjVGUv3ETwGZv97uk/+5OhMC61raHrQT8JmfAvptsCqSTmP5z3IodMEyIty5hhWM6U+qpMh5F8JrKLC8K1CT/xcJPRiuP3OQtYv/NWaA==
X-YMail-OSG: 9eFVwucVM1nv8ye1wGvl0bQS10cqqOv3ThODrTVIovWs7UF6itJEP25ebLjNtx9
 d.ax26b9yUn0yEVbGSVhwlNUz7wDTwnBynoiWOT6TYtIifuUUBQKOF_DfmzXRqXVFtmOL6_3PYRn
 CaA7a5ubqPZ9mpGZOhJJoXi5Lj1O0F7NpSyrEsrEc7bBgZZY22le1yRkHpCkJ2jha45cDfH3Skgy
 N6NCCwT6IOHP52PhGlaBZ_V2OzxUxjMYIkM_qqxT_9B97GEAKL3oAzgDJYYci0ilU4sPEV3p3EKK
 kDdsf_nP.HIYGQekkkqzelixjeXKrY792JrfjxZUO80P5RoCUWO1H2LYdH7EBlJYPIqb.nCahmgh
 5lsmdt4xDGaTXz3iIWMDu7_h73t7Cmh31e7l5Ceou5yKWDibtMml23iZVN8TA1qq4t54zjrq68OP
 NeqvVskhfB1OPOWUbY7fxHcyLK0dNfIW5DpxebouoajHudXmSTmQboL1hlwzPItEy0x8SEiaJx51
 JQk7hWGy_A3ld..Seqtnsf_LVI3B_PPxBhuQ_l9xJ0Pdg_gKVr1dXziTRByzstEhoJGCd1ImtvVh
 q2vBtFJIau9LwoPvEKtcoBKQTrZP1QwmmhU33yvXXrLVPux8.XeBkELWVljWs2qJ3i41jBv7aohj
 yM5A4XynakwCHZByk.Ttw0B22hZtaflaNOo2IIlJg2VXC3vgzurT_Z7WBbPs20C9u7SNJ9SyVycZ
 nabxBhzlwyhKBWpaNFN.Lt9mhslpodwLwma7MTcSWU6NZIKG98lR7IPPPV_EIM4cRCvjLCbZfw2y
 MOT3tz7zbS4_6057T2NeCljpUW9EoDd_BRBlcMYMB.jUUTZECFBknmnWIjf9Bh_KrUupvO2xF9OO
 t7vU1XpwkyQ8AVHl7myeulnowss7Jmr0juyIkmxoCANHnS5yb83Ke8u7Z7XUlg.VdwciQFw6ibkN
 v36U_q44JTbtxcAs.vVoy3PuOmMy2.8_X5VGqHbXQe.Oigb9KYny.YiDqnpMWJkV5RW1Oc1S_S1g
 z7VcdvoWqzx3beiQXt2jJuVFHiSqRjgwyZsBrllb6LYcWaHye8xKf5XEtNm.ZyZhl.er_9Lyx4sZ
 YJMg7jj7HIdsooTsmGTwqs3CaX1ImLZ0pcHgu6VDYUXsWbu9o8y683ErAB.cO4xgqcyUrZ5EwpXV
 5UJwEux4hbQ2ojujNeQtOK4vEQryIfHgtxazHnmRfKUb2JfbMrQECT7JND.1uPN0uxZA1a31m4hK
 mQo2Yum4OQmKvI7XWWHucb8m4ZvG9rjDb8fLd5jaDYw7foV2BZhfJ85xoZEVbfxlYld_LCYaaTHN
 1Jb963vVWYqrqOBtVCNRwi99DnqVjdpPebSI5KSMuwbwZoKY8nMo5DOWuqfvLkY70UGOfGqoFKtR
 PKOfbq2SjNJNcTO..TI9RSEd.4A--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Thu, 7 May 2020 16:27:09 +0000
Received: by smtp424.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 670988c6ce6ca50ecaf76f1cf9203ede;
          Thu, 07 May 2020 16:27:04 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
Subject: Please add Smack tree to linux-next
To:     sfr@canb.auug.org.au
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        "Schaufler, Casey" <casey.schaufler@intel.com>
References: <68401d6d-190c-75ec-b311-b47b0b8a57a5.ref@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <22f94d61-de26-c858-2571-ca6da12b56f4@schaufler-ca.com>
Date:   Thu, 7 May 2020 09:27:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <68401d6d-190c-75ec-b311-b47b0b8a57a5.ref@schaufler-ca.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailer: WebService/1.1.15756 hermes Apache-HttpAsyncClient/4.1.4 (Java/11.0.6)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Could you add https://github.com/cschaufler/smack-next#next to the next tree?
I believe that I have addressed the git issues that I had with the previous branch.
Thank you.


