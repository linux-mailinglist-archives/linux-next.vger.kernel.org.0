Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D107C4F476E
	for <lists+linux-next@lfdr.de>; Wed,  6 Apr 2022 01:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbiDEVL1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Apr 2022 17:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383812AbiDEPOt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Apr 2022 11:14:49 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13CB56759
        for <linux-next@vger.kernel.org>; Tue,  5 Apr 2022 06:27:34 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso1614067wma.0
        for <linux-next@vger.kernel.org>; Tue, 05 Apr 2022 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xXiJ7E3buFOmKaSNtVYhVfiGSQm7gptWYLzEoB5MokI=;
        b=O9IJQtdzbkZcZt0N+Gky9OnNamx2qItL0YP6nnMP3axAnjPu5sGS1XwJUnuM5FlHKO
         lNI3Jk8H+gxK206jBmI5IFfFU/kpdOguY0M2S5doN1LKUbcWbUCYVMdXUi+BLNJ3Isp4
         7Kb+w3s5nxelI4SJ1O0dy0/Re2ESgBt7Nk3n5Ds50qW/cX6EBQyp3vEf2vMKWZdQ1+dN
         1ATJQ1jh5FpicZGmdVFRh0ycIsUfdjI6hNfzZWnnhzkphfRuFQHUGdoGnl9+dUjZ6G6q
         3EVxNsHrJJWw7mZu41iPxfLHC2egBVBisTDMqFutWcbIP6rS4Bo7DPFPm2f0eMquBoZT
         N6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=xXiJ7E3buFOmKaSNtVYhVfiGSQm7gptWYLzEoB5MokI=;
        b=uX/t45qk06aA+cLLvgvUxu5g2vsv/1YNRNHW9d+TAiM/x5dDjW1j/dftAk3e67a5+9
         VFb9sJjoRP1TGM7b78zgnTCrT8h3jF7smy6PzNrnRQQM9g/zC7UWjHZzmAgctaXGIyI+
         cJEbQ27GFex3wZWmr7k3axMqWsLefer6Rku1/+DdoU6LUhyP/7PbjdO5SnyKWiL/fyQ/
         uOeuLzcpJuQhdhcpoxZToXY3zsjOAHx6G5sJbBhfXmWZ8j/LnHm9sGDRgsVHRAmbaOk7
         xni7jyI4w2N1QZJfyi4JvmAoRZVNpJuuhinj0iqr4kC9tx7R4bA9HOYMg8i5j1CVp7/K
         MsBA==
X-Gm-Message-State: AOAM533wfdXiQUGkZFiLIRYGFDZK+AzCn40QSClowyxws3BTCSOIK1i3
        jSoBXxMt2vX0R6Zp+LWMTJVxfDFcWfeZooFtsfE=
X-Google-Smtp-Source: ABdhPJzU44KSOpA5tDqBOHpaxPC6kg1ke01c0lNcdcR2CtWfwEfG4/exBR9pIw7aENh0xuqAFhmQYV3OL6ODTbw5Bd8=
X-Received: by 2002:a05:600c:1e85:b0:38c:ef05:ba5d with SMTP id
 be5-20020a05600c1e8500b0038cef05ba5dmr3087974wmb.119.1649165253154; Tue, 05
 Apr 2022 06:27:33 -0700 (PDT)
MIME-Version: 1.0
Sender: jimchampman5773@gmail.com
Received: by 2002:a5d:64a5:0:0:0:0:0 with HTTP; Tue, 5 Apr 2022 06:27:32 -0700 (PDT)
From:   The Sigrid Rausing Trust <thesigridrausingtrust@gmail.com>
Date:   Tue, 5 Apr 2022 16:27:32 +0300
X-Google-Sender-Auth: P3ZUqTx_LOsp1Q3oJx1FnRp6e6Y
Message-ID: <CAJaLhfbYouV=pnYrp7C=CZcxo5xMbFCELazUY+YMsM_9JifNOQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hallo,

    Ich bin Sigrid Rausing. Ihre E-Mail-Adresse wurde von Google Inc.
bereitgestellt. Zuf=C3=A4llig als aktiver Benutzer im Web ausgew=C3=A4hlt.
Aufgrund der Coronavirus-Pandemie spende ich Ihnen =E2=82=AC2.000.000,00 un=
d
fordere Sie auf, jemandem in Ihrem Umfeld mit dem Wenigen zu helfen,
das Sie k=C3=B6nnen.

Weitere Informationen =C3=BCber mich finden Sie hier in meiner Wikipedia:
https://en.wikipedia.org/wiki/Sigrid_Rausing

Kontaktieren Sie mich unter dieser E-Mail-Adresse:
thesigridrausingtrust@gmail.com f=C3=BCr weitere Informationen.

Gl=C3=BCckw=C3=BCnsche!
Sigrid Maria Elisabet Rausing.
