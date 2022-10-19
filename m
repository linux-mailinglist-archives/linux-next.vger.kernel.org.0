Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C189604765
	for <lists+linux-next@lfdr.de>; Wed, 19 Oct 2022 15:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbiJSNiL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Oct 2022 09:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbiJSNhD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Oct 2022 09:37:03 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E6D1974CC
        for <linux-next@vger.kernel.org>; Wed, 19 Oct 2022 06:25:24 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-358bf076f1fso167657907b3.9
        for <linux-next@vger.kernel.org>; Wed, 19 Oct 2022 06:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mfibaF6aKr49AkDi2NV5TQ0Zst4gwNZkFki5993X6jc=;
        b=h3NbhrMbCBwk0Hnr9XMowhAoSHk5InhwthULv50BE9mYT5F17Lx9M0ckIuX3HBgzQ2
         +JEgoktMxs9YSHukWtDoCJXCitF2kwpRStUkBELKkVjUD2stj+jIiZ52fSfBlKJ1r7Z7
         Tk2RD2nqzHpcp3roC8CqsmkRFAgeIoENs6O7ng8Zg2/5keZSCaX9eOOlVPhsOlIjhY1+
         7w25KBYB+LmjtS8/4PO+QxDeOZvu7tvMujxxkB6wvZvRW2OcYbWTZ+MlOK3MIzfADWxv
         PX4PGP4REuut9aF26GmTDaDLwE4GqrY5FGUmdGNohGyoaHP6AGgPvFQVYJ1FXfsyC7nB
         SkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfibaF6aKr49AkDi2NV5TQ0Zst4gwNZkFki5993X6jc=;
        b=UQvcsT7PKHKAgKWl2ea/46zV1NM9XCkHLBMCNGWGk8vPmaienuAdOWrs0tB+yNn79J
         4jU2+pgVaOxQZmp1c05dlhY23xpw9uE3PcqWQGeg+3h6BFxT8ybw3hSC48kbHN94ayGw
         TWwOkA+SZrcO/dkYVzUoGC7xY7IicR82P3qOeGrCx/RARSPAb7dmvJ7MxO/V/rbleGDZ
         k//BN5psJKiZT3QcEPQKrs9MIpY5gsz72MeDXrl71LYgoFxvZd7dXkMqBLdzvmVIE+9z
         FiMt5mdx6LqCAKp8bt2OpXe1lt+PWvTQb/JihsY0xWjMZKf36Dk/9u7DWdw6M5WuWcjQ
         sy8Q==
X-Gm-Message-State: ACrzQf0CBCF2BhGnB8fD/liv9q6gFJxeLh3T3eKb5wjip6rOwDGYsuz/
        Jw7CMTX5Q+PFb++W6mIbwRXm3RDjB/7EK0jYIpnL
X-Google-Smtp-Source: AMsMyM6lCCWTmm+6IikuuDS5cfpN/BQL43j+d8hclavgvII3F6vQdSnScxwCLjAzSdMdKtkE68LNCzqRkGxXESTHTZQ=
X-Received: by 2002:a81:f84:0:b0:357:c499:44e6 with SMTP id
 126-20020a810f84000000b00357c49944e6mr6660650ywp.51.1666185868743; Wed, 19
 Oct 2022 06:24:28 -0700 (PDT)
MIME-Version: 1.0
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 19 Oct 2022 09:24:17 -0400
Message-ID: <CAHC9VhShn01qD5bYFtNEhAA=5w=+PYuoPq1tdY4b6S-wrs+xPA@mail.gmail.com>
Subject: Commit 9fdb079fb28e ("pstore/ram: Set freed addresses to NULL") in
 linux-next has "bonus material"
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-security-module@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Kees,

I'm sure this is an honest mistake, but commit 9fdb079fb28e
("pstore/ram: Set freed addresses to NULL") in linux-next appears to
have your "LSM: Better reporting of actual LSMs at boot" patch
included as well.  Please fix that when you get the chance.

Thanks.

-- 
paul-moore.com
