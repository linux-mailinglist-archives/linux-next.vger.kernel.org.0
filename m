Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2AF476022E
	for <lists+linux-next@lfdr.de>; Tue, 25 Jul 2023 00:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbjGXWXE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Jul 2023 18:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbjGXWXD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Jul 2023 18:23:03 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E963199F
        for <linux-next@vger.kernel.org>; Mon, 24 Jul 2023 15:22:31 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-780c89d1998so54218539f.1
        for <linux-next@vger.kernel.org>; Mon, 24 Jul 2023 15:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690237337; x=1690842137;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLAXwNR7C+3Umlu0dXlKwDqmDiqJdnNjwwiVgRkpsVQ=;
        b=dgboTQlXg3NCBkmAMxqTOV4079qL5wRAnoXYDstQz9FrUmJmCGcR1UzE2q6AikZtXm
         bs//I5NFJvfQjRBVOHSTPoFUHDi2GTFIOgE84WZmo5WrIc/JhXlDCommJuqK0w7zgdYO
         bSaI5Vfk2Vv1z3aiypaAqZ8O37AV9eMvqFzKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690237337; x=1690842137;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tLAXwNR7C+3Umlu0dXlKwDqmDiqJdnNjwwiVgRkpsVQ=;
        b=fGHSTx6IocJRYJElUWcBNb6BjLF53HVfekjb9EAd5bDzGC5l9KfXdC/QORdZOPMbcG
         2w/Sg3cD3wCAG0Sic9aWwl3KiJZxQpD6GbNulovM0/YFBACwyauUvvVzVQgZ1r1VNZ4v
         HLufR1QOV9Hr2ak1naR+jh8MLcjwx1ae84+yxm3kU7mJtm+y4Pm66r1wF8IjUY4bQEDf
         NIb/5Nsvd68vQpZKRYNLAofdUmj2EYJ5PS/Hdr6pwtg6X65hiCCPZtDYylRy6iy1f2P7
         OqIr9OqTZACcdHE/5M/1jKbSyPDgMk/26bkQztqHUOrBAM0eR8rdS+Ndevci/3bEcc/C
         z7VQ==
X-Gm-Message-State: ABy/qLb73tgVvmymMm4QrA7BaF+4OFIT5mxGxW1jNm6lhRxa5QHSZvEW
        himylvlRcd0hvzRZNOGvHamPsky78YX5JGtlNpkBD/CD
X-Google-Smtp-Source: APBJJlG9BuhkS05d6D5oTV5niAihQps/asbV6X9PDU5PCQcK8rjFvYh49F8Qh2JiqgnXZBSCJqqVFA==
X-Received: by 2002:a05:6602:480b:b0:780:d6ef:160 with SMTP id ed11-20020a056602480b00b00780d6ef0160mr9236012iob.1.1690237337376;
        Mon, 24 Jul 2023 15:22:17 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id e18-20020a056638021200b0042bae96eba7sm3193183jaq.7.2023.07.24.15.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 15:22:16 -0700 (PDT)
Message-ID: <4a007283-be03-907a-094f-6651a44e631f@linuxfoundation.org>
Date:   Mon, 24 Jul 2023 16:22:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>, Willy Tarreau <w@1wt.eu>,
        thomas@t-8ch.de, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        shuah <shuah@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Subject: Request for linux-kselftest nolibc branch Inclusion in linux-next
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Please include the following linux-kselftest nolibc branch for linux-next
coverage. This will be based on Linus's tree.

I will be using this branch to send nolibc pull requests to Linus.

URL for the branch:
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=nolibc

Primary Contacts:
Shuah Khan - shuah@kernel.org or Shuah Khan <skhan@linuxfoundation.org>

Please cc:
Willy Tarreau <w@1wt.eu>
Thomas Weißschuh <thomas@t-8ch.de>
Paul E. McKenney <paulmck@kernel.org>

thanks,
-- Shuah
