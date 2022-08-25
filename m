Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E7A5A17BF
	for <lists+linux-next@lfdr.de>; Thu, 25 Aug 2022 19:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236250AbiHYRMi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Aug 2022 13:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbiHYRMh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Aug 2022 13:12:37 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7FBB1BB2
        for <linux-next@vger.kernel.org>; Thu, 25 Aug 2022 10:12:36 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id u14so24071843oie.2
        for <linux-next@vger.kernel.org>; Thu, 25 Aug 2022 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc;
        bh=LcowEz/MHN6VIwZyVyshjW7bqzLnX3nnurMOL1MyeF0=;
        b=cKkmbBix+N3cbmFgCBhnjLIvuq5g14yJ904Eln2mxC6ZlF14pz0erECWCP4txp3xs8
         7S8mpHAkjHlV2vxSqEHaxHMCa8QAgVq4bzsgV5ul5AL+lwU2YSbizVxnl/Bso5/sb0yS
         oOE5GhU30f9zhtX3UCX7n2OJ6l7JUt1vRLYl2VZg6L0y1XmnrouwXeMqe8ACF3YJm+SS
         DnGKiy54WOS5O36rsO4xJ+5eoZnXCTHxTjpGXwP3KAtodAlZSRusSg0VRNWHb4EkSZWG
         xo07mL+XN5RL6uCEcPMBe/C3qF2RmDFAcZ6T29yxbqIXsYigFnF3G0MgFt89mfc7lWgG
         6zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=LcowEz/MHN6VIwZyVyshjW7bqzLnX3nnurMOL1MyeF0=;
        b=uz2h2gRzXKLw5RDpXlw8fz41HfRU4niQ6BzWGJGazQ6WC8U3Qqg/x58MAroj+TpJou
         mTT0fk7PrQyyFkC2tHGq6s6uT5evQlIU3uLGkcsO4TX0dCMF3cm3F+6acl1Kr00TcFBW
         W1cl6kelnjwhSry0lo3AhecIQGTiDfG1JSMW5nCPe9rjONwM4fbp31PdUPZGZXXigX1b
         hJzIAvUFAlqz3XvHNtFzGEBK6Q7hHq9zdOxQXGi1XDir+7XjJWsjA5bET4KjUOfTvwIr
         gI5LVDKIv63hdB2LfEgW6OdcgSkwezj031OJx/vRP8ErGYSKVuX5bCTvltkiQ6VcaDeU
         VlFg==
X-Gm-Message-State: ACgBeo1CdoMMW6Jkd23lb4X7t4cmzbgwE3uAAgr6L37kil1QJVRS4KEZ
        DjP8/2Mj0ji8QkSHKqxJI4sMhy3ozkpzM57f9qk=
X-Google-Smtp-Source: AA6agR6041ReGowM8y0wztP239SBgQurxNqCOQY3ObWzoJ3F/EOopGhKFI5Vs09LDDeAPO4eGI//4yQH208NchXxpKc=
X-Received: by 2002:aca:1c03:0:b0:345:161:b011 with SMTP id
 c3-20020aca1c03000000b003450161b011mr50053oic.40.1661447556213; Thu, 25 Aug
 2022 10:12:36 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkaylama@gmail.com
Sender: salifzouli4@gmail.com
Received: by 2002:a05:6838:bac4:0:0:0:0 with HTTP; Thu, 25 Aug 2022 10:12:35
 -0700 (PDT)
From:   sgtkaylama <sgtkaylama@gmail.com>
Date:   Thu, 25 Aug 2022 17:12:35 +0000
X-Google-Sender-Auth: w3QtPfX5IUfmDSH-J_2gO1fZ5yM
Message-ID: <CAFFHfojJZsdbFTbxnGAiX80jZnf7Ewz5EOcPKd-=LtFXwYuoeA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Ol=C3=A1, voc=C3=AA recebeu minhas duas mensagens anteriores? por favor
verifique e me responda
