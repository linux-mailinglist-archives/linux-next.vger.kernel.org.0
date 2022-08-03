Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5E2588CEA
	for <lists+linux-next@lfdr.de>; Wed,  3 Aug 2022 15:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbiHCNZw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Aug 2022 09:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbiHCNZv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Aug 2022 09:25:51 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D26A38B5
        for <linux-next@vger.kernel.org>; Wed,  3 Aug 2022 06:25:50 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id q7so18883722ljp.13
        for <linux-next@vger.kernel.org>; Wed, 03 Aug 2022 06:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=a8x2ZOr3OJQ7WkBJoA9idC49LScpgSTLREdRfqKOVe4=;
        b=Hpjrj3yFlXvwFp3t6RTtHFk8oefoYyKwIDl4dYvJ2PwbTGiYF8u+lG1pfI/HVdm5kO
         nGlVUFn8mr0KlqqyPAyIZFxPdv2c2v1Y7fkBGAyX7LoJnGAonrVICAlSx8sCdwwIIyC4
         XiX39H4FUdkBGlz2Xqy2NuO0kpa3qbOVLZlVDDxOe1xiFmbDiFwhuVqLlcH87vL+LCCT
         KR73i0Q3KfROnFpbEdPRK5Fv24tTITx94AuioQvIdrK9JfDKBRCcm+RzB7qiFF5/JYI/
         eGO3ZY4r4yliBZicRATIrOMI9veQZwxpPdHW9YveYJ69gkOmdQAm8lNmxszRasO9qOza
         vuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=a8x2ZOr3OJQ7WkBJoA9idC49LScpgSTLREdRfqKOVe4=;
        b=DQzOzyoiPcY1AqCV2CRoFqss5wU3/kxEmr4EMQyoEEX+UGn/p7IY/2JqFbAhwDqFqR
         Go5gwRvucXdIXDWCRl46wd1I5ukyBbvNDKaHQ3YWIEyIvaFWk72PDLIJGUYWH9z4Sh9V
         xOy+VNN1ZrzCPx7cp13ttZfqTmAmqs6xrWDpqZjVx7NJxNtBK7v8TcikXtdU4UU9JZQ8
         grr5aL9Fdqk/TPoFrjDsD546xr4TJbjlvNnzGQlJWSWkn9lI20A4oGrdKKqVAoJsZdyd
         UHaszSajb1i7u7p6QBohq82a0UJlDvqRjEeomP+vunZCIV3eQ7ZCO4JFL38yetp8pBgN
         ix1Q==
X-Gm-Message-State: AJIora8v7TrCNIIcVIgXRyKAUdUmXM2My/3EbNy8G5gPu5MnA5ctm71a
        OudmFr8MVjJZaL+XYuCz7l4werXYLtRnuSGtk1Y=
X-Google-Smtp-Source: AGRyM1ulkRsENUwGtRpQkNk5/htgMGD3UngtRdTZAdPSX1oeQsgkmMvu6wJHDtE6RqVgH6YY6dVQKRqDzzLOWVdK2zg=
X-Received: by 2002:a2e:a794:0:b0:25e:8d6:386 with SMTP id c20-20020a2ea794000000b0025e08d60386mr8398659ljf.42.1659533148764;
 Wed, 03 Aug 2022 06:25:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6500:da1:b0:14b:be7e:57fe with HTTP; Wed, 3 Aug 2022
 06:25:48 -0700 (PDT)
Reply-To: thomasjoyec@yahoo.com
From:   Joyce Thomas <thomasjoycetho12@gmail.com>
Date:   Wed, 3 Aug 2022 06:25:48 -0700
Message-ID: <CADijiqR85j_h9s2QjGt8WE5xszrDtgqJZQ2hEZv042+Th_uOPQ@mail.gmail.com>
Subject: URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:232 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5021]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [thomasjoycetho12[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [thomasjoycetho12[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi my dear,
Good day to you today and how are you doing; please I want to hear
from you so that I will know what to do r regards to this matter.
Please I wait to read from you as soon as you receive this mail.
Mrs. Joyce Thomas
