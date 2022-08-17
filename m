Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A626596727
	for <lists+linux-next@lfdr.de>; Wed, 17 Aug 2022 04:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238423AbiHQCDF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Aug 2022 22:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237900AbiHQCDD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Aug 2022 22:03:03 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE16485FEE
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 19:03:02 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id v10so12256064ljh.9
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 19:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc;
        bh=zwISn8wdVLRMx4eihcM5TNekfJsbrZ4Xl+DqPJtSy8k=;
        b=Vd3kZ5LQY/tHUqKhqhU7/fREASLyr52RwxpGX337OriC6pyeobuTc26YajBPzaXrQ0
         O637ft9b4CZW/CPcB8eEKyEoo+3Xb1cJuDiZM22fgR9G0LDoYr0i788azWghtaGQ2RFM
         oqZrxuMt8kWFKedPsQHPZBYLPGOsV8/6GJFZiZIuGr0Knh3IhLRncL8rCTyLg2MeEzAj
         L4H2IWwWIXvhCA8BUDE5hbMmPiRL8vXl7Yf9pbz6nKgrV0ZA9yOTgYw02agGUD9IAqpm
         4bqnXub5r4LABufcHI1njfSo1cfOubj47Em38VgikRS8dZAHMspB3tt04vRpV8Ji6JKV
         448A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc;
        bh=zwISn8wdVLRMx4eihcM5TNekfJsbrZ4Xl+DqPJtSy8k=;
        b=1tDjBh04epyp2vxUFh9AY45bG2NiA0AJQC167Dux9+c5GMlTKebfhtGoCTc14dJygM
         isKwMfm+P+q5RdDzgaheqSByf2QJTfkmY44hLJVOm/dhxYDMUkdaVBSfgzG7GEjA1a50
         n1YtI+bEohPGl9+ixYOHV2M2tq93MOMIdJazivhX7aXPr3ae3KGPPGjz5mKRAo6oLeAU
         60nezldKwKExjMhtz/IPpXGNQ52opEoJ+V4YZgo6+oPJ7VPR+a41L2b4pBVGo4a6oURY
         K3lMCILHBnu/0AkUeJayhxos/xFkucFUnyzy7zbKW7a9AL6jNz+3v4GajqPR81UGf0nm
         qanw==
X-Gm-Message-State: ACgBeo2YXxFYtdfDhTBQcRhaCaOK/uIYHxl7xgD2LpXpJYOcJTnz4Jmc
        aN50YzpjujQyM7hoR0R0rOJdlMfSFG9RWZYeWn0=
X-Google-Smtp-Source: AA6agR6zFzmCrxnEqD2w+UWVrITUVzOYS4hi3aH6ioV6AgSO4c9wfd/k77DCkH61CXXYcVPpl/s5ZQ0XTDiIEu07ZIg=
X-Received: by 2002:a2e:8090:0:b0:25e:5916:ddf4 with SMTP id
 i16-20020a2e8090000000b0025e5916ddf4mr6831295ljg.11.1660701781053; Tue, 16
 Aug 2022 19:03:01 -0700 (PDT)
MIME-Version: 1.0
Sender: sgtkaylmanthey612@gmail.com
Received: by 2002:aa6:da8c:0:b0:1fa:b1fc:86c4 with HTTP; Tue, 16 Aug 2022
 19:03:00 -0700 (PDT)
From:   Kayla Manthey <sgtkaylamanthey612@gmail.com>
Date:   Wed, 17 Aug 2022 02:03:00 +0000
X-Google-Sender-Auth: HH_PSQbVSO0tz_Ij7Rfifs0s0U4
Message-ID: <CALwsdYFG7Hmnb2w8o9G8_bt=QdNxWxK8Mt=Xm+jUzaDdEKohJw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi, how are you? I hope you're OK. I'm still looking forward to
hearing from you in regards to my previous emails, please check and
reply me.
