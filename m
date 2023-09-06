Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18CFC793313
	for <lists+linux-next@lfdr.de>; Wed,  6 Sep 2023 02:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjIFAxw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Sep 2023 20:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241982AbjIFAxw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Sep 2023 20:53:52 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179EE1A3
        for <linux-next@vger.kernel.org>; Tue,  5 Sep 2023 17:53:44 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68becf931bfso2065475b3a.0
        for <linux-next@vger.kernel.org>; Tue, 05 Sep 2023 17:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693961623; x=1694566423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLKng4M4W18Juo1CPvzbwKF3U/TaOCudVZnU5lAZ1eM=;
        b=VxckT7SMFLF03R2s894FHoes/Z3ZIGdZnyCH477R+FfPNh6RBKpgSsVqiUd5hIxpm0
         WDb5P2+KbXdjwBwLEMen195gAvSvZ5dW7NMCU1U7nN8WKi+2HjpzJQqlggH7zX3kE4TY
         TLwa3TYqdeOw2UjISDdEYpmsI2vrF43zCsKAuDjsbfOD4bKU3HCpS2jOg3y2ZSYzUref
         oRpnFeg1NVHyrVUYojq+3NPBLhDMGkZ/KWv5ofVZ6ZAInNdR7nqOsMv9FIKioH6LRKPA
         AtvcnTFaWdiSSS2GEvvIHSnqHp0bxyeDIPiV/qW9pR5Br+mdEiQWN8Upan2nJOS9SgeH
         of8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693961623; x=1694566423;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLKng4M4W18Juo1CPvzbwKF3U/TaOCudVZnU5lAZ1eM=;
        b=VevALNPBwdIYJzET6xIGXXEO6i/dbU1IisjrATKSTVfqR76u5JyL92UDeEsvkkswvq
         X1+LlUTWBzDtLAmpAXPSGixOdSZD6E8+VKafaEw64cEH19kGIunGT7D+HGRpbpg2nN1d
         /FXYqYAGiHn7GR4kAUk3stVrHRyV5hb2I2M0Oql4Uo0MRorYib8k9HojPTMtqQPJsSOx
         F6KU4BI3DJmg+4/itVFCwOFML+bS/7DsCDUjzyoPWDw9uhwgpZfN7J/9JoWaF+S5NErJ
         CdXWl1Ea2feLLQhk+o6QIZH6vBTLxbqkcVVyR18SGaOI3qKohd59hCKd0Hp/XI2GCPV1
         hTvQ==
X-Gm-Message-State: AOJu0YziSP1YGVFz09SZ+yOsB4W9SSMkWNU3Jp3erHU/tiuHB/aMBlqR
        aPs+vEcADVeQ0XI6GxzndhnpEA==
X-Google-Smtp-Source: AGHT+IGZF0GKGVAu3VeeCKxDvBsyyX0Qu2g52QEhlY1dKdPYIydVH1waehL5sCgCMQJ+HEQtr/kuvQ==
X-Received: by 2002:a05:6a20:96d5:b0:136:ea0e:d23 with SMTP id hq21-20020a056a2096d500b00136ea0e0d23mr10958136pzc.11.1693961623472;
        Tue, 05 Sep 2023 17:53:43 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id iy22-20020a170903131600b001bf20c80684sm9945161plb.6.2023.09.05.17.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 17:53:43 -0700 (PDT)
Date:   Tue, 05 Sep 2023 17:53:43 -0700 (PDT)
X-Google-Original-Date: Tue, 05 Sep 2023 17:53:41 PDT (-0700)
Subject:     Re: linux-next: duplicate patches in the perf-current tree
In-Reply-To: <ZPdaBAWxzUpr0cdu@kernel.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>, arnaldo.melo@gmail.com,
        namhyung@kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     acme@kernel.org
Message-ID: <mhng-7f75b11a-f1f6-4b96-9e16-7321c91042d1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 05 Sep 2023 09:40:36 PDT (-0700), acme@kernel.org wrote:
> Em Tue, Sep 05, 2023 at 07:43:50AM +1000, Stephen Rothwell escreveu:
>> Hi all,
>>
>> The following commits are also in Linus Torvalds' tree as different
>> commits (but the same patches):
>>
>>   10da1b8ed79f ("perf tests mmap-basic: Adapt for riscv")
>>   159a8bb06f7b ("libperf: Implement riscv mmap support")
>>
>> These are commits
>>
>>   26ba042414a3 ("perf: tests: Adapt mmap-basic.c for riscv")
>>   60bd50116484 ("tools: lib: perf: Implement riscv mmap support")
>>
>> in Linus' tree.
>
> Yeah, I had cherry picked those perf patches at some point, I'll make a
> note when submitting to Linus.

Ya, and sorry if I screwed something up here.

> Thanks for the report!
>
> - Arnaldo
