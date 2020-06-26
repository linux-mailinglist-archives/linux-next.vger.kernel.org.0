Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA3520BA96
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 22:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbgFZUu2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 16:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgFZUu1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2020 16:50:27 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F65C03E979
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 13:50:27 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id n6so9877821otl.0
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 13:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=5UjDgo9TDD0uXnCznEEYR+8Pydw53U4zTLJqbc800tU=;
        b=Kl+Q35/3GCxhMnOYKsKt5XOdjbTpl4szH6eWynFDgA3Y9I6MbMefm2SRY8jOdZY5+R
         Tm6QiZGNAexVEz9HOk3j3/Uwh3tPa+T6one/+8dgjBABVoyFp9nl0fN8ajQl3TugYMyP
         B90cG4GRwM3Oprc5yBzw1Q+gyR71dgTeyNwnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=5UjDgo9TDD0uXnCznEEYR+8Pydw53U4zTLJqbc800tU=;
        b=dSfAUPmbrZQ9qnTNppREUahYxvyyPrJn/xRZUeQV7ShVRGEnCOOi3Dogdv1Tr4VPDF
         s8/T4MVq1utWKkNgX/B5ObHNhCLKEUGS4ntYiVRj2UNAAD4aQm7xVKHiPQVxifPRDcxV
         TMi+wz63gDEDL/GqEsCbOK7qvzzStNywzzH/fRNdPYHosRr3h2FuNQJjVOpFwpnezdZU
         //Rh4N3aA9hzjeQGa/K5Mdr6Y1MZNxz5GJEweacYV+ZbCeqEG2LVHwuPwHYCllaw5xPZ
         SjhUZQ7F8HWlUznQwwji2UKbYqtQrwRSQzKE6tj/jxbjm9dCvhz49rrG2Ao9wTr8SEIf
         hyjg==
X-Gm-Message-State: AOAM532skJhvtrhr4uv2C7B5EkRM+oP6tMXptmNc1tCk7mD/HiJYobgj
        eOPI6kK91T3ib2hInui8hlMSDg==
X-Google-Smtp-Source: ABdhPJzlgXsS7Shx7oAZkYgNP+8udzwOXgtGP1emDIGQt97IErQ+zhUK/7kV/3u/4r+liHCIwnsbgw==
X-Received: by 2002:a05:6830:19eb:: with SMTP id t11mr849522ott.207.1593204626975;
        Fri, 26 Jun 2020 13:50:26 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id u19sm1170859oic.10.2020.06.26.13.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 13:50:26 -0700 (PDT)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Subject: Request to add linux-kselftest kunit-fixes branch to linux-next
Message-ID: <35ddf39c-1ffb-3099-139f-391193ae3526@linuxfoundation.org>
Date:   Fri, 26 Jun 2020 14:50:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Please add kunit-fixes branch to linux-next.


https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=kunit-fixes


Contacts:

Shuah Khan
Brendan Higgins

thanks,
-- Shuah
