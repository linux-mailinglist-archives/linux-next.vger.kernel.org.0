Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D711B5A2992
	for <lists+linux-next@lfdr.de>; Fri, 26 Aug 2022 16:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344481AbiHZOcD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Aug 2022 10:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344523AbiHZObz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Aug 2022 10:31:55 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0337ACD789
        for <linux-next@vger.kernel.org>; Fri, 26 Aug 2022 07:31:52 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id x23so1724258pll.7
        for <linux-next@vger.kernel.org>; Fri, 26 Aug 2022 07:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=yFrZaBTnH0a2pdY6VSIo3LxE0IBoHhY23bZhh1lul/4=;
        b=oNJWe7IYa5D+TjB3Pqa5Q4mPC4Idgowxyesqop9TCo/d4MquJxIUcEoSmmzWGGrMdM
         s6LC6DDEurAQZ2eUTvV2X7+ZxiVjWLvgwB7A+CvojkhKE5aDNMv32VRaA67oiA9ojszi
         u3XsBXpBH9d2EKJfrh9V8TIqU68mWmwpUElSz1MzRqCa8hzcrY6s4thfQqsZuVr9sLmm
         NTheNd+krmzedE7NIzy6zisFDNtBuaRo/x425kWUAHfFa/A8gcNxOh/mq01gufHtMH/3
         9DwKas9ZHUisLt7X0ORyy7FUroAEH28u9RcbwbTJM5i2R9MMW85Sbxr/v6hT6zRA4+il
         zDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=yFrZaBTnH0a2pdY6VSIo3LxE0IBoHhY23bZhh1lul/4=;
        b=OlARHM35+YvJmdmn5Cz/r12ud76L0GMv15WykNQzn40wizF/b3pJ63lph5xDuaGjdz
         OxiUnSJWgWOB2Vrjv2GodKXCCwO+BGpp3Q90u1G4U1kqsyGM7c8llkArGOJkmG30lbaO
         PYW7YjdlzFfp6aAhLaOeYM3byKGAl1Ik208hNN9OeaRKzPxHocX0E8gt+YRFLfcKZ+jr
         la3kc54QgCFHPctTd1OxjhQvlMASVQ4aT4LYPkj2IDh7baX6kYdDFs9oBZf3MNXzWptg
         tfGVMTGm9CA4mRrVzPL4BzzC9IbS4qSclOHNsapROrR8+bJIRj61sUo3Q8vVpYLBel2I
         TjYw==
X-Gm-Message-State: ACgBeo06TLFiiUvDMz+4Vv8oZYoqdyCnBMcXJNcjWFdYaa1myffKX2a8
        UEQq9aYTUsj/WfIifSNCbf/5zJHfqp1fjw==
X-Google-Smtp-Source: AA6agR6WDhjZH1snE7ayBYircn9IOuKD4o9SkoI3aQDed45sxvpGE5W9/8qngYJIN9FyOb99e/d6NQ==
X-Received: by 2002:a17:902:ab55:b0:173:4116:8d3d with SMTP id ij21-20020a170902ab5500b0017341168d3dmr3843210plb.157.1661524311800;
        Fri, 26 Aug 2022 07:31:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id q1-20020a6557c1000000b0042b5b036da4sm1497841pgr.68.2022.08.26.07.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 07:31:51 -0700 (PDT)
Date:   Fri, 26 Aug 2022 07:31:51 -0700 (PDT)
X-Google-Original-Date: Fri, 26 Aug 2022 07:31:37 PDT (-0700)
Subject:     Re: linux-next: Signed-off-by missing for commit in the risc-v-fixes tree
In-Reply-To: <20220826175646.77554fff@canb.auug.org.au>
CC:     Paul Walmsley <paul.walmsley@sifive.com>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-5cd1212f-2476-438d-8eb1-32e6ab61f517@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 26 Aug 2022 00:56:46 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>   5024d917e5f6 ("MAINTAINERS: add the Polarfire SoC's i2c driver")
>
> is missing a Signed-off-by from its committer.

Sorry about that, it's fixed.
