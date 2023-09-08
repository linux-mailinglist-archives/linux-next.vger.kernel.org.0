Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F205F79800D
	for <lists+linux-next@lfdr.de>; Fri,  8 Sep 2023 03:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240446AbjIHBTC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Sep 2023 21:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240367AbjIHBTC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Sep 2023 21:19:02 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8679D19A7
        for <linux-next@vger.kernel.org>; Thu,  7 Sep 2023 18:18:58 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-68bf02547dbso2257794b3a.1
        for <linux-next@vger.kernel.org>; Thu, 07 Sep 2023 18:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694135938; x=1694740738; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AzdaW3bsRk+Lh3EGhqx3K9jprVjb9beAWdd1Upzj6Qc=;
        b=fDwOR2K5B3u8zV2ETA2p8mcIAX2bpSLzVJXdIhh2XPeq1LSZqYCX4XWs0qGrEyEZQW
         sctFdT5/3/XMHUYrWoiCbngjGdavRl9Ic3rqRFeHEQiRGFoQKbc7FKEalfpCMCbkcS8i
         YgxsLMJmYKtzmuqKE8N/spTGizcQhU0q4BuyI5YDLEQKSdGiH1foVtWZ8nWog5hkAJ05
         5kiGYgt/5WbytC8nj2afo0NuMUlZbwQ+xCjaJYxzALFQrIdPfTPSnZ6Jyb7HB3tm2V34
         7MYGWRAZFXh201K8+vWPLdnvOriM0zWWA4AJWWQ1KkU654UKsIM4d2Tw3M5ol/PsHX8E
         NNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694135938; x=1694740738;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzdaW3bsRk+Lh3EGhqx3K9jprVjb9beAWdd1Upzj6Qc=;
        b=J1Uqcx9ax0Fp0deRCFbmeeeRHTM/kZrI2OkIfB8OYXORMXWrMq/moxmgaJZ4qi0oo4
         XeivrQfxjjCLOo0BeaFbneSBLWTAxzH/JVs3yCrjCtYgcvMZ40yaq6BsEPIVOHk7naXd
         91AR7bFvJAGP8LPdmE99JKt4pR7aRn/39iyTeTkXhPPHkq/LjxuTeABhmZ0bYEjUGXGN
         JSBQHwTPZu0gqewxG0R3OeMOTswrA7rP6U/vlkN2/vgXQ4icTV8BOpAc9aT5JtkYqPcp
         0sGeC9w1lDmX4QEKjaqkMQsHaaPc5BabdwYEmyvQd7/enbvhTG3TRJfePVuKw8wHW9It
         is5Q==
X-Gm-Message-State: AOJu0Yxv4nNqYmoaeJtNIdp2uOEPzpgLTCxLXToEaN2H8MGXNF+hOkVL
        lzidSn2yTBg/WUSrjW3xk+br1GF6HaU=
X-Google-Smtp-Source: AGHT+IH46/StAcLJTg4dP2kKbllp+XA9pbAbITjrRGlgU1uDSzNh/tIT6d7lEnUDiAjFPMuTWJdSJRqz9R8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2356:b0:68a:2c24:57d1 with SMTP id
 j22-20020a056a00235600b0068a2c2457d1mr476538pfj.1.1694135938001; Thu, 07 Sep
 2023 18:18:58 -0700 (PDT)
Date:   Thu, 7 Sep 2023 18:18:56 -0700
In-Reply-To: <20230908101819.65e8994c@canb.auug.org.au>
Mime-Version: 1.0
References: <20230908101819.65e8994c@canb.auug.org.au>
Message-ID: <ZPp2gIw5AGMcv4IV@google.com>
Subject: Re: linux-next: duplicate patches in the kvm-x86 tree
From:   Sean Christopherson <seanjc@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 08, 2023, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):

I'll force push, Paolo squashed a minor fixup and I haven't updated. 
