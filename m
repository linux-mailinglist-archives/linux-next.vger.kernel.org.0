Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69296482741
	for <lists+linux-next@lfdr.de>; Sat,  1 Jan 2022 11:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbiAAK3p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 1 Jan 2022 05:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiAAK3p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 1 Jan 2022 05:29:45 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC18C061574
        for <linux-next@vger.kernel.org>; Sat,  1 Jan 2022 02:29:45 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id c3so8439758pls.5
        for <linux-next@vger.kernel.org>; Sat, 01 Jan 2022 02:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=C5OlgXdCsyGauJE9EojEBd19/+yVCg+GJinycnLX1E3NyKAycaH3FQxBbSuALCg9En
         TGoJl9iCWM2PgoJi8koSs/AbkCBkCD0j4c9jOon0GdHeTA43grSchYIoHa/Bkcv2+U08
         cDYEbff8ylCyZLNZVCi+IO2N62B/PnJka0Vn7A9+Kks1eUOPnGoBOS5x1JHgG5tts5ws
         pre+WG1+AGPPzLEeQhB1RORYNvbFiMhmu6D3Ja/DsDj+mx5YibS6l/+8ExLdZbKl78nK
         elsQ6hJ0H15DWR9FmUzfrT/rsaqej5RAxbpjZ8lvGUo348KshdJwROpxR0PO5pCz/zxY
         tZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=uq1Yv7A1keDqHKmLtqAHXYBPVgN/bU5KNfKAQquadHL+h9pgRuEe7YfB8NXZmMrlcX
         MJR/NuLrZDTSEpsRHUb9aR42oL9wZvDkHYgptzWBJfjOEfhOvKMk2bv/fdh1CbNPrXiO
         xnkJbOhvfkPo8e2w/sXPLd89Z0wa3qnTW8UyC+ehljkx2liy9bGZI1rQTL3OckpMuw0f
         EqbXgca+yMlAuJwsUG3prpghOwnZDijlg89jT4eYCzh95nGdYzMFzgupO7uRQ5CSBkJ0
         Fm07hr/7BWVpJxMXN0jfQqnZKwm0/rHX0OIIAS+aJWZSvv+sNW9SCTocJlGr8TrJgXBD
         8ZhA==
X-Gm-Message-State: AOAM530iY6T/38uva02lM5dKrMukiD4eRYWZb+PvcHPR6UHjsg31JMzU
        heUiXg2fqaLQ6FqhoItgQ0E=
X-Google-Smtp-Source: ABdhPJyUmJCIRyhaAlMycOSBdSsbpncPhAFeAE1g1WQqHAWco/mFJPf5iiysDp+NjknDtGHE40Pv4Q==
X-Received: by 2002:a17:902:9343:b0:148:a2e8:2c49 with SMTP id g3-20020a170902934300b00148a2e82c49mr38399406plp.152.1641032984651;
        Sat, 01 Jan 2022 02:29:44 -0800 (PST)
Received: from [192.168.0.153] ([143.244.48.136])
        by smtp.gmail.com with ESMTPSA id c24sm17039024pgj.57.2022.01.01.02.29.37
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jan 2022 02:29:44 -0800 (PST)
Message-ID: <61d02d18.1c69fb81.20b84.ed3a@mx.google.com>
From:   vipiolpeace@gmail.com
X-Google-Original-From: suport.prilend@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <suport.prilend@gmail.com>
Date:   Sat, 01 Jan 2022 12:29:29 +0200
Reply-To: andres.stemmet1@gmail.com
X-Mailer: TurboMailer 2
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

I want to confide in you to finalize this transaction of mutual benefits. I=
t may seem strange to you, but it is real. This is a transaction that has n=
o risk at all, due process shall be followed and it shall be carried out un=
der the ambit of the financial laws. Being the Chief Financial Officer, BP =
Plc. I want to trust and put in your care Eighteen Million British Pounds S=
terling, The funds were acquired from an over-invoiced payment from a past =
contract executed in one of my departments. I can't successfully achieve th=
is transaction without presenting you as foreign contractor who will provid=
e a bank account to receive the funds.

Documentation for the claim of the funds will be legally processed and docu=
mented, so I will need your full cooperation on this matter for our mutual =
benefits. We will discuss details if you are interested to work with me to =
secure this funds. I will appreciate your prompt response in every bit of o=
ur communication. Stay Blessed and Stay Safe.

Best Regards


Tel: +44 7537 185910
Andres  Stemmet
Email: andres.stemmet1@gmail.com  =

Chief financial officer
BP Petroleum p.l.c.

                                                                           =
                        Copyright =A9 1996-2021

