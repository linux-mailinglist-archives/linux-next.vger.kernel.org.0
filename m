Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C56333791
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 09:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbhCJIld (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 03:41:33 -0500
Received: from m34-101.88.com ([104.250.34.101]:41169 "EHLO 88.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231735AbhCJIlD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Mar 2021 03:41:03 -0500
X-Greylist: delayed 360 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Mar 2021 03:41:02 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=5g4I0r/DGg6RJLF1PGE/mXjosHacIgb1ONExj
        xL+IEk=; b=Md1VgYbQ1e7UjkYsG2OznmBYOUdKKNgeBW00F6cN2COaToPz+BKWg
        d950Es2TvlkeJDQ/NrhyeO8oTio+CGhFAmjkvH7XfTt1VvssfWWROrTdkrWyIHmp
        y6a78QAxULhlo5y9vlDW4mDK3WoKEcZRBGgSoTYkgBxzg3v6jloFB4=
Received: from mipc (unknown [110.64.86.229])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCnMiNhhEhgjH4hAA--.23797S2;
        Wed, 10 Mar 2021 16:33:39 +0800 (CST)
Date:   Wed, 10 Mar 2021 16:33:37 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] docs/zh_CN: fix original link unknown document warning
Message-ID: <20210310083335.GA17722@mipc>
References: <20210310142019.27b9aa7b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210310142019.27b9aa7b@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCnMiNhhEhgjH4hAA--.23797S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4Utw1fGw4rWFW5Jw4Utwb_yoW8Aryrpa
        4vkryIk3ZrAFy3Cr4kWry7tF17tF4xW398GF1j9wn5XFs5Ar1vqr42gr9rK3ZxXr40qay8
        XrWSgryF9r4jyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqqb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42
        xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
        14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
        kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
        wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
        4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUUOzVUUU
        UUU==
X-Originating-IP: [110.64.86.229]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fix original link unknown document warning in zh_CN/admin-guide/README.rst
and admin-guide/unicode.rst which introduced by commit:

  550c8399d017 ("docs/zh_CN: Add zh_CN/admin-guide/README.rst")

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
Sorry for the inconvenience. This is a fix patch. 
Or I could re-submit the two original patches if you need.

 Documentation/translations/zh_CN/admin-guide/README.rst  | 2 +-
 Documentation/translations/zh_CN/admin-guide/unicode.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
index 939aee115e48..99b708a416d8 100644
--- a/Documentation/translations/zh_CN/admin-guide/README.rst
+++ b/Documentation/translations/zh_CN/admin-guide/README.rst
@@ -1,6 +1,6 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/admin-guide/README.rst <Linux kernel release 5.x>`
+:Original: :doc:`../../../admin-guide/README`
 
 :译者:
 
diff --git a/Documentation/translations/zh_CN/admin-guide/unicode.rst b/Documentation/translations/zh_CN/admin-guide/unicode.rst
index ef7f3cb2c02e..814f9ecf562b 100644
--- a/Documentation/translations/zh_CN/admin-guide/unicode.rst
+++ b/Documentation/translations/zh_CN/admin-guide/unicode.rst
@@ -1,6 +1,6 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/admin-guide/unicode.rst`
+:Original: :doc:`../../../admin-guide/unicode`
 
 :译者:
 
-- 
2.20.1

