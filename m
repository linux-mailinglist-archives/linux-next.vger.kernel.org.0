Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3328248277F
	for <lists+linux-next@lfdr.de>; Sat,  1 Jan 2022 13:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbiAAMGP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 1 Jan 2022 07:06:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbiAAMGO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 1 Jan 2022 07:06:14 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5773FC061574
        for <linux-next@vger.kernel.org>; Sat,  1 Jan 2022 04:06:14 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id r16-20020a17090a0ad000b001b276aa3aabso19741898pje.0
        for <linux-next@vger.kernel.org>; Sat, 01 Jan 2022 04:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=RJ7daYWs0BXbN1+mIyDJ5enz3bhfRY+Wl4t0To+HIjKTCKKgtfXTbWcskXt4vZtPmJ
         eEHMfB4y+lKL54wkDjvliTRTVx0wZLgDSTk1D4d4wYR153V85fmKQa4zuPLf3yrOAo4C
         Po43gveWFlW08ux0iuWK5fOD00d32zdQhIsIqH+tdpPPYONJjA0z1cBzaNwI3ITkQCl1
         PL1o0N7EKXf1IXw8LuGHbYuYLPunB4Baprv5WhenDkRhPqM5p7rxgOeds5dMVGXlRTj/
         ePW4okey71MVQBPptiZ1uqoF1yXDcOn7xbPc5FjsbgbNFevI5/UbFiBTTibSgl6BC0HG
         O5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=wjivF9BS8fIdy17MjzV25UlxQ8fJIncPJmmeL4tfSjfn9HqdHIy/nDhK0PebZR4oiI
         Wv1HU/CDKbecvB3ZNkzyw42pD98HboPxSKATPh87MAHwhXRzV3n5MeONFcq/Z49Cg5Wq
         qa1I+rwxqyLyl0gnTh6xB7qr4cCzSsUP2Bwd/fv7IsGulm5+f3yqKsS33TwoaSrna0HV
         JK2bjxWghDdHa7h8mnxurYTO38f4faBIwx9lYwlExttRHcF38xp0dYItvkm3xiiV3DUb
         P2fZr/LzH+hqcrkAMo08ud2CfjWIrKmyJUDtkvvLrV+DDxJP6EWMmN809gMt8F1B0gEG
         j9GA==
X-Gm-Message-State: AOAM531XQqDAzuvGMtouVDJw1/po2bWsq+ZG4f9dVA4EcTeQqu8DZpit
        x9FT2sqP7Qf9++2NQhePGHA=
X-Google-Smtp-Source: ABdhPJz9Qij1lVSsOhq2EC7urSWQNTSFV/4JLLti9jvv3tMOmrHm4RtI3NGBcZv+Nr4/nQMC1ecHCQ==
X-Received: by 2002:a17:90b:1b11:: with SMTP id nu17mr46684803pjb.167.1641038773969;
        Sat, 01 Jan 2022 04:06:13 -0800 (PST)
Received: from [192.168.0.153] ([143.244.48.136])
        by smtp.gmail.com with ESMTPSA id w13sm27606619pgm.5.2022.01.01.04.06.06
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jan 2022 04:06:13 -0800 (PST)
Message-ID: <61d043b5.1c69fb81.c547a.d7ee@mx.google.com>
From:   yalaiibrahim818@gmail.com
X-Google-Original-From: suport.prilend@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <suport.prilend@gmail.com>
Date:   Sat, 01 Jan 2022 14:05:57 +0200
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

